From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Sep 2014 23:18:20 +0200
Subject: [Buildroot] [git commit] xfsprogs: depends on MMU
Message-ID: <20140913074255.A0F2C9D688@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b309e1a09ef0426129bb60b580aaeb356517f21
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://sysmic.org/~jezz/results/17f32103:

xfs_fsr.o: In function `fsrallfs':
/home/jezz/br-continuous/cfgs/45-bf609-bfin-uclibc-nommu-ext/build/xfsprogs-3.1.11/fsr/xfs_fsr.c:617: undefined reference to `_fork'
collect2: ld returned 1 exit status

madvise.o: In function `madvise_f':
/home/jezz/br-continuous/cfgs/45-bf609-bfin-uclibc-nommu-ext/build/xfsprogs-3.1.11/io/madvise.c:111: undefined reference to `_madvise'
mincore.o: In function `mincore_f':
/home/jezz/br-continuous/cfgs/45-bf609-bfin-uclibc-nommu-ext/build/xfsprogs-3.1.11/io/mincore.c:77: undefined reference to `_mincore'
collect2: ld returned 1 exit status

[Peter: don't mention mmu dependency in comment]
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xfsprogs/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/xfsprogs/Config.in b/package/xfsprogs/Config.in
index 3a31dd2..6f02c97 100644
--- a/package/xfsprogs/Config.in
+++ b/package/xfsprogs/Config.in
@@ -3,10 +3,12 @@ comment "Note that xfsprogs needs a toolchain with UCLIBC_SV4_DEPRECATED and UCL
 	depends on BR2_PACKAGE_XFSPROGS
 
 comment "xfsprogs needs a toolchain w/ largefile, wchar"
+	depends on BR2_USE_MMU
 	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
 
 config BR2_PACKAGE_XFSPROGS
 	bool "xfsprogs"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_LARGEFILE
 	depends on BR2_USE_WCHAR # util-linux
 	select BR2_PACKAGE_UTIL_LINUX
