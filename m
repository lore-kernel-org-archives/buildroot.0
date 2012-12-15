From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Dec 2012 18:29:41 +0100
Subject: [Buildroot] [PATCH 4/5] webkit: silence gazillions of warnings
In-Reply-To: <1355592582-31374-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1355592582-31374-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1355592582-31374-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building webkit with a recent gcc versions gives gazillions of
warnings such as 'warning: cast from 'WTF::AlignedBufferChar* {aka
char*}' to 'JSC::Identifier*' increases required alignment of target
type [-Wcast-align]'.

Those make the webkit build very noise, and hard to debug, so let's
silence those warnings.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/webkit/webkit.mk |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 580c5d2..326be14 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -9,7 +9,13 @@ WEBKIT_SITE = http://www.webkitgtk.org
 WEBKIT_INSTALL_STAGING = YES
 WEBKIT_DEPENDENCIES = host-flex host-gperf icu libcurl libxml2 libxslt \
 			libgtk2 sqlite enchant libsoup jpeg libgail
-WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config
+
+# Give explicit path to icu-config, and silence gazillions of warnings
+# with recent gcc versions.
+WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config \
+	CFLAGS="$(TARGET_CFLAGS) -Wno-cast-align" \
+	CXXFLAGS="$(TARGET_CXXFLAGS) -Wno-cast-align"
+
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 	WEBKIT_CONF_OPT += --with-target=x11
-- 
1.7.9.5
