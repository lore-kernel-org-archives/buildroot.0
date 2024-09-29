Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B42CF6495
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 20:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C382180FA8;
	Sun, 29 Sep 2024 20:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id smuB2A0Ic1wE; Sun, 29 Sep 2024 20:15:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 537C680FAE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 537C680FAE;
	Sun, 29 Sep 2024 20:15:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11B2E1BF334
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01090605A5
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y6O-zmW6R4ck for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 20:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 06158600D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06158600D4
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 06158600D4
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 20:15:11 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d3e662791so298082566b.1
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 13:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727640909; x=1728245709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D4p/uqH+E0QejI4dRMKNUT/grPbll7PtBMaTT6zZuWo=;
 b=OT+btlShP6uRTyF8w9rBFHnWzPPGD78tOha/JPOxAxyBnG000GjpzAO3935VVyQN3W
 byEZG9TX52L637I7DiGUta+j2yJM3ejRUTfXrTOV4V17GzQksIPbv5KRribdGBavKFMV
 Y8vjrq5qAZwx6f4rmIfzN9YqesOInrzSR3OInW1R65AJTLkypElVsUsGjj1yE4CvMKDt
 8kl8noeI2j0Y+0o1+PRpS98nBPkUb+wRTNI+dLmYMROm4GlLH2HuBv89grlkNA4Y2MGK
 ncHVzyKBEo4Fuch/q3tG0oegHFtGCsNe9ck+9RgSNo5iY9HVltk7LB+1DbTfQDWSG/pF
 /bFg==
X-Gm-Message-State: AOJu0YxsSJ2Z9PvIvAUvF3Bs+TnAaSA952mKp+M15dL5cvMoxiYdhxfJ
 w4Y7WiuPbxsRBALExHr+aq8OIh6yPyzLh6JubOUwKKB+XEvI+Vv0pZIHlSM7eQQ0OpUXAIKaxH7
 T6Lc=
X-Google-Smtp-Source: AGHT+IFFxYzKV2kS5G2SN5tJwHGtZcPHONbSlqPvuN9wtOlHj0lZXkkcUBSJcuogOYbqo0S5U1h0bw==
X-Received: by 2002:a05:6402:4307:b0:5c8:7696:7bfb with SMTP id
 4fb4d7f45d1cf-5c8824d3cdamr17978372a12.10.1727640909614; 
 Sun, 29 Sep 2024 13:15:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245fbd2sm3537870a12.42.2024.09.29.13.15.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2024 13:15:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 22:14:52 +0200
Message-ID: <20240929201459.1761285-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
References: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727640909; x=1728245709;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4p/uqH+E0QejI4dRMKNUT/grPbll7PtBMaTT6zZuWo=;
 b=Qt9qSZ3I0CQaEIfVUn7JmNN/GW9T04yYQaShvifCOO3eZpia5WgnNsBHX2AdCAkHAD
 cjooRTbY6MHeHPY7NO9LoBxYokoMhdkQW52x8BI59wZX2bd8ar+uP0Nul2xyE7foOakt
 P//4xVoeSuqbF2uibN1oZtdTF5sTm21fqyh7s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Qt9qSZ3I
Subject: [Buildroot] [PATCH v3 2/9] arch: don't enable FDPIC binaries by
 default
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
Cc: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Ben Wolsieffer <ben.wolsieffer@hefring.com>

FDPIC support is being added as a new option for an existing
architecture (ARM), so we don't want to suddenly change the default.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 arch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index bd5f9ce47058..e57f4b2baa06 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -433,7 +433,6 @@ endif
 choice
 	prompt "Target Binary Format"
 	default BR2_BINFMT_ELF if BR2_USE_MMU
-	default BR2_BINFMT_FDPIC if BR2_ARCH_HAS_FDPIC_SUPPORT
 	default BR2_BINFMT_FLAT
 
 config BR2_BINFMT_ELF
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
