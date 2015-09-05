From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  5 Sep 2015 16:30:42 +0200
Subject: [Buildroot] [PATCH 1/2] package/gdb (7.9): fix doc build when
	makeinfo is missing
Message-ID: <1441463443-9335-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If makeinfo is not found in the system then the missing
script is used to warn the user.

Before commit e30465112ed4c6320dd19107302057a5f7712cf2 the missing
script returned 0 after printing the message.

Now, missing return 127 (command not found) to the Makefile and
the build fail.

Ignore the code returned by missing in order to build successfully
gdb even if makeinfo is not installed on the system.

upstream status: to be submitted

Fixes:
http://autobuild.buildroot.net/results/dee/dee1326baf26ad1eb6e12a7d033428eca50d00bc/build-end.log

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 ...db-fix-doc-build-when-makeinfo-is-missing.patch | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 package/gdb/7.9.1/0004-gdb-fix-doc-build-when-makeinfo-is-missing.patch

diff --git a/package/gdb/7.9.1/0004-gdb-fix-doc-build-when-makeinfo-is-missing.patch b/package/gdb/7.9.1/0004-gdb-fix-doc-build-when-makeinfo-is-missing.patch
new file mode 100644
index 0000000..ca73750
--- /dev/null
+++ b/package/gdb/7.9.1/0004-gdb-fix-doc-build-when-makeinfo-is-missing.patch
@@ -0,0 +1,73 @@
+From e282f9d2a24f72ff7bb9bfb20dbdea299982bda0 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sat, 5 Sep 2015 16:02:28 +0200
+Subject: [PATCH] gdb: fix doc build when makeinfo is missing
+
+If makeinfo is not found in the system then the missing
+script is used to warn the user.
+
+Before commit e30465112ed4c6320dd19107302057a5f7712cf2 the missing
+script returned 0 after printing the message.
+
+Now, missing return 127 (command not found) to the Makefile and
+the build fail.
+
+Ignore the code returned by missing in order to build successfully
+gdb even if makeinfo is not installed on the system.
+
+Fixes:
+http://autobuild.buildroot.net/results/dee/dee1326baf26ad1eb6e12a7d033428eca50d00bc/build-end.log
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ gdb/doc/Makefile.in | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/gdb/doc/Makefile.in b/gdb/doc/Makefile.in
+index bd30a81..fe276d6 100644
+--- a/gdb/doc/Makefile.in
++++ b/gdb/doc/Makefile.in
+@@ -485,7 +485,7 @@ gdb.pdf: ${GDB_DOC_FILES}
+ # GDB MANUAL: info file
+ gdb.info: ${GDB_DOC_FILES}
+ 	$(MAKEINFO_CMD) $(READLINE_TEXI_INCFLAG) -I ${GDBMI_DIR} -I $(srcdir) \
+-		-o gdb.info $(srcdir)/gdb.texinfo
++		-o gdb.info $(srcdir)/gdb.texinfo | true
+ 
+ # GDB MANUAL: roff translations
+ # Try to use a recent texi2roff.  v2 was put on prep in jan91.
+@@ -560,15 +560,15 @@ gdb.mm: $(GDB_DOC_FILES) links2roff
+ # GDB MANUAL: HTML file
+ 
+ gdb/index.html: ${GDB_DOC_FILES}
+-	$(MAKEHTML) $(MAKEHTMLFLAGS) $(READLINE_TEXI_INCFLAG) -I ${GDBMI_DIR} -I $(srcdir) $(srcdir)/gdb.texinfo
++	$(MAKEHTML) $(MAKEHTMLFLAGS) $(READLINE_TEXI_INCFLAG) -I ${GDBMI_DIR} -I $(srcdir) $(srcdir)/gdb.texinfo | true
+ 
+ stabs.info: $(STABS_DOC_FILES)
+-	$(MAKEINFO_CMD) -I $(srcdir) -o stabs.info $(srcdir)/stabs.texinfo
++	$(MAKEINFO_CMD) -I $(srcdir) -o stabs.info $(srcdir)/stabs.texinfo | true
+ 
+ # STABS DOCUMENTATION: HTML file
+ 
+ stabs/index.html: $(STABS_DOC_FILES)
+-	$(MAKEHTML) $(MAKEHTMLFLAGS) -I $(srcdir) $(srcdir)/stabs.texinfo
++	$(MAKEHTML) $(MAKEHTMLFLAGS) -I $(srcdir) $(srcdir)/stabs.texinfo | true
+ 
+ # Clean these up before each run.  Avoids a catch 22 with not being
+ # able to re-generate these files (to fix a corruption) because these
+@@ -607,10 +607,10 @@ annotate.pdf: $(ANNOTATE_DOC_FILES)
+ 	$(TEXI2DVI) --pdf -I $(srcdir) $(srcdir)/annotate.texinfo
+ 
+ annotate.info: $(ANNOTATE_DOC_FILES)
+-	$(MAKEINFO_CMD) -I $(srcdir) -o annotate.info $(srcdir)/annotate.texinfo
++	$(MAKEINFO_CMD) -I $(srcdir) -o annotate.info $(srcdir)/annotate.texinfo | true
+ 
+ annotate/index.html: $(ANNOTATE_DOC_FILES)
+-	$(MAKEHTML) $(MAKEHTMLFLAGS) -I $(srcdir) $(srcdir)/annotate.texinfo
++	$(MAKEHTML) $(MAKEHTMLFLAGS) -I $(srcdir) $(srcdir)/annotate.texinfo | true
+ 
+ # Man pages
+ gdb.1: $(GDB_DOC_FILES)
+-- 
+2.4.3
+
-- 
2.4.3
