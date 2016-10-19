From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 19 Oct 2016 12:00:34 +0300
Subject: [Buildroot] [PATCH 2/2] liburcu: needs MMU
In-Reply-To: <ef30f526d3d31123695b867262dac86030da8af2.1476867634.git.baruch@tkos.co.il>
References: <ef30f526d3d31123695b867262dac86030da8af2.1476867634.git.baruch@tkos.co.il>
Message-ID: <5feff8d883fff7c5e9929d9b191d776c27de3cfa.1476867634.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The test_urcu_fork.c test calls fork(). Upstream provides no easy way to
disable tests build.

Fixes:
http://autobuild.buildroot.net/results/9eb/9eb182ab2d0b396eeff3d637a040da5a4d5bdcd7/
http://autobuild.buildroot.net/results/47a/47aabc219a2fd50105881b1e2715f7eeb1a6a588/
http://autobuild.buildroot.net/results/566/56631605f76b8623c9674f25c529ac67d0de12a8/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/liburcu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/liburcu/Config.in b/package/liburcu/Config.in
index 49510da4956c..915b17ab9d6d 100644
--- a/package/liburcu/Config.in
+++ b/package/liburcu/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 config BR2_PACKAGE_LIBURCU
 	bool "liburcu"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+	depends on BR2_USE_MMU # fork() in test
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Userspace implementation of the Read-Copy-Update (RCU)
@@ -23,4 +24,5 @@ config BR2_PACKAGE_LIBURCU
 
 comment "liburcu needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.9.3
