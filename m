From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Jan 2016 17:56:26 +0100
Subject: [Buildroot] [PATCH] package/gdb: avoid build issue with gdb sources
	from a git repository
Message-ID: <1453568186-4592-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't try to generate standards.info.

WARNING: `makeinfo' is missing on your system.  You should only need it if
         you modified a `.texi' or `.texinfo' file, or any other file
         indirectly affecting the aspect of the manual.  The spurious
         call might also be the consequence of using a buggy `make' (AIX,
         DU, IRIX).  You might want to install the `Texinfo' package or
         the `GNU make' package.  Grab either from any GNU archive site.
make[5]: *** [standards.info] Error 1
make[4]: *** [info] Error 1
make[3]: *** [all-etc] Error 2
make[3]: *** Waiting for unfinished jobs....

Fixes:
http://autobuild.buildroot.net/results/55d/55d95d7decc8ff8c451601a38ce2c2818fe23bcc

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
It would be easier to force "missing" script to exit 0
instead of unsing SED all over the gdb's tree.
---
 package/gdb/gdb.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 3b0f501..6447598 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -54,6 +54,9 @@ endif
 # Prevent gdb to build the documentation
 define GDB_DISABLE_DOC
 	$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
+	if test -e $(@D)/etc/Makefile.in ; then \
+		$(SED) '/^INFOFILES =/ s/standards.info configure.info//' $(@D)/etc/Makefile.in ; \
+	fi
 	if test -e $(@D)/bfd/doc/Makefile.in ; then \
 		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/bfd/doc/Makefile.in ; \
 	fi
-- 
2.4.3
