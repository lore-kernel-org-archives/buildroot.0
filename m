From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 2 Jan 2013 15:52:58 +0100
Subject: [Buildroot] [git commit] gnutls: handle libidn properly
Message-ID: <20130102145306.F077A9A5BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7155fb7dd6386377eaf05b7436bc9c5dd024d0ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add it to the dependencies when it's available.
But disable crywrap when it's a nommu system since it uses fork()

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gnutls/gnutls.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 1cbcf70..4c918c1 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -20,6 +20,10 @@ GNUTLS_INSTALL_STAGING = YES
 # libpthread autodetection poisons the linkpath
 GNUTLS_CONF_OPT += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(STAGING_DIR)/usr)
 
+# libidn support for nommu must exclude the crywrap wrapper (uses fork)
+GNUTLS_CONF_OPT += $(if $(BR2_USE_MMU),,--disable-crywrap)
+GNUTLS_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBIDN),libidn)
+
 # Some examples in doc/examples use wchar
 define GNUTLS_DISABLE_DOCS
 	$(SED) 's/ doc / /' $(@D)/Makefile.in
