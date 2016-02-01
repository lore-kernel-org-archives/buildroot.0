From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  1 Feb 2016 15:22:27 +0100
Subject: [Buildroot] [RFC] package/gdb: simplify the disable doc hook
Message-ID: <1454336547-23655-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Depending on the gdb version we need to remove the documentation
build from different place in the gdb source tree.

From: gdb/Makefile.in
3aecfbd03dd2a8d49c97f1e68df42b077dbbd396

From: bfd/doc/Makefile.in and gprof/Makefile.in
1180bafd8e1de2b12db3c7c235b128c9e48d4abb

From: etc/Makefile.in
as proposed by [1]

The issue come from the commit e30465112ed4c6320dd19107302057a5f7712cf2
in the gdb tree that update the "missing" script which now return the
error code 127 when a tool is missing.

The same kind of hook will be needed when the binutils package will be
updated to 2.26 release.

Fixes:
http://autobuild.buildroot.net/results/55d/55d95d7decc8ff8c451601a38ce2c2818fe23bcc

[1] http://patchwork.ozlabs.org/patch/572150/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gdb/gdb.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 3b0f501..65b2e67 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -53,13 +53,8 @@ endif
 
 # Prevent gdb to build the documentation
 define GDB_DISABLE_DOC
-	$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
-	if test -e $(@D)/bfd/doc/Makefile.in ; then \
-		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/bfd/doc/Makefile.in ; \
-	fi
-	if test -e $(@D)/gprof/Makefile.in ; then \
-		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/gprof/Makefile.in ; \
-	fi
+	echo "#!/bin/sh" > $(@D)/missing
+	echo "exit 0" >> $(@D)/missing
 endef
 GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
 HOST_GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
-- 
2.4.3
