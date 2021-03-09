From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 9 Mar 2021 23:58:37 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/screen: add
 security fix for CVE-2021-26937
Message-ID: <20210309223952.9D1ED88D43@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5db04dd2477ed74ffdbe8ef0ec4e05bc0de0b2f7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

encoding.c in GNU Screen through 4.8.0 allows remote attackers to cause a
denial of service (invalid write access and application crash) or possibly
have unspecified other impact via a crafted UTF-8 character sequence.

For more details, see the oss-security discussion:
https://www.openwall.com/lists/oss-security/2021/02/09/3

So far no fix has been added to upstream git, and a number of early proposed
fixes caused regressions, so pull the security fix from the screen 4.8.0-5
Debian package.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6ca1a7c2773cc13f71e284d0b3b4b3b35101d1db)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/screen/0008_CVE-2021-26937.patch | 68 ++++++++++++++++++++++++++++++++
 package/screen/screen.mk                 |  3 ++
 2 files changed, 71 insertions(+)

diff --git a/package/screen/0008_CVE-2021-26937.patch b/package/screen/0008_CVE-2021-26937.patch
new file mode 100644
index 0000000000..df7efa0294
--- /dev/null
+++ b/package/screen/0008_CVE-2021-26937.patch
@@ -0,0 +1,68 @@
+Description: [CVE-2021-26937] Fix out of bounds array access
+Author: Michael Schr??der <mls@suse.de>
+Bug-Debian: https://bugs.debian.org/982435
+Bug: https://savannah.gnu.org/bugs/?60030
+Bug: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00000.html
+Bug-OSS-Security: https://www.openwall.com/lists/oss-security/2021/02/09/3
+Origin: https://lists.gnu.org/archive/html/screen-devel/2021-02/msg00010.html
+
+Downloaded from Debian:
+https://sources.debian.org/data/main/s/screen/4.8.0-5/debian/patches/99_CVE-2021-26937.patch
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+--- a/encoding.c
++++ b/encoding.c
+@@ -43,7 +43,7 @@
+ # ifdef UTF8
+ static int   recode_char __P((int, int, int));
+ static int   recode_char_to_encoding __P((int, int));
+-static void  comb_tofront __P((int, int));
++static void  comb_tofront __P((int));
+ #  ifdef DW_CHARS
+ static int   recode_char_dw __P((int, int *, int, int));
+ static int   recode_char_dw_to_encoding __P((int, int *, int));
+@@ -1263,6 +1263,8 @@
+     {0x30000, 0x3FFFD},
+   };
+ 
++  if (c >= 0xdf00 && c <= 0xdfff)
++    return 1;          /* dw combining sequence */
+   return ((bisearch(c, wide, sizeof(wide) / sizeof(struct interval) - 1)) ||
+           (cjkwidth &&
+            bisearch(c, ambiguous,
+@@ -1330,11 +1332,12 @@
+ }
+ 
+ static void
+-comb_tofront(root, i)
+-int root, i;
++comb_tofront(i)
++int i;
+ {
+   for (;;)
+     {
++      int root = i >= 0x700 ? 0x801 : 0x800;
+       debug1("bring to front: %x\n", i);
+       combchars[combchars[i]->prev]->next = combchars[i]->next;
+       combchars[combchars[i]->next]->prev = combchars[i]->prev;
+@@ -1396,9 +1399,9 @@
+     {
+       /* full, recycle old entry */
+       if (c1 >= 0xd800 && c1 < 0xe000)
+-        comb_tofront(root, c1 - 0xd800);
++        comb_tofront(c1 - 0xd800);
+       i = combchars[root]->prev;
+-      if (c1 == i + 0xd800)
++      if (i == 0x800 || i == 0x801 || c1 == i + 0xd800)
+ 	{
+ 	  /* completely full, can't recycle */
+ 	  debug("utf8_handle_comp: completely full!\n");
+@@ -1422,7 +1425,7 @@
+   mc->font  = (i >> 8) + 0xd8;
+   mc->fontx = 0;
+   debug3("combinig char %x %x -> %x\n", c1, c, i + 0xd800);
+-  comb_tofront(root, i);
++  comb_tofront(i);
+ }
+ 
+ #else /* !UTF8 */
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index c1705f742d..5f40c68742 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -14,6 +14,9 @@ SCREEN_CONF_ENV = CFLAGS="$(TARGET_CFLAGS)"
 SCREEN_CONF_OPTS = --enable-colors256
 SCREEN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) SCREEN=screen install_bin
 
+# 0008_CVE-2021-26937.patch
+SCREEN_IGNORE_CVES += CVE-2021-26937
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 SCREEN_DEPENDENCIES += linux-pam
 SCREEN_CONF_OPTS += --enable-pam
