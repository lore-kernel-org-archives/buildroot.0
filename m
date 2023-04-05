Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C19CC76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 17:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9B9740917;
	Wed,  5 Apr 2023 17:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9B9740917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U5GFtIUIP2_E; Wed,  5 Apr 2023 17:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9C464053C;
	Wed,  5 Apr 2023 17:35:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9C464053C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ADB021C2B7D
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 17:35:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83CF04053C
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 17:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83CF04053C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gL8-_N10n1yi for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 17:35:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C606F400B8
Received: from mail.ott.net (mail.ott.net [77.109.144.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C606F400B8
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 17:35:34 +0000 (UTC)
Received: from relay.zh.ott.net (relay.zh.ott.net [IPv6:fd53:c48b:8ee5::17:1])
 by mail.ott.net (Postfix) with ESMTPS id 743244801026;
 Wed,  5 Apr 2023 19:35:30 +0200 (CEST)
Received: by relay.zh.ott.net (OpenSMTPD) with ESMTPS id ff663c37
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:YES); 
 Wed, 5 Apr 2023 19:35:30 +0200 (CEST)
Received: from localhost (mort [local])
 by mort (OpenSMTPD) with ESMTPA id 6aeb8bcf;
 Wed, 5 Apr 2023 17:35:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 19:34:11 +0200
Message-Id: <20230405173410.158297-1-stefan@ott.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ott.net; s=onbz5; 
 t=1680716130; bh=U1QhOjFn3whvvOWUAIvSnk1Bcpp5ht5i5PY530CYGS4=;
 h=From:To:Cc:Subject:Date:From;
 b=GpoatF0mwwT1zgRGHMoWsaQCaiIw+KPK9gm4D7reo7kNmAu+PWNYT3jgvRCKH5KG5
 8mU8zpCwcOA0kKimLsBW2kbH7ikamz/gl+Uj1iYagjU4XBLXiNVsEwhDwOyJ1hFZYs
 ZAhZyD8nO4rzaxbp0S8UzPVTYEJ/sY0OiYNH90W9zrln3s+6CawT0PdpnTP1o1BdtN
 +TExMJWz7ckfEOY6pKyCxsHW+gLJ1siCrojiy+atyzrj5b3ieMebJk+dtsvRMPHEii
 mK4ZhQsbDbAqzNT11fD6i5rYoO5mhUXECaDNOQD3xV6DCPEz961fhfX5cQNhnSjbak
 zoNno6lEOygDg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ott.net header.i=@ott.net
 header.a=rsa-sha256 header.s=onbz5 header.b=GpoatF0m
Subject: [Buildroot] [PATCH 1/1] package/eudev: fix compile-time issue on
 very old kernels
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
From: Stefan Ott via buildroot <buildroot@buildroot.org>
Reply-To: Stefan Ott <stefan@ott.net>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
compiling against such a kernel will fail.

This patch introduces a version check and makes eudev fall back to
v2cap.capabilities on these kernels.

Signed-off-by: Stefan Ott <stefan@ott.net>
---
 ...mpile-time-issue-on-very-old-kernels.patch | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch

diff --git a/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
new file mode 100644
index 0000000000..63546079d6
--- /dev/null
+++ b/package/eudev/0002-Fix-compile-time-issue-on-very-old-kernels.patch
@@ -0,0 +1,29 @@
+Fix compile-time issue on very old kernels
+
+Kernel versions prior to 3.4 did not have V4L2_CAP_DEVICE_CAPS and
+compiling eudev against such a kernel will fail.
+
+This patch introduces a version check and makes eudev fall back to
+v2cap.capabilities on these kernels.
+
+diff -Naur a/src/v4l_id/v4l_id.c b/src/v4l_id/v4l_id.c
+@@ -28,7 +28,6 @@
+ #include <sys/types.h>
+ #include <sys/time.h>
+ #include <sys/ioctl.h>
+-#include <linux/version.h>
+ #include <linux/videodev2.h>
+ 
+ #include "util.h"
+@@ -72,11 +71,9 @@
+                 printf("ID_V4L_VERSION=2\n");
+                 printf("ID_V4L_PRODUCT=%s\n", v2cap.card);
+                 printf("ID_V4L_CAPABILITIES=:");
+-#if LINUX_VERSION_CODE >= KERNEL_VERSION(3,4,0)
+                 if (v2cap.capabilities & V4L2_CAP_DEVICE_CAPS)
+                         capabilities = v2cap.device_caps;
+                 else
+-#endif
+                         capabilities = v2cap.capabilities;
+                 if ((capabilities & V4L2_CAP_VIDEO_CAPTURE) > 0 ||
+                     (capabilities & V4L2_CAP_VIDEO_CAPTURE_MPLANE) > 0)
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
