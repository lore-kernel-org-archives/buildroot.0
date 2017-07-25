From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Jul 2017 23:51:03 +0200
Subject: [Buildroot] [git commit branch/2017.05.x] efibootmgr: fix build
	with gcc 7.x
Message-ID: <20170725222211.BC13481D5C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4ae64c3074bf34f45ecfde4fc0733c2f0bcbd58
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.05.x

Now that the build of efivar with gcc 7.x has been fixed by commit
0ca30170345a81f5f21e4ef4424b1f186cde1988 ("efivar: fix build with gcc
7"), efibootmgr fails similarly with gcc 7.x.

This commit backports an upstream patch that fixes this issue.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit cefdd6546010e160985de2daa2ef70a952d081f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...e-extra-const-keywords-gcc-7-gripes-about.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/efibootmgr/0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch b/package/efibootmgr/0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch
new file mode 100644
index 0000000..8bc6f01
--- /dev/null
+++ b/package/efibootmgr/0003-Remove-extra-const-keywords-gcc-7-gripes-about.patch
@@ -0,0 +1,51 @@
+From a542b169003c2ef95ce6c00d40050eb10568b612 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 6 Feb 2017 16:34:54 -0500
+Subject: [PATCH] Remove extra const keywords gcc 7 gripes about.
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+[Backported from upstream commit a542b169003c2ef95ce6c00d40050eb10568b612]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/efibootdump.c | 2 +-
+ src/efibootmgr.c  | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/efibootdump.c b/src/efibootdump.c
+index 6ff8360..30a1943 100644
+--- a/src/efibootdump.c
++++ b/src/efibootdump.c
+@@ -39,7 +39,7 @@ print_boot_entry(efi_load_option *loadopt, size_t data_size)
+ 	uint8_t *optional_data = NULL;
+ 	size_t optional_data_len = 0;
+ 	uint16_t pathlen;
+-	const unsigned char const *desc;
++	const unsigned char *desc;
+ 	char *raw;
+ 	size_t raw_len;
+ 
+diff --git a/src/efibootmgr.c b/src/efibootmgr.c
+index 493f2cf..90a0998 100644
+--- a/src/efibootmgr.c
++++ b/src/efibootmgr.c
+@@ -221,7 +221,7 @@ warn_duplicate_name(list_t *var_list)
+ 	list_t *pos;
+ 	var_entry_t *entry;
+ 	efi_load_option *load_option;
+-	const unsigned char const *desc;
++	const unsigned char *desc;
+ 
+ 	list_for_each(pos, var_list) {
+ 		entry = list_entry(pos, var_entry_t, list);
+@@ -873,7 +873,7 @@ show_vars(const char *prefix)
+ {
+ 	list_t *pos;
+ 	var_entry_t *boot;
+-	const unsigned char const *description;
++	const unsigned char *description;
+ 	efi_load_option *load_option;
+ 	efidp dp = NULL;
+ 	unsigned char *optional_data = NULL;
+-- 
+2.9.4
+
