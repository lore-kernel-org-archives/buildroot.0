From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  6 Apr 2009 09:21:27 +0000 (UTC)
Subject: [Buildroot] svn commit: [25975] trunk/buildroot:  toolchain
Message-ID: <20090406092127.2758C77182@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-06 09:21:26 +0000 (Mon, 06 Apr 2009)
New Revision: 25975

Log:
Makefile: add BR2_ENABLE_LOCALE_PURGE to purge unwanted locales

Add BR2_ENABLE_LOCALE_PURGE / BR2_ENABLE_LOCALE_WHITELIST options to
remove unwanted locales from the target rootfs. Handy for stuff like
the gtk stack, which comes with ~25 MB locales.

Works similar to localepurge in Debian, E.G. you provide a white list
of wanted locales, and everything else is removed.

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/toolchain/Config.in.2


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-04-06 09:21:22 UTC (rev 25974)
+++ trunk/buildroot/Makefile	2009-04-06 09:21:26 UTC (rev 25975)
@@ -264,6 +264,10 @@
 
 TARGETS+=target-devfiles
 
+ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
+TARGETS+=target-purgelocales
+endif
+
 # target stuff is last so it can override anything else
 include target/Makefile.in
 
@@ -348,6 +352,24 @@
 	find $(TARGET_DIR)/usr/lib \( -name '*.a' -o -name '*.la' \) -delete
 endif
 
+ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
+LOCALE_WHITELIST=$(PROJECT_BUILD_DIR)/locales.nopurge
+LOCALE_NOPURGE=$(strip $(subst ",,$(BR2_ENABLE_LOCALE_WHITELIST)))
+#"))
+
+target-purgelocales:
+	rm -f $(LOCALE_WHITELIST)
+	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
+
+	for dir in $(wildcard $(addprefix $(TARGET_DIR),/usr/share/locale /usr/share/X11/locale /usr/man /usr/share/man)); \
+	do \
+		for lang in $$(cd $$dir; ls .|grep -v man); \
+		do \
+			grep -qx $$lang $(LOCALE_WHITELIST) || rm -rf $$dir/$$lang; \
+		done; \
+	done
+endif
+
 source: $(TARGETS_SOURCE) $(HOST_SOURCE)
 
 _source-check:

Modified: trunk/buildroot/toolchain/Config.in.2
===================================================================
--- trunk/buildroot/toolchain/Config.in.2	2009-04-06 09:21:22 UTC (rev 25974)
+++ trunk/buildroot/toolchain/Config.in.2	2009-04-06 09:21:26 UTC (rev 25975)
@@ -44,6 +44,28 @@
 	  Say N here unless your buildhost lacks locale support and you
 	  desparately want to use internationalization on your target.
 
+config BR2_ENABLE_LOCALE_PURGE
+	bool "Purge unwanted locales"
+	depends on BR2_ENABLE_LOCALE
+	help
+	  Explicitly specify what locales to install on target. If N
+	  then all locales supported by packages are installed.
+
+config BR2_ENABLE_LOCALE_WHITELIST
+	string "Locales to keep"
+	default "C en_US de fr"
+	depends on BR2_ENABLE_LOCALE_PURGE
+	help
+	  Whitespace seperated list of locales to allow on target.
+	  Locales not listed here will be removed from the target.
+	  See 'locale -a' on your host for a list of locales available
+	  on your build host, or have a look in /usr/share/locale in
+	  the target file system for available locales.
+
+	  Notice that listing a locale here doesn't guarantee that it
+	  will be available on the target - That purely depends on the
+	  support for that locale in the selected packages.
+
 config BR2_USE_WCHAR
 	bool "Enable WCHAR support"
 	help
