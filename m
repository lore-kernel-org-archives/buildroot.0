From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Wed, 10 Aug 2016 22:08:37 +0530
Subject: [Buildroot] [PATCH 2/2] mtd: integck needs MMU support
In-Reply-To: <1470847117-14956-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470847117-14956-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1470847117-14956-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After fixing build issue related to MS_DIRSYNC and MS_RELATIME, we get
following build error with blackfin external toolchain.

fstest_monitor.c: In function 'main':
fstest_monitor.c:237: warning: implicit declaration of function 'fork'
/tmp/ccCzZIuW.o: In function 'main':
/home/rahul.bedarkar/buildroot/output/build/mtd-1.5.2/tests/fs-tests/utils/fstest_monitor.c:237: undefined reference to '_fork'
collect2: ld returned 1 exit status
make[2]: *** [fstest_monitor] Error 1

Since it uses fork(), add dependency on MMU support for integck.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/mtd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mtd/Config.in b/package/mtd/Config.in
index eef8129..8be5eff 100644
--- a/package/mtd/Config.in
+++ b/package/mtd/Config.in
@@ -161,6 +161,7 @@ config BR2_PACKAGE_MTD_UBIBLOCK
 
 config BR2_PACKAGE_MTD_INTEGCK
 	bool "integck"
+	depends on BR2_USE_MMU # fork()
 	help
 	  Install the integck test program.
 
-- 
2.6.2
