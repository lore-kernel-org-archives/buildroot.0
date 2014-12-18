From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Dec 2014 22:55:00 +0100
Subject: [Buildroot] [git commit] linux-pam: add security patches
Message-ID: <20141218220056.567687FED9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c165b0e580b6236c3efe93156e02d68d3013c575
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To fix:
CVE-2013-7041 - use case sensitive comparison in pam_userdb
CVE-2014-2583 - potential path traversal issue in pam_timestamp

Also add hash file (computed, the hash files upstream cover up to 1.1.7)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...pam-01-configure.patch => 0001-configure.patch} |    0
 ...akefile-am.patch => 0002-doc-makefile-am.patch} |    0
 .../{linux-pam-03-group.patch => 0003-group.patch} |    0
 .../{linux-pam-04-mkdir.patch => 0004-mkdir.patch} |    0
 ...nux-pam-05-succeed.patch => 0005-succeed.patch} |    0
 .../{linux-pam-06-time.patch => 0006-time.patch}   |    0
 ...linux-pam-07-rhosts.patch => 0007-rhosts.patch} |    0
 package/linux-pam/0008-fix-CVE-2014-2583.patch     |   53 ++++++++++++++++++++
 package/linux-pam/0009-fix-CVE-2013-7041.patch     |   50 ++++++++++++++++++
 package/linux-pam/linux-pam.hash                   |    2 +
 10 files changed, 105 insertions(+), 0 deletions(-)

diff --git a/package/linux-pam/linux-pam-01-configure.patch b/package/linux-pam/0001-configure.patch
similarity index 100%
rename from package/linux-pam/linux-pam-01-configure.patch
rename to package/linux-pam/0001-configure.patch
diff --git a/package/linux-pam/linux-pam-02-doc-makefile-am.patch b/package/linux-pam/0002-doc-makefile-am.patch
similarity index 100%
rename from package/linux-pam/linux-pam-02-doc-makefile-am.patch
rename to package/linux-pam/0002-doc-makefile-am.patch
diff --git a/package/linux-pam/linux-pam-03-group.patch b/package/linux-pam/0003-group.patch
similarity index 100%
rename from package/linux-pam/linux-pam-03-group.patch
rename to package/linux-pam/0003-group.patch
diff --git a/package/linux-pam/linux-pam-04-mkdir.patch b/package/linux-pam/0004-mkdir.patch
similarity index 100%
rename from package/linux-pam/linux-pam-04-mkdir.patch
rename to package/linux-pam/0004-mkdir.patch
diff --git a/package/linux-pam/linux-pam-05-succeed.patch b/package/linux-pam/0005-succeed.patch
similarity index 100%
rename from package/linux-pam/linux-pam-05-succeed.patch
rename to package/linux-pam/0005-succeed.patch
diff --git a/package/linux-pam/linux-pam-06-time.patch b/package/linux-pam/0006-time.patch
similarity index 100%
rename from package/linux-pam/linux-pam-06-time.patch
rename to package/linux-pam/0006-time.patch
diff --git a/package/linux-pam/linux-pam-07-rhosts.patch b/package/linux-pam/0007-rhosts.patch
similarity index 100%
rename from package/linux-pam/linux-pam-07-rhosts.patch
rename to package/linux-pam/0007-rhosts.patch
diff --git a/package/linux-pam/0008-fix-CVE-2014-2583.patch b/package/linux-pam/0008-fix-CVE-2014-2583.patch
new file mode 100644
index 0000000..a8b5f7b
--- /dev/null
+++ b/package/linux-pam/0008-fix-CVE-2014-2583.patch
@@ -0,0 +1,53 @@
+From 9dcead87e6d7f66d34e7a56d11a30daca367dffb Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Wed, 26 Mar 2014 22:17:23 +0000
+Subject: pam_timestamp: fix potential directory traversal issue (ticket #27)
+
+pam_timestamp uses values of PAM_RUSER and PAM_TTY as components of
+the timestamp pathname it creates, so extra care should be taken to
+avoid potential directory traversal issues.
+
+* modules/pam_timestamp/pam_timestamp.c (check_tty): Treat
+"." and ".." tty values as invalid.
+(get_ruser): Treat "." and ".." ruser values, as well as any ruser
+value containing '/', as invalid.
+
+Fixes CVE-2014-2583.
+
+Reported-by: Sebastian Krahmer <krahmer@suse.de>
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff --git a/modules/pam_timestamp/pam_timestamp.c b/modules/pam_timestamp/pam_timestamp.c
+index 5193733..b3f08b1 100644
+--- a/modules/pam_timestamp/pam_timestamp.c
++++ b/modules/pam_timestamp/pam_timestamp.c
+@@ -158,7 +158,7 @@ check_tty(const char *tty)
+ 		tty = strrchr(tty, '/') + 1;
+ 	}
+ 	/* Make sure the tty wasn't actually a directory (no basename). */
+-	if (strlen(tty) == 0) {
++	if (!strlen(tty) || !strcmp(tty, ".") || !strcmp(tty, "..")) {
+ 		return NULL;
+ 	}
+ 	return tty;
+@@ -243,6 +243,17 @@ get_ruser(pam_handle_t *pamh, char *ruserbuf, size_t ruserbuflen)
+ 		if (pwd != NULL) {
+ 			ruser = pwd->pw_name;
+ 		}
++	} else {
++		/*
++		 * This ruser is used by format_timestamp_name as a component
++		 * of constructed timestamp pathname, so ".", "..", and '/'
++		 * are disallowed to avoid potential path traversal issues.
++		 */
++		if (!strcmp(ruser, ".") ||
++		    !strcmp(ruser, "..") ||
++		    strchr(ruser, '/')) {
++			ruser = NULL;
++		}
+ 	}
+ 	if (ruser == NULL || strlen(ruser) >= ruserbuflen) {
+ 		*ruserbuf = '\0';
+-- 
+cgit v0.10.2
+
diff --git a/package/linux-pam/0009-fix-CVE-2013-7041.patch b/package/linux-pam/0009-fix-CVE-2013-7041.patch
new file mode 100644
index 0000000..ed58807
--- /dev/null
+++ b/package/linux-pam/0009-fix-CVE-2013-7041.patch
@@ -0,0 +1,50 @@
+From 57a1e2b274d0a6376d92ada9926e5c5741e7da20 Mon Sep 17 00:00:00 2001
+From: "Dmitry V. Levin" <ldv@altlinux.org>
+Date: Fri, 24 Jan 2014 22:18:32 +0000
+Subject: pam_userdb: fix password hash comparison
+
+Starting with commit Linux-PAM-0-77-28-g0b3e583 that introduced hashed
+passwords support in pam_userdb, hashes are compared case-insensitively.
+This bug leads to accepting hashes for completely different passwords in
+addition to those that should be accepted.
+
+Additionally, commit Linux-PAM-1_1_6-13-ge2a8187 that added support for
+modern password hashes with different lengths and settings, did not
+update the hash comparison accordingly, which leads to accepting
+computed hashes longer than stored hashes when the latter is a prefix
+of the former.
+
+* modules/pam_userdb/pam_userdb.c (user_lookup): Reject the computed
+hash whose length differs from the stored hash length.
+Compare computed and stored hashes case-sensitively.
+Fixes CVE-2013-7041.
+
+Bug-Debian: http://bugs.debian.org/731368
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff --git a/modules/pam_userdb/pam_userdb.c b/modules/pam_userdb/pam_userdb.c
+index de8b5b1..ff040e6 100644
+--- a/modules/pam_userdb/pam_userdb.c
++++ b/modules/pam_userdb/pam_userdb.c
+@@ -222,12 +222,15 @@ user_lookup (pam_handle_t *pamh, const char *database, const char *cryptmode,
+ 	  } else {
+ 	    cryptpw = crypt (pass, data.dptr);
+ 
+-	    if (cryptpw) {
+-	      compare = strncasecmp (data.dptr, cryptpw, data.dsize);
++	    if (cryptpw && strlen(cryptpw) == (size_t)data.dsize) {
++	      compare = memcmp(data.dptr, cryptpw, data.dsize);
+ 	    } else {
+ 	      compare = -2;
+ 	      if (ctrl & PAM_DEBUG_ARG) {
+-		pam_syslog(pamh, LOG_INFO, "crypt() returned NULL");
++		if (cryptpw)
++		  pam_syslog(pamh, LOG_INFO, "lengths of computed and stored hashes differ");
++		else
++		  pam_syslog(pamh, LOG_INFO, "crypt() returned NULL");
+ 	      }
+ 	    };
+ 
+-- 
+cgit v0.10.2
+
diff --git a/package/linux-pam/linux-pam.hash b/package/linux-pam/linux-pam.hash
new file mode 100644
index 0000000..3f420c2
--- /dev/null
+++ b/package/linux-pam/linux-pam.hash
@@ -0,0 +1,2 @@
+# Locally computed hashes, not provided by upstream
+sha256	c4b1f23a236d169e2496fea20721578d864ba00f7242d2b41d81050ac87a1e55	Linux-PAM-1.1.8.tar.bz2
