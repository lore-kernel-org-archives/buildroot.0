From: Brendan Heading <brendanheading@gmail.com>
Date: Tue,  4 Aug 2015 16:53:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/empty - fix build failure
Message-ID: <1438703581-25996-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/e07/e07aec9a839e89b7452b13bf5445164530e27414/

"empty" fails to build if _POSIX_SEMAPHORES is not defined, which is the
case on a toolchain with no threading support.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/empty/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/empty/Config.in b/package/empty/Config.in
index 7fd0877..9a77f8d 100644
--- a/package/empty/Config.in
+++ b/package/empty/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_EMPTY
 	bool "empty"
 	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Run processes and applications under pseudo-terminal (PTY) sessions.
 
 	  http://empty.sourceforge.net/
+
+comment "empty needs a toolchain w/ threads"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
-- 
2.4.3
