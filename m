From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Oct 2013 12:12:44 +0200
Subject: [Buildroot] [git commit] nano: needs mmu
Message-ID: <20131003101321.2718B9B255@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b901a16634d5bc66f14df87a04310a382c6e8e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix below build error if !BR2_USE_MMU:

text.o: In function `execute_command':
text.c:(.text+0x7f8): undefined reference to `fork'
text.o: In function `do_int_speller':
text.c:(.text+0x3480): undefined reference to `fork'
text.c:(.text+0x34f4): undefined reference to `fork'
text.c:(.text+0x3568): undefined reference to `fork'
text.o: In function `do_alt_speller':
text.c:(.text+0x3914): undefined reference to `fork'
collect2: ld returned 1 exit status
make[3]: *** [nano] Error 1

[Peter: fork() only in full version, so force tiny for !mmu]
Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nano/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nano/Config.in b/package/nano/Config.in
index ef7f69d..9546fe7 100644
--- a/package/nano/Config.in
+++ b/package/nano/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_NANO
 	bool "nano"
+	# full version uses fork()
+	select BR2_PACKAGE_NANO_TINY if !BR2_USE_MMU
 	select BR2_PACKAGE_NCURSES
 	help
 	  A nice ncurses-based editor. Started out as a clone of pico.
