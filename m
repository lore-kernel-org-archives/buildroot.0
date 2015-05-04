From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 May 2015 23:52:33 +0200
Subject: [Buildroot] [PATCH] package/at: needs uClibc or (e)glibc
Message-ID: <1430776353-9627-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

at needs __isleap() which is (e)glibc and uClibc, but not in musl.

Fixes:
    http://autobuild.buildroot.org/results/6f2/6f25e80e8aedec91323ef9b67576b550d7abee60/
    http://autobuild.buildroot.org/results/da5/da5bb779f3077b079203fcbdb2533dd790963cd4/
    http://autobuild.buildroot.org/results/8a6/8a6ce608c6f46d08ed77049f796e98e6e10a1709/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/at/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/at/Config.in b/package/at/Config.in
index 17fabf7..e58debf 100644
--- a/package/at/Config.in
+++ b/package/at/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_AT
 	bool "at"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_UCLIBC
 	help
 	  At and batch read shell commands from standard input and
 	  store them as jobs to be scheduled for execution in the
@@ -8,3 +9,7 @@ config BR2_PACKAGE_AT
 
 	  at    - run the job at a specified time
 	  batch - run the job when system load levels permit
+
+comment "at needs a uClibc or (e)glibc toolchain"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_USES_GLIBC && !BR2_TOOLCHAIN_USES_UCLIBC
-- 
1.9.1
