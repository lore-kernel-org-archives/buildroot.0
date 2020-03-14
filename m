From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 19:21:15 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/libcgroup: fix
 CVE-2018-14348
Message-ID: <20200314180851.286A883ABE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f13c688df549e8e07af00b2ac2a80ed7db1f283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

libcgroup up to and including 0.41 creates /var/log/cgred with mode 0666
regardless of the configured umask, leading to disclosure of information

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d74283309535a6b673cdb95e9aaac28e46523bb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-cgrulesengd-remove-umask-0.patch          | 33 ++++++++++++++++++++++
 package/libcgroup/libcgroup.mk                     |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/package/libcgroup/0001-cgrulesengd-remove-umask-0.patch b/package/libcgroup/0001-cgrulesengd-remove-umask-0.patch
new file mode 100644
index 0000000000..1d9077a2d6
--- /dev/null
+++ b/package/libcgroup/0001-cgrulesengd-remove-umask-0.patch
@@ -0,0 +1,33 @@
+From 0d88b73d189ea3440ccaab00418d6469f76fa590 Mon Sep 17 00:00:00 2001
+From: Michal Hocko <mhocko@suse.com>
+Date: Wed, 18 Jul 2018 11:24:29 +0200
+Subject: [PATCH] cgrulesengd: remove umask(0)
+
+One of our partners has noticed that cgred daemon is creating a log file
+(/var/log/cgred) with too wide permissions (0666) and that is seen as
+a security bug because an untrusted user can write to otherwise
+restricted area. CVE-2018-14348 has been assigned to this issue.
+
+Signed-off-by: Michal Hocko <mhocko@suse.com>
+Acked-by: Balbir Singh <bsingharora@gmail.com>
+[Retrieved from:
+https://github.com/libcgroup/libcgroup/commit/0d88b73d189ea3440ccaab00418d6469f76fa590]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/daemon/cgrulesengd.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/daemon/cgrulesengd.c b/src/daemon/cgrulesengd.c
+index ea51f11..0d288f3 100644
+--- a/src/daemon/cgrulesengd.c
++++ b/src/daemon/cgrulesengd.c
+@@ -889,9 +889,6 @@ int cgre_start_daemon(const char *logp, const int logf,
+ 		} else if (pid > 0) {
+ 			exit(EXIT_SUCCESS);
+ 		}
+-
+-		/* Change the file mode mask. */
+-		umask(0);
+ 	} else {
+ 		flog(LOG_DEBUG, "Not using daemon mode\n");
+ 		pid = getpid();
diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index 3845627d48..a26d5f2ddf 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -12,6 +12,9 @@ LIBCGROUP_LICENSE_FILES = COPYING
 LIBCGROUP_DEPENDENCIES = host-bison host-flex
 LIBCGROUP_INSTALL_STAGING = YES
 
+# 0001-cgrulesengd-remove-umask-0.patch
+LIBCGROUP_IGNORE_CVES += CVE-2018-14348
+
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 # large file support. See https://bugzilla.redhat.com/show_bug.cgi?id=574992
 # for more information.
