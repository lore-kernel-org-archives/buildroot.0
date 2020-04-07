From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 20:34:03 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/pure-ftpd: fix
 CVE-2020-9274
Message-ID: <20200407182208.A9B6B8D5DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1536f80f4d1289be40d2e3d0d95904d13eee7bf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

An issue was discovered in Pure-FTPd 1.0.49. An uninitialized pointer
vulnerability has been detected in the diraliases linked list. When the
*lookup_alias(const char alias) or print_aliases(void) function is
called, they fail to correctly detect the end of the linked list and try
to access a non-existent list member. This is related to init_aliases in
diraliases.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1d8426b32cb030888cbd3d8abdc2b4dc70e987c8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...s-always-set-the-tail-of-the-list-to-NULL.patch | 35 ++++++++++++++++++++++
 package/pure-ftpd/pure-ftpd.mk                     |  3 ++
 2 files changed, 38 insertions(+)

diff --git a/package/pure-ftpd/0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch b/package/pure-ftpd/0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch
new file mode 100644
index 0000000000..6c58eb74ae
--- /dev/null
+++ b/package/pure-ftpd/0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch
@@ -0,0 +1,35 @@
+From 8d0d42542e2cb7a56d645fbe4d0ef436e38bcefa Mon Sep 17 00:00:00 2001
+From: Frank Denis <github@pureftpd.org>
+Date: Tue, 18 Feb 2020 18:36:58 +0100
+Subject: [PATCH] diraliases: always set the tail of the list to NULL
+
+Spotted and reported by Antonio Norales from GitHub Security Labs.
+Thanks!
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/jedisct1/pure-ftpd/commit/8d0d42542e2cb7a56d645fbe4d0ef436e38bcefa]
+---
+ src/diraliases.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/diraliases.c b/src/diraliases.c
+index 4002a36..fb70273 100644
+--- a/src/diraliases.c
++++ b/src/diraliases.c
+@@ -93,7 +93,6 @@ int init_aliases(void)
+                 (tail->dir = strdup(dir)) == NULL) {
+                 die_mem();
+             }
+-            tail->next = NULL;
+         } else {
+             DirAlias *curr;
+ 
+@@ -105,6 +104,7 @@ int init_aliases(void)
+             tail->next = curr;
+             tail = curr;
+         }
++        tail->next = NULL;
+     }
+     fclose(fp);
+     aliases_up++;
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 0ef9a35250..7b7c7d9637 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -17,6 +17,9 @@ PURE_FTPD_IGNORE_CVES += CVE-2019-20176
 # 0002-pure_strcmp-len-s2-can-be-len-s1.patch
 PURE_FTPD_IGNORE_CVES += CVE-2020-9365
 
+# 0003-diraliases-always-set-the-tail-of-the-list-to-NULL.patch
+PURE_FTPD_IGNORE_CVES += CVE-2020-9274
+
 PURE_FTPD_CONF_OPTS = \
 	--with-altlog \
 	--with-puredb
