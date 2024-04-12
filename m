Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AB9C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 05:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2928141FAC;
	Fri, 12 Apr 2024 05:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7KExdAiPvrH; Fri, 12 Apr 2024 05:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB0C441FA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB0C441FA5;
	Fri, 12 Apr 2024 05:46:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 505211BF23C
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:46:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AD138135D
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 05:46:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WJNamUHeUSZR for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 05:46:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 489158135C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 489158135C
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 489158135C
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 05:46:22 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a5200202c1bso53500466b.0
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 22:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712900779; x=1713505579;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hCxhyeBGGqoXJskmeWumkMIIPbqETM7GoC3dnEA+2xg=;
 b=bHI4QKPoWXEtleuyS3XgFOgGRqRfY9wG83rBDMF2V4Dzv4eAOuAvlb4UVE8ud4Mljd
 xDr3LUodiXBkJlV6fKKfXxLZ+ij6PYWL9U8OCpVdo1ct59s0xZ3w2gzmNFtYGDxgds2H
 BxWaZTXapkgqxaX/IjNDUYdnHhJeA6P195BawIUhOPgKh2IN3toEMkaQYpbRpyby3v5K
 xfqrinCsz0UxbdagEMpAGbgcb7do+HMlGth/ebCMrrk2C1zwNj1VwNwYYRavauutlgsl
 5dKyUZ3gYjNDwX6wKaGxgv5NidX8lPdntrvuLejnTi0BoOHNnM5uFkFc8G+3NEeVCu9A
 qcdQ==
X-Gm-Message-State: AOJu0YwMOQ72OGJ8a0V3W4U2TkpHpA0NaH/AKPQV7+e6hfY6nOipYrct
 naQty4BvdoIIjfQfHNahygp1fmXqt/EeFf84Vz5uljrOVbQx3fZaS7W3yQ==
X-Google-Smtp-Source: AGHT+IGQONgGdmwqiRQOLHUGTpIy2rLk+X/q7hZZrOMlI3nSGBUUqVtR+pciq990YgbuOpEEz/Zw9g==
X-Received: by 2002:a17:906:6808:b0:a52:39d6:5edb with SMTP id
 k8-20020a170906680800b00a5239d65edbmr353749ejr.11.1712900778906; 
 Thu, 11 Apr 2024 22:46:18 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a8-20020a17090640c800b00a51a34eba63sm1424620ejk.85.2024.04.11.22.46.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 22:46:18 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 07:45:49 +0200
Message-Id: <20240412054546.1350700-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240412054546.1350700-1-heiko.thiery@gmail.com>
References: <20240412054546.1350700-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712900779; x=1713505579; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hCxhyeBGGqoXJskmeWumkMIIPbqETM7GoC3dnEA+2xg=;
 b=HlGHrWJRpJ4fiATF0NjzzK7xIYbLOOObhtXSO07xogT2ycoRaYKcA/8guiY3PAmSS8
 6sL2RMLGnt6s9Q/z/Me3eMsoDgNco5VDZn+HD33uMneVa90BxQvXbucdNd5apC6slAlm
 QQFAHc3Xu9VHtUJXlQmdwlO+ANZEyR5eMe8apfYp9qoQ83BuWLxdzGRfFOp2PjYs3tjL
 /ZgUJWZFGEXr7qqtekZymqQGB2PeS5rz8DzrVeVH7jfWomtPGoden9l0WoDW3vNeb4Kp
 lBi/I+x/OtYuImUFF2ZLfcY/6MZeXzSQw+hps24l+L6R4ysFXJooglITnUAAcMFO9fz1
 qmXQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HlGHrWJR
Subject: [Buildroot] [PATCH v2 3/3] uboot/uboot: add new dependency to
 yamllint
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Heiko Thiery <heiko.thiery@gmail.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since U-Boot 2024.04 [1] binman also uses yamllint as dependency [2].

[1] https://source.denx.de/u-boot/u-boot/-/commit/10fee88d42f
[2] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2:
 - update URLs in the comment

 boot/uboot/uboot.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index a894654698..0ee63cabdb 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -276,10 +276,12 @@ UBOOT_DEPENDENCIES += host-vim
 endif

 ifeq ($(BR2_TARGET_UBOOT_USE_BINMAN),y)
-# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/binman/binman.rst?plain=1#L377
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt
 UBOOT_DEPENDENCIES += \
 	host-python-jsonschema \
-	host-python-pyyaml
+	host-python-pyyaml \
+	host-python-yamllint
 UBOOT_MAKE_OPTS += BINMAN_INDIRS=$(BINARIES_DIR)
 endif

--
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
