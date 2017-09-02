From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 02 Sep 2017 13:13:43 -0000
Subject: [Buildroot] [git commit] expat: bump to version 2.2.3
Message-ID: <20170902130615.AACE180285@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0a7ac88739214d5d83c101c24b700d9534e831a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the XML_POOR_ENTROPY workaround. Upstream commit fd9581a34e5665
(Never require XML_POOR_ENTROPY for "./configure && make") fixes this
issue.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/expat/expat.hash |  8 ++++----
 package/expat/expat.mk   | 11 +----------
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index f1e1919..ccf74d6 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.2.2/
-md5	1ede9a41223c78528b8c5d23e69a2667	expat-2.2.2.tar.bz2
-sha1	891cee988b38d5d66953f62f94c3150b8810a70a	expat-2.2.2.tar.bz2
+# From https://sourceforge.net/projects/expat/files/expat/2.2.3/
+md5	f053af63ef5f39bd9b78d01fbc203334	expat-2.2.3.tar.bz2
+sha1	e2be3a2aa8d12ce70184aab418d0d5d96ed86d0e	expat-2.2.3.tar.bz2
 # Calculated based on the hashes above
-sha256	4376911fcf81a23ebd821bbabc26fd933f3ac74833f74924342c29aad2c86046	expat-2.2.2.tar.bz2
+sha256	b31890fb02f85c002a67491923f89bda5028a880fd6c374f707193ad81aace5f	expat-2.2.3.tar.bz2
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a78d326..a6fa373 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.2.2
+EXPAT_VERSION = 2.2.3
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.bz2
 EXPAT_INSTALL_STAGING = YES
@@ -15,14 +15,5 @@ HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
 
-# Kernel versions older than 3.17 do not support getrandom()
-ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17),)
-EXPAT_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DXML_POOR_ENTROPY"
-endif
-
-# Make build succeed on host kernel older than 3.17. getrandom() will still
-# be used on newer kernels.
-HOST_EXPAT_CONF_ENV += CPPFLAGS="$(HOST_CPPFLAGS) -DXML_POOR_ENTROPY"
-
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
