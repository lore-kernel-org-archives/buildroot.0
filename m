Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBCBC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 21:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0446A41C50;
	Fri, 12 Apr 2024 21:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FW8hoUgnu74D; Fri, 12 Apr 2024 21:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9779741C4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9779741C4D;
	Fri, 12 Apr 2024 21:43:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE8371BF997
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A2358270B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id meQf7mjCi8Rr for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 21:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 206CC826F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 206CC826F5
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 206CC826F5
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 21:43:33 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4155819f710so9567235e9.2
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 14:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712958212; x=1713563012;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X1j/kpga7E2+b+CopUywl191mzoVOafUsgyLIwQfsak=;
 b=r7elgmo+mlW8/ITFxBHQRlBjN7Uy8wGIA/UxAIC3D2fkqQnlwL9dVZjVBEtorV9DAu
 NbFMybrryRv0RIJQIPaK5aoG+5OFG8+Ic/3hpS3zYTrxjGG6wW45lA/3Re1oyLvXRTMD
 MtpxSUqpMpbA8WiU7NzcqqVeu2m4FKePjVHfGsiadM1AMRoshVqgfO0Ucu4yziKjtnYP
 0PgteC0EQs4Wyjak1lEim540damlFtiNp2ZKOtmtP8JOs8c3MsJaqksJpyO7rXht3Jaf
 TJQI4kFYGzdtlu65PoGNexAZ1scaR0rPAmMqZ05CmtsPzN6wEKjZJ1mspfiyOEktv+tE
 1dtQ==
X-Gm-Message-State: AOJu0Yzfo+cZBozXxKJ2FTjYSALDYyDGBcfJwuKumY9SKRbdiVgdwOZ0
 9Jpe2zF4eCR5AMxJlWClRNlPeZW23yksNHy6tiuu4ovJteYuOzkLSQDCMLGfzxNMbsMxmT9v4wo
 0LTI=
X-Google-Smtp-Source: AGHT+IHjW+r91lenyEcpIpgNLb3vS9ySV5pnHK8BSFD9CW9d1+osQdcYvEtuJO0azCAUZRzsRH9UKA==
X-Received: by 2002:a05:600c:1ca9:b0:414:63c2:23cc with SMTP id
 k41-20020a05600c1ca900b0041463c223ccmr3275895wms.2.1712958211552; 
 Fri, 12 Apr 2024 14:43:31 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk
 (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b004163ee3922csm10034597wms.38.2024.04.12.14.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 14:43:30 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 23:43:04 +0200
Message-Id: <cover.1712957992.git.ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712958212; x=1713563012; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X1j/kpga7E2+b+CopUywl191mzoVOafUsgyLIwQfsak=;
 b=cEs18t+MIDZ2X7jroFU3L4REKrPMjQlH3ZQUN1MmV5lzX84dqZSI3h0EDIkFVZw2yB
 Ta2BIIm9nH0rNRHP4zShIuhR6BX8VkzLg5EItuQ1AJxPC7E8KGB5oO2bzkd/rA+oPYnw
 wbg0TB/RzJJWIyuPyrtuOWC2Ksm75ejh/0of1NTe5mUcoTrtY04FCj2gqN7/TMueApNt
 9Fvfa+C1yC8wZ9ixGXR5iYnPZOIK3hSlxZcqVqQmaa/e+JBgN52QISPFNyOwKsceiX77
 c9i34rtXHIOUnUfemm/jeNyIbJfDYA0hBNkN/KQQuE9OWm4GWAR8or42p9VrAx5X9lpH
 Z94Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=cEs18t+M
Subject: [Buildroot] [PATCH 0/6] Add host packages of gnupg2 and its
 dependencies
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
From: Ben Hutchings via buildroot <buildroot@buildroot.org>
Reply-To: Ben Hutchings <ben.hutchings@mind.be>
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently we can build a host package of the obsolete GnuPG 1 but not
GnuPG 2.  This series adds host packages of gnupg2 and the various
libraries it depends on, but with only the host gnupg2 package being
directly selectable.

Ben.

Ben Hutchings (6):
  package/libgpg-error: Add host package
  package/libnpth: Add host package
  package/libassuan: Add host package
  package/libgcrypt: Add host package
  package/libksba: Add host package
  package/gnupg2: Add host package

 package/Config.in.host               |  1 +
 package/gnupg2/Config.in.host        | 13 +++++++++++++
 package/gnupg2/gnupg2.mk             | 11 +++++++++++
 package/libassuan/libassuan.mk       |  5 +++++
 package/libgcrypt/libgcrypt.mk       |  4 ++++
 package/libgpg-error/libgpg-error.mk |  4 ++++
 package/libksba/libksba.mk           |  4 ++++
 package/libnpth/libnpth.mk           |  1 +
 8 files changed, 43 insertions(+)
 create mode 100644 package/gnupg2/Config.in.host

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
