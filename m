From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Jul 2020 17:51:35 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] package/vlc: fix build with live555 and without openssl
In-Reply-To: <20200713155135.1214109-1-fontaine.fabrice@gmail.com>
References: <20200713155135.1214109-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713155135.1214109-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass -DNO_OPENSSL to avoid a build failure with live555 but without
openssl

Fixes:
 - http://autobuild.buildroot.org/results/70ca93aa5c9488a4657c7bcafa40bfb2e974a5b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vlc/vlc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 38d9751690..ccaaa6cd6d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -440,6 +440,9 @@ endif
 ifeq ($(BR2_PACKAGE_LIVE555),y)
 VLC_CONF_OPTS += --enable-live555
 VLC_DEPENDENCIES += live555
+ifneq ($(BR2_PACKAGE_OPENSSL),y)
+VLC_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DNO_OPENSSL"
+endif
 else
 VLC_CONF_OPTS += --disable-live555
 endif
-- 
2.27.0
