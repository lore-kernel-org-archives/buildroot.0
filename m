From: Martin Bark <martin@barkynet.com>
Date: Thu, 16 Jun 2016 17:00:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/ucl: fix build with host gcc 6.x
Message-ID: <20160616160049.19597-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ucl fails with the following error when using gcc 6.x on the host:

 checking whether your compiler passes the ACC conformance test... FAILED
 configure:
 configure: Your compiler failed the ACC conformance test - for details see
 configure: `config.log'. Please check that log file and consider sending
 configure: a patch or bug-report to <markus@oberhumer.com>.
 configure: Thanks for your support.
 configure:
 configure: error: ACC conformance test failed. Stop.

Fix the issue by using the ISO C90 standard.

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Note: I found the fix here https://bugs.archlinux.org/task/49287
---
 package/ucl/ucl.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ucl/ucl.mk b/package/ucl/ucl.mk
index 2654a5a..e4dc1b3 100644
--- a/package/ucl/ucl.mk
+++ b/package/ucl/ucl.mk
@@ -9,4 +9,7 @@ UCL_SITE = http://www.oberhumer.com/opensource/ucl/download
 UCL_LICENSE = GPLv2+
 UCL_LICENSE_FILES = COPYING
 
+# Fix ACC conformance test failure for host gcc 6.x
+HOST_UCL_CONF_ENV += CPPFLAGS="$(HOST_CPPFLAGS) -std=c90"
+
 $(eval $(host-autotools-package))
-- 
2.8.3
