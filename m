From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Oct 2016 10:50:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: bump to version 1.3.0
Message-ID: <20161016085032.27512-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

removed 0003-Conditionally-compile-per-innetgr-availability.patch,
applied upstream:
https://git.fedorahosted.org/cgit/linux-pam.git/commit/?id=835d64947996b7cc96fe187f9b3103db36dddf77

This bump includes
https://git.fedorahosted.org/cgit/linux-pam.git/commit/?id=01e0038fa55581c4afc9d63b6180d2ea77ba2940
which fixes
http://autobuild.buildroot.net/results/394/394e22be0ef986463e97b3040dad8f978262732c/

Removed comment in Config.in about broken --enable-static-modules
configure option because it was removed upstream:

https://git.fedorahosted.org/cgit/linux-pam.git/commit/?id=a684595c0bbd88df71285f43fb27630e3829121e

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...tionally-compile-per-innetgr-availability.patch | 84 ----------------------
 package/linux-pam/Config.in                        |  6 --
 package/linux-pam/linux-pam.hash                   |  2 +-
 package/linux-pam/linux-pam.mk                     |  2 +-
 4 files changed, 2 insertions(+), 92 deletions(-)
 delete mode 100644 package/linux-pam/0003-Conditionally-compile-per-innetgr-availability.patch

diff --git a/package/linux-pam/0003-Conditionally-compile-per-innetgr-availability.patch b/package/linux-pam/0003-Conditionally-compile-per-innetgr-availability.patch
deleted file mode 100644
index 4b516fa..0000000
--- a/package/linux-pam/0003-Conditionally-compile-per-innetgr-availability.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-innetgr is not available/functional in uclibc, provide conditions for
-compilation.
-
-Patch originally by Dmitry Golubovsky <golubovsky@gmail.com> - porting
-to linux-pam 1.2.1.
-
-Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-
-Upstream-status: pending
-
----
- modules/pam_group/pam_group.c           | 8 +++++++-
- modules/pam_succeed_if/pam_succeed_if.c | 4 ++++
- modules/pam_time/pam_time.c             | 8 +++++++-
- 3 files changed, 18 insertions(+), 2 deletions(-)
-
-diff --git a/modules/pam_group/pam_group.c b/modules/pam_group/pam_group.c
-index be5f20f..0982de8 100644
---- a/modules/pam_group/pam_group.c
-+++ b/modules/pam_group/pam_group.c
-@@ -655,8 +655,14 @@ static int check_account(pam_handle_t *pamh, const char *service,
- 	    continue;
- 	}
- 	/* If buffer starts with @, we are using netgroups */
--	if (buffer[0] == '@')
-+	if (buffer[0] == '@') {
-+#ifdef HAVE_INNETGR
- 	  good &= innetgr (&buffer[1], NULL, user, NULL);
-+#else
-+	  good = 0;
-+	  pam_syslog (pamh, LOG_ERR, "pam_group does not have netgroup support");
-+#endif  /* HAVE_INNETGR */
-+	}
- 	/* otherwise, if the buffer starts with %, it's a UNIX group */
- 	else if (buffer[0] == '%')
-           good &= pam_modutil_user_in_group_nam_nam(pamh, user, &buffer[1]);
-diff --git a/modules/pam_succeed_if/pam_succeed_if.c b/modules/pam_succeed_if/pam_succeed_if.c
-index aa828fc..c09d669 100644
---- a/modules/pam_succeed_if/pam_succeed_if.c
-+++ b/modules/pam_succeed_if/pam_succeed_if.c
-@@ -233,16 +233,20 @@ evaluate_notingroup(pam_handle_t *pamh, const char *user, const char *group)
- static int
- evaluate_innetgr(const char *host, const char *user, const char *group)
- {
-+#ifdef HAVE_INNETGR
- 	if (innetgr(group, host, user, NULL) == 1)
- 		return PAM_SUCCESS;
-+#endif /* HAVE_INNETGR */
- 	return PAM_AUTH_ERR;
- }
- /* Return PAM_SUCCESS if the (host,user) is NOT in the netgroup. */
- static int
- evaluate_notinnetgr(const char *host, const char *user, const char *group)
- {
-+#ifdef HAVE_INNETGR
- 	if (innetgr(group, host, user, NULL) == 0)
- 		return PAM_SUCCESS;
-+#endif /* HAVE_INNETGR */
- 	return PAM_AUTH_ERR;
- }
- 
-diff --git a/modules/pam_time/pam_time.c b/modules/pam_time/pam_time.c
-index c94737c..4898fd2 100644
---- a/modules/pam_time/pam_time.c
-+++ b/modules/pam_time/pam_time.c
-@@ -554,8 +554,14 @@ check_account(pam_handle_t *pamh, const char *service,
- 	       continue;
- 	  }
- 	  /* If buffer starts with @, we are using netgroups */
--	  if (buffer[0] == '@')
-+	  if (buffer[0] == '@') {
-+#ifdef HAVE_INNETGR
- 	    good &= innetgr (&buffer[1], NULL, user, NULL);
-+#else
-+	    good = 0;
-+	    pam_syslog (pamh, LOG_ERR, "pam_time does not have netgroup support");
-+#endif /* HAVE_INNETGR */
-+	  }
- 	  else
- 	    good &= logic_field(pamh, user, buffer, count, is_same);
- 	  D(("with user: %s", good ? "passes":"fails" ));
--- 
-2.4.3
-
diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index 7044073..5d3fd61 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -3,12 +3,6 @@ config BR2_PACKAGE_LINUX_PAM
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_FLEX
 	depends on (BR2_ENABLE_LOCALE && BR2_USE_WCHAR)
-	# While linux-pam does have some support for statically linked
-	# modules (through --enable-static-modules), it doesn't work
-	# properly due to a build cycle between libpam and
-	# modules. See
-	# https://lists.fedorahosted.org/pipermail/linux-pam-commits/2012-February/000105.html
-	# for details.
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_TOOLCHAIN_USES_MUSL # linux-pam
 	depends on BR2_USE_MMU # fork()
diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
index a6a26d1..b9c91ef 100644
--- a/package/linux-pam/linux-pam.hash
+++ b/package/linux-pam/linux-pam.hash
@@ -1,2 +1,2 @@
 # Locally computed hashes, not provided by upstream
-sha256	342b1211c0d3b203a7df2540a5b03a428a087bd8a48c17e49ae268f992b334d9	Linux-PAM-1.2.1.tar.bz2
+sha256 241aed1ef522f66ed672719ecf2205ec513fd0075ed80cda8e086a5b1a01d1bb  Linux-PAM-1.3.0.tar.bz2
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 2b94412..6ce3839 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINUX_PAM_VERSION = 1.2.1
+LINUX_PAM_VERSION = 1.3.0
 LINUX_PAM_SOURCE = Linux-PAM-$(LINUX_PAM_VERSION).tar.bz2
 LINUX_PAM_SITE = http://linux-pam.org/library
 LINUX_PAM_INSTALL_STAGING = YES
-- 
2.9.3
