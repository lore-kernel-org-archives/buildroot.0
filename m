From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Fri,  4 Apr 2008 05:23:29 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/festival/speech-tools
Message-ID: <20080404122329.5DF1A3C3A2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-04 05:23:28 -0700 (Fri, 04 Apr 2008)
New Revision: 21635

Log:
fix for festival install patch

Modified:
   trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch


Changeset:
Modified: trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch
===================================================================
--- trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch	2008-04-04 10:04:41 UTC (rev 21634)
+++ trunk/buildroot/package/festival/speech-tools/speech-tools-1.2.96-beta-install.patch	2008-04-04 12:23:28 UTC (rev 21635)
@@ -24,7 +24,7 @@
  
 --- a/config/rules/bin_process.mak	2004-01-27 18:56:39.000000000 -0500
 +++ b/config/rules/bin_process.mak	2008-04-03 12:37:31.000000000 -0400
-@@ -69,7 +69,8 @@ endif
+@@ -69,10 +69,17 @@ endif
  	    do \
  	    b=`basename "$$i"`;\
  	    $(ECHO_N) " $$b";\
@@ -32,5 +32,15 @@
 +	    $(INSTALL_PROG) "$$main/$$i" "$(DESTDIR)/usr/bin/$$b";\
 +		$(STRIP) "$(DESTDIR)/usr/bin/$$b";\
  	done
- 	@echo
- 
+-	@echo
+-
++	@$(ECHO_N) "Install Scheme Libraries:"
++	@main=`pwd` ;\
++	cp -a "$$main/../../lib" "$(DESTDIR)/usr/share/festival";\
++	for i in `find "$(DESTDIR)/usr/share/festival/lib" -name Makefile`;\
++		do \
++		rm "$$i"; \
++	done
++
+ .link_main:
+ 	@$(MAKE) MADE_FROM_ABOVE=1 --no-print-directory -C '$(PROJECT_MAIN_DIR)' BIN=TOP/$(DIRNAME) LIBDIR=MAIN/TOP/$(PROJECT_LIBRARY_DIR) MAIN='$($(PROJECT_PREFIX)_HOME)' .link_main$(S)
\ No newline at end of file
