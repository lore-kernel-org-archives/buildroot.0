Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4634E77345
	for <buildroot@archiver.kernel.org>; Fri, 29 Sep 2023 22:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F65242F76;
	Fri, 29 Sep 2023 22:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F65242F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wir8_Ld6u8Zr; Fri, 29 Sep 2023 22:14:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2E6E42F85;
	Fri, 29 Sep 2023 22:14:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2E6E42F85
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA1F81BF2CE
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92D6D405F5
 for <buildroot@lists.busybox.net>; Fri, 29 Sep 2023 22:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92D6D405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RxZEp9S3fheK for <buildroot@lists.busybox.net>;
 Fri, 29 Sep 2023 22:13:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7F16040150
 for <buildroot@buildroot.org>; Fri, 29 Sep 2023 22:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F16040150
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D5EF837B4; Fri, 29 Sep 2023 22:13:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Sep 2023 00:11:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60b0f7141b00a793a3ddb4e963d83bdd832aca83
X-Git-Newrev: 48730a1a9d882a7c56146bd2955e074aed790dcb
X-Patchwork-Hint: ignore
Message-Id: <20230929221310.6D5EF837B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/depot-tools: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=48730a1a9d882a7c56146bd2955e074aed790dcb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Chromium and Chromium OS use a package of scripts called
depot_tools to manage checkouts and code reviews. This package
also includes the gclient utility.

gclient is a Python script to manage a workspace of modular dependencies that
are each checked out independently from different subversion or git
repositories. Features include:

  - Dependencies can be specified on a per-OS basis.
  - Dependencies can be specified relative to their parent dependency.
  - Variables can be used to abstract concepts.
  - Hooks can be specified to be run after a checkout.
  - .gclient and DEPS are Python scripts. You can hack in easily or add
     additional configuration data.

.gclient file: It's the primary file. It is, in fact, a Python script. It
specifies the following variables:

  - solutions: an array of dictionaries specifying the projects that will be
               fetched.
  - hooks: additional hooks to be run when this meta checkout is synced.
  - target_os: an optional array of (target) operating systems to fetch
               OS-specific dependencies for.
  - cache_dir: Primarily for bots, multiple working sets use a single git
               cache.

gclient is necessary for checking out the flutter-engine source code, as the
release tarballs provided on the flutter-engine github are in no state to
compile. Google expects the use of gclient to download a source directory
structure suitable to build the Flutter engine.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                           |  3 +++
 package/Config.in.host               |  1 +
 package/depot-tools/Config.in.host   | 10 ++++++++++
 package/depot-tools/depot-tools.hash |  3 +++
 package/depot-tools/depot-tools.mk   | 25 +++++++++++++++++++++++++
 5 files changed, 42 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index defeb502ab..858e3c45a4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -31,6 +31,9 @@ F:	package/firewalld/
 F:	package/vulkan-loader/
 F:	package/vulkan-tools/
 
+N:	Adam Duskett <adam.duskett@amarulasolutions.com>
+F:	package/depot-tools/
+
 N:	Adam Heinrich <adam@adamh.cz>
 F:	package/jack1/
 
diff --git a/package/Config.in.host b/package/Config.in.host
index 22e0dc64d4..377dbed7d3 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -19,6 +19,7 @@ menu "Host utilities"
 	source "package/cryptsetup/Config.in.host"
 	source "package/dbus-python/Config.in.host"
 	source "package/delve/Config.in.host"
+	source "package/depot-tools/Config.in.host"
 	source "package/dfu-util/Config.in.host"
 	source "package/dos2unix/Config.in.host"
 	source "package/dosfstools/Config.in.host"
diff --git a/package/depot-tools/Config.in.host b/package/depot-tools/Config.in.host
new file mode 100644
index 0000000000..935331dedb
--- /dev/null
+++ b/package/depot-tools/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_DEPOT_TOOLS
+	bool "host depot-tools"
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
+	select BR2_PACKAGE_HOST_PYTHON_SIX
+	help
+	  Chromium and Chromium OS use a package of scripts called
+	  depot_tools to manage checkouts and code reviews.
+
+	  https://www.chromium.org/developers/how-tos/install-depot-tools/
diff --git a/package/depot-tools/depot-tools.hash b/package/depot-tools/depot-tools.hash
new file mode 100644
index 0000000000..2109096901
--- /dev/null
+++ b/package/depot-tools/depot-tools.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  8e0bccdd6b1231f58d5453dc14a5e1d195295ac8d466dec34961e951e946b50b  depot-tools-4e87f5bfe244e903f712408ea68dc3c3a6fe2d00-br1.tar.gz
+sha256  984523ee987f4e8b72d61df37d8f1189a7077cd4b77e41a397e35593b297a29d  LICENSE
diff --git a/package/depot-tools/depot-tools.mk b/package/depot-tools/depot-tools.mk
new file mode 100644
index 0000000000..e3b840f29a
--- /dev/null
+++ b/package/depot-tools/depot-tools.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# depot-tools
+#
+################################################################################
+
+DEPOT_TOOLS_VERSION = 4e87f5bfe244e903f712408ea68dc3c3a6fe2d00
+DEPOT_TOOLS_SITE = https://chromium.googlesource.com/chromium/tools/depot_tools
+DEPOT_TOOLS_SITE_METHOD = git
+DEPOT_TOOLS_LICENSE = BSD-3-Clause
+DEPOT_TOOLS_LICENSE_FILES = LICENSE
+DEPOT_TOOLS_CPE_ID_VENDOR = google
+
+HOST_DEPOT_TOOLS_DEPENDENCIES = \
+	host-python3 \
+	host-python-httplib2 \
+	host-python-pyparsing \
+	host-python-six
+
+define HOST_DEPOT_TOOLS_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/share/depot_tools
+	cp -dprf $(@D)/* $(HOST_DIR)/share/depot_tools/
+endef
+
+$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
