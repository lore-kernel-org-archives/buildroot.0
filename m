From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  9 Mar 2016 13:29:41 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/gdb: use our missing script to
	disable the doc
In-Reply-To: <1457526582-20655-1-git-send-email-romain.naour@gmail.com>
References: <1457526582-20655-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1457526582-20655-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to workaround a build issue when makeinfo is missing on the host,
use our custom 'missing' script. The script bundled with gdb sources return the
exit status of the given program (makeinfo) and stop the build.

Remove the script bundled with gdb sources an create a symlink to our
customized 'missing' script.

Fixes:
http://autobuild.buildroot.net/results/4fcad074e1c9d66e19283bac9e15039990eb9430/

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v2: Remove the script bundled with gdb sources an create a symlink to our
    customized 'missing' script.
---
 package/gdb/gdb.mk | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 32d52eb..2aaf154 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -51,15 +51,16 @@ GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 HOST_GDB_PRE_PATCH_HOOKS += GDB_XTENSA_PRE_PATCH
 endif
 
-# Prevent gdb to build the documentation
+# Don't build documentation. It takes up extra space / build time,
+# and sometimes needs specific makeinfo versions to work.
+GDB_CONF_ENV += ac_cv_prog_MAKEINFO=missing
+HOST_GDB_CONF_ENV += ac_cv_prog_MAKEINFO=missing
+
+# Since gdb use an updated version of the 'missing' script from automake
+# >= v1.12b, use our customized version.
 define GDB_DISABLE_DOC
-	$(SED) '/^SUBDIRS =/ s/doc//' $(@D)/gdb/Makefile.in
-	if test -e $(@D)/bfd/doc/Makefile.in ; then \
-		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/bfd/doc/Makefile.in ; \
-	fi
-	if test -e $(@D)/gprof/Makefile.in ; then \
-		$(SED) 's/^INFO_DEPS =.*$$/INFO_DEPS =/' $(@D)/gprof/Makefile.in ; \
-	fi
+	rm -f $(@D)/missing
+	ln -s $(TOPDIR)/support/scripts/missing $(@D)/missing
 endef
 GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
 HOST_GDB_PRE_CONFIGURE_HOOKS += GDB_DISABLE_DOC
-- 
2.5.0
