From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 27 Feb 2020 18:47:10 +0100
Subject: [Buildroot] [PATCH/next 2/6] package/ortp: bump to version 4.3.1
In-Reply-To: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
References: <20200227174714.3727844-1-fontaine.fabrice@gmail.com>
Message-ID: <20200227174714.3727844-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- License is GPL-3.0+ since version 4.3.0 and
  https://gitlab.linphone.org/BC/public/ortp/commit/6b925368588ce0fc64a9762dbe86041151e8450a
- Switch to cmake-package

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ortp/ortp.hash |  4 ++--
 package/ortp/ortp.mk   | 23 ++++++++++++++++-------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/package/ortp/ortp.hash b/package/ortp/ortp.hash
index 93ec39297f..65a5141609 100644
--- a/package/ortp/ortp.hash
+++ b/package/ortp/ortp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eb61a833ab3ad80978d7007411240f46e9b2d1034373b9d9dfaac88c1b6ec0af  ortp-0.27.0.tar.gz
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+sha256  55d12b71ed7c3958abb8d892105e616499d66c88200c46e3ec3cfbbe79771b2e  ortp-4.3.1.tar.gz
+sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/ortp/ortp.mk b/package/ortp/ortp.mk
index 0bd61e88d9..436e04c14d 100644
--- a/package/ortp/ortp.mk
+++ b/package/ortp/ortp.mk
@@ -4,13 +4,22 @@
 #
 ################################################################################
 
-ORTP_VERSION = 0.27.0
-ORTP_SITE = http://download.savannah.nongnu.org/releases/linphone/ortp/sources
-
-ORTP_CONF_OPTS = --disable-strict
+ORTP_VERSION = 4.3.1
+ORTP_SITE = https://gitlab.linphone.org/BC/public/ortp/-/archive/$(ORTP_VERSION)
+ORTP_LICENSE = GPL-3.0+
+ORTP_LICENSE_FILES = LICENSE.txt
 ORTP_INSTALL_STAGING = YES
-ORTP_LICENSE = LGPL-2.1+
-ORTP_LICENSE_FILES = COPYING
 ORTP_DEPENDENCIES = bctoolbox
+ORTP_CONF_OPTS = \
+	-DENABLE_DOC=OFF \
+	-DENABLE_STRICT=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+ORTP_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+ORTP_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+ORTP_CONF_OPTS += -DENABLE_STATIC=OFF -DENABLE_SHARED=ON
+endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.25.0
