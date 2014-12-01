From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  2 Dec 2014 00:13:21 +0100
Subject: [Buildroot] [PATCH v2] package/bdwgc: only enable on supported
	architectures
Message-ID: <1417475601-3688-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bdwgc has support for a sub-set of the architectures we support.

Since there is roughly a 50-50 split of our architectures that have
support in bdwgc vs. those that do not, use a positive dependency logic,
rather than a negative one.

The list was constructed by visual inspection of the source code of
bdwgc, but the header doing the check is, to say it politely, a bit
difficult to read...

So, some working archotectures may be missing. Users needing it may
investigate if their architectures are indeed supported.

Fixes;
    http://autobuild.buildroot.net/results/529/529b0b6dd47744c13f56e59a4c669a3f5d56530d/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Pedro Aguilar <paguilar@paguilar.org>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v1 -> v2:
  - fix case for mipsel  (Baruch)
---
 package/bdwgc/Config.in | 7 +++++++
 package/bdwgc/bdwgc.mk  | 2 ++
 package/guile/Config.in | 1 +
 3 files changed, 10 insertions(+)

diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
index 9aa7c7d..215c54d 100644
--- a/package/bdwgc/Config.in
+++ b/package/bdwgc/Config.in
@@ -1,5 +1,12 @@
+config BR2_PACKAGE_BDWGC_ARCH_SUPPORTS
+	default y
+	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_i386 \
+		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_sh \
+		|| BR2_sparc || BR2_x86_64
+
 config BR2_PACKAGE_BDWGC
 	bool "bdwgc"
+	depends on BR2_PACKAGE_BDWGC_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 3e6de1a..b408947 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+# When bumping the version number, check if the list of supported architectures
+# is still valid; see Config.log.
 BDWGC_VERSION = 7.2f
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = http://www.hboehm.info/gc/gc_source
diff --git a/package/guile/Config.in b/package/guile/Config.in
index 009dbdf..8f86e9f 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GUILE
 	bool "guile"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_BDWGC_ARCH_SUPPORTS # bdwgc
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # bdwgc
 	depends on BR2_USE_WCHAR # libunistring
 	select BR2_PACKAGE_LIBUNISTRING
-- 
1.9.1
