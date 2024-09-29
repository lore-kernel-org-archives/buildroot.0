Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED98CF6497
	for <buildroot@archiver.kernel.org>; Sun, 29 Sep 2024 20:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A4CA81028;
	Sun, 29 Sep 2024 20:15:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XWKKpqvO2jyW; Sun, 29 Sep 2024 20:15:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D2AC8103B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D2AC8103B;
	Sun, 29 Sep 2024 20:15:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B8841BF334
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEEE180FAE
 for <buildroot@lists.busybox.net>; Sun, 29 Sep 2024 20:15:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7CjvsHAQvoAx for <buildroot@lists.busybox.net>;
 Sun, 29 Sep 2024 20:15:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02C3580FB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02C3580FB2
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02C3580FB2
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 20:15:19 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so6713965a12.0
 for <buildroot@buildroot.org>; Sun, 29 Sep 2024 13:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727640917; x=1728245717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ucWYeingJI9DCD8hQDaZ1DGr9qbnpw2gXZFhvPSmJfU=;
 b=Jnm7bobrSN75Ry6OZ8QFdIEbSepZtL7fRNZuqnmVP4NH2T1mq2vvPSiPZ+mXnkWqjJ
 El11YSUVJHiWnaw4XVwiKqhicM4BE5Q8yhknstz9hb0BoOZkTiZZEwPwkDeZJoiwnRjx
 O+PdC4D4hGk6/66yjyLU05FvUYOpLC4LyttbpNJGDW6iWViZ9nrJkfRJ6E1UfmH2vLNb
 gpu9u9V2iis27ea4QXkJzWB/hAKs1Y1EmdsxbrQJL7Tnrr9Stae4q8ZmRyePfz82++qQ
 n9pVDgvLk5t3C6m1TkkrFBCHwZAz8FdcQwAFrsuctu5O9o1VTfAfmSh4KsyTCyYXLfv+
 y8RQ==
X-Gm-Message-State: AOJu0Yzc6QtTq7NTRi8f7Qnv2tK8W1G+xXGj82iL6vL7wSRNk1iIMjde
 YNeIP+jym5k9s6U3nVihZdF9Xee6cGhysOKaWz1QNYCl/VHsHZS0G5DRfUbS0o01q0r7cOCekoo
 V43E=
X-Google-Smtp-Source: AGHT+IGsWk+7WKRsK/cplgDcWbuc04Mb84csw0yM7FkfgtcsCmraBWNd80ghhQHsdi/7F+dJLj6qBw==
X-Received: by 2002:a05:6402:43c3:b0:5c3:d8fb:df6a with SMTP id
 4fb4d7f45d1cf-5c882479319mr11407067a12.14.1727640917361; 
 Sun, 29 Sep 2024 13:15:17 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-54-102-102.retail.telecomitalia.it. [79.54.102.102])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c88245fbd2sm3537870a12.42.2024.09.29.13.15.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Sep 2024 13:15:17 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun, 29 Sep 2024 22:14:57 +0200
Message-ID: <20240929201459.1761285-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
References: <20240929201459.1761285-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1727640917; x=1728245717;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ucWYeingJI9DCD8hQDaZ1DGr9qbnpw2gXZFhvPSmJfU=;
 b=ClhOx7lpSFZBq3jKIm8OtX+0e+ImQeDrpSTCwrJrgwC/GZuDZ185vNnDYsFcx1hQwJ
 bLWZWoLBRJdSbRNDjDqsdFcIVRHVKZzwAxTNL+TMdEg1obCIhfZYRvH1wRE+lSRpS4z1
 7P1L9lRZUqPe/uy3OibquXm1RdFRpEnLkg0z8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ClhOx7lp
Subject: [Buildroot] [PATCH v3 7/9] package/uclibc: enable NPTL on no-MMU
 ARM w/ FDPIC
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

NPTL is supported on no-MMU ARM systems if FDPIC binaries are used.

Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
No changes since v1

 package/uclibc/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 73ddd5ef5819..4c360809c3ab 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -78,7 +78,7 @@ choice
 
 config BR2_PTHREADS_NATIVE
 	bool "Native POSIX Threading (NPTL)"
-	depends on BR2_USE_MMU
+	depends on BR2_USE_MMU || ((BR2_arm || BR2_armeb) && BR2_BINFMT_FDPIC)
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
