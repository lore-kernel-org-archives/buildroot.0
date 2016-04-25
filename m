From: Patrick Keroulas <patrick.keroulas@savoirfairelinux.com>
Date: Mon, 25 Apr 2016 14:18:42 -0400 (EDT)
Subject: [Buildroot] [PATCH v1 4/4] ring-daemon: new package
In-Reply-To: <20160423001924.38960007@free-electrons.com>
References: <1461358628-9352-1-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <1461358628-9352-5-git-send-email-patrick.keroulas@savoirfairelinux.com>
 <20160423001924.38960007@free-electrons.com>
Message-ID: <1541125393.275698.1461608322652.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, 

Thank you for your reactivity. 

As you can imagine, multiple endpoints conference is a bit tricky and there is no magical recipe provided by libav nor ffmpeg. We're also aware of some limitations in Alsa. 
But our internal dev team is growing and we're trying to facilitate external contributions. So we'll take the opportunity to address such an inconvience. 

Concerning the D-Bus daemon, Ring relies on a session bus but D-Bus initscript starts a daemon for system bus only. 
I can change D-Bus initscript instead of starting it from our Ring initscript. In this case, in which package should I add the patch? ring-daemon or dbus? 

Thanks, 

-- 
Patrick Keroulas 
Consultant en logiciel libre, 
Savoir-faire Linux Inc. 

7275 Saint-Urbain, bureau 200 
Montr?al, Qu?bec H2R 2Y5 
t?l: (514) 276-5468 ext. 167 
fax: (514) 276-5465 
_____________________ 


From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com> 
To: "Patrick Keroulas" <patrick.keroulas@savoirfairelinux.com> 
Cc: buildroot at buildroot.org 
Sent: Friday, April 22, 2016 6:19:24 PM 
Subject: Re: [Buildroot] [PATCH v1 4/4] ring-daemon: new package 

Hello, 

Thanks again for this contribution. As a side note, we tried Ring at 
work as a replacement for Google Hangouts, but unfortunately, the 
quality level was really bad as soon as more than 3/4 persons joined 
the call. Since I know Savoir Faire Linux is behind the Ring project, 
do you know if this is something that might be improved in the future? 

On Fri, 22 Apr 2016 16:57:08 -0400, Patrick Keroulas wrote: 
> Ring is a secure and distributed voice, video and chat communication 
> platform that requires no centralized server. This package only 
> contains the communication daemon and an optional simple python 
> client which interacts with the daemon through DBus to manage accounts 
> and calls. 

This lacks your Signed-off-by line here. 

> diff --git a/package/ring-daemon/Config.in b/package/ring-daemon/Config.in 
> new file mode 100644 
> index 0000000..128a943 
> --- /dev/null 
> +++ b/package/ring-daemon/Config.in 
> @@ -0,0 +1,47 @@ 
> +config BR2_PACKAGE_RING_DAEMON 
> + bool "ring-daemon" 
> + depends on BR2_INSTALL_LIBSTDCPP 
> + depends on BR2_USE_WCHAR 
> + depends on BR2_TOOLCHAIN_HAS_THREADS 
> + depends on BR2_TOOLCHAIN_HAS_SYNC_4 
> + depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV 

Are you sure that you need eudev specifically, and not just "one 
implementation of udev" ? Most likely ring just needs the udev library. 
In this case, you should use: 

depends on BR2_PACKAGE_HAS_UDEV 

and add "udev" to RING_DAEMON_DEPENDENCIES. 

This way, ring will be usable regardless of the specific udev 
implementation: either eudev or systemd. 

> + select BR2_PACKAGE_ALSA_LIB 
> + select BR2_PACKAGE_DBUS_CPP 

Since you select DBUS_CPP, you need to inherit its dependencies. You're 
missing: 

depends on BR2_USE_MMU 
depends on !BR2_TOOLCHAIN_USES_MUSL 

> + select BR2_PACKAGE_FFMPEG 

You need: 

depends on !BR2_nios2 

> + select BR2_PACKAGE_FFMPEG_SWSCALE 
> + select BR2_PACKAGE_JSONCPP 

You need: 

depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 

> + select BR2_PACKAGE_LIBSAMPLERATE 
> + select BR2_PACKAGE_LIBSNDFILE 
> + select BR2_PACKAGE_LIBUPNP 
> + select BR2_PACKAGE_X264 
> + select BR2_PACKAGE_OPENDHT 
> + select BR2_PACKAGE_LIBPJSIP 
> + select BR2_PACKAGE_YAML_CPP 

You need: 

depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS 

> + help 
> + ring-daemon package 
> + Ring is a secure and distributed voice, video and chat communication 
> + platform that requires no centralized server and leaves the power of 
> + privacy in the hands of the user. 
> + 
> + https://ring.cx 

Indentation for the help text should be one tab + two spaces. 

> + 
> +comment "ring needs a toolchain w/ C++, thread, dynamic library" 
> + depends on !BR2_INSTALL_LIBSTDCPP \ 
> + || !BR2_USE_WCHAR \ 
> + || !BR2_TOOLCHAIN_HAS_THREADS \ 
> + || !BR2_TOOLCHAIN_HAS_SYNC_4 \ 
> + || BR2_STATIC_LIBS \ 
> + || !BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV 

This needs to be adjusted to take into account all the additional 
dependencies mentioned above. Also, note that architecture dependencies 
(BR2_TOOLCHAIN_HAS_SYNC_4, BR2_USE_MMU, 
BR2_PACKAGE_BOOST_ARCH_SUPPORTS) are not handled in the same way as 
toolchain dependencies. Indeed, we don't want to show the comment when 
we are on an architecture that for sure cannot build the ring-daemon 
package. We want to show the comment only when something that the user 
can actually adjust is missing (C++ support, wchar support, dynamic 
library support, udev support, etc.). 

> +if BR2_PACKAGE_RING_DAEMON 
> + 
> +config BR2_PACKAGE_RING_SIMPLE_CLIENT 

This name is not correct: all option names should start with the name 
of the package main option, so it should be: 

BR2_PACKAGE_RING_DAEMON_SIMPLE_CLIENT 

> + bool "ring-simple-client" 
> + select BR2_PACKAGE_DBUS_PYTHON 
> + select BR2_PACKAGE_PYTHON 
> + select BR2_PACKAGE_PYTHON_GOBJECT 

Please look at the "depends on" of those packages and replicate the 
dependencies here, if they are not already taken into account at the 
level of the BR2_PACKAGE_RING_DAEMON option. 

Also, is Python 2.x the only supported version, or can 
ring-simple-client also be used with Python 3.x ? 

> + help 
> + ring-simple client package 
> + This is a Python CLI to manage Ring accounts and calls through DBus. 

Indentation: one tab + two spaces for the help text. Also, wrap the 
help text at 72 characters. 

> diff --git a/package/ring-daemon/dring.yml b/package/ring-daemon/dring.yml 
> new file mode 100644 
> index 0000000..6a59a3f 
> --- /dev/null 
> +++ b/package/ring-daemon/dring.yml 

I assume that if you include such a file in Buildroot, it's because 
the ring-daemon source code doesn't come with a sensible default 
configuration that we could use? 

> diff --git a/package/ring-daemon/ring-client.init b/package/ring-daemon/ring-client.init 

Init scripts should be named with name used once installed on the 
target, so SXYring-client for this case, with XY being the sequence 
number. 

> new file mode 100644 
> index 0000000..01208cd 
> --- /dev/null 
> +++ b/package/ring-daemon/ring-client.init 
> @@ -0,0 +1,38 @@ 
> +#!/bin/sh 
> + 
> +CLIENT_PID_FILE=/var/run/ring-client.pid 

RING_CLIENT_PID_FILE would be a better name. 

> +DBUS_ADDR_FILE=/tmp/dbus-session-bus-address 
> + 
> +start() { 
> + # load dbus address for ring session, create one if necessary 
> + [ -f $DBUS_ADDR_FILE ] && . $DBUS_ADDR_FILE 
> + [ -z $DBUS_SESSION_BUS_ADDRESS ] && \ 
> + { echo "Ring-Client: couldn't load DBus address for"; return 1; } 
> + export DBUS_SESSION_BUS_ADDRESS 

This DBus stuff looks weird, why is it needed? 

> + # start auto-answer client 
> + start-stop-daemon -b -S -m -p $CLIENT_PID_FILE -c ring:ring \ 
> + --exec /usr/bin/python -- /usr/share/ring/dringctrl/dringctrl.py --auto-answer 
> + echo "Ring-Client: started" 

This should be: 

printf "Starting ring-client: " 
start-stop-daemon ...... 
[ $? = 0 ] && echo "OK" || echo "FAIL" 

> +} 
> + 
> +stop() { 
> + start-stop-daemon -K -p $CLIENT_PID_FILE 

This should be: 

printf "Stopping ring-client: " 
start-stop-daemon .... 
[ $? = 0 ] && echo "OK" || echo "FAIL" 

> +} 
> + 
> +case "$1" in 
> + start) 
> + start 
> + ;; 
> + stop) 
> + stop 
> + ;; 
> + restart) 
> + stop 
> + start 
> + ;; 
> + *) 
> + echo "Usage: $0 {start|stop|restart}" 
> + ;; 
> +esac 
> +exit $RETVAL 
> diff --git a/package/ring-daemon/ring-daemon.hash b/package/ring-daemon/ring-daemon.hash 
> new file mode 100644 
> index 0000000..8143999 
> --- /dev/null 
> +++ b/package/ring-daemon/ring-daemon.hash 
> @@ -0,0 +1,2 @@ 
> +# Locally calculated 
> +sha256 15096f6d78127a284cfb7a05646cacb72e9385f087e8381fb21670e4644d4f59 ring-daemon-0cc44fa269ab1054c248b7f0383cb2249d2091aa.tar.gz 
> diff --git a/package/ring-daemon/ring-daemon.init b/package/ring-daemon/ring-daemon.init 
> new file mode 100644 
> index 0000000..7913a6b 
> --- /dev/null 
> +++ b/package/ring-daemon/ring-daemon.init 
> @@ -0,0 +1,47 @@ 
> +#!/bin/sh 
> + 
> +DAEMON_PID_FILE=/var/run/ring-daemon.pid 

RING_DAEMON_PID_FILE 

> +DBUS_ADDR_FILE=/tmp/dbus-session-bus-address 
> + 
> +start() { 
> + # add missing modules 
> + modprobe ring 

Wow, where is this kernel module coming from? I don't see the 
ring-daemon package depending on the Linux kernel package, which would 
be needed to build kernel modules. 

> + 
> + # load dbus address for ring session, create one if necessary 
> + [ -f $DBUS_ADDR_FILE ] && . $DBUS_ADDR_FILE 
> + if [ -z $DBUS_SESSION_BUS_ADDRESS ]; then 
> + echo " Ring: start a DBus session." 
> + su ring -c 'dbus-uuidgen --ensure; \ 
> + eval $(dbus-launch --sh-syntax); \ 
> + echo DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS > '$DBUS_ADDR_FILE 
> + . $DBUS_ADDR_FILE 
> + fi 
> + export DBUS_SESSION_BUS_ADDRESS 

This is really weird. Shouldn't the dbus daemon already be started by 
the dbus init script itself? 

> + 
> + # dring program needs $HOME to access user config 
> + export HOME=/var/lib/ring 
> + start-stop-daemon -b -S -m -p $DAEMON_PID_FILE -c ring:ring --exec /usr/libexec/dring -- -d 
> + echo "Ring-Daemon: started" 

Please see the comments for the client init script above. 

> +} 
> + 
> +stop() { 
> + start-stop-daemon -K -p $DAEMON_PID_FILE 

Ditto. 

> + # this can take a while 

Why is this comment useful? 

> +} 
> + 
> +case "$1" in 
> + start) 
> + start 
> + ;; 
> + stop) 
> + stop 
> + ;; 
> + restart) 
> + stop 
> + start 
> + ;; 
> + *) 
> + echo "Usage: $0 {start|stop|restart}" 
> + ;; 
> +esac 
> +exit $RETVAL 
> diff --git a/package/ring-daemon/ring-daemon.mk b/package/ring-daemon/ring-daemon.mk 
> new file mode 100644 
> index 0000000..2f1a07e 
> --- /dev/null 
> +++ b/package/ring-daemon/ring-daemon.mk 
> @@ -0,0 +1,66 @@ 
> +################################################################################ 
> +# 
> +# ring-daemon 
> +# 
> +################################################################################ 
> + 
> +RING_DAEMON_VERSION = 0cc44fa269ab1054c248b7f0383cb2249d2091aa 
> +RING_DAEMON_SITE_METHOD = git 
> +RING_DAEMON_SITE = https://github.com/savoirfairelinux/ring-daemon.git 

Please use the github function. 

> +RING_DAEMON_LICENSE = GPLv3 

The license seems to be GPLv3+. 

> +RING_DAEMON_LICENSE_FILES = COPYING 
> +RING_DAEMON_AUTORECONF = YES 
> +RING_DAEMON_INSTALL_STAGING = YES 

Why is staging installation needed? ring-daemon seems to be a program, 
not a library. Or does it provide libraries that could be useful by 
other programs, such as more elaborate clients? 

> +RING_DAEMON_INSTALL_TARGET = YES 

This last line is not needed. 

> +RING_DAEMON_CONF_OPTS = \ 
> + --without-pulse \ 
> + --without-gsm \ 
> + --without-speex \ 
> + --without-speexdsp \ 
> + --disable-ipv6 

Don't disable IPv6 support, nowadays all Buildroot toolchains have 
built-in IPv6 support. 

> +RING_DAEMON_CONF_ENV = \ 
> + GNUTLS_CFLAGS="-I$(STAGING_DIR)/usr/include" \ 
> + GNUTLS_LIBS="-I$(STAGING_DIR)/usr/lib -lgnutls -lnettle -lhogweed" \ 

Why are these needed? Isn't pkg-config used to detect where gnutls is? 

> + DBUSCPP_CFLAGS="-I/usr/include/dbus-c++-1" 

This is clearly wrong: pointing to headers in /usr/include will not 
work when cross-compiling. Actually, if you enable 
BR2_COMPILER_PARANOID_UNSAFE_PATH the build will abort if such invalid 
paths get used. 



> +RING_DAEMON_DEPENDENCIES = \ 
> + eudev \ 

Most likely to be replaced by udev. 

> + dbus-cpp \ 
> + ffmpeg \ 
> + gnutls \ 
> + host-pkgconf \ 
> + jsoncpp \ 
> + libpjsip \ 
> + libsamplerate \ 
> + libsndfile \ 
> + libupnp \ 
> + opendht \ 
> + yaml-cpp 

Are all those dependencies mandatory to build ring-daemon, or can some 
of them be made optional ? 

> + 
> +RING_DAEMON_POST_INSTALL_TARGET_HOOKS += RING_DAEMON_POST_INSTALL 

The registration of hooks should appear right after the hook definition. 

> + 
> +define RING_DAEMON_USERS 
> + ring -1 ring -1 * /var/lib/ring /bin/sh ring,audio,video Ring user for both daemon and interface 
> +endef 
> + 
> +define RING_DAEMON_POST_INSTALL 
> + # init script 
> + $(INSTALL) -m 0755 -D package/ring-daemon/ring-daemon.init $(TARGET_DIR)/etc/init.d/S60ring-daemon 

Should be done in RING_DAEMON_INIT_SYSV (check the documentation for 
details). 

> + # default config 
> + $(INSTALL) -m 0755 -d $(TARGET_DIR)/var/lib/ring/.config/ring/ 
> + $(INSTALL) -m 0644 -D package/ring-daemon/dring.yml $(TARGET_DIR)/var/lib/ring/.config/ring/ 

Can be done in one line: 

$(INSTALL) -m 0644 -D package/ring-daemon/dring.yml $(TARGET_DIR)/var/lib/ring/.config/ring/dring.yml 

the $(INSTALL) command with the -D option will create all directories 
that are needed. 

> + 
> +endef 
> + 
> +ifeq ($(BR2_PACKAGE_RING_SIMPLE_CLIENT),y) 
> +RING_DAEMON_POST_INSTALL_TARGET_HOOKS += RING_CLIENT_INSTALL 
> + 
> +define RING_CLIENT_INSTALL 

You cannot name a variable like this: all variables should be prefixed 
by the name of the package. So it should be RING_DAEMON_CLIENT_INSTALL 
or something like that. 

> + # init script 
> + $(INSTALL) -m 0755 -D package/ring-daemon/ring-client.init $(TARGET_DIR)/etc/init.d/S61ring-client 

Ditto, should be in RING_DAEMON_INIT_SYSV as well. 

> + # default config 
> + $(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/ring/dringctrl 
> + $(INSTALL) -m 0755 -D $(@D)/tools/dringctrl/* $(TARGET_DIR)/usr/share/ring/dringctrl 

We normally use "cp -dpfr" when installing multiple files. 

All in all, you should probably have something like this: 

ifeq ($(BR2_PACKAGE_RING_DAEMON_SIMPLE_CLIENT),y) 
define RING_DAEMON_INSTALL_CLIENT 
mkdir -p $(TARGET_DIR)/usr/share/ring/dringctrl 
cp -dpfr $(@D)/tools/dringctl/* $(TARGET_DIR)/usr/share/ring/dringctrl 
endef 

RING_DAEMON_POST_INSTALL_TARGET_HOOKS += RING_DAEMON_INSTALL_CLIENT 

define RING_DAEMON_SIMPLE_CLIENT_INIT_SYSV 
$(INSTALL) -m 0755 -D $(RING_DAEMON_PKGDIR)/S61ring-client $(TARGET_DIR)/etc/init.d/S61ring-client 
endef 
endif 

define RING_DAEMON_INSTALL_CONFIG 
$(INSTALL) -m 0644 -D $(RING_DAEMON_PKGDIR)/dring.yml $(TARGET_DIR)/var/lib/ring/.config/ring/dring.yml 
endef 

RING_DAEMON_POST_INSTALL_TARGET_HOOKS += RING_DAEMON_INSTALL_CONFIG 

define RING_DAEMON_INIT_SYSV 
$(INSTALL) -m 0755 -D $(RING_DAEMON_PKGDIR)/S60ring-daemon $(TARGET_DIR)/etc/init.d/S60ring-daemon 
$(RING_DAEMON_SIMPLE_CLIENT_INIT_SYSV) 
endef 

Could you rework your patch to take into account those comments, and 
send an updated version? 

Thanks a lot! 

Thomas 
-- 
Thomas Petazzoni, CTO, Free Electrons 
Embedded Linux, Kernel and Android engineering 
http://free-electrons.com 
_______________________________________________ 
buildroot mailing list 
buildroot at busybox.net 
http://lists.busybox.net/mailman/listinfo/buildroot 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160425/d8ff569d/attachment.html>
