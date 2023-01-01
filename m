Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0E9C4332F
	for <buildroot@archiver.kernel.org>; Sun,  1 Jan 2023 23:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5E65405C7;
	Sun,  1 Jan 2023 23:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5E65405C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMmZrnskb7R1; Sun,  1 Jan 2023 23:43:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 02A9C402F5;
	Sun,  1 Jan 2023 23:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02A9C402F5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEC251BF38D
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ACAF60BFC
 for <buildroot@lists.busybox.net>; Sun,  1 Jan 2023 23:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8ACAF60BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NyOsyFc-ApZ9 for <buildroot@lists.busybox.net>;
 Sun,  1 Jan 2023 23:39:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFC4660B2C
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AFC4660B2C
 for <buildroot@buildroot.org>; Sun,  1 Jan 2023 23:39:58 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id n8so17047094oih.0
 for <buildroot@buildroot.org>; Sun, 01 Jan 2023 15:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1asv+KkdZVhFgokm+Z6xlKoXc5LlR1E8nJTy+fGVBnw=;
 b=u4a3ha9EuR236vt26ivm000XMMOQITXUs2aI47TX6urLV8hMlq+Q4U1oz0PaoFy0QX
 DCfHHqN6dmPIWq63PsMWVD35CVcUiapSNxdEpF9CXDEwxeX6jEe7rUZxL6pRjSE79tCj
 HaDlNMyCkpR43nVwq9pgWc9t2Rxv45WvrE85plpfpOfkCt3eUW0X2brXqKTtdVXFFdi9
 UbfBcXcZ+MGUU7Hmt5VPrfpQSXkqgCqjX8VjMxR80zFm0JZq+WxV0+e3wFCenuJyJxhm
 6yXTrDfXlSZDXYppuvyS3PUuhR90Z5x+VP9Fk08Jkd8whgHMCJVD5hbdqb3KnT4f1Clp
 aSiQ==
X-Gm-Message-State: AFqh2krMsPZ3JaYng7rawdyqyBng2bUqeZKwQ60NS2cmXGFSdGM2so8p
 BlNXSGhAvOEoHQezARTlZZgLywBOL/s=
X-Google-Smtp-Source: AMrXdXvqHltrMLSYhhahKPGnTbXTlMXJKt6nSYBRHGG/0QyeBPtzWu2readIXet4T8BXeNdbfMhlWw==
X-Received: by 2002:a05:6808:2089:b0:35e:8fa7:6e05 with SMTP id
 s9-20020a056808208900b0035e8fa76e05mr23045369oiw.26.1672616397843; 
 Sun, 01 Jan 2023 15:39:57 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:6ae4:c2b1:7ea6:a195])
 by smtp.gmail.com with ESMTPSA id
 o189-20020aca41c6000000b00360e46a1edasm11372611oia.22.2023.01.01.15.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jan 2023 15:39:56 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Jan 2023 20:36:45 -0300
Message-Id: <20230101233653.487175-22-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
References: <20230101233653.487175-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1asv+KkdZVhFgokm+Z6xlKoXc5LlR1E8nJTy+fGVBnw=;
 b=YJk4eFahcoHMOU2bPFUtfz4TB0yeTGeq3PxTg4vvb7MFvN2SNGkHUnJ8eF40G2jUAb
 lwKmPWSbvTQz2+CUcM42kYDzkNgqEMEmr2/em6XDOLNEkNjxXJY/jAhpHb7HRxsKthCD
 HaHNiaJxntrNtUSBmMMZ1cOyVNihWuh/450XvGqHRueozOhE6gIu7PaJG1NJ+r9ILhH0
 VR4S3Kfp+/iU4WtC+CaNZffTkdnYvw5b37RYhbQxlRs/cWfdf1GnZG08N2Ocy9zzDPr9
 G9wkMOhPrMFTrJhETVNzlTT5qfl1C9vK+vNkwEGUuvNckhEgyiY01WufR/uXKe0R7/Kx
 6Xzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YJk4eFah
Subject: [Buildroot] [PATCH 21/29] package/qoriq-rcw: drop bogus
 QORIQ_RCW_FILE_BIN
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While applying [1] and cleaning up, the commit "d167f7006e
package/qoriq-rcw: add in-tree rcw source support" ended up keeping an
unused define.

Drop it now.

[1] http://patchwork.ozlabs.org/project/buildroot/patch/20200207083857.28058-4-jerry.huang@nxp.com/

Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 package/qoriq-rcw/qoriq-rcw.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/qoriq-rcw/qoriq-rcw.mk b/package/qoriq-rcw/qoriq-rcw.mk
index 8b1ceacfce..b9c9e99222 100644
--- a/package/qoriq-rcw/qoriq-rcw.mk
+++ b/package/qoriq-rcw/qoriq-rcw.mk
@@ -59,7 +59,6 @@ endef
 else ifneq ($(QORIQ_RCW_INTREE),)
 
 QORIQ_RCW_PLATFORM = $(firstword $(subst /, ,$(QORIQ_RCW_INTREE)))
-QORIQ_RCW_FILE_BIN = $(lastword $(subst /, ,$(QORIQ_RCW_INTREE)))
 
 define HOST_QORIQ_RCW_BUILD_CMDS
 	$(MAKE) -C $(@D)/$(QORIQ_RCW_PLATFORM)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
