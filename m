Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8DFC3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 20:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AEBE400BA;
	Sat, 13 Jul 2024 20:02:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hi5lx7UK_awk; Sat, 13 Jul 2024 20:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B81C404B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B81C404B0;
	Sat, 13 Jul 2024 20:02:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7524E1BF3F6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D9CD4072B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 20:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flzIJbuYQ5Sw for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 20:02:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4493240720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4493240720
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4493240720
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 20:02:06 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4266ea6a488so23930075e9.1
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720900923; x=1721505723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cKskiPQ3iVqyypi/RVfjtKEVD9y1xd+jPFOVkW5gTrU=;
 b=Q2Lb512+xkJ25AsIvroCOFsTEXk6ipQHuaT7652d9lYfq6UH2gRG+ziV7zUNXUNFvB
 xnpgrSkRVn5qTkEoBgHxwya8bAuzH7DcXvBOwEx+DHmYsxGxHz5dHNQyGgmvgZRRtuOS
 yRwfRX9DZvrsFV5xxFgtcJjrl33Yc67jNNncPbu0YA8IoOu14gJRx2Mp5eDJffm+LLDu
 wtjgrlJawk3XdH7jKP9d8reqLKJPkE9zAVQDl3IZ8lAVuvQbIBC3YsjxHsvegRH3rDBM
 cxw5a/HTPrnvL56b5Dm6QBF7+fv/c1IWbYhJz1B6lUsBfwc0d5MHqdI33mNK8cizemTI
 Gqtg==
X-Gm-Message-State: AOJu0YydM7/+wMRq17DR1H6CpCD8uFBpTrHQzlwJvk+VHDSGA3GaCoED
 jDWLCnR52GjHYfeMTr8zipi5hc6Yxi+X2yP0xOYnCuy6pnKpOe3crbtpAg==
X-Google-Smtp-Source: AGHT+IE39bgpZBE+rH4Ld9pEqhqOwLAXKNZQ/KKZ3gCgwJesS8FiLn4cajrKaShheZBN62CXCXERSA==
X-Received: by 2002:a05:600c:4aa9:b0:426:5b44:2be7 with SMTP id
 5b1f17b1804b1-426707cea49mr129009675e9.10.1720900923422; 
 Sat, 13 Jul 2024 13:02:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e7749esm31614455e9.2.2024.07.13.13.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 13:02:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 22:01:59 +0200
Message-ID: <20240713200159.562870-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720900923; x=1721505723; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cKskiPQ3iVqyypi/RVfjtKEVD9y1xd+jPFOVkW5gTrU=;
 b=bUIk9zlWk70MqKAZzLjG/nD8FEoHExZil2mw/YDsXry4HoucWNiibMQ5CtUYFrB7Cx
 El8qZEP/G8pw26f/Kn+3Coi022Agoh1Srr44+n+lrA9SRcipjRLCyEtaCg4xYn2RBDqy
 0EFviBAehvDsxgUgGmFA/hBpnsKBzeBTQMvTrr+KFlDH7LIwdXyayH1NQunOl6yhs/mU
 /uWwrHOfZu7cCw+gQDoK5jFwnZVL4nPQWMmxL+bokWMw6MgpUIGp5ZMjAuE1OoBboBzo
 WGl25gk6AYtKYgZ8PXxG2qE8CrHdg9HgCvG4UHEIIfJrZDXD+5L+o4LX7sVK457b3Gw9
 ixbw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bUIk9zlW
Subject: [Buildroot] [PATCH 1/1] package/skopeo: set SKOPEO_CPE_ID_VALID
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:skopeo_project:skopeo is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/D76885CE-0BE8-4012-A93F-F33A0C5D743E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/skopeo/skopeo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
index 98b0e7ed0a..58631629b3 100644
--- a/package/skopeo/skopeo.mk
+++ b/package/skopeo/skopeo.mk
@@ -9,6 +9,7 @@ SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
 
 SKOPEO_LICENSE = Apache-2.0
 SKOPEO_LICENSE_FILES = LICENSE
+SKOPEO_CPE_ID_VALID = YES
 
 HOST_SKOPEO_DEPENDENCIES = \
 	host-btrfs-progs \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
