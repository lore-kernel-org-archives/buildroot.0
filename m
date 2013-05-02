From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Thu,  2 May 2013 15:00:42 +0200
Subject: [Buildroot] [PATCH v3 03/11] arc: Add support for ARC-specific
	binutils
In-Reply-To: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
References: <1367499650-29869-1-git-send-email-mjonker@synopsys.com>
Message-ID: <1367499650-29869-4-git-send-email-mjonker@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC support is not upstream yet...

package/binutils: add host-{flex,bison} dependencies for 2.19-arc

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>
---
 .../binutils/2.19-arc/add-empty-info-files.patch   |   72 ++++++++++++++++++++
 package/binutils/Config.in.host                    |    2 +
 package/binutils/binutils.mk                       |    7 ++
 3 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 package/binutils/2.19-arc/add-empty-info-files.patch

diff --git a/package/binutils/2.19-arc/add-empty-info-files.patch b/package/binutils/2.19-arc/add-empty-info-files.patch
new file mode 100644
index 0000000..90de429
--- /dev/null
+++ b/package/binutils/2.19-arc/add-empty-info-files.patch
@@ -0,0 +1,72 @@
+binutils: add empty info files to remove makeinfo dependency
+
+Signed-off-by: Mischa jonker <mjonker@synopsys.com>
+---
+ bfd/doc/bfd.info           |    1 +
+ binutils/doc/binutils.info |    1 +
+ etc/configure.info         |    1 +
+ etc/standards.info         |    1 +
+ gas/doc/as.info            |    1 +
+ gprof/gprof.info           |    1 +
+ ld/ld.info                 |    1 +
+ 7 files changed, 7 insertions(+), 0 deletions(-)
+ create mode 100644 bfd/doc/bfd.info
+ create mode 100644 binutils/doc/binutils.info
+ create mode 100644 etc/configure.info
+ create mode 100644 etc/standards.info
+ create mode 100644 gas/doc/as.info
+ create mode 100644 gprof/gprof.info
+ create mode 100644 ld/ld.info
+
+diff --git a/bfd/doc/bfd.info b/bfd/doc/bfd.info
+new file mode 100644
+index 0000000..8b13789
+--- /dev/null
++++ b/bfd/doc/bfd.info
+@@ -0,0 +1 @@
++
+diff --git a/binutils/doc/binutils.info b/binutils/doc/binutils.info
+new file mode 100644
+index 0000000..8b13789
+--- /dev/null
++++ b/binutils/doc/binutils.info
+@@ -0,0 +1 @@
++
+diff --git a/etc/configure.info b/etc/configure.info
+new file mode 100644
+index 0000000..8b13789
+--- /dev/null
++++ b/etc/configure.info
+@@ -0,0 +1 @@
++
+diff --git a/etc/standards.info b/etc/standards.info
+new file mode 100644
+index 0000000..8b13789
+--- /dev/null
++++ b/etc/standards.info
+@@ -0,0 +1 @@
++
+diff --git a/gas/doc/as.info b/gas/doc/as.info
+new file mode 100644
+index 0000000..8b13789
+--- /dev/null
++++ b/gas/doc/as.info
+@@ -0,0 +1 @@
++
+diff --git a/gprof/gprof.info b/gprof/gprof.info
+new file mode 100644
+index 0000000..8b13789
+--- /dev/null
++++ b/gprof/gprof.info
+@@ -0,0 +1 @@
++
+diff --git a/ld/ld.info b/ld/ld.info
+new file mode 100644
+index 0000000..8b13789
+--- /dev/null
++++ b/ld/ld.info
+@@ -0,0 +1 @@
++
+-- 
+1.7.0.4
+
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index a61a503..d9bab44 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -2,6 +2,7 @@ comment "Binutils Options"
 
 choice
 	prompt "Binutils Version"
+	depends on !BR2_arc
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
 	default BR2_BINUTILS_VERSION_2_21_1 if (!BR2_UCLIBC_VERSION_0_9_31)
 	default BR2_BINUTILS_VERSION_2_21
@@ -41,6 +42,7 @@ endchoice
 config BR2_BINUTILS_VERSION
 	string
 	default "2.18-avr32-1.0.1" if BR2_BINUTILS_VERSION_2_18_AVR32_1_0_1
+	default "2.19-arc"	if BR2_arc
 	default "2.20.1"	if BR2_BINUTILS_VERSION_2_20_1
 	default "2.21"		if BR2_BINUTILS_VERSION_2_21
 	default "2.21.1"	if BR2_BINUTILS_VERSION_2_21_1
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 92e0a74..081be6a 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -26,6 +26,9 @@ BINUTILS_SITE = $(BR2_GNU_MIRROR)/binutils
 ifeq ($(ARCH),avr32)
 BINUTILS_SITE = ftp://www.at91.com/pub/buildroot
 endif
+ifeq ($(BR2_arc),y)
+BINUTILS_SITE = $(BR2_ARC_SITE)
+endif
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
 BINUTILS_INSTALL_STAGING = YES
 BINUTILS_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
@@ -52,7 +55,11 @@ HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 			--with-sysroot=$(STAGING_DIR) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
+ifeq ($(BINUTILS_VERSION),2.19-arc)
+HOST_BINUTILS_DEPENDENCIES = host-flex host-bison
+else
 HOST_BINUTILS_DEPENDENCIES =
+endif
 
 # We just want libbfd and libiberty, not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
-- 
1.7.0.4
