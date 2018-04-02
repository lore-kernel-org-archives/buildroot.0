From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 00:28:45 +0200
Subject: [Buildroot] [git commit] libcurl: add brotli optional dependency
Message-ID: <20180402222935.E56E683B17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7d658e0291b78553bf4eca704f0d0202bcf031f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The brotli package has recently been added to Buildroot. Add brotli an
an optional dependency to libcurl to make the build consistent.

It turns out that libcurl configure script uses pkg-config to figure
out link libraries only when --with-brotli is explicitly set. So this
also fixes static build failure.

Fixes:
http://autobuild.buildroot.net/results/64b/64bc0dfe284206390ae0680b94c0876863a3c0f3/
http://autobuild.buildroot.net/results/233/23376d8653dea6361e42b0f17b6aaab3c14d99cf/
http://autobuild.buildroot.net/results/b19/b198db4b69e18e6d01ec95aae9c6096c1912dd9c/

Cc: Adrian Perez de Castro <aperez@igalia.com>
Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index c6289e05f4..a3e66d094c 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -76,6 +76,13 @@ else
 LIBCURL_CONF_OPTS += --without-libssh2
 endif
 
+ifeq ($(BR2_PACKAGE_BROTLI),y)
+LIBCURL_DEPENDENCIES += brotli
+LIBCURL_CONF_OPTS += --with-brotli
+else
+LIBCURL_CONF_OPTS += --without-brotli
+endif
+
 define LIBCURL_FIX_DOT_PC
 	printf 'Requires: openssl\n' >>$(@D)/libcurl.pc.in
 endef
