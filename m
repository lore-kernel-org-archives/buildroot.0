From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 10:39:09 +0200
Subject: [Buildroot] [git commit] botan: fix build on uclibc
Message-ID: <20180912083809.CC59E84386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd9ad13bed514990c06d2be2c4f8aff243cb4229
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uclibc does not have sys/auxv.h so disable getauxval

Fixes:
 - http://autobuild.buildroot.org/results/0000636025b843ab343dc45ccd29979325aff428

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
