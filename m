From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 May 2012 08:18:20 +0300
Subject: [Buildroot] [PATCH] Package proposed: read-edid
In-Reply-To: <CADiAo4KJqO8oC+x8mwKoYWKiFf7wSdOfNfO3LPQgREvkLQwAvg@mail.gmail.com>
References: <CADiAo4KJqO8oC+x8mwKoYWKiFf7wSdOfNfO3LPQgREvkLQwAvg@mail.gmail.com>
Message-ID: <20120503051820.GA20002@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dimitry,

On Thu, May 03, 2012 at 12:36:15AM -0400, Dimitry Golubovsky wrote:
> I would like to propose the read-edid package for inclusion in
> Buildroot. This package provides a pair of utilities: one to issue a
> real-mode BIOS call to read monitor descriptor block (EDID), and other
> to parse it.

Please send your patch inline to ease review. Use may 'git send-email' to 
automate patch sending.

Also, you have to sign-off your patches for them to be included in Buildroot.  
See http://elinux.org/Developer_Certificate_Of_Origin.

A few more comments inline below.

diff --git a/package/Config.in b/package/Config.in
index ed66c05..88c5ffd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -210,6 +210,7 @@ source "package/openocd/Config.in"
 source "package/parted/Config.in"
 source "package/pciutils/Config.in"
 source "package/picocom/Config.in"
+source "package/read-edid/Config.in"
 source "package/rng-tools/Config.in"
 source "package/sane-backends/Config.in"
 source "package/sdparm/Config.in"
diff --git a/package/read-edid/Config.in b/package/read-edid/Config.in
new file mode 100644
index 0000000..caeb119
--- /dev/null
+++ b/package/read-edid/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_READ_EDID
+	bool "read-edid"

read-edid can only run on x86 PCs and PowerPC Macs, so it should depend on 
(BR2_i386 || BR2_x86_64 || BR2_powerpc).

+	help
+	  Read-edid is a pair of tools (originally by John Fremlin) for reading the EDID 
+	  from a monitor.  It should work with most monitors made since 1996 (except for 
+	  newer ones with 256-byte EDID's - WiP),  assuming the video card supports  the 
+	  standard read commands (most do).  Read-edid is a set of two tools - get-edid, 
+	  which gets  the raw edid  information from the monitor,  and parse-edid, which 
+	  turns the raw binary information into an XF86Config-compatible monitor section.
+
+	  http://polypux.org/projects/read-edid/
diff --git a/package/read-edid/read-edid.mk b/package/read-edid/read-edid.mk
new file mode 100644
index 0000000..6033957
--- /dev/null
+++ b/package/read-edid/read-edid.mk
@@ -0,0 +1,21 @@
+############################################
+#
+# read-edid
+# 
+############################################
+
+READ_EDID_VERSION = 1.4.2
+READ_EDID_SOURCE = read-edid-$(READ_EDID_VERSION).tar.gz

This is the default value. Just drop this line.

+READ_EDID_SITE = http://www.polypux.org/projects/read-edid/
+
+define READ_EDID_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)

You can use $(TARGET_CONFIGURE_OPTS) instead of specifying CC and LD.

+endef
+
+define READ_EDID_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/get-edid $(TARGET_DIR)/bin
+	$(INSTALL) -D -m 0755 $(@D)/parse-edid $(TARGET_DIR)/bin
+endef
+
+$(eval $(call AUTOTARGETS,package,read-edid))

The last two parameters of AUTOTARGETS are not needed anymore.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
