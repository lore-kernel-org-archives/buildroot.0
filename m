From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 16:49:33 +0100
Subject: [Buildroot] [git commit] package/libsepol: change policy version to
 an int
Message-ID: <20200203154034.7D9A6888DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=45bd1e73a9297239bc318df2d57ecb70a4fc7bb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The policy version has to be a number, as such, set the type to int.

Due to the type change, we can't any longer do the legacy handling of
re-using the refpolicy policy version.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsepol/Config.in     | 5 ++---
 package/refpolicy/refpolicy.mk | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 049c915c36..3b84c90761 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -10,9 +10,8 @@ config BR2_PACKAGE_LIBSEPOL
 if BR2_PACKAGE_LIBSEPOL
 
 config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
-	string "Policy version"
-	default BR2_PACKAGE_REFPOLICY_POLICY_VERSION if BR2_PACKAGE_REFPOLICY_POLICY_VERSION != ""
-	default "30"
+	int "Policy version"
+	default 30
 
 endif
 
diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index 3f421e2ac1..1a5fefff06 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -25,8 +25,7 @@ REFPOLICY_MAKE = \
 	$(TARGET_MAKE_ENV) \
 	$(MAKE1)
 
-REFPOLICY_POLICY_VERSION = \
-	$(call qstrip,$(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION))
+REFPOLICY_POLICY_VERSION = $(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION)
 REFPOLICY_POLICY_STATE = \
 	$(call qstrip,$(BR2_PACKAGE_REFPOLICY_POLICY_STATE))
 
