From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 21:51:13 +0100
Subject: [Buildroot] [git commit] gnutls: remove manual tools disabling
	kludge
Message-ID: <20151215205918.C9FD57F91C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=869a4c6fea27e9455191e2390a25a7f48afbce25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's no longer required, tools are guarded by ENABLE_TOOLS in
Makefile.am and excluded accordingly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gnutls/gnutls.mk | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 2855e8f..0ab521e 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -20,7 +20,8 @@ GNUTLS_CONF_OPTS = \
 	--enable-openssl-compatibility \
 	--with-libnettle-prefix=$(STAGING_DIR)/usr \
 	--with-librt-prefix=$(STAGING_DIR) \
-	--without-tpm
+	--without-tpm \
+	$(if $(BR2_PACKAGE_GNUTLS_TOOLS),--enable-tools,--disable-tools)
 GNUTLS_CONF_ENV = gl_cv_socket_ipv6=yes \
 	ac_cv_header_wchar_h=$(if $(BR2_USE_WCHAR),yes,no) \
 	gt_cv_c_wchar_t=$(if $(BR2_USE_WCHAR),yes,no) \
@@ -80,11 +81,4 @@ else
 GNUTLS_CONF_OPTS += --without-zlib
 endif
 
-define GNUTLS_DISABLE_TOOLS
-	$(SED) 's/\$$(PROGRAMS)//' $(@D)/src/Makefile.in
-	$(SED) 's/) install-exec-am/)/' $(@D)/src/Makefile.in
-endef
-
-GNUTLS_POST_PATCH_HOOKS += $(if $(BR2_PACKAGE_GNUTLS_TOOLS),,GNUTLS_DISABLE_TOOLS)
-
 $(eval $(autotools-package))
