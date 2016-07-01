From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 16:16:45 +0200
Subject: [Buildroot] [git commit] package/ucl: fix build with host gcc 6.x
Message-ID: <20160701141707.2EB7D82161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1474b369638e84090d3f6c2b51a5269076d00be5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
