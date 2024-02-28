Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED04C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 22:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23EC7400AB;
	Wed, 28 Feb 2024 22:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JN5aXsavv0Yb; Wed, 28 Feb 2024 22:45:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9136401C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9136401C2;
	Wed, 28 Feb 2024 22:45:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D2461BF349
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 22:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1885607F3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 22:45:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tcNLWBJvV3c for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 22:45:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA57E605E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA57E605E7
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA57E605E7
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 22:45:02 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-33dcad9e3a2so203113f8f.3
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 14:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709160301; x=1709765101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8gIMdW7n0RNsUnbEFTk296aJLOTlC/UiueB6faSMzQg=;
 b=rnvhA12cRL018aG9UY0rQQXcIkH8ZYoBLCO60ntceoWnvgyx0Ve3laOfGYDFZPc69j
 xwGzkwptpq/GLd8JLSXbpOWLdg3tZoBrl0dG4dRjS8kbdSRA5Jpbu7XUGLGOu8kKiKoJ
 X86EfsD/1RnE7Cn8dGAH129Uact1clk4ORwzfHlF0yZWdMLjLrkxD2nXRMXPjRqMdrzM
 ZGCVxm6/eftLEYsqCgPKOUi4rXAf8F1s9g6K1rVU57JU64Tn27DL0xbOMv2wQJZpZO5P
 20YZqKiBbg2QalslY4zZ08rBGPalaRUoWsTlzrH0tcBc5M4lqmIJ8lYrDDSkg5hX6Sr9
 yblw==
X-Gm-Message-State: AOJu0YystXdRX1CCo/qK0kr8qHlaZ2hG81jmVw4tWSiUXAtWGJWA6WFS
 MOWyG/9aqAQDFu0bPIGEYVEW7z8vTvLgKsTfSfJ/B+YVIlfM35EGMAIvxHVt
X-Google-Smtp-Source: AGHT+IH2DvlsbZUgEvkaDqMGI6ZgGKz1kEaEORW2Eum5uPZPos7e3ALOiO07U2nkHvVJd6Sc00qXHA==
X-Received: by 2002:a5d:4c8f:0:b0:33d:3089:a840 with SMTP id
 z15-20020a5d4c8f000000b0033d3089a840mr145434wrs.49.1709160300502; 
 Wed, 28 Feb 2024 14:45:00 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 bq1-20020a5d5a01000000b0033e05499cd6sm1515847wrb.59.2024.02.28.14.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Feb 2024 14:45:00 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 23:44:59 +0100
Message-ID: <20240228224459.2383336-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709160301; x=1709765101; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=8gIMdW7n0RNsUnbEFTk296aJLOTlC/UiueB6faSMzQg=;
 b=m8sJVF4H/tziGxdfS+OAWdNkbx5L0cI2CNaGSW9UNhKb4YFJ99ePOXAV4qd9KKk10V
 vsndvVEhXQlx8dBgitIhcjZsqSmAz3xYkPzxlhRSom4UVCsbGK1PHdSqEYaOx3KB8tCc
 A8ETVpA+qLm2BbGZMOf0KCY3oloH5IfmB1BaHkfxIeGNXhYrdzz+sOJx1e77s+XTLlBg
 u8dpaJ2De2zkuJgEZQgb0aR3p11ClRtS1m9dFs4W1KsilCYA1+RbVcRrzIVdV60rVI2f
 nVa3B3rP/iwvbNzlAdABXeQxfJ2RT06RMiLci5ikjX+MsTWWq1PBD24pXijJ4sFXfJs6
 LX4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m8sJVF4H
Subject: [Buildroot] [PATCH] support/scripts/pkg-stats: fix running on older
 python versions
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit f71d9f49e546 (support/scripts/pkg-stats: fix datetime deprecation
warning) forgot to consider that the datetime.UTC suggested by python
3.12, was only introduced with python 3.11.

However, we are still generating the daily report on a python 3.8
version, which fails at runtime:
    AttributeError: module 'datetime' has no attribute 'UTC'

It turns out that datetime.UTC is just an alias for datetime.timezone.utc,
which seems to have existed since before python3...

Use datetime.timezone.utc instead of its alias.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/pkg-stats | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 9a4a3ccad5..53898a36f2 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -1290,7 +1290,7 @@ def __main__():
         package_list = set([v["name"] for v in show_info_js.values() if 'name' in v])
     else:
         package_list = None
-    date = datetime.datetime.now(datetime.UTC)
+    date = datetime.datetime.now(datetime.timezone.utc)
     commit = subprocess.check_output(['git', '-C', brpath,
                                       'rev-parse',
                                       'HEAD']).splitlines()[0].decode()
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
