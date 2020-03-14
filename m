From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:33:36 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/pure-ftpd: fix
 CVE-2019-20176
Message-ID: <20200314182116.E496383B74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0aa07ab40451c5f3c621a49a6283466b01b42632
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

In Pure-FTPd 1.0.49, a stack exhaustion issue was discovered in the
listdir function in ls.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cb7ac0c12efc0de259ab1c08b8fb86f4dddf9fe5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...uffer-to-store-every-file-name-to-display.patch | 70 ++++++++++++++++++++++
 package/pure-ftpd/pure-ftpd.mk                     |  3 +
 2 files changed, 73 insertions(+)

diff --git a/package/pure-ftpd/0001-listdir-reuse-a-single-buffer-to-store-every-file-name-to-display.patch b/package/pure-ftpd/0001-listdir-reuse-a-single-buffer-to-store-every-file-name-to-display.patch
new file mode 100644
index 0000000000..2f791d1d6e
--- /dev/null
+++ b/package/pure-ftpd/0001-listdir-reuse-a-single-buffer-to-store-every-file-name-to-display.patch
@@ -0,0 +1,70 @@
+From aea56f4bcb9948d456f3fae4d044fd3fa2e19706 Mon Sep 17 00:00:00 2001
+From: Frank Denis <github@pureftpd.org>
+Date: Mon, 30 Dec 2019 17:40:04 +0100
+Subject: [PATCH] listdir(): reuse a single buffer to store every file name to
+ display
+
+Allocating a new buffer for each entry is useless.
+
+And as these buffers are allocated on the stack, on systems with a
+small stack size, with many entries, the limit can easily be reached,
+causing a stack exhaustion and aborting the user session.
+
+Reported by Antonio Morales from the GitHub Security Lab team, thanks!
+[Retrieved from:
+https://github.com/jedisct1/pure-ftpd/commit/aea56f4bcb9948d456f3fae4d044fd3fa2e19706]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/ls.c | 15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/src/ls.c b/src/ls.c
+index cf804c7..f8a588f 100644
+--- a/src/ls.c
++++ b/src/ls.c
+@@ -661,6 +661,8 @@ static void listdir(unsigned int depth, int f, void * const tls_fd,
+     char *names;
+     PureFileInfo *s;
+     PureFileInfo *r;
++    char *alloca_subdir;
++    size_t sizeof_subdir;
+     int d;
+ 
+     if (depth >= max_ls_depth || matches >= max_ls_files) {
+@@ -690,14 +692,12 @@ static void listdir(unsigned int depth, int f, void * const tls_fd,
+     }
+     outputfiles(f, tls_fd);
+     r = dir;
++    sizeof_subdir = PATH_MAX + 1U;
++    if ((alloca_subdir = ALLOCA(sizeof_subdir)) == NULL) {
++        goto toomany;
++    }
+     while (opt_R && r != s) {
+         if (r->name_offset != (size_t) -1 && !chdir(FI_NAME(r))) {
+-            char *alloca_subdir;
+-            const size_t sizeof_subdir = PATH_MAX + 1U;
+-
+-            if ((alloca_subdir = ALLOCA(sizeof_subdir)) == NULL) {
+-                goto toomany;
+-            }
+             if (SNCHECK(snprintf(alloca_subdir, sizeof_subdir, "%s/%s",
+                                  name, FI_NAME(r)), sizeof_subdir)) {
+                 goto nolist;
+@@ -706,8 +706,8 @@ static void listdir(unsigned int depth, int f, void * const tls_fd,
+             wrstr(f, tls_fd, alloca_subdir);
+             wrstr(f, tls_fd, ":\r\n\r\n");
+             listdir(depth + 1U, f, tls_fd, alloca_subdir);
++
+             nolist:
+-            ALLOCA_FREE(alloca_subdir);
+             if (matches >= max_ls_files) {
+                 goto toomany;
+             }
+@@ -720,6 +720,7 @@ static void listdir(unsigned int depth, int f, void * const tls_fd,
+         r++;
+     }
+     toomany:
++    ALLOCA_FREE(alloca_subdir);
+     free(names);
+     free(dir);
+     names = NULL;
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 2d69efe3f9..3af66a066c 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -11,6 +11,9 @@ PURE_FTPD_LICENSE = ISC
 PURE_FTPD_LICENSE_FILES = COPYING
 PURE_FTPD_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+# 0001-listdir-reuse-a-single-buffer-to-store-every-file-name-to-display.patch
+PURE_FTPD_IGNORE_CVES += CVE-2019-20176
+
 PURE_FTPD_CONF_OPTS = \
 	--with-altlog \
 	--with-puredb
