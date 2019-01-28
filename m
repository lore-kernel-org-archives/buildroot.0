From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 Jan 2019 22:06:51 +0100
Subject: [Buildroot] [git commit] haproxy: disable on sh4 with gcc < 7
Message-ID: <20190128210844.7A67581062@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0f5e916f31565f1268484182b9924984fac0a87e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build fails on sh4:
src/dns.c:290:1: error: unable to find a register to spill in class 'R0_REGS'
 }

This build failure seems related to a known gcc bug that has been fixed
only in gcc 7:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60040

Fixes:
 - http://autobuild.buildroot.org/results/2e181cc874d5389f10ecddb0d11253c3aa5e7fc4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
index cbcbc0c388..78cbf6e103 100644
--- a/package/haproxy/Config.in
+++ b/package/haproxy/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_HAPROXY
 	bool "haproxy"
+	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60040
+	depends on !(BR2_sh4 && !BR2_TOOLCHAIN_GCC_AT_LEAST_7)
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	help
