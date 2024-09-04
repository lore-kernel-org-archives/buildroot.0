Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEB7CA0ED3
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 10:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC27E401C5;
	Wed,  4 Sep 2024 10:07:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTAsg_30zGLb; Wed,  4 Sep 2024 10:07:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90031401C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90031401C7;
	Wed,  4 Sep 2024 10:07:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 064451BF40B
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 10:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3AD4401C7
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 10:07:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lEbtrb6OvmFl for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 10:07:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B935B401C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B935B401C5
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B935B401C5
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 10:07:51 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-374bb1a3addso2690154f8f.1
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 03:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725444470; x=1726049270;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AMljIhuObqzsmFcZ3jIqP4KlbTdHZRnO73HpiiSjqVI=;
 b=Nx2Wf1UtPC6w9st+/8RsiDBW1FQRMmxJjqjIazxdxFShj+v3k4w7VFpQxSLqO+T8jP
 OHX69sfglGK8/cwPWK7n2iwMKKpuZ1iO6l49J0F7WZ3jw+KKakFBss0/T1ld9EIDWNdk
 3Pz4eDCZ/jycOa5YK17xEgV1ac3+9JLOcoJ50cv6OwY5u57pWopr5rvAkyEBrzJqor61
 NlVV0NsbSPWtqIhvXwqPTuTZ2uads6G2dTgJicIQ/btibkqJlB6qlKt8yi9Yh7oM2I6M
 Shg81Fb3svhq6W+waoSWALidyQqkXuMvFMlQmeNvYfGQ0rBUmUuA5YS/KIA1N6LeZjbB
 I5bQ==
X-Gm-Message-State: AOJu0YziNNt5BxZetqMOMP5EXKKEHl3iH9zxTq7cUkuTiubKrNFwNHES
 hXWMlNWJmTV9DtaKuqVL0AUVGAmRXpF22/T18S7W543UvK/ZoUXJvV1puw==
X-Google-Smtp-Source: AGHT+IFfnIpa7olk6EALNojbl7R8CYFal0l+e6E6qSl72Shxv+MlovYpUXmcxUN5ogZsdr5j/igPYQ==
X-Received: by 2002:adf:ab18:0:b0:374:b69f:8 with SMTP id
 ffacd0b85a97d-376dd71aademr2499810f8f.33.1725444469304; 
 Wed, 04 Sep 2024 03:07:49 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ef812cbsm16575302f8f.83.2024.09.04.03.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 03:07:49 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 12:07:48 +0200
Message-ID: <20240904100748.3623308-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725444470; x=1726049270; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=AMljIhuObqzsmFcZ3jIqP4KlbTdHZRnO73HpiiSjqVI=;
 b=d0e6MrwV/aHWSm2b5XIfvEYY0uOIiEbE5vRzRqh2SwBmYYqGa6zLJpniecKB4OKl37
 TShLYC3PAVEIxFQPFUFwye2akONfVWNa/nE+jiTcn7Wx2GfTyVPYD4+iQEVX7+MYGPyw
 NFf+k6WCsLMaGUU74/ySwMMWt0WDdoScC5nOTOCofMk4/RphXf5h9TLblhSMR/az+k7U
 omkVe9e9r1oVUBN9GN0rW1I/dtB10geLibOnh9+UNtNW2TRYpdxbOCVURnpHp9jzVISI
 KPxj5ZXOzbYHa/HX71dFcDy/2PRCn0ESedCrC9Xu0ljg+m5a8fX7d04JTX1oKajE7XIk
 yIDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d0e6MrwV
Subject: [Buildroot] [PATCH v2] docs/manual: use space-separated list for
 BR2_EXTERNAL
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Brandon Maier <Brandon.Maier@collins.com>,
 "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Specifying a list of br2-external trees is poorly documented, and the
only example uses a colon to separate the br2-external paths.

Adding the support for colon-separated list is the biggest mistake that
was made when introducing support for multiple br2-external [0]. Indeed,
both space and colon can be used to separate entries in the list, and it
is also possible to mix the two. However, internally, the list is stored
as a space-separated list, and all the code will split on spaces.

So, using colons is odd.

Change the documentation to only mention using a space-separated list.

Of course, for backward compatibility, we keep the code as-is to accept
a colon-separated list, but we just do not advertise it.

[0] in 20cd49738781 core: add support for multiple br2-external trees

Reported-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Reported-by: Brandon Maier <Brandon.Maier@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Changes v1 -> v2:
  - fix typoes
---
 docs/manual/customize-outside-br.adoc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/docs/manual/customize-outside-br.adoc b/docs/manual/customize-outside-br.adoc
index 5e653f1603..081d302e42 100644
--- a/docs/manual/customize-outside-br.adoc
+++ b/docs/manual/customize-outside-br.adoc
@@ -58,10 +58,11 @@ We can switch to another br2-external tree at any time:
 buildroot/ $ make BR2_EXTERNAL=/where/we/have/bar xconfig
 ----
 
-We can also use multiple br2-external trees:
+We can also use multiple br2-external trees, by specifying a space-separated
+list of paths to use:
 
 ----
-buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig
+buildroot/ $ make BR2_EXTERNAL="/path/to/foo /where/we/have/bar" menuconfig
 ----
 
 Or disable the usage of any br2-external tree:
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
