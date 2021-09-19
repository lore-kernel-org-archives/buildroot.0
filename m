Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C81DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:24:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6941C61212
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6941C61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CCA0830E6;
	Sun, 19 Sep 2021 11:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVvepnRY5OBg; Sun, 19 Sep 2021 11:24:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 537AD82F9B;
	Sun, 19 Sep 2021 11:24:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 868721BF2BF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7594382F9B
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRlTM30qodOL for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 11:24:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C44482EB4
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 11:24:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3B95B8B770; Sun, 19 Sep 2021 11:22:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 13:24:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 536e209ccaec94b4289d09060e2c8e05696bd0fe
X-Git-Newrev: 0fa1f5222b29b7d148e94f906305a46b417fc00f
X-Patchwork-Hint: ignore
Message-Id: <20210919112234.3B95B8B770@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wayland-protocols: fix build
 without host-wayland
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0fa1f5222b29b7d148e94f906305a46b417fc00f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Don't require wayland-scanner if tests are disabled to avoid the
following build failure raised since bump to version 1.23 in commit
7eedc9cc1e0c3cce1c18cb150157cb2346075b23:

Build-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)

../output-1/build/wayland-protocols-1.23/meson.build:11:0: ERROR: Dependency "wayland-scanner" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/2744e50465a9cd9d3726d23298ad6c943ef49a21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-wayland-scanner-is-only-needed-for-tests.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch b/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
new file mode 100644
index 0000000000..ff3ec5719c
--- /dev/null
+++ b/package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch
@@ -0,0 +1,42 @@
+From 80e97bd00bf6263845aa98b411507baba28be67e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 19 Sep 2021 11:01:00 +0200
+Subject: [PATCH] meson.build: wayland-scanner is only needed for tests
+
+wayland-scanner is only needed for tests so don't require it if tests
+are disabled
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.freedesktop.org/wayland/wayland-protocols/-/commit/80e97bd00bf6263845aa98b411507baba28be67e]
+---
+ meson.build       | 2 --
+ tests/meson.build | 1 +
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 94b49e7..15dbc37 100644
+--- a/meson.build
++++ b/meson.build
+@@ -8,8 +8,6 @@ wayland_protocols_version = meson.project_version()
+ 
+ fs = import('fs')
+ 
+-dep_scanner = dependency('wayland-scanner', native: true)
+-
+ stable_protocols = [
+ 	'presentation-time',
+ 	'viewporter',
+diff --git a/tests/meson.build b/tests/meson.build
+index 66337e7..74824ae 100644
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -1,4 +1,5 @@
+ prog_scan_sh = find_program('scan.sh')
++dep_scanner = dependency('wayland-scanner', native: true)
+ prog_scanner = find_program(dep_scanner.get_pkgconfig_variable('wayland_scanner'))
+ 
+ libwayland = [
+-- 
+GitLab
+
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
