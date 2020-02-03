From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 16:49:33 +0100
Subject: [Buildroot] [git commit] package/libsepol: set default policy
 version
Message-ID: <20200203154034.89DAC873EB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55784bcbfa77671359a6e7a98a6a73bf8cc73126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If a policy is built that is newer than the kernel can support, the
libsepol will fail to load that policy.

Indeed, a user can manually select the policy version in the config
as-is. However, it is not a friendly solution. The best solution available
is to set a default policy version based off of the toolchain header kernel
version. While a user may have a toolchain that has older kernel headers than
the built kernel, it is still better than setting the default to the maximum
available version that SELinux can support.

The following defaults policy versions are as follows for the given toolchain
headers:

31 >= 4.13
30 >= 4.3
29 >= 3.14
28 >= 3.5
26 >= 2.6
default 25

Note: Version 27 was never released.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsepol/Config.in | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 3b84c90761..21d4d7865c 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -11,7 +11,23 @@ if BR2_PACKAGE_LIBSEPOL
 
 config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	int "Policy version"
-	default 30
+	default 31 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_13
+	default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
+	default 29 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
+	default 28 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
+	default 26 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
+	default 25
+	help
+	  The maximum SELinux policy version your kernel supports.
+
+	  Here's a handy table to help you choose:
+	  kernel version   SElinux policy max version
+	  <= 2.6.x         25
+	  > 2.6 <= 3.5     26
+	  > 3.5 <= 3.14    28 (27 and 28 were added@the same time)
+	  > 3.14 <= 4.3    29
+	  > 4.3 <= 4.13    30
+	  > 4.13           31
 
 endif
 
