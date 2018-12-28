From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 28 Dec 2018 08:04:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/wget: add optional dependency on
 pcre/pcre2
In-Reply-To: <8e7b99203d2d931a90f1386c9cbd7823e1bcc647.1545977060.git.baruch@tkos.co.il>
References: <8e7b99203d2d931a90f1386c9cbd7823e1bcc647.1545977060.git.baruch@tkos.co.il>
Message-ID: <23f351ac07ecded68a036df8d9eb35e63076f978.1545977060.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Default to pcre2 to mimic upstream configure.ac.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/wget/wget.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 8d65364016b2..5cdecbcc81a8 100644
--- a/package/wget/wget.mk
+++ b/package/wget/wget.mk
@@ -39,4 +39,14 @@ else
 WGET_CONF_OPTS += --without-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+WGET_CONF_OPTS += --disable-pcre --enable-pcre2
+WGET_DEPENDENCIES += pcre2
+else ifeq ($(BR2_PACKAGE_PCRE),y)
+WGET_CONF_OPTS += --enable-pcre --disable-pcre2
+WGET_DEPENDENCIES += pcre
+else
+WGET_CONF_OPTS += --disable-pcre --disable-pcre2
+endif
+
 $(eval $(autotools-package))
-- 
2.19.2
