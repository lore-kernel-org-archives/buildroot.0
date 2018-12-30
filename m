From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 17:10:13 +0100
Subject: [Buildroot] [git commit] package/wget: add optional dependency on
 pcre/pcre2
Message-ID: <20181230160534.C891D86DC0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8fe075d9d9ba9b76e10ce092fdd60ca8cbb4656a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Default to pcre2 to mimic upstream configure.ac.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wget/wget.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/wget/wget.mk b/package/wget/wget.mk
index 8d65364016..5cdecbcc81 100644
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
