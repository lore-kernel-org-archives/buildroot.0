Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88EACF9C6B
	for <buildroot@archiver.kernel.org>; Wed, 25 Sep 2024 13:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0D85401CF;
	Wed, 25 Sep 2024 13:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUcoGIje4VsY; Wed, 25 Sep 2024 13:38:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC6C42667
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AC6C42667;
	Wed, 25 Sep 2024 13:38:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B6071BF3C0
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B72D8480E
 for <buildroot@lists.busybox.net>; Wed, 25 Sep 2024 13:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9qhvL2LNOMfU for <buildroot@lists.busybox.net>;
 Wed, 25 Sep 2024 13:38:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6365D847AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6365D847AA
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6365D847AA
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 13:38:14 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37cc846fbc4so416421f8f.2
 for <buildroot@busybox.net>; Wed, 25 Sep 2024 06:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271491; x=1727876291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7TOPS3Xm3onDQrSQ6ESS9u1gSCT9un2bJVX4EbFTR/A=;
 b=DohZMfFe8eaEP6AtIbetRqumyDA4Xz+SqIGP6Se3TfFoMMLrVfXq2vnJK7RJbSlwaG
 G97dTVRpk+2PbB/ecz+7/vfPTMzWITj2SRanODBPVXkuVmjY032cp7Dl0oAYNh7oqaVV
 EeM4eLiHwoHfXE1VPQyBDL5I0+COUgXez0Ev4wQV/apxyj3ayzA4mvGHVaAyMShFaF9p
 Nt9eW+pe6AU+46iKoySqX0zeA7IYo4y9DhUXpzyDLleKgmxWEf9zvB1u7cKi/3Q/u3fr
 QnAaL/jeHLSm+YpQEnk4FPCsN9zQ1u411c+M4oNSvkQCvNRXNSKKy4xWhT2O97h0S7Q1
 fD1Q==
X-Gm-Message-State: AOJu0YzwBQqAIws/BDvP5MV3ZmnGjxoicxQ+bmGI28/r70MtoPMfIvc6
 MjBw82JrSU6fWiLv7QwNvAbQCViZrFBD6p9LEvqCsmUl1jXwSNwkc6XA9EPaxx9+67VQMCFed9I
 iXw==
X-Google-Smtp-Source: AGHT+IFPp+YLPeGzAxBiTHeFtB1QceAbeyiQahNoccRQZPbiW1ZJdu9yLjMiLB/0ihwTwRDmK2eC9A==
X-Received: by 2002:adf:ee90:0:b0:371:a844:d326 with SMTP id
 ffacd0b85a97d-37cc24c5ab3mr1936979f8f.43.1727271491187; 
 Wed, 25 Sep 2024 06:38:11 -0700 (PDT)
Received: from vm-2404.. (55.6.65.37.rev.sfr.net. [37.65.6.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2a8be2sm4053523f8f.24.2024.09.25.06.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:38:10 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 25 Sep 2024 15:38:07 +0200
Message-ID: <20240925133807.3899910-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1727271491; x=1727876291; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7TOPS3Xm3onDQrSQ6ESS9u1gSCT9un2bJVX4EbFTR/A=;
 b=Hxkb2n72vt3//8J4uVbuPc+rPnuXcYOZYgCoaX6l5JDMvJW2Bpm+/mcCFg/FZZF1+3
 r4+nwHtr3xpbLBcQ6NfdJSeWD6g30DKDOqzk6I1EATe5IlBoVQ9CkZxiuO41j8hYhupP
 UCi6cG/yJSw4E+jb1N3IU1O7CoHbVAs4TnA/qYNxn0l0QGSEpHVRL/KpsYYbpQQMGlyE
 jElFe1b1SfGNZF0LiFZs79fKE5p9CyAVw4uBi7akwLknsM50qKQUg/qRkgc3YHgs8YJI
 IofVToLV6dIZ5FNz+zg6G7h0LAdV2ybG3vb8espC/hmZglDVv0oYfct63Xx/cYN1mpOP
 mEWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Hxkb2n72
Subject: [Buildroot] [PATCH] package/nano: bump to version 8.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 04e3c6290..4f31eedef 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v8/nano-8.1.tar.xz.asc
+# https://www.nano-editor.org/dist/v8/nano-8.2.tar.xz.asc
 # using key 168E6F4297BFD7A79AFD4496514BBE2EB8E1961F
-sha256  93b3e3e9155ae389fe9ccf9cb7ab380eac29602835ba3077b22f64d0f0cbe8cb  nano-8.1.tar.xz
+sha256  d5ad07dd862facae03051c54c6535e54c7ed7407318783fcad1ad2d7076fffeb  nano-8.2.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index db614feb7..a1b94c90d 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 8
-NANO_VERSION = $(NANO_VERSION_MAJOR).1
+NANO_VERSION = $(NANO_VERSION_MAJOR).2
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
