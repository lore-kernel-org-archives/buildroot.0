From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Sep 2018 20:54:36 +0200
Subject: [Buildroot] [PATCH 1/1] botan: fix build on uclibc
Message-ID: <20180911185436.15777-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uclibc does not have sys/auxv.h so disable getauxval

Fixes:
 - http://autobuild.buildroot.org/results/0000636025b843ab343dc45ccd29979325aff428

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index e352fab6c9..4788617d4a 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -40,6 +40,10 @@ else
 BOTAN_CONF_OPTS += --without-stack-protector
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+BOTAN_CONF_OPTS += --without-os-feature=getauxval
+endif
+
 ifeq ($(BR2_PACKAGE_BOOST),y)
 BOTAN_DEPENDENCIES += boost
 BOTAN_CONF_OPTS += --with-boost
-- 
2.17.1
