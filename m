From: Francis Mendes <francis.mendes@gmail.com>
Date: Tue, 7 Jun 2011 20:40:04 -0300
Subject: [Buildroot] Add package statserial
In-Reply-To: <87zklulymu.fsf@macbook.be.48ers.dk>
References: <BANLkTi=bZM8DpVptAVzw13Xs4V0d7b2rVg@mail.gmail.com>
	<20110606212121.335044b2@skate>
	<BANLkTi=AamsYp47dfhXa6RtJTATze7sCOQ@mail.gmail.com>
	<87zklulymu.fsf@macbook.be.48ers.dk>
Message-ID: <BANLkTik-ixqi4p1yQkPqn9hd0cXSJweO+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Tue, Jun 7, 2011 at 07:33, Peter Korsgaard <jacmet@uclibc.org> wrote:

> >>>>> "Francis" == Francis Mendes <francis.mendes@gmail.com> writes:
>
> Hi,
>
> Looks good, but here's a few more comments.
>
>  Francis> The original Makefile compiles the source code to statserial.o
>  Francis> and then links it. I don't know exactly why, but the linker
>  Francis> fails with the message "undefined reference to
>  Francis> `atexit'". Searching in the web, I found someone suggesting to
>  Francis> compile and link in a single step using gcc, and it worked for
>  Francis> me. The purpose of the patch is to compile and link the source
>  Francis> code this way. If someone has a better way to fix the problem,
>  Francis> let me know.
>
>  Francis> Thanks for the input. Below is the new patch. If there's still
>  Francis> something wrong, let me know.
>
>  Francis> Francis
>
>  Francis> =====================================================
>
>  Francis> Add package statserial
>
>  Francis> +++ b/package/statserial/Config.in
>  Francis> @@ -0,0 +1,11 @@
>  Francis> +config BR2_PACKAGE_STATSERIAL
>  Francis> +    bool "statserial"
>  Francis> +    select BR2_PACKAGE_NCURSES
>  Francis> +    help
>  Francis> +        Displays a table of the signals on a standard
>  Francis> +        9-pin or 25-pin serial port, and indicates the
>  Francis> +        status of the handshaking lines. It can be
>  Francis> +        useful for debugging problems with serial
>  Francis> +        ports or modems.
>  Francis> +
>  Francis> +        https://sites.google.com/site/tranter/software
>
> Config.in files should be indented with <tab> rather than spaces - So
> the bool/select/help files should be indented with <tab>, and the help
> text lines with <tab><space><space>.
>

Fixed.


>  Francis> diff --git a/package/statserial/statserial-1.1-fixmakefile.patch
> b/package/
>  Francis> statserial/statserial-1.1-fixmakefile.patch
>  Francis> new file mode 100644
>  Francis> index 0000000..88cdd3f
>  Francis> --- /dev/null
>  Francis> +++ b/package/statserial/statserial-1.1-fixmakefile.patch
>  Francis> @@ -0,0 +1,26 @@
>  Francis> +Compile and link the source in one step only
>  Francis> +
>  Francis> +
>  Francis> +Signed-off-by: Francis M. de P. Mendes <
> francis.mendes at gmail.com>
>  Francis> +
>  Francis> +diff --git a/Makefile b/Makefile
>  Francis> +index 2ed79f1..bf82034 100644
>  Francis> +--- a/Makefile
>  Francis> ++++ b/Makefile
>  Francis> +@@ -9,11 +9,8 @@ LD    = gcc
>  Francis> + CFLAGS    = -Wall -O3 -fomit-frame-pointer
>  Francis> + LDFLAGS = -s -N
>
> The problem is that the package expects LD to be gcc.
>
>  Francis> +++ b/package/statserial/statserial.mk
>  Francis> @@ -0,0 +1,20 @@
>  Francis> +#############################################################
>  Francis> +#
>  Francis> +# statserial
>  Francis> +#
>  Francis> +#############################################################
>  Francis> +STATSERIAL_VERSION = 1.1
>  Francis> +STATSERIAL_SOURCE = statserial-$(STATSERIAL_VERSION).tar.gz
>  Francis> +STATSERIAL_SITE =
> http://www.ibiblio.org/pub/Linux/system/serial/
>  Francis> +STATSERIAL_DEPENDENCIES = ncurses
>  Francis> +
>  Francis> +define STATSERIAL_BUILD_CMDS
>  Francis> +    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)"
> CFLAGS="$(TARGET_CFLAGS)"
>
> So it would presumably work if you just passed LD="$(TARGET_CC) $(CFLAGS)"
>

You're absolutely right. And the answer to this was all the time in the
original Makefile. I feel so stupid :-(
Now it's fixed and there's no need for the patch. Thanks!

Francis

====================================================

Add package statserial


Signed-off-by: Francis M. de P. Mendes <francis.mendes@gmail.com>
---
 package/Config.in                |    1 +
 package/statserial/Config.in     |   11 +++++++++++
 package/statserial/statserial.mk |   20 ++++++++++++++++++++
 3 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/statserial/Config.in
 create mode 100644 package/statserial/statserial.mk

diff --git a/package/Config.in b/package/Config.in
index 40f523d..ddcdf53 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -203,6 +203,7 @@ source "package/smartmontools/Config.in"
 source "package/squashfs/Config.in"
 source "package/squashfs3/Config.in"
 source "package/sshfs/Config.in"
+source "package/statserial/Config.in"
 source "package/sysstat/Config.in"
 source "package/udev/Config.in"
 source "package/usb_modeswitch/Config.in"
diff --git a/package/statserial/Config.in b/package/statserial/Config.in
new file mode 100644
index 0000000..b7211bb
--- /dev/null
+++ b/package/statserial/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_STATSERIAL
+    bool "statserial"
+    select BR2_PACKAGE_NCURSES
+    help
+      Displays a table of the signals on a standard
+      9-pin or 25-pin serial port, and indicates the
+      status of the handshaking lines. It can be
+      useful for debugging problems with serial
+      ports or modems.
+
+      https://sites.google.com/site/tranter/software
diff --git a/package/statserial/statserial.mk b/package/statserial/
statserial.mk
new file mode 100644
index 0000000..e072d30
--- /dev/null
+++ b/package/statserial/statserial.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# statserial
+#
+#############################################################
+STATSERIAL_VERSION = 1.1
+STATSERIAL_SOURCE = statserial-$(STATSERIAL_VERSION).tar.gz
+STATSERIAL_SITE = http://www.ibiblio.org/pub/Linux/system/serial/
+STATSERIAL_DEPENDENCIES = ncurses
+
+define STATSERIAL_BUILD_CMDS
+    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+endef
+
+define STATSERIAL_INSTALL_TARGET_CMDS
+    $(INSTALL) -D -m 0755 $(@D)/statserial $(TARGET_DIR)/usr/bin/statserial
+endef
+
+$(eval $(call GENTARGETS,package,statserial))
+
-- 
1.7.0.4
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110607/6d34761b/attachment-0001.html>
