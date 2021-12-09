Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC6CC433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 09:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 864944028B;
	Thu,  9 Dec 2021 09:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AgsSCapIUYd3; Thu,  9 Dec 2021 09:38:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0DCC40213;
	Thu,  9 Dec 2021 09:38:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5621BF3CD
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 09:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40A4640412
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 09:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4sn1173DWkz for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 09:38:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 271C440165
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 09:38:02 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id z26so5845572iod.10
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 01:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1lL5nxpGpFwkOp0rZCf2cWO7yn2Xdh2fFGY9vRz2Cw4=;
 b=e1n1mWQBB30rvsmuDhRw49tI977ws5UE4IotOcpeDh9WSmhg2p9UMzJPBfflT691mO
 61Z1njDlUTaCDF9sSbRbAjXcc/JB47bseZzdNPO9E8rss0w9Ekvxiz4dvVuIhi57UI0H
 xyC4oW8hHrLutHlLaGK7cRlu7Pl3OMsERDRYPzo6iqZ80fMB65QPeFjiE2WrwQKLYqqS
 8cM+NcG1Xujs/XEcWmdjiZMp8DV6WsNHkjBSxGkcgjeWFUujVUQL2mdBiAuLzmqjv6Kk
 02ZaMnkOPGR5q4qwXVGBKLC6LOmHO3IJ+ZXtHCvIXh1H8XNM3CRj2PpqaWEcyCiD9lW3
 +Y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1lL5nxpGpFwkOp0rZCf2cWO7yn2Xdh2fFGY9vRz2Cw4=;
 b=5iUXW7axbVFm4h15q/q4OvxOIs7zrnvlKbkBE3PCsJZxGVsuStg77NshnwgDotzfyL
 zHIvlswe30u/i75BF7jeeKmvUvNuPbvSCLj39ZFaQynJp0gueqR4eXyEPy4knzu7JWmG
 r0WTOFdROg1gQqXnkU2gSct+Ee90Yr0dUbvfKiUSfdUdka/C6Qhzyl23QQuLNVyHeNYH
 DEXqKGaX88WEd5uOmDMUfjvFLrBxBF1WSbwVFaPKFa8ncOI7O0mVkwYg1YK3GUFy7jyD
 +p6tzzDJV+dufX1ElTrnYnEcwlerePHpvzNm0b7LZ3fqj1Srk+o5CHEhKpRsyKKi2OjN
 WfvA==
X-Gm-Message-State: AOAM533ZZ64i5IpyS3+XM1Q/A0txMEfQ/HJb/AAMaujn44iI6q7CDXV3
 psRv7KwzDcts8rmcovCPuxftqeQ2jOC69Q==
X-Google-Smtp-Source: ABdhPJw213evc0fmT7VWj9UnZRO7JCOESwPu3FHfjeVJ5dl1ZCkkZYnnbAz64rE4Dgf9xBT8BEDULg==
X-Received: by 2002:a02:85a9:: with SMTP id d38mr7280867jai.71.1639042680985; 
 Thu, 09 Dec 2021 01:38:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id s18sm3216508ilq.25.2021.12.09.01.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 01:38:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 02:37:58 -0700
Message-Id: <20211209093758.3084564-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.60.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 33b8676cc5..467f540761 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.60.1/meson-0.60.1.tar.gz.asc
-sha256  5add789c953d984b500858b2851ee3d7add0460cf1a6f852f0a721af17384e13  meson-0.60.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.60.2/meson-0.60.2.tar.gz.asc
+sha256  64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921  meson-0.60.2.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index a8c846126a..154f712f5b 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.60.1
+MESON_VERSION = 0.60.2
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
