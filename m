From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Nov 2020 09:41:03 +0100
Subject: [Buildroot] [git commit branch/next] package/trousers: bump to
 version 0.3.15
Message-ID: <20201105083135.1B54487590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=648c824ec26cf1fee86f15e4eb7dc537dd38a995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- Drop third and fourth patches (already in version)
- Update indentation in hash file (two spaces)

https://sourceforge.net/p/trousers/trousers/ci/master/tree/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tiple-security-issues-that-are-present-if.patch | 90 ----------------------
 .../0004-trousers-resolve-build-failure.patch      | 41 ----------
 package/trousers/trousers.hash                     | 10 +--
 package/trousers/trousers.mk                       |  5 +-
 4 files changed, 6 insertions(+), 140 deletions(-)

diff --git a/package/trousers/0003-Correct-multiple-security-issues-that-are-present-if.patch b/package/trousers/0003-Correct-multiple-security-issues-that-are-present-if.patch
deleted file mode 100644
index 609245dad8..0000000000
--- a/package/trousers/0003-Correct-multiple-security-issues-that-are-present-if.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From e74dd1d96753b0538192143adf58d04fcd3b242b Mon Sep 17 00:00:00 2001
-From: Matthias Gerstner <mgerstner@suse.de>
-Date: Fri, 14 Aug 2020 22:14:36 -0700
-Subject: [PATCH] Correct multiple security issues that are present if the tcsd
- is started by root instead of the tss user.
-
-Patch fixes the following 3 CVEs:
-
-CVE-2020-24332
-If the tcsd daemon is started with root privileges,
-the creation of the system.data file is prone to symlink attacks
-
-CVE-2020-24330
-If the tcsd daemon is started with root privileges,
-it fails to drop the root gid after it is no longer needed
-
-CVE-2020-24331
-If the tcsd daemon is started with root privileges,
-the tss user has read and write access to the /etc/tcsd.conf file
-
-Authored-by: Matthias Gerstner <mgerstner@suse.de>
-Signed-off-by: Debora Velarde Babb <debora@linux.ibm.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/tcs/ps/tcsps.c   |  2 +-
- src/tcsd/svrside.c   |  1 +
- src/tcsd/tcsd_conf.c | 10 +++++-----
- 3 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/src/tcs/ps/tcsps.c b/src/tcs/ps/tcsps.c
-index e47154b..85d45a9 100644
---- a/src/tcs/ps/tcsps.c
-+++ b/src/tcs/ps/tcsps.c
-@@ -72,7 +72,7 @@ get_file()
- 	}
- 
- 	/* open and lock the file */
--	system_ps_fd = open(tcsd_options.system_ps_file, O_CREAT|O_RDWR, 0600);
-+	system_ps_fd = open(tcsd_options.system_ps_file, O_CREAT|O_RDWR|O_NOFOLLOW, 0600);
- 	if (system_ps_fd < 0) {
- 		LogError("system PS: open() of %s failed: %s",
- 				tcsd_options.system_ps_file, strerror(errno));
-diff --git a/src/tcsd/svrside.c b/src/tcsd/svrside.c
-index 1ae1636..1c12ff3 100644
---- a/src/tcsd/svrside.c
-+++ b/src/tcsd/svrside.c
-@@ -473,6 +473,7 @@ main(int argc, char **argv)
- 		}
- 		return TCSERR(TSS_E_INTERNAL_ERROR);
- 	}
-+	setgid(pwd->pw_gid);
- 	setuid(pwd->pw_uid);
- #endif
- #endif
-diff --git a/src/tcsd/tcsd_conf.c b/src/tcsd/tcsd_conf.c
-index a31503d..ea8ea13 100644
---- a/src/tcsd/tcsd_conf.c
-+++ b/src/tcsd/tcsd_conf.c
-@@ -743,7 +743,7 @@ conf_file_init(struct tcsd_config *conf)
- #ifndef SOLARIS
- 	struct group *grp;
- 	struct passwd *pw;
--	mode_t mode = (S_IRUSR|S_IWUSR);
-+	mode_t mode = (S_IRUSR|S_IWUSR|S_IRGRP);
- #endif /* SOLARIS */
- 	TSS_RESULT result;
- 
-@@ -798,15 +798,15 @@ conf_file_init(struct tcsd_config *conf)
- 	}
- 
- 	/* make sure user/group TSS owns the conf file */
--	if (pw->pw_uid != stat_buf.st_uid || grp->gr_gid != stat_buf.st_gid) {
-+	if (stat_buf.st_uid != 0 || grp->gr_gid != stat_buf.st_gid) {
- 		LogError("TCSD config file (%s) must be user/group %s/%s", tcsd_config_file,
--				TSS_USER_NAME, TSS_GROUP_NAME);
-+				"root", TSS_GROUP_NAME);
- 		return TCSERR(TSS_E_INTERNAL_ERROR);
- 	}
- 
--	/* make sure only the tss user can manipulate the config file */
-+	/* make sure only the tss user can read (but not manipulate) the config file */
- 	if (((stat_buf.st_mode & 0777) ^ mode) != 0) {
--		LogError("TCSD config file (%s) must be mode 0600", tcsd_config_file);
-+		LogError("TCSD config file (%s) must be mode 0640", tcsd_config_file);
- 		return TCSERR(TSS_E_INTERNAL_ERROR);
- 	}
- #endif /* SOLARIS */
--- 
-2.20.1
-
diff --git a/package/trousers/0004-trousers-resolve-build-failure.patch b/package/trousers/0004-trousers-resolve-build-failure.patch
deleted file mode 100644
index ea054ab2c5..0000000000
--- a/package/trousers/0004-trousers-resolve-build-failure.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From c9b8c4434f3b11bae4f7e72c3aec5b4f3459eecc Mon Sep 17 00:00:00 2001
-From: Jerry Snitselaar <jsnitsel@redhat.com>
-Date: Wed, 18 Mar 2020 14:10:35 -0700
-Subject: [PATCH] trousers: resolve build failure
-
-The global variables tcsd_sa_chld and tcsd_sa_int in tcsd.h are
-causing build failures in latest Fedora release:
-
-/usr/bin/ld: ../../src/tcs/libtcs.a(libtcs_a-tcsi_changeauth.o):/builddir/build/BUILD/trousers-0.3.13/src/tcs/../include/tcsd.h:169: multiple definition of `tcsd_sa_chld'; tcsd-svrside.o:/builddir/build/BUILD/trousers-0.3.13/src/tcsd/../../src/include/tcsd.h:169: first defined here
-/usr/bin/ld: ../../src/tcs/libtcs.a(libtcs_a-tcsi_changeauth.o):/builddir/build/BUILD/trousers-0.3.13/src/tcs/../include/tcsd.h:168: multiple definition of `tcsd_sa_int'; tcsd-svrside.o:/builddir/build/BUILD/trousers-0.3.13/src/tcsd/../../src/include/tcsd.h:168: first defined here
-
-They are no longer used since 9b40e581470b ("Improved daemon's signal
-handling") so just remove them.
-
-Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>
-Signed-off-by: Debora Velarde Babb <debora@linux.ibm.com>
-[Retrieved from:
-https://sourceforge.net/p/trousers/trousers/ci/c9b8c4434f3b11bae4f7e72c3aec5b4f3459eecc]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/include/tcsd.h | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/src/include/tcsd.h b/src/include/tcsd.h
-index 5b9462b..f5c286e 100644
---- a/src/include/tcsd.h
-+++ b/src/include/tcsd.h
-@@ -164,10 +164,4 @@ TSS_RESULT tcsd_thread_create(int, char *);
- void	   *tcsd_thread_run(void *);
- void	   thread_signal_init();
- 
--/* signal handling */
--#ifndef __APPLE__
--struct sigaction tcsd_sa_int;
--struct sigaction tcsd_sa_chld;
--#endif
--
- #endif
--- 
-2.28.0
-
diff --git a/package/trousers/trousers.hash b/package/trousers/trousers.hash
index 20c65c450e..f6c3427462 100644
--- a/package/trousers/trousers.hash
+++ b/package/trousers/trousers.hash
@@ -1,6 +1,6 @@
-# http://sourceforge.net/projects/trousers/files/trousers/0.3.14/
-sha1 9ca2cc9e1179465f6c5d9055e2b855e25031b85a trousers-0.3.14.tar.gz
-md5  4a476b4f036dd20a764fb54fc24edbec         trousers-0.3.14.tar.gz
+# http://sourceforge.net/projects/trousers/files/trousers/0.3.15/
+sha1  75cd40e17c9385299e50ff2099905865442b59f1  trousers-0.3.15.tar.gz
+md5  eb1b02e98c7d360749b9076196db3f0f  trousers-0.3.15.tar.gz
 # Locally computed
-sha256 ce50713a261d14b735ec9ccd97609f0ad5ce69540af560e8c3ce9eb5f2d28f47  trousers-0.3.14.tar.gz
-sha256 1ad596d12e7471549663c03e280b5b5d084a2e853fb86e4d766109818f9d7dae  LICENSE
+sha256  1e5be93e518372acf1d92d2f567d01a46fdb0b730487e544e6fb896c59cac77f  trousers-0.3.15.tar.gz
+sha256  1ad596d12e7471549663c03e280b5b5d084a2e853fb86e4d766109818f9d7dae  LICENSE
diff --git a/package/trousers/trousers.mk b/package/trousers/trousers.mk
index 5e6161ce4d..b2cfef0968 100644
--- a/package/trousers/trousers.mk
+++ b/package/trousers/trousers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TROUSERS_VERSION = 0.3.14
+TROUSERS_VERSION = 0.3.15
 TROUSERS_SITE = http://downloads.sourceforge.net/project/trousers/trousers/$(TROUSERS_VERSION)
 TROUSERS_LICENSE = BSD-3-Clause
 TROUSERS_LICENSE_FILES = LICENSE
@@ -13,9 +13,6 @@ TROUSERS_INSTALL_STAGING = YES
 TROUSERS_AUTORECONF = YES
 TROUSERS_DEPENDENCIES = host-pkgconf openssl
 
-# 0003-Correct-multiple-security-issues-that-are-present-if.patch
-TROUSERS_IGNORE_CVES += CVE-2020-24330 CVE-2020-24331 CVE-2020-24332
-
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 TROUSERS_DEPENDENCIES += libiconv
 endif
