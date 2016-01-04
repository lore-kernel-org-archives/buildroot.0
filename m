From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 4 Jan 2016 17:39:12 +0100
Subject: [Buildroot] [git commit] mongodb: disable support for armv4 and
	armv5
Message-ID: <20160104163931.D86D4826BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=af2de9e6628c16f50ce5888a6ff7068977129fd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling for armv4 or armv5, we get the following error:

src/mongo/util/signal_handlers_synchronous.cpp:188:9: error: 'current_exception' is not a member of 'std'
     if (std::current_exception()) {
         ^

This is because libstdc++ will only enable std::current_exception if ATOMIC_INT_LOCK_FREE > 1, which is not the case for armv4 and armv5 architectures, so disable them.

Fixes:
http://autobuild.buildroot.net/results/589a02f511939531141135def73785b600113152/
http://autobuild.buildroot.net/results/89b9cd2dae8645b50407409c7f2a8567c551822c/
http://autobuild.buildroot.net/results/b8ffce927cb0563f5c43533ec2f02d3487acc198/

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongodb/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/mongodb/Config.in b/package/mongodb/Config.in
index 7665c86..2f6876a 100644
--- a/package/mongodb/Config.in
+++ b/package/mongodb/Config.in
@@ -1,8 +1,9 @@
 # from src/mongo/platform/bits.h
 config BR2_PACKAGE_MONGODB_ARCH_SUPPORTS
 	bool
-	default y if BR2_aarch64 || BR2_arm ||  \
-		BR2_i386 || BR2_powerpc64 || BR2_x86_64
+	# ARM needs LDREX/STREX, so ARMv6+
+	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
+	default y if BR2_aarch64 || BR2_i386 || BR2_powerpc64 || BR2_x86_64
 
 config BR2_PACKAGE_MONGODB
 	bool "mongodb"
