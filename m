From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Sep 2014 23:21:48 +0200
Subject: [Buildroot] [git commit] sudo: bump to version 1.8.10p3
Message-ID: <20140919212229.4E49D9D6C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7fcf3bc5643a75898c76d5610360b6560a695f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also add hashes, kill some whitespace and correct the license type
(ICS->ISC).
Enable $EDITOR to point to the right editor for visudo since it normally
expects /usr/bin/vi which in busybox-world is /bin/vi (and some people
might want to use other editors like the operating system sized one).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sudo/sudo-0001-no-netgroup.patch |   29 +++++++++++++++++++++++++++++
 package/sudo/sudo.hash                   |    3 +++
 package/sudo/sudo.mk                     |   11 +++++++----
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/package/sudo/sudo-0001-no-netgroup.patch b/package/sudo/sudo-0001-no-netgroup.patch
new file mode 100644
index 0000000..64b870c
--- /dev/null
+++ b/package/sudo/sudo-0001-no-netgroup.patch
@@ -0,0 +1,29 @@
+# HG changeset patch
+# User Todd C. Miller <Todd.Miller@courtesan.com>
+# Date 1406550172 21600
+# Node ID 57deb66ef8ffc0f551d460e15a34f7df78f54d2a
+# Parent  f547bf80c436c07ddb1c7385d22db96862ae7e4f
+Fix compilation on systems w/o netgroups.
+
+Status: upstream
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -r f547bf80c436 -r 57deb66ef8ff plugins/sudoers/match.c
+--- a/plugins/sudoers/match.c	Sat Jul 26 06:07:34 2014 -0600
++++ b/plugins/sudoers/match.c	Mon Jul 28 06:22:52 2014 -0600
+@@ -972,12 +972,12 @@
+ 	rc = true;
+     else if (lhost != shost && innetgr(netgr, shost, user, domain))
+ 	rc = true;
+-#endif /* HAVE_INNETGR */
+ 
+     sudo_debug_printf(SUDO_DEBUG_DEBUG|SUDO_DEBUG_LINENO,
+ 	"netgroup %s matches (%s|%s, %s, %s): %s", netgr, lhost ? lhost : "",
+ 	shost ? shost : "", user ? user : "", domain ? domain : "",
+ 	rc ? "true" : "false");
++#endif /* HAVE_INNETGR */
+ 
+     debug_return_bool(rc);
+ }
+
diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
new file mode 100644
index 0000000..ba65773
--- /dev/null
+++ b/package/sudo/sudo.hash
@@ -0,0 +1,3 @@
+# From announcement http://www.sudo.ws/pipermail/sudo-announce/2014-May/000132.html
+md5	fcd8d0d9f9f0397d076ee901e242ed39	sudo-1.8.10p3.tar.gz
+sha256	6eda135fa68163108f1c24de6975de5ddb09d75730bb62d6390bda7b04345400	sudo-1.8.10p3.tar.gz
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index e0db465..c958bec 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -4,17 +4,20 @@
 #
 ################################################################################
 
-SUDO_VERSION = 1.8.8
-SUDO_SITE    = http://www.sudo.ws/sudo/dist
-SUDO_LICENSE = ICS BSD-3c
+SUDO_VERSION = 1.8.10p3
+SUDO_SITE = http://www.sudo.ws/sudo/dist
+SUDO_LICENSE = ISC BSD-3c
 SUDO_LICENSE_FILES = doc/LICENSE
+# Ships a non-release libtool that isn't patch-friendly
+SUDO_AUTORECONF = YES
 SUDO_CONF_OPT = \
 		--without-lecture \
 		--without-sendmail \
 		--without-umask \
 		--with-logging=syslog \
 		--without-interfaces \
-		--without-pam
+		--without-pam \
+		--with-env-editor
 
 # mksigname/mksiglist needs to run on build host to generate source files
 define SUDO_BUILD_MKSIGNAME_MKSIGLIST_HOST
