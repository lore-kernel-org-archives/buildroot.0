Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6197C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:39:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A848611C3
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:39:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A848611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36FD960648;
	Sun, 19 Sep 2021 09:39:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEh66my8NHtP; Sun, 19 Sep 2021 09:39:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A21460596;
	Sun, 19 Sep 2021 09:39:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EB9D91BF5E6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9ECF4013B
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:39:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A4SzPxR1LEf7 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 09:39:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FA69400CB
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 09:39:22 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f62-20020a1c1f41000000b0030b42643f72so4935874wmf.3
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 02:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G1FKjsNXl3+e5Z6tWqTSqD+/z1uK5aADVlBE4Pu9Cfg=;
 b=GHENiOStCJUBfZ9S+zdK62yzV/sZUiUZDKg3ZdLk8SmxklkMRyBCAmb92r3/+W1kcl
 EuOzjeg/MLyYIHrSS3gsj9OoeBQ+71kDp2vjLlhNOKkYoRxEvbH6oxCT31Rgtch/mVsc
 YDdsfELo4ayIvs2JMUmu77BAmDscnk5SqajxQM//p2YidF9SqfI3IIhr6OfghcG+N9TP
 delGi1YJy7g/2N6RJNdINRJs4O2WJxrCVFw4Ws0CrStZ/hDpjcxuNaXWhbzW08JRLcJv
 Rh5e1RSpG2TUYYf9i+bux7P0OQG+o2dGB8szktCw39eE6P1tQ1GjMxcy9C7h0JZJ772Y
 ZRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G1FKjsNXl3+e5Z6tWqTSqD+/z1uK5aADVlBE4Pu9Cfg=;
 b=Y/WIuz4X2OX5mg5EvlozscWQ/NUiR+IDsHTYQleDxZTwj5OoDtjaOp3JwKhBJ+bTqs
 dx27pObiq3t1WSSt5SGcq2IYQS59SjiF1i8YqfOXLN79prTaYHlfmqZAhF2xPYBkjScm
 I4plmUmxv9B/sfvBBskV5jxNv3OWtzlxBBPjQlMnTsxI0aVWCgYeAAMZJROCeaF5i/Et
 XPI1vOR7QEkg9maSNo8dbV1ldqgenfxdQN9UvN7yHgXEp9wm/f581Si56ll6fOIkGtsf
 kTc0zFUGHWzQthDfVprXdGkdeqYFOZmVdw4JiD+SmknlcSNQnOm9OYv5e8MgROwuCE6J
 0IkA==
X-Gm-Message-State: AOAM533SfWPu/LECTz8Nx7hRa6hyyHjxZqIpe0kslkc+8+xJWnrBjfXS
 +Jl0m8CN1i4Bvjpkk1UFpmhnkaej/m0=
X-Google-Smtp-Source: ABdhPJyuXTxZQkxcumfJjHjDgtofUi0GJVg4wLY71Qk/NlNSHnHMHgqvfKEA03tNd30tF8v8/6IsRg==
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr1566263wmq.167.1632044360413; 
 Sun, 19 Sep 2021 02:39:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id x21sm16052249wmc.14.2021.09.19.02.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 02:39:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 11:39:01 +0200
Message-Id: <20210919093901.1873403-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3,
 1/1] package/wayland-protocols: fix build without host-wayland
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Don't require wayland-scanner if tests are disabled to avoid the
following build failure raised since bump to version 1.23 in commit
7eedc9cc1e0c3cce1c18cb150157cb2346075b23:

Build-time dependency wayland-scanner found: NO (tried pkgconfig and cmake)

../output-1/build/wayland-protocols-1.23/meson.build:11:0: ERROR: Dependency "wayland-scanner" not found, tried pkgconfig and cmake

Fixes:
 - http://autobuild.buildroot.org/results/2744e50465a9cd9d3726d23298ad6c943ef49a21

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v2 -> v3 (after review of Yann E. Morin):
 - Remove host-wayland dependency which is only needed for tests

Changes v1 -> v2 (after review of Yann E. Morin):
 - Use host-wayland dependency instead of wayland

 ...and-scanner-is-only-needed-for-tests.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/wayland-protocols/0001-meson.build-wayland-scanner-is-only-needed-for-tests.patch

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
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
