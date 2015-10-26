From: Remi Pommarel <repk@triplefau.lt>
Date: Mon, 26 Oct 2015 22:12:42 +0100
Subject: [Buildroot] [PATCH 3/3] package/git: Used curl-config program for
	target
In-Reply-To: <1445893962-13338-1-git-send-email-repk@triplefau.lt>
References: <1445893962-13338-1-git-send-email-repk@triplefau.lt>
Message-ID: <1445893962-13338-4-git-send-email-repk@triplefau.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix cross compilation by using curl-config script for target instead of the
one from host.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 ...kefile-make-curl-config-path-configurable.patch | 131 +++++++++++++++++++++
 package/git/git.mk                                 |   2 +
 2 files changed, 133 insertions(+)
 create mode 100644 package/git/0002-Makefile-make-curl-config-path-configurable.patch

diff --git a/package/git/0002-Makefile-make-curl-config-path-configurable.patch b/package/git/0002-Makefile-make-curl-config-path-configurable.patch
new file mode 100644
index 0000000..54911e3
--- /dev/null
+++ b/package/git/0002-Makefile-make-curl-config-path-configurable.patch
@@ -0,0 +1,131 @@
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
+diff -rup a/configure b/configure
+--- a/configure     2015-10-26 20:33:23.829904205 +0100
++++ b/configure 2015-10-26 20:33:40.429904052 +0100
+@@ -624,6 +624,7 @@ ac_includes_default="\
+
+ ac_subst_vars='LTLIBOBJS
+ LIBOBJS
++CURL_CONFIG
+ ASCIIDOC
+ TCLTK_PATH
+ DIFF
+@@ -5230,6 +5281,55 @@ fi
+
+ config_appended_defs="$config_appended_defs${newline}NO_CURL=${NO_CURL}"
+
++if test -z "$NO_CURL"; then
++
++# Extract the first word of "curl-config", so it can be a program name with args.
++set dummy curl-config; ac_word=$2
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
++$as_echo_n "checking for $ac_word... " >&6; }
++if ${ac_cv_prog_CURL_CONFIG+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  if test -n "$CURL_CONFIG"; then
++  ac_cv_prog_CURL_CONFIG="$CURL_CONFIG" # Let the user override the test.
++else
++as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
++for as_dir in $PATH
++do
++  IFS=$as_save_IFS
++  test -z "$as_dir" && as_dir=.
++    for ac_exec_ext in '' $ac_executable_extensions; do
++  if as_fn_executable_p "$as_dir/$ac_word$ac_exec_ext"; then
++    ac_cv_prog_CURL_CONFIG="curl-config"
++    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
++    break 2
++  fi
++done
++  done
++IFS=$as_save_IFS
++
++  test -z "$ac_cv_prog_CURL_CONFIG" && ac_cv_prog_CURL_CONFIG="no"
++fi
++fi
++CURL_CONFIG=$ac_cv_prog_CURL_CONFIG
++if test -n "$CURL_CONFIG"; then
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $CURL_CONFIG" >&5
++$as_echo "$CURL_CONFIG" >&6; }
++else
++  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
++$as_echo "no" >&6; }
++fi
++
++
++
++if test $CURL_CONFIG != no; then
++
++config_appended_defs="$config_appended_defs${newline}CURL_CONFIG=${CURL_CONFIG}"
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
index 942f29f..e049cf4 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -29,6 +29,8 @@ endif
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
