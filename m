From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:24:11 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/dnsmasq: fix
 CVE-2019-14834
Message-ID: <20200314171832.C069C83919@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cacd3efd2ac98a0efbcf319215be9c2075d40082
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

A vulnerability was found in dnsmasq before version 2.81, where the
memory leak allows remote attackers to cause a denial of service
(memory consumption) via vectors involving DHCP response creation.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d0063f2ff14101d7efe1d1a3a8374845b7bc9847)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../dnsmasq/0004-Fix-memory-leak-in-helper-c.patch | 49 ++++++++++++++++++++++
 package/dnsmasq/dnsmasq.mk                         |  3 ++
 2 files changed, 52 insertions(+)

diff --git a/package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch b/package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch
new file mode 100644
index 0000000000..c00a9cc3ef
--- /dev/null
+++ b/package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch
@@ -0,0 +1,49 @@
+From 69bc94779c2f035a9fffdb5327a54c3aeca73ed5 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Wed, 14 Aug 2019 20:44:50 +0100
+Subject: [PATCH] Fix memory leak in helper.c
+
+Thanks to Xu Mingjie <xumingjie1995@outlook.com> for spotting this.
+[Retrieved from:
+http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=69bc94779c2f035a9fffdb5327a54c3aeca73ed5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/helper.c |   12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/src/helper.c b/src/helper.c
+index 33ba120..c392eec 100644
+--- a/src/helper.c
++++ b/src/helper.c
+@@ -80,7 +80,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
+   pid_t pid;
+   int i, pipefd[2];
+   struct sigaction sigact;
+-
++  unsigned char *alloc_buff = NULL;
++  
+   /* create the pipe through which the main program sends us commands,
+      then fork our process. */
+   if (pipe(pipefd) == -1 || !fix_fd(pipefd[1]) || (pid = fork()) == -1)
+@@ -186,11 +187,16 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
+       struct script_data data;
+       char *p, *action_str, *hostname = NULL, *domain = NULL;
+       unsigned char *buf = (unsigned char *)daemon->namebuff;
+-      unsigned char *end, *extradata, *alloc_buff = NULL;
++      unsigned char *end, *extradata;
+       int is6, err = 0;
+       int pipeout[2];
+ 
+-      free(alloc_buff);
++      /* Free rarely-allocated memory from previous iteration. */
++      if (alloc_buff)
++	{
++	  free(alloc_buff);
++	  alloc_buff = NULL;
++	}
+       
+       /* we read zero bytes when pipe closed: this is our signal to exit */ 
+       if (!read_write(pipefd[0], (unsigned char *)&data, sizeof(data), 1))
+-- 
+1.7.10.4
+
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index f271523068..3f25ac0885 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -15,6 +15,9 @@ DNSMASQ_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DNSMASQ_LICENSE = GPL-2.0 or GPL-3.0
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 
+# 0004-Fix-memory-leak-in-helper-c.patch
+DNSMASQ_IGNORE_CVES += CVE-2019-14834
+
 DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
