From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 12:11:20 +0200
Subject: [Buildroot] [PATCH 2/3] package/libsndfile: add external libs
 support
In-Reply-To: <20210523101121.1517749-1-fontaine.fabrice@gmail.com>
References: <20210523101121.1517749-1-fontaine.fabrice@gmail.com>
Message-ID: <20210523101121.1517749-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsndfile/libsndfile.mk | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/libsndfile/libsndfile.mk b/package/libsndfile/libsndfile.mk
index 2505e8d17f..d0bceecb36 100644
--- a/package/libsndfile/libsndfile.mk
+++ b/package/libsndfile/libsndfile.mk
@@ -18,7 +18,17 @@ LIBSNDFILE_IGNORE_CVES += CVE-2018-13419
 LIBSNDFILE_CONF_OPTS = \
 	--disable-sqlite \
 	--disable-alsa \
-	--disable-external-libs \
 	--disable-full-suite
 
+ifeq ($(BR2_PACKAGE_FLAC)$(BR2_PACKAGE_LIBVORBIS)$(BR2_PACKAGE_OPUS),yyy)
+LIBSNDFILE_DEPENDENCIES += \
+	flac \
+	host-pkgconf \
+	libvorbis \
+	opus
+LIBSNDFILE_CONF_OPTS += --enable-external-libs
+else
+LIBSNDFILE_CONF_OPTS += --disable-external-libs
+endif
+
 $(eval $(autotools-package))
-- 
2.30.2
