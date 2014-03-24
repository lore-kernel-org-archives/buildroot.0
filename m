From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 24 Mar 2014 20:29:45 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/1=5D_host-mtools=3A_Fix_build_fa?=
	=?utf-8?q?ilure_introduced_by_libiconv_dependency?=
Message-ID: <BLU0-SMTP166C506BEDB8CDC67D076CFD97A0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/8ff/8ff7fc94cc3e54f5608f7b4d2e6ccba5fd8e4177/

Also disable parallel make because "make install" is broken, see
http://lists.openembedded.org/pipermail/openembedded-commits/2011-October/134396.html

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 package/mtools/mtools.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 8649325..9dc72f3 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -16,7 +16,12 @@ MTOOLS_CONF_OPT = --without-x
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 MTOOLS_DEPENDENCIES += libiconv
 MTOOLS_CONF_ENV += LIBS=-liconv
+# We have no host dependencies
+HOST_MTOOLS_DEPENDENCIES =
 endif
 
+#?Package does not build in parallel due to improper make rules
+MTOOLS_MAKE = $(MAKE1)
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.7.10.4
