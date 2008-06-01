From: antab at uclibc.org <antab@uclibc.org>
Date: Sun,  1 Jun 2008 10:58:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  package
Message-ID: <20080601175849.6C0D43C7ED@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-06-01 10:58:48 -0700 (Sun, 01 Jun 2008)
New Revision: 22163

Log:
Add option to set default site to download package source from. FreeBSD ports mirrors (like: ftp2.uk.freebsd.org/pub/FreeBSD/ports/distfiles) are a good place to find almost all of the source packages.


Modified:
   trunk/buildroot/Config.in
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/Config.in
===================================================================
--- trunk/buildroot/Config.in	2008-06-01 17:27:37 UTC (rev 22162)
+++ trunk/buildroot/Config.in	2008-06-01 17:58:48 UTC (rev 22163)
@@ -15,6 +15,15 @@
 
 menu "Build options"
 
+config BR2_PRIMARY_SITE
+	string "Primary download site"
+	default ""
+	help
+	  Primary site to download from. If this option is set then buildroot
+	  will try to download package source first from this site and try the
+	  default if the file is not found.
+	  NOTE: This only works for packages using the Makefile.autotools.in
+
 config BR2_WGET
 	string "Wget command"
 	default "wget --passive-ftp -nd"

Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-06-01 17:27:37 UTC (rev 22162)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-06-01 17:58:48 UTC (rev 22163)
@@ -131,6 +131,9 @@
 # Retrieve and unpack the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 	$(call MESSAGE,"Downloading")
+ifdef BR2_PRIMARY_SITE
+	-$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $(BR2_PRIMARY_SITE)/$($(PKG)_SOURCE)
+endif
 	$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
 	$(if $($(PKG)_PATCH),$(Q)test -e $(DL_DIR)/$($(PKG)_PATCH) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
 	$(Q)mkdir -p $(@D)
