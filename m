From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:05:49 +0200
Subject: [Buildroot] [PATCH 16/41] directfb: drop forced linux-fusion with
	multiapp
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-17-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Linux-fusion isn't mandatory anymore for directfb to work with multi
app. Indeed, directfb has a userspace fusion implementation (still
unstable but anyway...).

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/directfb/Config.in   |    1 -
 package/directfb/directfb.mk |   13 ++++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index cace1fa..cd95da7 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -9,7 +9,6 @@ if BR2_PACKAGE_DIRECTFB
 
 config BR2_PACKAGE_DIRECTFB_MULTI
 	bool "directfb multi application"
-	select BR2_PACKAGE_LINUX_FUSION
 	help
 	  Enable use of multiple concurrent DirectFB applications
 
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 9b1cecf..3dcad13 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -11,14 +11,17 @@ DIRECTFB_AUTORECONF = NO
 DIRECTFB_LIBTOOL_PATCH = NO
 HOST_DIRECTFB_LIBTOOL_PATCH = NO
 DIRECTFB_INSTALL_STAGING = YES
-DIRECTFB_INSTALL_TARGET = YES
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_MULTI),y)
-DIRECTFB_MULTI:=--enable-multi --enable-fusion
-DIRECTFB_FUSION:=linux-fusion
+DIRECTFB_MULTI = --enable-multi
+ifeq ($(BR2_PACKAGE_LINUX_FUSION),y)
+DIRECTFB_FUSION = linux-fusion
 else
-DIRECTFB_MULTI:=
-DIRECTFB_FUSION:=
+DIRECTFB_FUSION =
+endif
+else
+DIRECTFB_MULTI =
+DIRECTFB_FUSION =
 endif
 
 ifeq ($(BR2_PACKAGE_DIRECTFB_DEBUG),y)
-- 
1.7.0.4
