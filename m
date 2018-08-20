From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 20 Aug 2018 09:53:29 -0700
Subject: [Buildroot] [PATCH/next 2/2] kmod: bump to 25
In-Reply-To: <20180820165329.10083-1-aduskett@gmail.com>
References: <20180820165329.10083-1-aduskett@gmail.com>
Message-ID: <20180820165329.10083-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@greenlots.com>

With the introduction of Python3.7.0, kmod needs to be bumped to
version 25.

Fixes:
5ba7f2e9d0802890e275f7da160ad0aad87b6f56

Signed-off-by: Adam Duskett <aduskett@greenlots.com>
---
 ....c-assert_cc-can-only-be-used-inside-func.patch | 56 ----------------------
 package/kmod/kmod.hash                             |  2 +-
 package/kmod/kmod.mk                               |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 package/kmod/0002-shared-util.c-assert_cc-can-only-be-used-inside-func.patch

diff --git a/package/kmod/0002-shared-util.c-assert_cc-can-only-be-used-inside-func.patch b/package/kmod/0002-shared-util.c-assert_cc-can-only-be-used-inside-func.patch
deleted file mode 100644
index 09fe252..0000000
--- a/package/kmod/0002-shared-util.c-assert_cc-can-only-be-used-inside-func.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 7cd698eb31059012305d8bb7516577c8cd383e32 Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 3 Jun 2017 16:52:37 +0200
-Subject: [PATCH] shared/util.c: assert_cc() can only be used inside functions
-
-shared/macro.h has two versions of assert_cc, one that uses gcc
-_Static_assert(), which requires recent enough gcc versions, and one
-that uses a fake array to trigger a build error. The latter can only
-work inside functions, so assert_cc() should only be used inside
-functions.
-
-Fixes the following build failure when building kmod with old gcc
-versions such as gcc 4.3.x:
-
-shared/util.c:52: error: expected identifier or '(' before 'do'
-shared/util.c:52: error: expected identifier or '(' before 'while'
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- shared/util.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/shared/util.c b/shared/util.c
-index 9de080a..fd2028d 100644
---- a/shared/util.c
-+++ b/shared/util.c
-@@ -49,8 +49,6 @@ static const struct kmod_ext {
- 	{ }
- };
- 
--assert_cc(EAGAIN == EWOULDBLOCK);
--
- /* string handling functions and memory allocations                         */
- /* ************************************************************************ */
- 
-@@ -201,6 +199,8 @@ ssize_t read_str_safe(int fd, char *buf, size_t buflen)
- 	size_t todo = buflen - 1;
- 	size_t done = 0;
- 
-+	assert_cc(EAGAIN == EWOULDBLOCK);
-+
- 	do {
- 		ssize_t r = read(fd, buf + done, todo);
- 
-@@ -226,6 +226,8 @@ ssize_t write_str_safe(int fd, const char *buf, size_t buflen)
- 	size_t todo = buflen;
- 	size_t done = 0;
- 
-+	assert_cc(EAGAIN == EWOULDBLOCK);
-+
- 	do {
- 		ssize_t r = write(fd, buf + done, todo);
- 
--- 
-2.7.4
-
diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index be350c4..0e8f034 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256 610b8d1df172acc39a4fdf1eaa47a57b04873c82f32152e7a62e29b6ff9cb397  kmod-24.tar.xz
+sha256 7165e6496656159dcb909a91ed708a0fe273a4b128b4b1dc997ccb5189eef1cd  kmod-25.tar.xz
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index 7c796ab..c165ea3 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 24
+KMOD_VERSION = 25
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
1.8.3.1
