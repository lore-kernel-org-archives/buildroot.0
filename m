From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 30 Oct 2012 22:04:44 +0100
Subject: [Buildroot] [git commit] strace: fix build for x86_64
Message-ID: <20121030210537.28E8A999A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8ada3b45e6af1680f9aafb38cb7425f3bcfa8380
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

strace fails to build on x86_64 because stat64 is not available.  This
is because the automatic detection of stat64 in configure is overridden
by buildroot, by setting ac_cv_type_stat64.  Just remove that override -
current strace seems to detect it correctly for non-largefile platforms.

Build-tested on x86_64 (with largefile), ARM (with and without largefile),
sh4, MIPS and ppc-32 (no largefile).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/strace/strace.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 7876848..ad1d042 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -9,8 +9,7 @@ STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = http://downloads.sourceforge.net/project/strace/strace/$(STRACE_VERSION)
 
 STRACE_CONF_ENV = ac_cv_header_linux_if_packet_h=yes \
-		  ac_cv_header_linux_netlink_h=yes \
-	          $(if $(BR2_LARGEFILE),ac_cv_type_stat64=yes,ac_cv_type_stat64=no)
+		  ac_cv_header_linux_netlink_h=yes
 
 ifeq ($(BR2_LARGEFILE),y)
 # strace gets confused when lfs mode is forced, so don't
