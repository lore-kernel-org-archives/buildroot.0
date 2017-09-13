From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 14:29:56 +0200
Subject: [Buildroot] [PATCH 3/5] package/ngircd: add optional support for
	gnutls
In-Reply-To: <20170913122958.11805-1-bernd.kuhls@t-online.de>
References: <20170913122958.11805-1-bernd.kuhls@t-online.de>
Message-ID: <20170913122958.11805-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openssl and gnutls can not be enabled at the same time:
https://github.com/ngircd/ngircd/blob/master/configure.ng#L449

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ngircd/ngircd.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 2ab9187c8e..06318a9df3 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -16,6 +16,12 @@ NGIRCD_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 NGIRCD_DEPENDENCIES += openssl
 else
 NGIRCD_CONF_OPTS += --without-openssl
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+NGIRCD_CONF_OPTS += --with-gnutls=$(STAGING_DIR)/usr
+NGIRCD_DEPENDENCIES += gnutls
+else
+NGIRCD_CONF_OPTS += --without-gnutls
+endif
 endif
 
 $(eval $(autotools-package))
-- 
2.11.0
