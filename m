Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E29D1CCA47C
	for <buildroot@archiver.kernel.org>; Thu, 14 Jul 2022 16:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3563B8188A;
	Thu, 14 Jul 2022 16:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3563B8188A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gSQA3YFMnpFr; Thu, 14 Jul 2022 16:42:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CE99817A5;
	Thu, 14 Jul 2022 16:42:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CE99817A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A95E11BF315
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 16:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8338640198
 for <buildroot@lists.busybox.net>; Thu, 14 Jul 2022 16:42:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8338640198
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id njtYAbJzbJo0 for <buildroot@lists.busybox.net>;
 Thu, 14 Jul 2022 16:42:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE81640114
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE81640114
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 16:42:15 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r10so3329534wrv.4
 for <buildroot@buildroot.org>; Thu, 14 Jul 2022 09:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oimP7c5XZe2qUoIGAtywmIMKTrVH8UUZjXg+1EUXMjI=;
 b=cQca8vtBfSXJsYMHfRqpLM+lHlKphrsMh2TFuq7g64zue3AgVsNhmHU3p3tNqVFLri
 Rm/QkK9avagWLmef27JoDVWOCHBIDtNLkU6CZ6VyknYsaQBJnwVS362mj5oTyWql+xo2
 cPvQIQgHHTZxCdvOz3jSvSFOQ/D+DbJUgzWPfUxWzMqs7th/19JCu8Z8yZ4FWzcDUpfE
 K++sd08UbpzcOL7vnqLnlnlxrNN5PCAe3atHKUd7rrD6jNoXH7eFBVgvNvX4PyfzctRB
 rl1taHc6tc0gXh/u2ihb0jaNBqksI9UslwjeLZS5unySTBB8FMT4Y+902+7XpFg3CDgg
 BVtw==
X-Gm-Message-State: AJIora/L/fPQJ+VVh4TUkVAJWzR+w6bJWzIMYds68AKhiktvDPCaDENA
 Myck9gOlUaGBNCKvRUvoLFy1P3KyrlI=
X-Google-Smtp-Source: AGRyM1tgni9ffocNnpzYbzA+a0znd5J7FrJCOWrih5r6nl+0VCggb4iEIwJSuZQz6dstJhwkvMdKbg==
X-Received: by 2002:a05:6000:1a53:b0:21d:7308:f7f9 with SMTP id
 t19-20020a0560001a5300b0021d7308f7f9mr9203459wry.197.1657816933821; 
 Thu, 14 Jul 2022 09:42:13 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a1cf306000000b003a2e92edeccsm5897148wmq.46.2022.07.14.09.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 09:42:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Jul 2022 18:38:36 +0200
Message-Id: <20220714163836.14576-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oimP7c5XZe2qUoIGAtywmIMKTrVH8UUZjXg+1EUXMjI=;
 b=EocMh5wNFjQ+gVsSFywuPfTJI2EqF5E4DjC2uw3I8X+WBnk4SAEdGr9hOaXsizmZq/
 jfdC3SO7zS2ocfIEqoRUeNRH621toHXKwIdrmik/d4sX03MJaTSD5gw2GX+VE1LYtq4N
 fNA4UxL5xrJCRtfkV8ZzsmZXtGb8WwS6PybovvHP5r4dsyLNfK0G1nzA55ZfPeNMr4LY
 RTVzdQroQ9qyWR3Pr8dimYhDcmrOcuz4VlF/+z6m3OIYFlBBRgSQOtx3spBM8MONyIY0
 fd1oTlHzbG+LCaQoFVfImdOpmb4PDrpPj7pQuz02ZINYw+Jn5kQhTBmLLjCo5nEGLaig
 d6iQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EocMh5wN
Subject: [Buildroot] [PATCH 1/1] package/assimp: add ASSIMP_CPE_ID_VENDOR
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:assimp:assimp is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aassimp%3Aassimp

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/assimp/assimp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/assimp/assimp.mk b/package/assimp/assimp.mk
index 42440f0fa9..79865673ac 100644
--- a/package/assimp/assimp.mk
+++ b/package/assimp/assimp.mk
@@ -8,6 +8,7 @@ ASSIMP_VERSION = 5.2.1
 ASSIMP_SITE = $(call github,assimp,assimp,v$(ASSIMP_VERSION))
 ASSIMP_LICENSE = BSD-3-Clause
 ASSIMP_LICENSE_FILES = LICENSE
+ASSIMP_CPE_ID_VENDOR = assimp
 ASSIMP_DEPENDENCIES = zlib
 ASSIMP_INSTALL_STAGING = YES
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
