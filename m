From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 9 Mar 2013 21:07:56 +0100
Subject: [Buildroot] [git commit] aircrack-ng: disable on non-MMU systems
Message-ID: <20130309201909.A78D49AF33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3bae624d5fd924f34dfccb6c020f599b189ca8f9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

aircrack-ng uses fork() and therefore fails to build on non-MMU
systems:

aircrack-ng.o: In function `_clean_exit':
aircrack-ng.c:(.text+0x555c): undefined reference to `_fork'
collect2: ld returned 1 exit status

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/aircrack-ng/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
