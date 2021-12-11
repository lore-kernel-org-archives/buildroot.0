Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C7EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 17:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B896D40017;
	Sat, 11 Dec 2021 17:32:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbZPuofgru-u; Sat, 11 Dec 2021 17:32:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4785403AA;
	Sat, 11 Dec 2021 17:32:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 228B21BF95C
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 17:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1181742A05
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 17:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5h3d8wFCXwYH for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 17:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F88342A02
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 17:31:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 599AC827D4; Sat, 11 Dec 2021 17:26:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 18:27:36 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: c618303de024d89fef8c8a1177674e0766e4e0c5
X-Git-Newrev: 27b09e3cc47e306e05ddfca5e9db7edc7bf51065
X-Patchwork-Hint: ignore
Message-Id: <20211211172635.599AC827D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libgee: fix
 introspection build
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

commit: https://git.buildroot.net/buildroot/commit/?id=27b09e3cc47e306e05ddfca5e9db7edc7bf51065
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Fix the following build failure raised since the addition of
introspection in commit 3915e17e7734ee3abe088d4ce1893eecd7cc4663:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler -l `/usr/bin/sed -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" libgee-0.8.la` -o Gee-0.8.typelib Gee-0.8.gir libgee-0.8.la
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file Gee-0.8.gir: Failed to parse included gir GObject-2.0

Fixes:
 - http://autobuild.buildroot.org/results/884faa0f84c8dc43ed1ca6cde9caf21c731a4b35

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a4bf020e8cce72ff94f0368f4eca1695d63738ea)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...akefile.am-include-Makefile.introspection.patch | 40 ++++++++++++++++++++++
 package/libgee/libgee.mk                           |  2 ++
 2 files changed, 42 insertions(+)

diff --git a/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch b/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
new file mode 100644
index 0000000000..0906275ae3
--- /dev/null
+++ b/package/libgee/0001-gee-Makefile.am-include-Makefile.introspection.patch
@@ -0,0 +1,40 @@
+From d771e8ddb5e40f234459966e46880d10f34aaa1a Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 20 Nov 2021 23:57:33 +0100
+Subject: [PATCH] gee/Makefile.am: include Makefile.introspection
+
+Include Makefile.introspection instead of using a custom rule which will
+result in the following build failure when cross-compiling on buildroot
+because of missing --includedir:
+
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/bin/../riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler -l `/usr/bin/sed -nE "s/^dlname='([A-Za-z0-9.+-]+)'/\1/p" libgee-0.8.la` -o Gee-0.8.typelib Gee-0.8.gir libgee-0.8.la
+Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
+error parsing file Gee-0.8.gir: Failed to parse included gir GObject-2.0
+
+Fixes:
+ - http://autobuild.buildroot.org/results/884faa0f84c8dc43ed1ca6cde9caf21c731a4b35
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.gnome.org/GNOME/libgee/-/merge_requests/8]
+---
+ gee/Makefile.am | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gee/Makefile.am b/gee/Makefile.am
+index 5634bcb..e0d950e 100644
+--- a/gee/Makefile.am
++++ b/gee/Makefile.am
+@@ -167,7 +167,8 @@ INTROSPECTION_COMPILER_ARGS= \
+ 	-l $(libgee_dlname)
+ Gee-0.8.gir: libgee_0_8_la_vala.stamp
+ Gee-0.8.typelib: Gee-0.8.gir libgee-0.8.la
+-	@INTROSPECTION_COMPILER@ $(INTROSPECTION_COMPILER_ARGS) -o $@ $^
++
++-include $(INTROSPECTION_MAKEFILE)
+ endif
+ 
+ MOSTLYCLEANFILES = \
+-- 
+2.33.0
+
diff --git a/package/libgee/libgee.mk b/package/libgee/libgee.mk
index 48bc9c9e41..0a05a63635 100644
--- a/package/libgee/libgee.mk
+++ b/package/libgee/libgee.mk
@@ -12,6 +12,8 @@ LIBGEE_DEPENDENCIES = host-pkgconf host-vala libglib2
 LIBGEE_INSTALL_STAGING = YES
 LIBGEE_LICENSE = LGPL-2.1+
 LIBGEE_LICENSE_FILES = COPYING
+# We're patching gee/Makefile.am
+LIBGEE_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 LIBGEE_CONF_OPTS += --enable-introspection
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
