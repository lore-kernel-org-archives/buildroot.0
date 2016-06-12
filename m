From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Jun 2016 22:07:20 +0200
Subject: [Buildroot] [PATCH v2 3/5] package/libv4l: add optional support for
	alsa-lib
In-Reply-To: <1465762042-18942-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465762042-18942-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465762042-18942-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add alsa-lib as optional dependency to get a reproducable build.
Without this patch configure logs:

checking for ALSA... no
configure: WARNING: ALSA library not available

After this patch alsa-lib was built before libv4l:
checking for ALSA... yes

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/libv4l/libv4l.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index d0a0369..e7a57f0 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -18,6 +18,10 @@ LIBV4L_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
 LIBV4L_LICENSE = GPLv2+ (utilities), LGPLv2.1+ (libraries)
 LIBV4L_LICENSE_FILES = COPYING COPYING.libv4l lib/libv4l1/libv4l1-kernelcode-license.txt
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+LIBV4L_DEPENDENCIES += alsa-lib
+endif
+
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 LIBV4L_DEPENDENCIES += argp-standalone
 LIBV4L_LIBS += -largp
-- 
2.8.1
