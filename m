From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 1 Jul 2010 09:03:36 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile: fixup make distclean
	after kconfig build in BUILD_DIR
Message-ID: <20100701071538.34E3D821E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8e29430410f37fe152c374d1c103a32f1906740e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We don't actually need to explicitly clean the kconfig stuff, as distclean
already removes the entire BUILD_DIR, but fix up the packag/config makefile
to do the right thing if make clean/distclean is called manually for
completeness.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                |    1 -
 package/config/Makefile |    7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index cdd16a2..df276c1 100644
--- a/Makefile
+++ b/Makefile
@@ -578,7 +578,6 @@ ifeq ($(O),output)
 	rm -rf $(O)
 endif
 	rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.config.cmd $(CONFIG_DIR)/.auto.deps
-	-$(MAKE) -C $(CONFIG) distclean
 
 flush:
 	rm -f $(BUILD_DIR)/tgt-config.cache
diff --git a/package/config/Makefile b/package/config/Makefile
index f0a030f..2b266b8 100644
--- a/package/config/Makefile
+++ b/package/config/Makefile
@@ -2,6 +2,7 @@ src := .
 top_srcdir=../../
 top_builddir=../../
 srctree := .
+obj ?= .
 
 include Makefile.kconfig
 #HOSTCFLAGS+=-Dinline="" -include foo.h
@@ -42,11 +43,11 @@ $(obj)/%:: $(src)/%_shipped
 	$(Q)cat $< > $@
 
 clean:
-	$(Q)rm -f $(clean-files)
+	$(Q)rm -f $(addprefix $(obj)/,$(clean-files))
 distclean: clean
-	$(Q)rm -f $(lxdialog) $(conf-objs) $(mconf-objs) $(kxgettext-objs) \
+	$(Q)rm -f $(addprefix $(obj)/,$(lxdialog) $(conf-objs) $(mconf-objs) $(kxgettext-objs) \
 		$(hostprogs-y) $(qconf-cxxobjs) $(qconf-objs) $(gconf-objs) \
-		mconf .depend
+		mconf .depend)
 
 FORCE:
 .PHONY: FORCE clean distclean
-- 
1.7.1
