From: Remi Pommarel <repk@triplefau.lt>
Date: Sun,  1 Nov 2015 21:36:23 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/git: Used curl-config program
	for target
In-Reply-To: <1446410183-7798-1-git-send-email-repk@triplefau.lt>
References: <1446410183-7798-1-git-send-email-repk@triplefau.lt>
Message-ID: <1446410183-7798-4-git-send-email-repk@triplefau.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix cross compilation by using curl-config script for target instead of the
one from host.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 ...kefile-make-curl-config-path-configurable.patch | 88 ++++++++++++++++++++++
 package/git/git.mk                                 |  2 +
 2 files changed, 90 insertions(+)
 create mode 100644 package/git/0002-Makefile-make-curl-config-path-configurable.patch

diff --git a/package/git/0002-Makefile-make-curl-config-path-configurable.patch b/package/git/0002-Makefile-make-curl-config-path-configurable.patch
new file mode 100644
index 0000000..b281b99
--- /dev/null
+++ b/package/git/0002-Makefile-make-curl-config-path-configurable.patch
@@ -0,0 +1,88 @@
+From f89158760d5f02ba59f644799abd921e6be22f13 Mon Sep 17 00:00:00 2001
+From: Remi Pommarel <repk@triplefau.lt>
+Date: Wed, 21 Oct 2015 19:10:46 +0200
+Subject: [PATCH 2/3] Makefile: make curl-config path configurable
+
+There are situations, e.g. during cross compilation, where curl-config
+program is not present in the PATH.
+
+Make the makefile use a configurable curl-config program passed through
+CURL_CONFIG variable which can be set through config.mak.
+
+Also make this variable tunable through use of autoconf/configure. Configure
+will set CURL_CONFIG variable in config.mak.autogen to whatever value has been
+passed to ac_cv_prog_CURL_CONFIG.
+
+Signed-off-by: Remi Pommarel <repk@triplefau.lt>
+Reviewed-by: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+---
+ Makefile     |  8 ++++++--
+ configure.ac | 13 +++++++++++++
+ 2 files changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9787385..64d17d0 100644
+--- a/Makefile
++++ b/Makefile
+@@ -39,6 +39,9 @@ all::
+ # Define CURLDIR=/foo/bar if your curl header and library files are in
+ # /foo/bar/include and /foo/bar/lib directories.
+ #
++# Define CURL_CONFIG to curl's configuration program that prints information
++# about the library (e.g., its version number).  The default is 'curl-config'.
++#
+ # Define NO_EXPAT if you do not have expat installed.  git-http-push is
+ # not built, and you cannot push using http:// and https:// transports (dumb).
+ #
+@@ -425,6 +428,7 @@ TCL_PATH = tclsh
+ TCLTK_PATH = wish
+ XGETTEXT = xgettext
+ MSGFMT = msgfmt
++CURL_CONFIG = curl-config
+ PTHREAD_LIBS = -lpthread
+ PTHREAD_CFLAGS =
+ GCOV = gcov
+@@ -1059,13 +1063,13 @@ else
+ 	REMOTE_CURL_NAMES = $(REMOTE_CURL_PRIMARY) $(REMOTE_CURL_ALIASES)
+ 	PROGRAM_OBJS += http-fetch.o
+ 	PROGRAMS += $(REMOTE_CURL_NAMES)
+-	curl_check := $(shell (echo 070908; curl-config --vernum | sed -e '/^70[BC]/s/^/0/') 2>/dev/null | sort -r | sed -ne 2p)
++	curl_check := $(shell (echo 070908; $(CURL_CONFIG) --vernum | sed -e '/^70[BC]/s/^/0/') 2>/dev/null | sort -r | sed -ne 2p)
+ 	ifeq "$(curl_check)" "070908"
+ 		ifndef NO_EXPAT
+ 			PROGRAM_OBJS += http-push.o
+ 		endif
+ 	endif
+-	curl_check := $(shell (echo 072200; curl-config --vernum | sed -e '/^70[BC]/s/^/0/') 2>/dev/null | sort -r | sed -ne 2p)
++	curl_check := $(shell (echo 072200; $(CURL_CONFIG) --vernum | sed -e '/^70[BC]/s/^/0/') 2>/dev/null | sort -r | sed -ne 2p)
+ 	ifeq "$(curl_check)" "072200"
+ 		USE_CURL_FOR_IMAP_SEND = YesPlease
+ 	endif
+diff --git a/configure.ac b/configure.ac
+index 14012fa..01b07ad 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -525,6 +525,19 @@ GIT_UNSTASH_FLAGS($CURLDIR)
+ 
+ GIT_CONF_SUBST([NO_CURL])
+ 
++if test -z "$NO_CURL"; then
++
++AC_CHECK_PROG([CURL_CONFIG], [curl-config],
++[curl-config],
++[no])
++
++if test $CURL_CONFIG != no; then
++    GIT_CONF_SUBST([CURL_CONFIG])
++fi
++
++fi
++
++
+ #
+ # Define NO_EXPAT if you do not have expat installed.  git-http-push is
+ # not built, and you cannot push using http:// and https:// transports.
+-- 
+2.0.1
+
diff --git a/package/git/git.mk b/package/git/git.mk
index 13f1bc9..7cfc0d4 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -31,6 +31,8 @@ endif
 ifeq ($(BR2_PACKAGE_CURL),y)
 GIT_DEPENDENCIES += libcurl
 GIT_CONF_OPTS += --with-curl
+GIT_CONF_ENV +=	\
+	ac_cv_prog_curl_config=$(STAGING_DIR)/usr/bin/$(LIBCURL_CONFIG_SCRIPTS)
 else
 GIT_CONF_OPTS += --without-curl
 endif
-- 
2.0.1
