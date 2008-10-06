From: wberrier at uclibc.org <wberrier@uclibc.org>
Date: Mon,  6 Oct 2008 12:20:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081006192059.02CC13C7DC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: wberrier
Date: 2008-10-06 12:20:58 -0700 (Mon, 06 Oct 2008)
New Revision: 23606

Log:
Makefile.autotools.in:
-Make tar switches 1.14 compatible

(Not sure of a more elegant way to handle this ... ?)


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-10-06 19:18:11 UTC (rev 23605)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-10-06 19:20:58 UTC (rev 23606)
@@ -124,6 +124,8 @@
 #AUTORECONF ?= autoreconf -v -i -f -I $(ACLOCAL_STAGING_DIR)
 #	ACLOCAL="$(ACLOCAL)"
 
+# Automatically detect tar --strip-path/components option
+TAR_STRIP_COMPONENTS = $(shell tar --help | grep strip-path > /dev/null ; if test $$? = 0 ; then echo '--strip-path' ; else echo '--strip-components' ; fi)
 
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
@@ -152,7 +154,7 @@
 	$(call MESSAGE,"Extracting")
 	$(Q)mkdir -p $(@D)
 	$(Q)$(INFLATE$(suffix $($(PKG)_SOURCE))) $(DL_DIR)/$($(PKG)_SOURCE) | \
-	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
+	$(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(@D) $(TAR_OPTIONS) -
 # some packages have messed up permissions inside
 	$(Q)chmod -R ug+rw $(@D)
 	$(Q)touch $@
