From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 27 Apr 2013 17:09:48 -0300
Subject: [Buildroot] [PATCH 5/6] gnutls: enable cryptodev-linux support
In-Reply-To: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
References: <1367093389-23877-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1367093389-23877-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unfortunately because of header file differencies this can't be used for
OCF.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 21ace1c..610a5a2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -24,6 +24,11 @@ GNUTLS_CONF_OPT += $(if $(BR2_TOOLCHAIN_HAS_THREADS),--with-libpthread-prefix=$(
 GNUTLS_CONF_OPT += $(if $(BR2_USE_MMU),,--disable-crywrap)
 GNUTLS_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBIDN),libidn)
 
+ifeq ($(BR2_PACKAGE_CRYPTODEV_LINUX),y)
+	GNUTLS_CONF_OPT += --enable-cryptodev
+	GNUTLS_DEPENDENCIES += cryptodev-linux
+endif
+
 # Some examples in doc/examples use wchar
 define GNUTLS_DISABLE_DOCS
 	$(SED) 's/ doc / /' $(@D)/Makefile.in
-- 
1.8.1.5
