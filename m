From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 6 May 2020 07:22:52 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libsepol: fix
 help text for BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
Message-ID: <20200506051931.E603B8B7AF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7c6cc0dd7dc12b8d6d7026ce17fa3586cd30ba5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The help text was wrong, as it didn't match the actual default values
we were specifying. Indeed, when we specify:

        default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
        default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3

It means that the policy version 30 is supported starting from Linux
4.3 included, and that 31 is supported from Linux 4.13 included.

So we shouldn't have:

	  > 4.3 <= 4.13    30
	  > 4.13           31

but:

	  >= 4.3 < 4.13    30
	  >= 4.13          31

This patch fixes that for all versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 67d7705a9aa58886e8a8777fe4c95746c1fb5c96)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsepol/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 21d4d7865c..21d9e96179 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -22,12 +22,12 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 
 	  Here's a handy table to help you choose:
 	  kernel version   SElinux policy max version
-	  <= 2.6.x         25
-	  > 2.6 <= 3.5     26
-	  > 3.5 <= 3.14    28 (27 and 28 were added@the same time)
-	  > 3.14 <= 4.3    29
-	  > 4.3 <= 4.13    30
-	  > 4.13           31
+	  < 2.6.x          25
+	  >= 2.6 < 3.5     26
+	  >= 3.5 < 3.14    28 (27 and 28 were added@the same time)
+	  >= 3.14 < 4.3    29
+	  >= 4.3 < 4.13    30
+	  >= 4.13          31
 
 endif
 
