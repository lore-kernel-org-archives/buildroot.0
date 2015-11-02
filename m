From: Remi Pommarel <repk@triplefau.lt>
Date: Mon,  2 Nov 2015 09:17:31 +0100
Subject: [Buildroot] [PATCH v3 2/3] package/git: Add git patch for static
	compilation
In-Reply-To: <1446452252-10647-1-git-send-email-repk@triplefau.lt>
References: <1446452252-10647-1-git-send-email-repk@triplefau.lt>
Message-ID: <1446452252-10647-3-git-send-email-repk@triplefau.lt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use submitted git patches that fix static compilation:
	- The first patch fix library link order
	- The second patch adds -lssl when needed with libcurl

These patches fix missing library in the Makefile for git compilation. configure
still need additional library to be passed to LIBS variable to compile test
programs for feature detection.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 .../0001-Makefile-link-libcurl-before-zlib.patch   | 62 ++++++++++++++++++++++
 ...configure.ac-detect-ssl-need-with-libcurl.patch | 46 ++++++++++++++++
 package/git/git.mk                                 |  2 +
 3 files changed, 110 insertions(+)
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
index 0000000..d39987e
--- /dev/null
+++ b/package/git/0003-configure.ac-detect-ssl-need-with-libcurl.patch
@@ -0,0 +1,46 @@
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
+diff --git a/configure.ac b/configure.ac
+index 01b07ad..fd22d41 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -521,6 +521,16 @@ AC_CHECK_LIB([curl], [curl_global_init],
+ [NO_CURL=],
+ [NO_CURL=YesPlease])
+ 
++if test -z "${NO_CURL}" && test -z "${NO_OPENSSL}"; then
++
++AC_CHECK_LIB([curl], [Curl_ssl_init],
++[NEEDS_SSL_WITH_CURL=YesPlease],
++[NEEDS_SSL_WITH_CURL=])
++
++GIT_CONF_SUBST([NEEDS_SSL_WITH_CURL])
++
++fi
++
+ GIT_UNSTASH_FLAGS($CURLDIR)
+ 
+ GIT_CONF_SUBST([NO_CURL])
+-- 
+2.0.1
+
diff --git a/package/git/git.mk b/package/git/git.mk
index 2c404b4..79cc31c 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -9,6 +9,8 @@ GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = https://www.kernel.org/pub/software/scm/git
 GIT_LICENSE = GPLv2 LGPLv2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
+# configure.ac gets patched, so autoreconf is necessary
+GIT_AUTORECONF = YES
 GIT_DEPENDENCIES = zlib host-gettext
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.0.1
