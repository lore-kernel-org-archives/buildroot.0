Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C713C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2954C83E76;
	Sat, 23 Apr 2022 15:38:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTAKJJ6U9nEq; Sat, 23 Apr 2022 15:38:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D9883E64;
	Sat, 23 Apr 2022 15:38:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A1E21BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:38:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4614E40609
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:38:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qkcPIVPLNzhm for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:38:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 606CB404A3
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:38:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 169AB84119; Sat, 23 Apr 2022 15:28:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 17:34:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d211f67016446b9e843259b1195be04691fecec
X-Git-Newrev: fc68bcf9b57e9b7324c6b567a766b72522580b8a
X-Patchwork-Hint: ignore
Message-Id: <20220423152829.169AB84119@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: drop tagged layout
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fc68bcf9b57e9b7324c6b567a766b72522580b8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop boost tagged layout which raises the following build failure with
botan or libcpprestsdk:

/nvmedata/autobuild/instance-31/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/11.2.0/../../../../m68k-buildroot-linux-uclibc/bin/ld: cannot find -lboost_system

CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
  Could NOT find Boost (missing: random system thread filesystem chrono
  atomic date_time regex) (found version "1.78.0")

While at it:
 - drop BR2_PACKAGE_BOOST_LAYOUT and BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
 - move --layout=system, --ignore-site-config,
   --user-config=$(@D)/user-config.jam, -j$(PARALLEL_JOBS), -q and
   --prefix=$(HOST_DIR) to BOOST_OPTS and HOST_BOOST_OPTS
 - drop parentheses to avoid spawning a useless sub-shell
 - use b2 everywhere instead of mixing b2 and
   tools/build/src/engine/bjam
 - drop uneeded 'echo "" >> $(@D)/user-config.jam'

BR2_PACKAGE_BOOST_LAYOUT_SYSTEM is not added to Config.in.legacy since
nothing changes for configs which already had it selected.

Fixes:
 - http://autobuild.buildroot.org/results/f237c9345faf8c28f3c73f7d8acb49271fe61780
 - http://autobuild.buildroot.org/results/a73225e40fa29bc3b24f36a86719e80c8e469d1f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Arnout: don't add BR2_PACKAGE_BOOST_LAYOUT_SYSTEM to Config.in.legacy]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy        |  7 +++++++
 package/boost/Config.in | 27 -------------------------
 package/boost/boost.mk  | 53 +++++++++++++++++--------------------------------
 3 files changed, 25 insertions(+), 62 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 27a4fcd33b..2b9575fe22 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -152,6 +152,13 @@ config BR2_BINUTILS_VERSION_2_35_X
 	help
 	  binutils 2.35 has been removed, use a newer version.
 
+config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
+	bool "boost tagged layout removed"
+	select BR2_LEGACY
+	help
+	  Boost tagged layout isn't handled by some packages (e.g. botan
+	  or libcpprestsdk).
+
 config BR2_PACKAGE_BOOST_LAYOUT_VERSIONED
 	bool "boost versioned layout removed"
 	select BR2_LEGACY
diff --git a/package/boost/Config.in b/package/boost/Config.in
index 9e96be7878..b99b01f22e 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -16,33 +16,6 @@ config BR2_PACKAGE_BOOST
 
 if BR2_PACKAGE_BOOST
 
-choice
-	prompt "Layout"
-	default BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
-	help
-	  Selects the layout of Boost binary names
-
-config BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
-	bool "system"
-	help
-	  Boost binary names do not include the Boost version number
-	  or the name and version number of the compiler.
-
-config BR2_PACKAGE_BOOST_LAYOUT_TAGGED
-	bool "tagged"
-	help
-	  Boost binary names include the encoded build properties such
-	  as variant and threading, but do not include compiler name
-	  and version, or Boost version. This option is useful if you
-	  build several variants of Boost, using the same compiler.
-
-endchoice
-
-config BR2_PACKAGE_BOOST_LAYOUT
-	string
-	default "system" if BR2_PACKAGE_BOOST_LAYOUT_SYSTEM
-	default "tagged" if BR2_PACKAGE_BOOST_LAYOUT_TAGGED
-
 config BR2_PACKAGE_BOOST_ATOMIC
 	bool "boost-atomic"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 032ba5c820..346d309777 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -76,7 +76,9 @@ BOOST_DEPENDENCIES += python3
 endif
 
 HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
-	variant=release link=shared runtime-link=shared
+	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
+	--ignore-site-config --layout=system --prefix=$(HOST_DIR) \
+	--user-config=$(@D)/user-config.jam
 
 ifeq ($(BR2_MIPS_OABI32),y)
 BOOST_ABI = o32
@@ -90,7 +92,12 @@ BOOST_OPTS += --no-cmake-config \
 	toolset=gcc \
 	threading=multi \
 	abi=$(BOOST_ABI) \
-	variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release)
+	variant=$(if $(BR2_ENABLE_RUNTIME_DEBUG),debug,release) \
+	-j$(PARALLEL_JOBS) \
+	-q \
+	--ignore-site-config \
+	--layout=system \
+	--user-config=$(@D)/user-config.jam
 
 ifeq ($(BR2_sparc64),y)
 BOOST_OPTS += architecture=sparc instruction-set=ultrasparc
@@ -119,43 +126,29 @@ endif
 
 BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
 BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
-BOOST_LAYOUT = $(call qstrip, $(BR2_PACKAGE_BOOST_LAYOUT))
 
 # how verbose should the build be?
 BOOST_OPTS += $(if $(QUIET),-d,-d+1)
 HOST_BOOST_OPTS += $(if $(QUIET),-d,-d+1)
 
 define BOOST_CONFIGURE_CMDS
-	(cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS))
+	cd $(@D) && ./bootstrap.sh $(BOOST_FLAGS)
 	echo "using gcc : `$(TARGET_CC) -dumpversion` : $(TARGET_CXX) : <cxxflags>\"$(BOOST_TARGET_CXXFLAGS)\" <linkflags>\"$(TARGET_LDFLAGS)\" ;" > $(@D)/user-config.jam
-	echo "" >> $(@D)/user-config.jam
 	sed -i "s/: -O.* ;/: $(TARGET_OPTIMIZATION) ;/" $(@D)/tools/build/src/tools/gcc.jam
 endef
 
 define BOOST_BUILD_CMDS
-	(cd $(@D) && $(TARGET_MAKE_ENV) ./tools/build/src/engine/bjam -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPTS) \
-	--ignore-site-config \
-	--layout=$(BOOST_LAYOUT))
+	cd $(@D) && $(TARGET_MAKE_ENV) ./b2 $(BOOST_OPTS)
 endef
 
 define BOOST_INSTALL_TARGET_CMDS
-	(cd $(@D) && $(TARGET_MAKE_ENV) ./b2 -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPTS) \
-	--prefix=$(TARGET_DIR)/usr \
-	--ignore-site-config \
-	--layout=$(BOOST_LAYOUT) install )
+	cd $(@D) && $(TARGET_MAKE_ENV) ./b2 $(BOOST_OPTS) \
+		--prefix=$(TARGET_DIR)/usr install
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && $(TARGET_MAKE_ENV) ./tools/build/src/engine/bjam -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(BOOST_OPTS) \
-	--prefix=$(STAGING_DIR)/usr \
-	--ignore-site-config \
-	--layout=$(BOOST_LAYOUT) install)
+	cd $(@D) && $(TARGET_MAKE_ENV) ./b2 $(BOOST_OPTS) \
+		--prefix=$(STAGING_DIR)/usr install
 endef
 
 # These hooks will help us to detect missing select in Config.in
@@ -177,26 +170,16 @@ endef
 BOOST_POST_INSTALL_TARGET_HOOKS += BOOST_CHECK_TARGET_LIBRARIES
 
 define HOST_BOOST_CONFIGURE_CMDS
-	(cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS))
+	cd $(@D) && ./bootstrap.sh $(HOST_BOOST_FLAGS)
 	echo "using gcc : `$(HOST_CC) -dumpversion` : $(HOSTCXX) : <cxxflags>\"$(HOST_CXXFLAGS)\" <linkflags>\"$(HOST_LDFLAGS)\" ;" > $(@D)/user-config.jam
-	echo "" >> $(@D)/user-config.jam
 endef
 
 define HOST_BOOST_BUILD_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(HOST_BOOST_OPTS) \
-	--ignore-site-config \
-	--prefix=$(HOST_DIR) )
+	cd $(@D) && ./b2 $(HOST_BOOST_OPTS)
 endef
 
 define HOST_BOOST_INSTALL_CMDS
-	(cd $(@D) && ./b2 -j$(PARALLEL_JOBS) -q \
-	--user-config=$(@D)/user-config.jam \
-	$(HOST_BOOST_OPTS) \
-	--prefix=$(HOST_DIR) \
-	--ignore-site-config \
-	--layout=$(BOOST_LAYOUT) install )
+	cd $(@D) && ./b2 $(HOST_BOOST_OPTS) install
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
