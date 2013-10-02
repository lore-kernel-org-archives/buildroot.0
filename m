From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Oct 2013 09:34:01 +0200
Subject: [Buildroot] [git commit] netkitbase: needs mmu
Message-ID: <20131002074535.8235C9B831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=63682ae471856c93a60b8173bf929006493d374d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix below build error:

/opt/test/buildroot/buildroot/output/host/usr/bin/arm-buildroot-uclinux-uclibcgnueabi-gcc  inetd.o servtab.o builtins.o sig.o daemon.o setproctitle.o mysleep.o  -o inetd
servtab.o: In function `loadconfigfile.clone.0':
servtab.c:(.text+0x98c): warning: gethostbyname is obsolescent, use getnameinfo() instead.
inetd.o: In function `main':
inetd.c:(.text+0x8a4): undefined reference to `fork'
inetd.c:(.text+0x974): undefined reference to `fork'
daemon.o: In function `daemon':
daemon.c:(.text+0xc): undefined reference to `fork'
collect2: ld returned 1 exit status
make[2]: *** [inetd] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netkitbase/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netkitbase/Config.in b/package/netkitbase/Config.in
index dd9166c..40833ad 100644
--- a/package/netkitbase/Config.in
+++ b/package/netkitbase/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETKITBASE
 	bool "netkitbase"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_DEPRECATED
 	help
 	  Old-style inetd.
