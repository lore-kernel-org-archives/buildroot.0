From: Remi Pommarel <repk@triplefau.lt>
Date: Mon, 26 Oct 2015 22:12:41 +0100
Subject: [Buildroot] [PATCH 2/3] package/git: Add git patch for static
	compilation
In-Reply-To: <1445893962-13338-1-git-send-email-repk@triplefau.lt>
References: <1445893962-13338-1-git-send-email-repk@triplefau.lt>
Message-ID: <1445893962-13338-3-git-send-email-repk@triplefau.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use submitted git patches that fix static compilation:
	- The first patch fix library link order
	- The second patch adds -lssl when needed with libcurl

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 .../0001-Makefile-link-libcurl-before-zlib.patch   | 62 ++++++++++++++++
 ...configure.ac-detect-ssl-need-with-libcurl.patch | 85 ++++++++++++++++++++++
 2 files changed, 147 insertions(+)
 create mode 100644 package/git/0001-Makefile-link-libcurl-before-zlib.patch
 create mode 100644 package/git/0003-configure.ac-detect-ssl-need-with-libcurl.patch

diff --git a/package/git/0001-Makefile-link-libcurl-before-zlib.patch b/package/git/0001-Makefile-link-libcurl-before-zlib.patch
new file mode 100644
index 0000000..8b6786e
--- /dev/null
+++ b/package/git/0001-Makefile-link-libcurl-before-zlib.patch
@@ -0,0 +1,62 @@
+From 9eaa78b0b037964da85d6a15f0128639f2118a53 Mon Sep 17 00:00:00 2001
+From: Remi Pommarel <repk@triplefau.lt>
+Date: Wed, 21 Oct 2015 19:01:13 +0200
+Subject: [PATCH 1/3] Makefile: link libcurl before zlib
+
+For static linking especially library order while linking is important. For
+example, libcurl wants symbols from zlib when building http-push, http-fetch
+and remote-curl. So for these programs libcurl has to be linked before zlib.
+
+Signed-off-by: Remi Pommarel <repk@triplefau.lt>
+Reviewed-by: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+---
+ Makefile | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ce0cfe2..9787385 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1029,7 +1029,7 @@ ifdef HAVE_ALLOCA_H
+ endif
+ 
+ IMAP_SEND_BUILDDEPS =
+-IMAP_SEND_LDFLAGS = $(OPENSSL_LINK) $(OPENSSL_LIBSSL) $(LIB_4_CRYPTO)
++IMAP_SEND_LDFLAGS =
+ 
+ ifdef NO_CURL
+ 	BASIC_CFLAGS += -DNO_CURL
+@@ -1086,6 +1086,7 @@ else
+ 		endif
+ 	endif
+ endif
++IMAP_SEND_LDFLAGS += $(OPENSSL_LINK) $(OPENSSL_LIBSSL) $(LIB_4_CRYPTO)
+ 
+ ifdef ZLIB_PATH
+ 	BASIC_CFLAGS += -I$(ZLIB_PATH)/include
+@@ -1971,10 +1972,10 @@ git-imap-send$X: imap-send.o $(IMAP_SEND_BUILDDEPS) GIT-LDFLAGS $(GITLIBS)
+ 
+ git-http-fetch$X: http.o http-walker.o http-fetch.o GIT-LDFLAGS $(GITLIBS)
+ 	$(QUIET_LINK)$(CC) $(ALL_CFLAGS) -o $@ $(ALL_LDFLAGS) $(filter %.o,$^) \
+-		$(LIBS) $(CURL_LIBCURL)
++		$(CURL_LIBCURL) $(LIBS)
+ git-http-push$X: http.o http-push.o GIT-LDFLAGS $(GITLIBS)
+ 	$(QUIET_LINK)$(CC) $(ALL_CFLAGS) -o $@ $(ALL_LDFLAGS) $(filter %.o,$^) \
+-		$(LIBS) $(CURL_LIBCURL) $(EXPAT_LIBEXPAT)
++		$(CURL_LIBCURL) $(EXPAT_LIBEXPAT) $(LIBS)
+ 
+ git-remote-testsvn$X: remote-testsvn.o GIT-LDFLAGS $(GITLIBS) $(VCSSVN_LIB)
+ 	$(QUIET_LINK)$(CC) $(ALL_CFLAGS) -o $@ $(ALL_LDFLAGS) $(filter %.o,$^) $(LIBS) \
+@@ -1988,7 +1989,7 @@ $(REMOTE_CURL_ALIASES): $(REMOTE_CURL_PRIMARY)
+ 
+ $(REMOTE_CURL_PRIMARY): remote-curl.o http.o http-walker.o GIT-LDFLAGS $(GITLIBS)
+ 	$(QUIET_LINK)$(CC) $(ALL_CFLAGS) -o $@ $(ALL_LDFLAGS) $(filter %.o,$^) \
+-		$(LIBS) $(CURL_LIBCURL) $(EXPAT_LIBEXPAT)
++		$(CURL_LIBCURL) $(EXPAT_LIBEXPAT) $(LIBS)
+ 
+ $(LIB_FILE): $(LIB_OBJS)
+ 	$(QUIET_AR)$(RM) $@ && $(AR) rcs $@ $^
+-- 
+2.0.1
+
diff --git a/package/git/0003-configure.ac-detect-ssl-need-with-libcurl.patch b/package/git/0003-configure.ac-detect-ssl-need-with-libcurl.patch
new file mode 100644
index 0000000..e8dc367
--- /dev/null
+++ b/package/git/0003-configure.ac-detect-ssl-need-with-libcurl.patch
@@ -0,0 +1,85 @@
+From 7e91e8d73a757801c0604a03fd2f0fa8003e4ac0 Mon Sep 17 00:00:00 2001
+From: Remi Pommarel <repk@triplefau.lt>
+Date: Thu, 24 Sep 2015 21:14:00 +0200
+Subject: [PATCH 3/3] configure.ac: detect ssl need with libcurl
+
+When libcurl has been statically compiled with openssl support they both
+need to be linked in everytime libcurl is used.
+
+During configuration this can be detected by looking for Curl_ssl_init
+function symbol in libcurl, which will only be present if libcurl has been
+compiled statically built with openssl.
+
+configure.ac checks for Curl_ssl_init function in libcurl and if such function
+exists; it sets NEEDS_SSL_WITH_CURL that is used by the Makefile to include
+-lssl alongside with -lcurl.
+
+Signed-off-by: Remi Pommarel <repk@triplefau.lt>
+Signed-off-by: Junio C Hamano <gitster@pobox.com>
+---
+ configure.ac | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff -rup a/configure b/configure
+--- a/configure 2015-10-26 20:33:23.829904205 +0100
++++ b/configure 2015-10-26 20:33:40.429904052 +0100
+@@ -5220,6 +5221,56 @@ else
+ fi
+ 
+ 
++if test -z "${NO_CURL}" && test -z "${NO_OPENSSL}"; then
++
++{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for Curl_ssl_init in -lcurl" >&5
++$as_echo_n "checking for Curl_ssl_init in -lcurl... " >&6; }
++if ${ac_cv_lib_curl_Curl_ssl_init+:} false; then :
++  $as_echo_n "(cached) " >&6
++else
++  ac_check_lib_save_LIBS=$LIBS
++LIBS="-lcurl  $LIBS"
++cat confdefs.h - <<_ACEOF >conftest.$ac_ext
++/* end confdefs.h.  */
++
++/* Override any GCC internal prototype to avoid an error.
++   Use char because int might match the return type of a GCC
++   builtin and then its argument prototype would still apply.  */
++#ifdef __cplusplus
++extern "C"
++#endif
++char Curl_ssl_init ();
++int
++main ()
++{
++return Curl_ssl_init ();
++  ;
++  return 0;
++}
++_ACEOF
++if ac_fn_c_try_link "$LINENO"; then :
++  ac_cv_lib_curl_Curl_ssl_init=yes
++else
++  ac_cv_lib_curl_Curl_ssl_init=no
++fi
++rm -f core conftest.err conftest.$ac_objext \
++    conftest$ac_exeext conftest.$ac_ext
++LIBS=$ac_check_lib_save_LIBS
++fi
++{ $as_echo "$as_me:${as_lineno-$LINENO}: result: $ac_cv_lib_curl_Curl_ssl_init" >&5
++$as_echo "$ac_cv_lib_curl_Curl_ssl_init" >&6; }
++if test "x$ac_cv_lib_curl_Curl_ssl_init" = xyes; then :
++  NEEDS_SSL_WITH_CURL=YesPlease
++else
++  NEEDS_SSL_WITH_CURL=
++fi
++
++
++
++config_appended_defs="$config_appended_defs${newline}NEEDS_SSL_WITH_CURL=${NEEDS_SSL_WITH_CURL}"
++
++fi
++
+ 
+ if test -n "$CURLDIR"; then
+    CPPFLAGS="$old_CPPFLAGS"
+-- 
+2.0.1
+
-- 
2.0.1
