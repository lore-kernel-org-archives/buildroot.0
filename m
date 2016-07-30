From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Jul 2016 21:50:16 +0200
Subject: [Buildroot] [git commit] tinycbor: add patch to fix installation
	with old make versions
Message-ID: <20160730195204.6AD988178D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04c9be519de922cda3e20a00be2fad39b265d398
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to the tinycbor package that fixes the
installation process with old make version.

This fixes the build on autobuilders using an old make, where tinycbor
was creating empty directories instead of installing files.

Fixes:

  http://autobuild.buildroot.net/results/7605c301f460398c2435f6b73d6d07c7d1022e8c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-installation-logic-compatible-with-old-.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/tinycbor/0001-Makefile-use-installation-logic-compatible-with-old-.patch b/package/tinycbor/0001-Makefile-use-installation-logic-compatible-with-old-.patch
new file mode 100644
index 0000000..8ab6955
--- /dev/null
+++ b/package/tinycbor/0001-Makefile-use-installation-logic-compatible-with-old-.patch
@@ -0,0 +1,59 @@
+From 1d92e2a4af056466dcbefd09750bce07cf1085ed Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sat, 30 Jul 2016 18:42:53 +0200
+Subject: [PATCH] Makefile: use installation logic compatible with old make
+ version
+
+The installation logic used by the Makefile causes a problem with old
+make versions, such as make 3.81. Indeed, the rule "$(DESTDIR)%/" gets
+matched even for targets like "$(DESTDIR)$(libdir)/libtinycbor.a". Due
+to this, with those old make versions, tinycbor.a is installed as a
+directory, and the library is never copied:
+
+make[1]: Entering directory `/home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/build/tinycbor-v0.3.1'
+install -d /home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/target/usr/bin/cbordump
+install -d /home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/target/usr/lib/libtinycbor.a
+install -d /home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/target/usr/lib/pkgconfig/tinycbor.pc
+install -d /home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/target/usr/include/tinycbor/cbor.h
+install -d /home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/target/usr/include/tinycbor/cborjson.h
+make[1]: Leaving directory `/home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/build/tinycbor-v0.3.1'
+
+To address this, we create the destination directory directly within
+the per-file make targets.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ Makefile | 14 ++++++++------
+ 1 file changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 0692f6b..94beaf8 100644
+--- a/Makefile
++++ b/Makefile
+@@ -123,15 +123,17 @@ $(PACKAGE).tar.gz: | .git
+ $(PACKAGE).zip: | .git
+ 	GIT_DIR=$(SRCDIR).git $(GIT_ARCHIVE) --format=zip -o "$(PACKAGE).zip" HEAD
+ 
+-$(DESTDIR)%/:
+-	$(INSTALL) -d $@
+-$(DESTDIR)$(libdir)/%: lib/% | $(DESTDIR)$(libdir)/
++$(DESTDIR)$(libdir)/%: lib/%
++	$(INSTALL) -d $(@D)
+ 	$(INSTALL_DATA) $< $@
+-$(DESTDIR)$(bindir)/%: bin/% | $(DESTDIR)$(bindir)/
++$(DESTDIR)$(bindir)/%: bin/%
++	$(INSTALL) -d $(@D)
+ 	$(INSTALL_PROGRAM) $< $@
+-$(DESTDIR)$(pkgconfigdir)/%: % | $(DESTDIR)$(pkgconfigdir)/
++$(DESTDIR)$(pkgconfigdir)/%: %
++	$(INSTALL) -d $(@D)
+ 	$(INSTALL_DATA) $< $@
+-$(DESTDIR)$(includedir)/tinycbor/%: src/% | $(DESTDIR)$(includedir)/tinycbor/
++$(DESTDIR)$(includedir)/tinycbor/%: src/%
++	$(INSTALL) -d $(@D)
+ 	$(INSTALL_DATA) $< $@
+ 
+ install-strip:
+-- 
+2.7.4
+
