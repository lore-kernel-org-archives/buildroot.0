From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 12 Apr 2016 02:29:25 -0300
Subject: [Buildroot] [PATCH 4/4] board/minnowboard-max: Add a X-based
	graphical defconfig
In-Reply-To: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460438965-28065-5-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds a new defconfig to build a X-based
graphical system for the MinnowboardMax board.

  * The 'openbox' windows manager is chosen because it's simple
    and lightweigth.

  * Basic X apps are enabled (such as xrandr, xterm), so we
    can at least get a console and change video mode.

  * ALSA default configuration is provided, so HDMI audio
    works out-of-the-box.

  * Systemd is chosen as the init system because... you know ;)

  * ... and finally, OpenGL support is provided.

Tested on Minnoboard Turot (which is Minnowboard Max compatible).

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 board/minnowboard-max/asound.conf           |   2 +
 board/minnowboard-max/post-build.sh         |  20 +++
 board/minnowboard-max/startx                | 239 ++++++++++++++++++++++++++++
 configs/minnowboard_max_graphical_defconfig |  78 +++++++++
 4 files changed, 339 insertions(+)
 create mode 100644 board/minnowboard-max/asound.conf
 create mode 100755 board/minnowboard-max/startx
 create mode 100644 configs/minnowboard_max_graphical_defconfig

diff --git a/board/minnowboard-max/asound.conf b/board/minnowboard-max/asound.conf
new file mode 100644
index 000000000000..8947748052e5
--- /dev/null
+++ b/board/minnowboard-max/asound.conf
@@ -0,0 +1,2 @@
+defaults.pcm.card 0
+defaults.pcm.device 3
diff --git a/board/minnowboard-max/post-build.sh b/board/minnowboard-max/post-build.sh
index 9f86d390f2ef..9156233404f8 100755
--- a/board/minnowboard-max/post-build.sh
+++ b/board/minnowboard-max/post-build.sh
@@ -1,2 +1,22 @@
 #!/bin/sh
+
+# Install grub config to the EFI part template
 cp board/minnowboard-max/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
+
+# Tell systemd we want a login shell on tty0
+ln -sf ${TARGET_DIR}/usr/lib/systemd/system/getty at .service ${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty at tty0.service
+
+# Setup xinitrc
+echo "exec /usr/bin/openbox-session" > ${TARGET_DIR}/root/.xinitrc
+
+# Fixup startx so it doesn't start X on the controlling
+# virtual console. Apparently, this is a bug and we are
+# affected for our lack of a Display Manager.
+# See https://bugs.freedesktop.org/show_bug.cgi?id=87762
+#
+# I haven't found a way to do this without hacking startx
+# itself, so...
+cp board/minnowboard-max/startx ${TARGET_DIR}/usr/bin/startx
+
+# Customize ALSA: the HDMI PCM is at card=0, device=3 (i.e. hw:0,3)
+cp board/minnowboard-max/asound.conf ${TARGET_DIR}/etc/asound.conf
diff --git a/board/minnowboard-max/startx b/board/minnowboard-max/startx
new file mode 100755
index 000000000000..3ed32a494654
--- /dev/null
+++ b/board/minnowboard-max/startx
@@ -0,0 +1,239 @@
+#!/bin/sh
+
+#
+# This is just a sample implementation of a slightly less primitive
+# interface than xinit. It looks for user .xinitrc and .xserverrc
+# files, then system xinitrc and xserverrc files, else lets xinit choose
+# its default. The system xinitrc should probably do things like check
+# for .Xresources files and merge them in, start up a window manager,
+# and pop a clock and several xterms.
+#
+# Site administrators are STRONGLY urged to write nicer versions.
+#
+
+unset DBUS_SESSION_BUS_ADDRESS
+unset SESSION_MANAGER
+userclientrc=$HOME/.xinitrc
+sysclientrc=/etc/X11/xinit/xinitrc
+
+userserverrc=$HOME/.xserverrc
+sysserverrc=/etc/X11/xinit/xserverrc
+defaultclient=xterm
+defaultserver=/usr/bin/X
+defaultclientargs=""
+defaultserverargs=""
+defaultdisplay=":0"
+clientargs=""
+serverargs="vt1"
+vtarg=""
+enable_xauth=1
+
+
+# Automatically determine an unused $DISPLAY
+d=0
+while true ; do
+    [ -e /tmp/.X$d-lock ] || break
+    d=$(($d + 1))
+done
+defaultdisplay=":$d"
+unset d
+
+whoseargs="client"
+while [ x"$1" != x ]; do
+    case "$1" in
+    # '' required to prevent cpp from treating "/*" as a C comment.
+    /''*|\./''*)
+ if [ "$whoseargs" = "client" ]; then
+     if [ x"$client" = x ] && [ x"$clientargs" = x ]; then
+  client="$1"
+     else
+  clientargs="$clientargs $1"
+     fi
+ else
+     if [ x"$server" = x ] && [ x"$serverargs" = x ]; then
+  server="$1"
+     else
+  serverargs="$serverargs $1"
+     fi
+ fi
+ ;;
+    --)
+ whoseargs="server"
+ ;;
+    *)
+ if [ "$whoseargs" = "client" ]; then
+     clientargs="$clientargs $1"
+ else
+     # display must be the FIRST server argument
+     if [ x"$serverargs" = x ] && \
+   expr "$1" : ':[0-9][0-9]*$' > /dev/null 2>&1; then
+  display="$1"
+     else
+  serverargs="$serverargs $1"
+     fi
+ fi
+ ;;
+    esac
+    shift
+done
+
+# process client arguments
+if [ x"$client" = x ]; then
+    client=$defaultclient
+
+    # For compatibility reasons, only use startxrc if there were no client command line arguments
+    if [ x"$clientargs" = x ]; then
+        if [ -f "$userclientrc" ]; then
+            client=$userclientrc
+        elif [ -f "$sysclientrc" ]; then
+            client=$sysclientrc
+        fi
+    fi
+fi
+
+# if no client arguments, use defaults
+if [ x"$clientargs" = x ]; then
+    clientargs=$defaultclientargs
+fi
+
+# process server arguments
+if [ x"$server" = x ]; then
+    server=$defaultserver
+
+
+    # When starting the defaultserver start X on the current tty to avoid
+    # the startx session being seen as inactive:
+    # "https://bugzilla.redhat.com/show_bug.cgi?id=806491"
+    tty=$(tty)
+    if expr match "$tty" '^/dev/tty[0-9]\+$' > /dev/null; then
+        tty_num=$(echo "$tty" | grep -oE '[0-9]+$')
+        vtarg="vt$tty_num"
+    fi
+
+
+    # For compatibility reasons, only use xserverrc if there were no server command line arguments
+    if [ x"$serverargs" = x -a x"$display" = x ]; then
+ if [ -f "$userserverrc" ]; then
+     server=$userserverrc
+ elif [ -f "$sysserverrc" ]; then
+     server=$sysserverrc
+ fi
+    fi
+fi
+
+# if no server arguments, use defaults
+if [ x"$serverargs" = x ]; then
+    serverargs=$defaultserverargs
+fi
+
+# if no vt is specified add vtarg (which may be empty)
+have_vtarg="no"
+for i in $serverargs; do
+    if expr match "$i" '^vt[0-9]\+$' > /dev/null; then
+        have_vtarg="yes"
+    fi
+done
+if [ "$have_vtarg" = "no" ]; then
+    serverargs="$serverargs $vtarg"
+fi
+
+# if no display, use default
+if [ x"$display" = x ]; then
+    display=$defaultdisplay
+fi
+
+if [ x"$enable_xauth" = x1 ] ; then
+    if [ x"$XAUTHORITY" = x ]; then
+        XAUTHORITY=$HOME/.Xauthority
+        export XAUTHORITY
+    fi
+
+    removelist=
+
+    # set up default Xauth info for this machine
+    case `uname` in
+    Linux*)
+        if [ -z "`hostname --version 2>&1 | grep GNU`" ]; then
+            hostname=`hostname -f`
+        else
+            hostname=`hostname`
+        fi
+        ;;
+    *)
+        hostname=`hostname`
+        ;;
+    esac
+
+    authdisplay=${display:-:0}
+
+    mcookie=`/usr/bin/mcookie`
+
+
+
+
+
+
+
+    if test x"$mcookie" = x; then
+        echo "Couldn't create cookie"
+        exit 1
+    fi
+    dummy=0
+
+    # create a file with auth information for the server. ':0' is a dummy.
+    xserverauthfile=$HOME/.serverauth.$$
+    trap "rm -f '$xserverauthfile'" HUP INT QUIT ILL TRAP KILL BUS TERM
+    xauth -q -f "$xserverauthfile" << EOF
+add :$dummy . $mcookie
+EOF
+
+
+
+
+    serverargs=${serverargs}" -auth "${xserverauthfile}
+
+
+    # now add the same credentials to the client authority file
+    # if '$displayname' already exists do not overwrite it as another
+    # server man need it. Add them to the '$xserverauthfile' instead.
+    for displayname in $authdisplay $hostname$authdisplay; do
+        authcookie=`xauth list "$displayname" \
+        | sed -n "s/.*$displayname[[:space:]*].*[[:space:]*]//p"` 2>/dev/null;
+        if [ "z${authcookie}" = "z" ] ; then
+            xauth -q << EOF
+add $displayname . $mcookie
+EOF
+        removelist="$displayname $removelist"
+        else
+            dummy=$(($dummy+1));
+            xauth -q -f "$xserverauthfile" << EOF
+add :$dummy . $authcookie
+EOF
+        fi
+    done
+fi
+
+
+
+
+xinit "$client" $clientargs -- "$server" $display $serverargs
+
+retval=$?
+
+if [ x"$enable_xauth" = x1 ] ; then
+    if [ x"$removelist" != x ]; then
+        xauth remove $removelist
+    fi
+    if [ x"$xserverauthfile" != x ]; then
+        rm -f "$xserverauthfile"
+    fi
+fi
+
+
+
+
+
+if command -v deallocvt > /dev/null 2>&1; then
+    deallocvt
+fi
+exit $retval
diff --git a/configs/minnowboard_max_graphical_defconfig b/configs/minnowboard_max_graphical_defconfig
new file mode 100644
index 000000000000..d66581d925b6
--- /dev/null
+++ b/configs/minnowboard_max_graphical_defconfig
@@ -0,0 +1,78 @@
+# Architecture
+BR2_x86_64=y
+BR2_x86_atom=y
+
+# Toolchain
+BR2_OPTIMIZE_2=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
+BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
+BR2_GLIBC_VERSION_2_23=y
+BR2_BINUTILS_VERSION_2_26_X=y
+BR2_GCC_VERSION_5_X=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ENABLE_LOCALE_PURGE=y
+
+# System config
+BR2_INIT_SYSTEMD=y
+BR2_SYSTEM_BIN_SH_BASH=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="enp2s0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/minnowboard-max/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/minnowboard-max/post-image.sh"
+
+# Linux
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/minnowboard-max/linux.config"
+
+# Packages
+BR2_PACKAGE_ALSA_UTILS=y
+BR2_PACKAGE_ALSA_UTILS_APLAY=y
+BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
+BR2_PACKAGE_GREP=y
+BR2_PACKAGE_GLMARK2=y
+BR2_PACKAGE_MESA3D_DEMOS=y
+BR2_PACKAGE_FB_TEST_APP=y
+BR2_PACKAGE_MESA3D=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
+BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
+BR2_PACKAGE_XORG7=y
+BR2_PACKAGE_XSERVER_XORG_SERVER=y
+BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX=y
+BR2_PACKAGE_XAPP_XDM=y
+BR2_PACKAGE_XAPP_XINIT=y
+BR2_PACKAGE_XAPP_XRANDR=y
+BR2_PACKAGE_XAPP_XSM=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_JOYSTICK=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
+BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
+BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
+BR2_PACKAGE_XTERM=y
+BR2_PACKAGE_OPENBOX=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_IMLIB2=y
+BR2_PACKAGE_IMLIB2_JPEG=y
+BR2_PACKAGE_IMLIB2_PNG=y
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+BR2_PACKAGE_STARTUP_NOTIFICATION=y
+BR2_PACKAGE_COREUTILS=y
+BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS=y
+BR2_PACKAGE_UTIL_LINUX_MORE=y
+BR2_PACKAGE_LESS=y
+
+# Filesystem image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Bootloader
+BR2_TARGET_GRUB2=y
+BR2_TARGET_GRUB2_X86_64_EFI=y
+
+# Host packages
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.7.0
