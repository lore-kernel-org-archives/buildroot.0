From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 22:25:58 +0200
Subject: [Buildroot] [git commit] util-linux: bump to v2.30.1
Message-ID: <20170729202522.8C7F381814@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=94cac1184b473caad90ae7966d9467e32992ad41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch 0002-column-fix-compilation-when-libc-lacks-wide-characte.patch
as it has been applied upstream
- Patch 0001-Revert-build-sys-ncurses-headers-cleanup.patch is still
required to fix ncursesw support.

Signed-off-by: Marcus Hoffmann <m.hoffmann@cartelsol.com>
Cc: "Carlos Santos" <casantos@datacom.ind.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...compilation-when-libc-lacks-wide-characte.patch | 53 ----------------------
 package/util-linux/util-linux.hash                 |  2 +-
 package/util-linux/util-linux.mk                   |  3 +-
 3 files changed, 3 insertions(+), 55 deletions(-)

diff --git a/package/util-linux/0002-column-fix-compilation-when-libc-lacks-wide-characte.patch b/package/util-linux/0002-column-fix-compilation-when-libc-lacks-wide-characte.patch
deleted file mode 100644
index 5c11db9..0000000
--- a/package/util-linux/0002-column-fix-compilation-when-libc-lacks-wide-characte.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 46a37cd25db592db878d5beccdf75d1accbbacb6 Mon Sep 17 00:00:00 2001
-From: Carlos Santos <casantos@datacom.ind.br>
-Date: Tue, 27 Jun 2017 13:18:48 -0300
-Subject: [PATCH] column: fix compilation when libc lacks wide-character
- support
-
-Commit 4762ae9d removed mtsafe_strtok() but left behind calls to wcstok
-and wcspbrk. This leads to build failures when libc does not have the
-wide-character functions, like some uClibc builds.
-
-Solve the problem by using strtok_r and strpbrk when HAVE_WIDECHAR is
-not defined.
-
-Fixes:
-  http://autobuild.buildroot.net/results/fd8a1a8e0cef3aeed9588540e8e663664f6b43aa
-  http://autobuild.buildroot.net/results/5ad73ea8b471321988c50d80a5e50d4504151dd6
-  http://autobuild.buildroot.net/results/04411b7280dc51ecd51236967981a42352bbeb3e
-
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
----
- text-utils/column.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/text-utils/column.c b/text-utils/column.c
-index be99f94..fb57b47 100644
---- a/text-utils/column.c
-+++ b/text-utils/column.c
-@@ -160,14 +160,22 @@ static wchar_t *local_wcstok(wchar_t *p, const wchar_t *separator, int greedy, w
- 	wchar_t *result = NULL;
- 
- 	if (greedy)
-+#ifdef HAVE_WIDECHAR
- 		return wcstok(p, separator, state);
-+#else
-+		return strtok_r(p, separator, state);
-+#endif
- 	if (!p) {
- 		if (!*state || !**state)
- 			return NULL;
- 		p = *state;
- 	}
- 	result = p;
-+#ifdef HAVE_WIDECHAR
- 	p = wcspbrk(result, separator);
-+#else
-+	p = strpbrk(result, separator);
-+#endif
- 	if (!p)
- 		*state = NULL;
- 	else {
--- 
-2.7.5
-
diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 02b82f6..6f0bafe 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.30/sha256sums.asc
-sha256 c208a4ff6906cb7f57940aa5bc3a6eed146e50a7cc0a092f52ef2ab65057a08d  util-linux-2.30.tar.xz
+sha256 1be4363a91ac428c9e43fc04dc6d2c66a19ec1e36f1105bd4b481540be13b841  util-linux-2.30.1.tar.xz
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index 99cc77f..fc32668 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 UTIL_LINUX_VERSION_MAJOR = 2.30
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
+UTIL_LINUX_VERSION_MINOR = 1
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).$(UTIL_LINUX_VERSION_MINOR)
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
