From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Dec 2012 19:07:33 +0100
Subject: [Buildroot] [git commit] webkit: silence gazillions of warnings
Message-ID: <20121215201829.53CEC9A1F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d2d81f4b3420ae004bdcd3b3edf742ac7f10ff7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building webkit with a recent gcc versions gives gazillions of
warnings such as 'warning: cast from 'WTF::AlignedBufferChar* {aka
char*}' to 'JSC::Identifier*' increases required alignment of target
type [-Wcast-align]'.

Those make the webkit build very noise, and hard to debug, so let's
silence those warnings.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/webkit.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

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
