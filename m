Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E10C369A5
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 15:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8017940699;
	Tue,  8 Apr 2025 15:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v1AWrkr7LnHb; Tue,  8 Apr 2025 15:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83ECF409D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83ECF409D9;
	Tue,  8 Apr 2025 15:17:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 989F51F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 15:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AE8B40757
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 15:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q6Sq1rWEKoQu for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 15:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:1600:4:17::bc08;
 helo=smtp-bc08.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AC08F40706
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC08F40706
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch
 [IPv6:2001:1600:4:17::bc08])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC08F40706
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 15:16:57 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4ZX8nL6rZtzMCP;
 Tue,  8 Apr 2025 17:16:54 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4ZX8nL31JSz78S; Tue,  8 Apr 2025 17:16:54 +0200 (CEST)
From: Quentin Schulz <foss+buildroot@0leil.net>
Date: Tue, 08 Apr 2025 17:16:40 +0200
MIME-Version: 1.0
Message-Id: <20250408-libcamera-qcam-v1-1-680c8a48dc17@cherry.de>
References: <20250408-libcamera-qcam-v1-0-680c8a48dc17@cherry.de>
In-Reply-To: <20250408-libcamera-qcam-v1-0-680c8a48dc17@cherry.de>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=0leil.net
Subject: [Buildroot] [PATCH RFC 1/2] package/meson: look for qt6 tools on
 Buildroot host machine
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

Qt tools that are looked by the meson qt module are only required as a
build time dependency, to be run on the Buildroot host machine.

Therefore, meson should be looking for them on the host machine and not
on the Buildroot target.

This fixes Buildroot meson not being able to find the qt6 tools whenever
necessary (e.g. for libcamera qcam, whose support is added in a later
commit).

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 ...e-look-for-qt-tools-only-on-build-machine.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/meson/0001-qt-module-look-for-qt-tools-only-on-build-machine.patch b/package/meson/0001-qt-module-look-for-qt-tools-only-on-build-machine.patch
new file mode 100644
index 0000000000000000000000000000000000000000..c00ae0dbc3c63296afdc8a3d245091ee8337ddd8
--- /dev/null
+++ b/package/meson/0001-qt-module-look-for-qt-tools-only-on-build-machine.patch
@@ -0,0 +1,56 @@
+From b42daeeb3396df1a02c95d2f583058a74e7854e3 Mon Sep 17 00:00:00 2001
+From: Quentin Schulz <quentin.schulz@cherry.de>
+Date: Tue, 18 Mar 2025 15:07:53 +0100
+Subject: [PATCH] qt module: look for qt tools only on build machine
+
+Qt tools may be needed at build time, let's make their detection based
+on the build machine rather than the host machine as currently done.
+
+This incidentally fixes cross-compilation search for moc, rcc, uic and
+lrelease Qt tools because they are installed in libexec dir and that
+path is somehow not properly looked for otherwise.
+
+Before:
+
+"""
+Detecting Qt6 tools
+Run-time dependency qt6 (modules: Core) found: YES 6.8.1 (pkg-config)
+Program /usr/bin/moc found: NO
+Program /usr/lib/qt6/libexec/moc found: NO
+Program moc6 found: NO
+Program moc-qt6 found: NO
+Program moc found: NO
+"""
+
+After:
+
+"""
+Detecting Qt6 tools
+Found pkg-config: YES (/home/qschulz/work/upstream/buildroot/output/host/bin/pkg-config) 2.3.0
+Build-time dependency qt6 (modules: Core) found: YES 6.8.1 (pkg-config)
+Program /home/qschulz/work/upstream/buildroot/output/host/bin/moc found: NO
+Program /home/qschulz/work/upstream/buildroot/output/host/libexec/moc found: YES 6.8.1 6.8.1 (/home/qschulz/work/upstream/buildroot/output/host/libexec/moc)
+"""
+
+Suggested-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+Upstream: Submitted [https://github.com/mesonbuild/meson/pull/14381]
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ mesonbuild/modules/_qt.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/mesonbuild/modules/_qt.py b/mesonbuild/modules/_qt.py
+index 7d52842f9..309068c51 100644
+--- a/mesonbuild/modules/_qt.py
++++ b/mesonbuild/modules/_qt.py
+@@ -270,6 +270,9 @@ class QtBaseModule(ExtensionModule):
+         self._tools_detected = True
+         mlog.log(f'Detecting Qt{self.qt_version} tools')
+         kwargs = {'required': required, 'modules': 'Core', 'method': method}
++        # Tools are for compile-time steps, so force native check for
++        # compatibility with cross-compile scenarios
++        kwargs["native"] = True
+         # Just pick one to make mypy happy
+         qt = T.cast('QtPkgConfigDependency', find_external_dependency(f'qt{self.qt_version}', state.environment, kwargs))
+         if qt.found():

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
