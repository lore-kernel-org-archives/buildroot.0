From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  9 Mar 2013 19:21:26 +0100
Subject: [Buildroot] [PATCH 1/5] aircrack-ng: disable on non-MMU systems
In-Reply-To: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1362853290-15592-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1362853290-15592-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

aircrack-ng uses fork() and therefore fails to build on non-MMU
systems:

aircrack-ng.o: In function `_clean_exit':
aircrack-ng.c:(.text+0x555c): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/aircrack-ng/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/aircrack-ng/Config.in b/package/aircrack-ng/Config.in
index 419f991..319b7c4 100644
--- a/package/aircrack-ng/Config.in
+++ b/package/aircrack-ng/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_AIRCRACK_NG
 	bool "aircrack-ng"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # uses fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_IW # runtime
 	help
-- 
1.7.9.5
