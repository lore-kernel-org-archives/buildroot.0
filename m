From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 13 Jan 2013 21:30:23 +0100
Subject: [Buildroot] [git commit] mcrypt: new package
Message-ID: <20130113203048.7CFCF99E30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e02c32fd6a064bf256c5e76abbf65e432892489
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                         |    1 +
 package/mcrypt/Config.in                  |   13 ++++
 package/mcrypt/mcrypt-CVE-2012-4409.patch |   25 +++++++
 package/mcrypt/mcrypt-CVE-2012-4426.patch |   35 +++++++++
 package/mcrypt/mcrypt-CVE-2012-4527.patch |  108 +++++++++++++++++++++++++++++
 package/mcrypt/mcrypt-no-rpath.patch      |   17 +++++
 package/mcrypt/mcrypt.mk                  |   17 +++++
 7 files changed, 216 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index ef62fb7..ea0586b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -589,6 +589,7 @@ menu "Miscellaneous"
 source "package/collectd/Config.in"
 source "package/empty/Config.in"
 source "package/googlefontdirectory/Config.in"
+source "package/mcrypt/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/snowball-init/Config.in"
diff --git a/package/mcrypt/Config.in b/package/mcrypt/Config.in
new file mode 100644
index 0000000..58567cd
--- /dev/null
+++ b/package/mcrypt/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MCRYPT
+	bool "mcrypt"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBMCRYPT
+	select BR2_PACKAGE_LIBMHASH
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	help
+	  MCrypt is a replacement for the old crypt() package and crypt(1)
+	  command, with extensions.
+	  It allows developers to use a wide range of encryption functions,
+	  without making drastic changes to their code.
+
+	  http://mcrypt.sourceforge.net/
diff --git a/package/mcrypt/mcrypt-CVE-2012-4409.patch b/package/mcrypt/mcrypt-CVE-2012-4409.patch
new file mode 100644
index 0000000..97c658b
--- /dev/null
+++ b/package/mcrypt/mcrypt-CVE-2012-4409.patch
@@ -0,0 +1,25 @@
+From 3efb40e17ce4f76717ae17a1ce1e1f747ddf59fd Mon Sep 17 00:00:00 2001
+From: Alon Bar-Lev <alon.barlev@gmail.com>
+Date: Sat, 22 Dec 2012 22:37:06 +0200
+Subject: [PATCH] cleanup: buffer overflow
+
+---
+ src/extra.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/src/extra.c b/src/extra.c
+index 3082f82..c7a1ac0 100644
+--- a/src/extra.c
++++ b/src/extra.c
+@@ -241,6 +241,8 @@ int check_file_head(FILE * fstream, char *algorithm, char *mode,
+ 		if (m_getbit(6, flags) == 1) { /* if the salt bit is set */
+ 			if (m_getbit(0, sflag) != 0) { /* if the first bit is set */
+ 				*salt_size = m_setbit(0, sflag, 0);
++				if (*salt_size > sizeof(tmp_buf))
++					err_quit(_("Salt is too long\n"));
+ 				if (*salt_size > 0) {
+ 					fread(tmp_buf, 1, *salt_size,
+ 					      fstream);
+-- 
+1.7.8.6
+
diff --git a/package/mcrypt/mcrypt-CVE-2012-4426.patch b/package/mcrypt/mcrypt-CVE-2012-4426.patch
new file mode 100644
index 0000000..708d4a5
--- /dev/null
+++ b/package/mcrypt/mcrypt-CVE-2012-4426.patch
@@ -0,0 +1,35 @@
+Patch taken from gentoo.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/src/errors.c
++++ b/src/errors.c
+@@ -25,24 +25,24 @@
+ 
+ void err_quit(char *errmsg)
+ {
+-	fprintf(stderr, errmsg);
++	fprintf(stderr, "%s", errmsg);
+ 	exit(-1);
+ }
+ 
+ void err_warn(char *errmsg)
+ {
+ 	if (quiet <= 1)
+-		fprintf(stderr, errmsg);
++		fprintf(stderr, "%s", errmsg);
+ }
+ 
+ void err_info(char *errmsg)
+ {
+ 	if (quiet == 0)
+-		fprintf(stderr, errmsg);
++		fprintf(stderr, "%s", errmsg);
+ }
+ 
+ void err_crit(char *errmsg)
+ {
+ 	if (quiet <= 2)
+-		fprintf(stderr, errmsg);
++		fprintf(stderr, "%s", errmsg);
+ }
diff --git a/package/mcrypt/mcrypt-CVE-2012-4527.patch b/package/mcrypt/mcrypt-CVE-2012-4527.patch
new file mode 100644
index 0000000..a287680
--- /dev/null
+++ b/package/mcrypt/mcrypt-CVE-2012-4527.patch
@@ -0,0 +1,108 @@
+Description: [CVE-2012-4527] Stack-based buffer overflow with long file names
+ .
+ A buffer overflow in mcrypt version 2.6.8 and earlier due to long filenames.
+ If a user were tricked into attempting to encrypt/decrypt specially crafted
+ long filename(s), this flaw would cause a stack-based buffer overflow that
+ could potentially lead to arbitrary code execution.
+ .
+ Note that this is caught by FORTIFY_SOURCE, which makes this a crash-only
+ bug on wheezy.
+Author: Attila Bogar, Jean-Michel Vourg??re <jmv_deb@nirgal.com>
+Origin: https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2012-4527
+Bug: CVE-2012-4527
+Bug-Debian: http://bugs.debian.org/690924
+Forwarded: no
+Last-Update: 2012-11-01
+Index: mcrypt-2.6.8/src/mcrypt.c
+===================================================================
+--- mcrypt-2.6.8.orig/src/mcrypt.c
++++ mcrypt-2.6.8/src/mcrypt.c
+@@ -41,4 +41,6 @@
+ 
++/* Temporary error message can contain one file name and 1k of text */
++#define ERRWIDTH ((PATH_MAX)+1024)
+-char tmperr[128];
++char tmperr[ERRWIDTH];
+ unsigned int stream_flag = FALSE;
+ char *keymode = NULL;
+ char *mode = NULL;
+@@ -482,7 +485,7 @@
+ #ifdef HAVE_STAT
+       if (stream_flag == FALSE) {
+ 	 if (is_normal_file(file[i]) == FALSE) {
+-	    sprintf(tmperr,
++	    snprintf(tmperr, ERRWIDTH,
+ 		    _
+ 		    ("%s: %s is not a regular file. Skipping...\n"),
+ 		    program_name, file[i]);
+@@ -501,7 +504,7 @@
+ 	    dinfile = file[i];
+ 	 if ((isatty(fileno((FILE *) (stdin))) == 1)
+ 	     && (stream_flag == TRUE) && (force == 0)) {	/* not a tty */
+-	    sprintf(tmperr,
++	    snprintf(tmperr, ERRWIDTH,
+ 		    _
+ 		    ("%s: Encrypted data will not be read from a terminal.\n"),
+ 		    program_name);
+@@ -520,7 +523,7 @@
+ 	    einfile = file[i];
+ 	 if ((isatty(fileno((FILE *) (stdout))) == 1)
+ 	     && (stream_flag == TRUE) && (force == 0)) {	/* not a tty */
+-	    sprintf(tmperr,
++	    snprintf(tmperr, ERRWIDTH,
+ 		    _
+ 		    ("%s: Encrypted data will not be written to a terminal.\n"),
+ 		    program_name);
+@@ -544,7 +547,7 @@
+ 	    strcpy(outfile, einfile);
+ 	    /* if file has already the .nc ignore it */
+ 	    if (strstr(outfile, ".nc") != NULL) {
+-	       sprintf(tmperr,
++	       snprintf(tmperr, ERRWIDTH,
+ 		       _
+ 		       ("%s: file %s has the .nc suffix... skipping...\n"),
+ 		       program_name, outfile);
+@@ -590,10 +593,10 @@
+ 
+ 	 if (x == 0) {
+ 	    if (stream_flag == FALSE) {
+-	       sprintf(tmperr, _("File %s was decrypted.\n"), dinfile);
++	       snprintf(tmperr, ERRWIDTH, _("File %s was decrypted.\n"), dinfile);
+ 	       err_warn(tmperr);
+ 	    } else {
+-	       sprintf(tmperr, _("Stdin was decrypted.\n"));
++	       snprintf(tmperr, ERRWIDTH, _("Stdin was decrypted.\n"));
+ 	       err_warn(tmperr);
+ 	    }
+ #ifdef HAVE_STAT
+@@ -610,7 +613,7 @@
+ 
+ 	 } else {
+ 	    if (stream_flag == FALSE) {
+-	       sprintf(tmperr,
++	       snprintf(tmperr, ERRWIDTH,
+ 		       _
+ 		       ("File %s was NOT decrypted successfully.\n"),
+ 		       dinfile);
+@@ -636,10 +639,10 @@
+ 
+ 	 if (x == 0) {
+ 	    if (stream_flag == FALSE) {
+-	       sprintf(tmperr, _("File %s was encrypted.\n"), einfile);
++	       snprintf(tmperr, ERRWIDTH, _("File %s was encrypted.\n"), einfile);
+ 	       err_warn(tmperr);
+ 	    } else {
+-	       sprintf(tmperr, _("Stdin was encrypted.\n"));
++	       snprintf(tmperr, ERRWIDTH, _("Stdin was encrypted.\n"));
+ 	       err_warn(tmperr);
+ 	    }
+ #ifdef HAVE_STAT
+@@ -655,7 +658,7 @@
+ 
+ 	 } else {
+ 	    if (stream_flag == FALSE) {
+-	       sprintf(tmperr,
++	       snprintf(tmperr, ERRWIDTH,
+ 		       _
+ 		       ("File %s was NOT encrypted successfully.\n"),
+ 		       einfile);
diff --git a/package/mcrypt/mcrypt-no-rpath.patch b/package/mcrypt/mcrypt-no-rpath.patch
new file mode 100644
index 0000000..a0813bc
--- /dev/null
+++ b/package/mcrypt/mcrypt-no-rpath.patch
@@ -0,0 +1,17 @@
+Patch out rpath hardcoding since it completely ignores --disable-rpath
+and other configure ways.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura mcrypt-2.6.8.orig/config.rpath mcrypt-2.6.8/config.rpath
+--- mcrypt-2.6.8.orig/config.rpath	2013-01-07 13:05:22.626883480 -0300
++++ mcrypt-2.6.8/config.rpath	2013-01-07 13:12:47.196090608 -0300
+@@ -153,7 +153,7 @@
+   # here allows them to be overridden if necessary.
+   # Unlike libtool, we use -rpath here, not --rpath, since the documented
+   # option of GNU ld is called -rpath, not --rpath.
+-  hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
++  hardcode_libdir_flag_spec=
+   case "$host_os" in
+     aix3* | aix4* | aix5*)
+       # On AIX/PPC, the GNU linker is very broken
diff --git a/package/mcrypt/mcrypt.mk b/package/mcrypt/mcrypt.mk
new file mode 100644
index 0000000..5bd5816
--- /dev/null
+++ b/package/mcrypt/mcrypt.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# mcrypt
+#
+#############################################################
+
+MCRYPT_VERSION = 2.6.8
+MCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/MCrypt/$(MCRYPT_VERSION)
+MCRYPT_DEPENDENCIES = libmcrypt libmhash \
+	$(if $(BR2_PACKAGE_ZLIB),zlib) \
+	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
+MCRYPT_CONF_OPT = --with-libmcrypt-prefix=$(STAGING_DIR)/usr
+MCRYPT_LICENSE = GPLv3
+MCRYPT_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
