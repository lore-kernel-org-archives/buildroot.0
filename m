From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 27 Jun 2012 14:46:31 +0200
Subject: [Buildroot] [PATCH] igh-ethercat: use release tarball instead of
	mercurial branch
Message-ID: <1340801191-8162-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Mercurial branch may change, which leads to non-reproducible builds.
So download a released version instead.

Also add configure option for e1000e.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
--
Tested on i386 with Xenomai


---
 package/igh-ethercat/Config.in       |    3 +++
 package/igh-ethercat/igh-ethercat.mk |   20 ++++----------------
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
index 764a021..890bb12 100644
--- a/package/igh-ethercat/Config.in
+++ b/package/igh-ethercat/Config.in
@@ -17,6 +17,9 @@ config BR2_PACKAGE_IGH_ETHERCAT_E100
 config BR2_PACKAGE_IGH_ETHERCAT_E1000
 	bool "e1000 driver"
 
+config BR2_PACKAGE_IGH_ETHERCAT_E1000E
+	bool "e1000e driver"
+
 config BR2_PACKAGE_IGH_ETHERCAT_R8169
 	bool "r8169 driver"
 
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index b6ac5b8..f04eb57 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -1,8 +1,7 @@
-IGH_ETHERCAT_VERSION = stable-1.5
-IGH_ETHERCAT_SITE    = http://etherlabmaster.hg.sourceforge.net/hgweb/etherlabmaster/etherlabmaster/archive/
-IGH_ETHERCAT_SOURCE  = $(IGH_ETHERCAT_VERSION).tar.bz2
+IGH_ETHERCAT_VERSION = 1.5.1
+IGH_ETHERCAT_SITE    = http://etherlab.org/download/ethercat/
+IGH_ETHERCAT_SOURCE  = ethercat-$(IGH_ETHERCAT_VERSION).tar.bz2
 
-IGH_ETHERCAT_AUTORECONF      = YES
 IGH_ETHERCAT_DEPENDENCIES    = linux
 IGH_ETHERCAT_INSTALL_STAGING = YES
 
@@ -12,20 +11,9 @@ IGH_ETHERCAT_CONF_OPT = \
 IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
 IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100)
 IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
+IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_E1000E),--enable-e1000e,--disable-e1000e)
 IGH_ETHERCAT_CONF_OPT += $(if $(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)
 
-# Since we download ethercat from source control, we have to emulate
-# the bootstrap script that creates the ChangeLog file before running
-# autoreconf.  We don't want to run that script directly, since we
-# leave to the autotargets infrastructure the responsability of
-# running 'autoreconf' so that the dependencies on host-automake,
-# host-autoconf and al. are correct.
-define IGH_ETHERCAT_CREATE_CHANGELOG
-	touch $(@D)/ChangeLog
-endef
-
-IGH_ETHERCAT_POST_PATCH_HOOKS += IGH_ETHERCAT_CREATE_CHANGELOG
-
 define IGH_ETHERCAT_BUILD_MODULES
 	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules
 endef
-- 
tg: (929c3e8..) t/ethercat-version-bump (depends on: master)
