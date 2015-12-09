From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Dec 2015 10:26:01 +0000
Subject: [Buildroot] [PATCH] git: bump version to 2.6.4
Message-ID: <1449656761-22843-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 2.6.4
- Update the hash value
- Remove 0002-Makefile-make-curl-config-path-configurable.patch
  - This patch is now part of upstream:
    https://github.com/git/git/commit/f89158760d5f02ba59f644799abd921e6be22f13

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 ...kefile-make-curl-config-path-configurable.patch | 88 ----------------------
 package/git/git.hash                               |  2 +-
 package/git/git.mk                                 |  2 +-
 3 files changed, 2 insertions(+), 90 deletions(-)
 delete mode 100644 package/git/0002-Makefile-make-curl-config-path-configurable.patch

diff --git a/package/git/0002-Makefile-make-curl-config-path-configurable.patch b/package/git/0002-Makefile-make-curl-config-path-configurable.patch
deleted file mode 100644
index b281b99..0000000
--- a/package/git/0002-Makefile-make-curl-config-path-configurable.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From f89158760d5f02ba59f644799abd921e6be22f13 Mon Sep 17 00:00:00 2001
-From: Remi Pommarel <repk@triplefau.lt>
-Date: Wed, 21 Oct 2015 19:10:46 +0200
-Subject: [PATCH 2/3] Makefile: make curl-config path configurable
-
-There are situations, e.g. during cross compilation, where curl-config
-program is not present in the PATH.
-
-Make the makefile use a configurable curl-config program passed through
-CURL_CONFIG variable which can be set through config.mak.
-
-Also make this variable tunable through use of autoconf/configure. Configure
-will set CURL_CONFIG variable in config.mak.autogen to whatever value has been
-passed to ac_cv_prog_CURL_CONFIG.
-
-Signed-off-by: Remi Pommarel <repk@triplefau.lt>
-Reviewed-by: Jonathan Nieder <jrnieder@gmail.com>
-Signed-off-by: Junio C Hamano <gitster@pobox.com>
----
- Makefile     |  8 ++++++--
- configure.ac | 13 +++++++++++++
- 2 files changed, 19 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 9787385..64d17d0 100644
---- a/Makefile
-+++ b/Makefile
-@@ -39,6 +39,9 @@ all::
- # Define CURLDIR=/foo/bar if your curl header and library files are in
- # /foo/bar/include and /foo/bar/lib directories.
- #
-+# Define CURL_CONFIG to curl's configuration program that prints information
-+# about the library (e.g., its version number).  The default is 'curl-config'.
-+#
- # Define NO_EXPAT if you do not have expat installed.  git-http-push is
- # not built, and you cannot push using http:// and https:// transports (dumb).
- #
-@@ -425,6 +428,7 @@ TCL_PATH = tclsh
- TCLTK_PATH = wish
- XGETTEXT = xgettext
- MSGFMT = msgfmt
-+CURL_CONFIG = curl-config
- PTHREAD_LIBS = -lpthread
- PTHREAD_CFLAGS =
- GCOV = gcov
-@@ -1059,13 +1063,13 @@ else
- 	REMOTE_CURL_NAMES = $(REMOTE_CURL_PRIMARY) $(REMOTE_CURL_ALIASES)
- 	PROGRAM_OBJS += http-fetch.o
- 	PROGRAMS += $(REMOTE_CURL_NAMES)
--	curl_check := $(shell (echo 070908; curl-config --vernum | sed -e '/^70[BC]/s/^/0/') 2>/dev/null | sort -r | sed -ne 2p)
-+	curl_check := $(shell (echo 070908; $(CURL_CONFIG) --vernum | sed -e '/^70[BC]/s/^/0/') 2>/dev/null | sort -r | sed -ne 2p)
- 	ifeq "$(curl_check)" "070908"
- 		ifndef NO_EXPAT
- 			PROGRAM_OBJS += http-push.o
- 		endif
- 	endif
--	curl_check := $(shell (echo 072200; curl-config --vernum | sed -e '/^70[BC]/s/^/0/') 2>/dev/null | sort -r | sed -ne 2p)
-+	curl_check := $(shell (echo 072200; $(CURL_CONFIG) --vernum | sed -e '/^70[BC]/s/^/0/') 2>/dev/null | sort -r | sed -ne 2p)
- 	ifeq "$(curl_check)" "072200"
- 		USE_CURL_FOR_IMAP_SEND = YesPlease
- 	endif
-diff --git a/configure.ac b/configure.ac
-index 14012fa..01b07ad 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -525,6 +525,19 @@ GIT_UNSTASH_FLAGS($CURLDIR)
- 
- GIT_CONF_SUBST([NO_CURL])
- 
-+if test -z "$NO_CURL"; then
-+
-+AC_CHECK_PROG([CURL_CONFIG], [curl-config],
-+[curl-config],
-+[no])
-+
-+if test $CURL_CONFIG != no; then
-+    GIT_CONF_SUBST([CURL_CONFIG])
-+fi
-+
-+fi
-+
-+
- #
- # Define NO_EXPAT if you do not have expat installed.  git-http-push is
- # not built, and you cannot push using http:// and https:// transports.
--- 
-2.0.1
-
diff --git a/package/git/git.hash b/package/git/git.hash
index 6b663b5..802855d 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,2 +1,2 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256 fc7c727745d5eb0d796a16dc7c4b999c184830110e0aeb592c788597cc8e9ccd  git-2.6.1.tar.xz
+sha256 1c0170952163e0b240256bc47388b95c617cf8cf446c93261df83d42cf5dd466  git-2.6.4.tar.xz
diff --git a/package/git/git.mk b/package/git/git.mk
index fe7945a..8d9d3ab 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.6.1
+GIT_VERSION = 2.6.4
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
-- 
2.4.10
