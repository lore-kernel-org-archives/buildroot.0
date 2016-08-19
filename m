From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 14:33:06 +0200
Subject: [Buildroot] [git commit] tinycbor: bump to version 0.3.2
Message-ID: <20160819124217.02BE68211B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbb12d336bd037057ca7ba73699dd6b842526eba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tinycbor 0.3.2 includes the buildroot patch that fixes the installation
with old Makefile used by targets such as blackfin, more details can be
found here: https://patchwork.ozlabs.org/patch/652187

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...e-installation-logic-compatible-with-old-.patch | 59 ----------------------
 package/tinycbor/tinycbor.hash                     |  2 +-
 package/tinycbor/tinycbor.mk                       |  2 +-
 3 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/package/tinycbor/0001-Makefile-use-installation-logic-compatible-with-old-.patch b/package/tinycbor/0001-Makefile-use-installation-logic-compatible-with-old-.patch
deleted file mode 100644
index 8ab6955..0000000
--- a/package/tinycbor/0001-Makefile-use-installation-logic-compatible-with-old-.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 1d92e2a4af056466dcbefd09750bce07cf1085ed Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Date: Sat, 30 Jul 2016 18:42:53 +0200
-Subject: [PATCH] Makefile: use installation logic compatible with old make
- version
-
-The installation logic used by the Makefile causes a problem with old
-make versions, such as make 3.81. Indeed, the rule "$(DESTDIR)%/" gets
-matched even for targets like "$(DESTDIR)$(libdir)/libtinycbor.a". Due
-to this, with those old make versions, tinycbor.a is installed as a
-directory, and the library is never copied:
-
-make[1]: Entering directory `/home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/build/tinycbor-v0.3.1'
-install -d /home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/target/usr/bin/cbordump
-install -d /home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/target/usr/lib/libtinycbor.a
-install -d /home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/target/usr/lib/pkgconfig/tinycbor.pc
-install -d /home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/target/usr/include/tinycbor/cbor.h
-install -d /home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/target/usr/include/tinycbor/cborjson.h
-make[1]: Leaving directory `/home/test/outputs/b1305500555cbb5b959e5be11dee5cf75907f0ce/output/build/tinycbor-v0.3.1'
-
-To address this, we create the destination directory directly within
-the per-file make targets.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- Makefile | 14 ++++++++------
- 1 file changed, 8 insertions(+), 6 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 0692f6b..94beaf8 100644
---- a/Makefile
-+++ b/Makefile
-@@ -123,15 +123,17 @@ $(PACKAGE).tar.gz: | .git
- $(PACKAGE).zip: | .git
- 	GIT_DIR=$(SRCDIR).git $(GIT_ARCHIVE) --format=zip -o "$(PACKAGE).zip" HEAD
- 
--$(DESTDIR)%/:
--	$(INSTALL) -d $@
--$(DESTDIR)$(libdir)/%: lib/% | $(DESTDIR)$(libdir)/
-+$(DESTDIR)$(libdir)/%: lib/%
-+	$(INSTALL) -d $(@D)
- 	$(INSTALL_DATA) $< $@
--$(DESTDIR)$(bindir)/%: bin/% | $(DESTDIR)$(bindir)/
-+$(DESTDIR)$(bindir)/%: bin/%
-+	$(INSTALL) -d $(@D)
- 	$(INSTALL_PROGRAM) $< $@
--$(DESTDIR)$(pkgconfigdir)/%: % | $(DESTDIR)$(pkgconfigdir)/
-+$(DESTDIR)$(pkgconfigdir)/%: %
-+	$(INSTALL) -d $(@D)
- 	$(INSTALL_DATA) $< $@
--$(DESTDIR)$(includedir)/tinycbor/%: src/% | $(DESTDIR)$(includedir)/tinycbor/
-+$(DESTDIR)$(includedir)/tinycbor/%: src/%
-+	$(INSTALL) -d $(@D)
- 	$(INSTALL_DATA) $< $@
- 
- install-strip:
--- 
-2.7.4
-
diff --git a/package/tinycbor/tinycbor.hash b/package/tinycbor/tinycbor.hash
index e60a86c..258e0e6 100644
--- a/package/tinycbor/tinycbor.hash
+++ b/package/tinycbor/tinycbor.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	e73a617b3a51fac103df1faab9ea037e509c1491cca29c1fd4b5083d74267597	tinycbor-v0.3.1.tar.gz
+sha256	f70de1e6b7e3750abb4ceacf0059e47b47c769f113434de10293b33867ce54c2	tinycbor-v0.3.2.tar.gz
diff --git a/package/tinycbor/tinycbor.mk b/package/tinycbor/tinycbor.mk
index 0be91b7..1519680 100644
--- a/package/tinycbor/tinycbor.mk
+++ b/package/tinycbor/tinycbor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYCBOR_VERSION = v0.3.1
+TINYCBOR_VERSION = v0.3.2
 TINYCBOR_SITE = $(call github,01org,tinycbor,$(TINYCBOR_VERSION))
 TINYCBOR_LICENSE = MIT
 TINYCBOR_LICENSE_FILES = LICENSE
