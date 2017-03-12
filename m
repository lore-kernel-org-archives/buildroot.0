From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Mar 2017 12:33:27 +0100
Subject: [Buildroot] [PATCH 4/5] package/gnupg2: add optional support for
	sqlite
In-Reply-To: <20170312113328.5745-1-bernd.kuhls@t-online.de>
References: <20170312113328.5745-1-bernd.kuhls@t-online.de>
Message-ID: <20170312113328.5745-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add host-pkgconf to detect sqlite support, otherwise

checking pkg-config is at least version 0.9.0...
 ./configure: line 7981: /home/buildroot/br2/output/host/usr/bin/pkg-config: No such file or directory
no
[...]
checking for SQLITE3... no

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gnupg2/gnupg2.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
index 55190cc80..d7f277cdf 100644
--- a/package/gnupg2/gnupg2.mk
+++ b/package/gnupg2/gnupg2.mk
@@ -10,7 +10,7 @@ GNUPG2_SITE = ftp://ftp.gnupg.org/gcrypt/gnupg
 GNUPG2_LICENSE = GPLv3+
 GNUPG2_LICENSE_FILES = COPYING
 GNUPG2_DEPENDENCIES = zlib libgpg-error libgcrypt libassuan libksba libnpth \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) host-pkgconf
 
 GNUPG2_CONF_OPTS = \
 	--disable-rpath --disable-regex --disable-doc \
@@ -49,4 +49,11 @@ else
 GNUPG2_CONF_OPTS += --without-readline
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+GNUPG2_CONF_OPTS += --enable-sqlite
+GNUPG2_DEPENDENCIES += sqlite
+else
+GNUPG2_CONF_OPTS += --disable-sqlite
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
