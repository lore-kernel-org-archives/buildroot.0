From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Jun 2012 15:06:27 +0200
Subject: [Buildroot] [git commit] cups: fix libdir handling
Message-ID: <20120606130646.1429C96E86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=edd2716c4369801770c10fad5565ab0d3e117c3f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cups uses /usr/lib64 if the HOST has it, no matter if it is cross compiling
for a 32bit arch, breaking the build for stuff looking in /usr/lib.

Fixes http://autobuild.buildroot.net/results/4ed4f5b43d05a40ab15f141442f15da56c87be3b

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cups/cups.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index f06502a..6d906ec 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -13,7 +13,8 @@ CUPS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) DSTROOT=$(TARGET_DIR) install
 CUPS_CONF_OPT = --without-perl \
 		--without-java \
 		--disable-gnutls \
-		--disable-gssapi
+		--disable-gssapi \
+		--libdir=/usr/$(if $(BR2_ARCH_IS_64),lib64,lib)
 
 CUPS_DEPENDENCIES = $(if $(BR2_PACKAGE_ZLIB),zlib) \
 		    $(if $(BR2_PACKAGE_LIBPNG),libpng) \
