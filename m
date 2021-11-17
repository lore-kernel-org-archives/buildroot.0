Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC577C433EF
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:46:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77B4A61AFB
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77B4A61AFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4760C60A8D;
	Wed, 17 Nov 2021 22:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qz4hEHFb-3Qr; Wed, 17 Nov 2021 22:46:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E52A606EE;
	Wed, 17 Nov 2021 22:46:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D98CD1BF9B2
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:46:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8F0D402EA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YdB7PyClLGEQ for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E280D4015F
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:46:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BA5168D765; Wed, 17 Nov 2021 22:42:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:39:29 +0100
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 71e7c4bbc41bace8fc42871aa8221c4e66427c85
X-Git-Newrev: a02e3ef3be3e5f229d66934fec4f0f674d50531c
X-Patchwork-Hint: ignore
Message-Id: <20211117224210.BA5168D765@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/libglib2: add
 girdir to glib-2.0.pc
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

commit: https://git.buildroot.net/buildroot/commit/?id=a02e3ef3be3e5f229d66934fec4f0f674d50531c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Add girdir to glib-2.0.pc to fix the following build failure with atk,
gcr or harfbuzz:

/home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir

This build failure could also be fixed by removing our update of girdir
in gobject-introspection.mk but this will have side effects as gir files
won't be installed in the correct directory. So patch glib-2.0.pc
instead.

Note: autotools-based packages have already been fixed by
https://git.buildroot.net/buildroot/commit/?id=8dda79970661090f202e1f20e5982ba53fdaeb95

Fixes:
 - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
 - http://autobuild.buildroot.org/results/67a47386019c2a700df348ad6846064e0950e87b
 - http://autobuild.buildroot.org/results/2c6a4470542af574f9407fa5867f0408ec2b4880

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit b094f88a4d501101bfba9b65491209e6a0fe0397)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...lib-meson.build-add-girdir-to-glib.2.0.pc.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch b/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
new file mode 100644
index 0000000000..7eeecbe336
--- /dev/null
+++ b/package/libglib2/0004-glib-meson.build-add-girdir-to-glib.2.0.pc.patch
@@ -0,0 +1,33 @@
+From 04bdfff007c91fc620ed0b7cd02fd2e1e83bdefc Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 12 Nov 2021 18:01:05 +0100
+Subject: [PATCH] glib/meson.build: add girdir to glib.2.0.pc
+
+Add girdir to glib-2.0.pc to fix the following build failure with atk:
+
+/home/giuliobenetti/autobuild/run/instance-1/output-1/host/riscv32-buildroot-linux-gnu/sysroot/usr/bin/g-ir-compiler atk/Atk-1.0.gir --output atk/Atk-1.0.typelib --includedir=/usr/share/gir-1.0
+Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
+
+Fixes:
+ - http://autobuild.buildroot.org/results/2716929db638977e6bf665352a08bd580e1dd0ae
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ glib/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/glib/meson.build b/glib/meson.build
+index f78f32969..6c5486699 100644
+--- a/glib/meson.build
++++ b/glib/meson.build
+@@ -377,6 +377,7 @@ pkg.generate(libglib,
+   subdirs : ['glib-2.0'],
+   extra_cflags : ['-I${libdir}/glib-2.0/include'] + win32_cflags,
+   variables : ['bindir=' + join_paths('${prefix}', get_option('bindir')),
++               'girdir=' + join_paths('${libdir}', '../share/gir-1.0'),
+                'glib_genmarshal=' + join_paths('${bindir}', 'glib-genmarshal'),
+                'gobject_query=' + join_paths('${bindir}', 'gobject-query'),
+                'glib_mkenums=' + join_paths('${bindir}', 'glib-mkenums')],
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
