From: Francis Mendes <francis.mendes@gmail.com>
Date: Mon, 6 Jun 2011 22:54:46 -0300
Subject: [Buildroot] Add package statserial
In-Reply-To: <20110606212121.335044b2@skate>
References: <BANLkTi=bZM8DpVptAVzw13Xs4V0d7b2rVg@mail.gmail.com>
	<20110606212121.335044b2@skate>
Message-ID: <BANLkTi=AamsYp47dfhXa6RtJTATze7sCOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, Jun 6, 2011 at 16:21, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello Francis,
>
> Le Mon, 6 Jun 2011 00:03:36 -0300,
> Francis Mendes <francis.mendes@gmail.com> a ?crit :
>
> > I needed this package and added it to Buildroot.
> >
> > Can anyone review the attached patch for any mistakes?
>
> Thanks for this submission!
>
> It would be nicer to attach the patch inline, as it is easier to make
> comments through the patch.
>

Sorry about that. The new patch is attached inline below.


> Two comments :
>
>  * You should "select" BR2_PACKAGE_NCURSES instead of "depends on".
>   That's the dependency type we use for the dependency of programs on
>   libraries.
>

Fixed.


>  * Your statserial-1.1-fixmakefile.patch should have a header with a
>   description saying why it is needed, and with a Signed-off-by line.
>   From a quick read, I don't see why the patch is needed.
>

The original Makefile compiles the source code to statserial.o and then
links it. I don't know exactly why, but the linker fails with the message
"undefined reference to `atexit'". Searching in the web, I found someone
suggesting to compile and link in a single step using gcc, and it worked for
me. The purpose of the patch is to compile and link the source code this
way. If someone has a better way to fix the problem, let me know.


>  * Your installation line should be
>   $(INSTALL) -D -m 0755 $(@D)/statserial $(TARGET_DIR)/usr/bin/statserial
>   otherwise your statserial binary will be named "bin" in
>   $(TARGET_DIR)/usr if the usr/bin directory does not exist.
>

Fixed.

Otherwise, looks good.
>

Thanks for the input. Below is the new patch. If there's still something
wrong, let me know.

Francis

=====================================================

Add package statserial


Signed-off-by: Francis M. de P. Mendes <francis.mendes@gmail.com>

 create mode 100644 package/statserial/Config.in
 create mode 100644 package/statserial/statserial-1.1-fixmakefile.patch
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
index 0000000..b4d69ea
--- /dev/null
+++ b/package/statserial/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_STATSERIAL
+    bool "statserial"
+    select BR2_PACKAGE_NCURSES
+    help
+        Displays a table of the signals on a standard
+        9-pin or 25-pin serial port, and indicates the
+        status of the handshaking lines. It can be
+        useful for debugging problems with serial
+        ports or modems.
+
+        https://sites.google.com/site/tranter/software
diff --git a/package/statserial/statserial-1.1-fixmakefile.patch
b/package/statserial/statserial-1.1-fixmakefile.patch
new file mode 100644
index 0000000..88cdd3f
--- /dev/null
+++ b/package/statserial/statserial-1.1-fixmakefile.patch
@@ -0,0 +1,26 @@
+Compile and link the source in one step only
+
+
+Signed-off-by: Francis M. de P. Mendes <francis.mendes@gmail.com>
+
+diff --git a/Makefile b/Makefile
+index 2ed79f1..bf82034 100644
+--- a/Makefile
++++ b/Makefile
+@@ -9,11 +9,8 @@ LD    = gcc
+ CFLAGS    = -Wall -O3 -fomit-frame-pointer
+ LDFLAGS = -s -N
+
+-statserial:    statserial.o
+-    $(LD) $(LDFLAGS) -o statserial statserial.o -lcurses
+-
+-statserial.o: statserial.c
+-    $(CC) $(CFLAGS) -c statserial.c
++statserial:
++    $(CC) $(CFLAGS) -lcurses -o statserial statserial.c
+
+ install: statserial
+     install -m 555 statserial /usr/local/bin/statserial
+--
+1.7.0.4
+
diff --git a/package/statserial/statserial.mk b/package/statserial/
statserial.mk
new file mode 100644
index 0000000..500a97b
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
+    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" CFLAGS="$(TARGET_CFLAGS)"
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110606/10eb3e04/attachment.html>
