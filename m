Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCB7C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 07:02:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0AF60E78
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 07:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E0AF60E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0CFA40267;
	Wed, 13 Oct 2021 07:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DSXaWo9fXjhe; Wed, 13 Oct 2021 07:02:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC66F402BB;
	Wed, 13 Oct 2021 07:02:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F39121BF36F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 07:02:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFFD2403CA
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 07:02:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4-QE2933lqvK for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 07:02:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 803CA402BB
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 07:02:05 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id o20so4833077wro.3
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 00:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C+2C87LbOhDhkU3ORwnk+K6IVuIyi9/wnM68ZpiMZJ4=;
 b=dHXz4rjZkDMLrxdK4Yyzccvoyl0DXZi4iAA+Ml+z/R6NaWJ2JYuMt+bOaOUlvLhypp
 spZ8TKXzX81vtpwpsQ0pbqd4rqQqF1SxVOr8rb6x8xnOIn7qlliz8FzZBsuO4Wa7CnD8
 0mFPQFBf5GK1lkVer/Hyk6eQE6fQ7MQJQjljBcJwauGrbrAxaZBfKBO8bMbFQr2PLr91
 +pn96JGRVYqp334fvUAyPDfywatydnhitgwIF1DGUp3NwFLBhJ6sP0vdKKzU7IXWp99g
 UbK2AxuJL5jVFylQ9b0liwr7B6NXXsUSiZNiXVlnjxgfhNQ0cE+LksCi4TKit3AmzXrs
 gUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C+2C87LbOhDhkU3ORwnk+K6IVuIyi9/wnM68ZpiMZJ4=;
 b=LoqYySrrtumGJNL/A5iEW+MmWnivcOAgANdMwpany1U5KACwRaiUrbwuHg4o1E83Ds
 d8J2Gp8L5zntJa0vy2zlDq/cx34md4N0EcMrh4H16bQA9XBGbsBEy3w0lo2N7fsNl0x+
 XLywBu61HCNNigyFbIJ4r9FELN7CTZUPh4Bjqdy2h6snBv5pjzm0e2hwCJ4Cz82Vni4O
 malngxMUGhFhWXaN4pJBt8dLEhQIPnr5GkofYOPKqWUWj4Eteb1tse6iUpNmbd8uiZ6n
 W84VNjPWOCbCoZ6HuFmfaR4IZH1G7qWwH7+Ul3WC7svIq7nknkIvR6DR3OBYKmqwE9E8
 d0vg==
X-Gm-Message-State: AOAM530JeiC6ypRiM1ALAqBPHTpYy92wds0aBz9jIi/PF4gqmetUgSVf
 GZ/2Ai9sDuhuaweGjZZJ8HC/UmOmxyE=
X-Google-Smtp-Source: ABdhPJy/GclbxdX9FJ1nT1lGXmc8j0ocVWVn/zdnnL3lSyBitOsZato8kyu5SdSuQ4bGwPN2ne16MQ==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr10837959wmq.180.1634108523388; 
 Wed, 13 Oct 2021 00:02:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id o11sm5683930wry.0.2021.10.13.00.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:02:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 09:01:05 +0200
Message-Id: <20211013070105.1857677-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dtbocfg: depends on kernel
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since the addition of the package
in commit 9fc7b49ab193da55b0a72d27b5e0ea33245b4df0:

Makefile:587: *** linux is in the dependency chain of dtbocfg that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/449a731c0a1394c28f519e341ea145cb42af012d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dtbocfg/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dtbocfg/Config.in b/package/dtbocfg/Config.in
index c1e8318e5c..862dc0ccc5 100644
--- a/package/dtbocfg/Config.in
+++ b/package/dtbocfg/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DTBOCFG
 	bool "dtbocfg"
+	depends on BR2_LINUX_KERNEL
 	help
 	  dtbocfg, which stands for Device Tree Blob Overlay
 	  Configuration File System, was developed to serve
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
