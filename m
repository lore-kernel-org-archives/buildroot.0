From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 1 Jun 2009 11:30:59 +0000
Subject: [Buildroot] [git commit] dmraid linking against host system fix
Message-ID: <20090615112814.76D0777833@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=220dca451ef4b2f680ca35caacb29f6a6138068a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


dmraid is hard coded with -L$(DESTDIR)$(libdir)  which tries to link in
the host systems' libs

Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dmraid/dmraid_library-linking-fix.patch |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 package/dmraid/dmraid_library-linking-fix.patch

diff --git a/package/dmraid/dmraid_library-linking-fix.patch b/package/dmraid/dmraid_library-linking-fix.patch
new file mode 100644
index 0000000..a1c33c7
--- /dev/null
+++ b/package/dmraid/dmraid_library-linking-fix.patch
@@ -0,0 +1,15 @@
+Why on earth are we trying to link against the libdir in DESTDIR?
+
+Signed-Off-By: Nigel Kukard  <nkukard@lbsd.net>
+diff -ur dmraid_vanilla/1.0.0.rc15/tools/Makefile.in dmraid_library-linking-fix/1.0.0.rc15/tools/Makefile.in
+--- dmraid_vanilla/1.0.0.rc15/tools/Makefile.in	2008-09-17 13:24:00.000000000 +0000
++++ dmraid_library-linking-fix/1.0.0.rc15/tools/Makefile.in	2009-06-01 10:50:52.000000000 +0000
+@@ -56,7 +56,7 @@
+ 
+ dmraid:	$(OBJECTS) $(top_srcdir)/lib/libdmraid.a
+ 	$(CC) -o $@ $(OBJECTS) $(LDFLAGS) -L$(top_srcdir)/lib \
+-	      -L$(DESTDIR)$(libdir) $(DMRAIDLIBS) $(LIBS) 
++	      $(DMRAIDLIBS) $(LIBS) 
+ 
+ install_dmraid_tools: $(TARGETS)
+ 	@echo "Installing $(TARGETS) in $(sbindir)"; \
-- 
1.6.0.6
