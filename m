Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0565EC021A0
	for <buildroot@archiver.kernel.org>; Sat, 15 Feb 2025 10:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C46D441A5A;
	Sat, 15 Feb 2025 10:34:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akBil3hB5VCZ; Sat, 15 Feb 2025 10:34:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9224423D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9224423D8;
	Sat, 15 Feb 2025 10:34:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 40C721E3
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EFE4607E8
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwG3WA1Nsz-4 for <buildroot@buildroot.org>;
 Sat, 15 Feb 2025 10:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E6A660852
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E6A660852
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E6A660852
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 10:33:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38ddfee3ba9so2241829f8f.2
 for <buildroot@buildroot.org>; Sat, 15 Feb 2025 02:33:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739615632; x=1740220432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1wRIplafNXTDk5z12i5SgFEK05hgdRLS5/Nq82vuh+0=;
 b=ky93JcEib33UD+4pVz7CdaW7SdPCoQAVh2epBB6Nqw5ZPOsRaHnQP+f35rmIHACGey
 L8q3ft20uupZnRSDygiEFYM7oQ2PIZvncsrFP1Fatca7JAJX3IeEYJkG++fjVhmtKod4
 Zm+/B+fdHQ8Twqu40Hw2HdHCO62xWYH1ANPm8e8YOQpfDHhVbs+flu6+nYow5K/SDIBE
 frYvbRZvcrG46fPoWLRtms5KHw+c60ssJg4eeSE41hrSPg5YI7NbUCB291cqPWt1YhYK
 9Qio6KrE8ftC4Ytb2wMO5ZnnbDGrZjsbW8zRpT+GzMVPTXX0XE3QlDzXWi+FBAYDVmsz
 j9Ng==
X-Gm-Message-State: AOJu0Yy4n92QMY75Q7BdNPMgZHO1W/Tq6L0uQKPrstx1S6GC3yRatgyB
 iLKKNidH4bEF6yPk9rZ0D4jqbWuAt67R4W+ZOnUioScSyevkNbTJDMGywA==
X-Gm-Gg: ASbGncu2OLqxJi3IPWTsZNcH+tuX9tysyj3909qcKjCHXIb7hUA3ABTCoc7AtrIDZth
 tZD8MsSlio9wxI24TSLGaFBCxYnsNI62kYgDqeKlm2e19WGfhTJNZXEkPftFQYtqXSQY8Zk78m7
 MgVBDiPH9VQzoP0EPzDfPm0gCHAEh0+F7xFEVZVNyp9Oni8b2+vRMV5q3mIvnM9TVatVp0IxDKz
 o17GqWrtY7upDs3hoxbsdeA5YK5DWsfctRorkYdiGwXWsYZ6zJBOr6AWXq5WtdCG81bqi9FlbjB
 rA6DBVEmy0osvNSgMiweo9pftw==
X-Google-Smtp-Source: AGHT+IEgkqAOrW9Lil08LMb0iKvFCpXy/XRDjDgnZ0yQWyVS/7Jpkdv3uVPoQtjaOuD5EqGSJjbTyQ==
X-Received: by 2002:adf:f20a:0:b0:38f:3009:e22a with SMTP id
 ffacd0b85a97d-38f33f28769mr2250054f8f.15.1739615632104; 
 Sat, 15 Feb 2025 02:33:52 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258b432asm6774941f8f.6.2025.02.15.02.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 02:33:51 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sat, 15 Feb 2025 11:33:49 +0100
Message-ID: <a51eb6ce464f7c9dae9303c5fe932177aece43f5.1739615626.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739615626.git.yann.morin.1998@free.fr>
References: <cover.1739615626.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739615632; x=1740220432; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1wRIplafNXTDk5z12i5SgFEK05hgdRLS5/Nq82vuh+0=;
 b=Qu09z4Gjy7nwO2diN4QWfLMRMnvcQ8w88l2ykMUSYMCYhwoecvu9wFOyg7gEPZUnjF
 SL43nEeF05xJRtgtUIjYt2+sNjQPQddsgLn7LWbQI+7LrDNdckTZmV6dM02nxRCS+WJz
 YlqGXRFTsadV8LLJLuEYFGYASlN4iUsI5UFSAddaYaQVn50Hdm9XjQJ5jSwct+c1pcAq
 RTIwIEcwA1VYPskiT8kvZgEI6K7BHKdDGTy3Zdp4f9sL5GCOUuGIJThrSwfwJ5cBZMEk
 l5w2l4XzXrGhOjwwVjQ3pD0mSSY3wtTGuAyW6r5UjR4LdwWXOihciKcm/A4ZRcXnIkLd
 q+YQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qu09z4Gj
Subject: [Buildroot] [PATCH 4/4] system: add catatonit as init system
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Like the existing tini, catatonit can be used as minimal init to be usd
as PID-1.

Add it to the list of init systems, like was done for tini in
24cac9c4e6a3 (system: add tini as init system) and tinyinit in
c1daa35cd950 (package/tinyinit: new package).

Unlike the "main" init systems, there is no historical preference for
those minilist init systems, so just keep them alphabetically ordered.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 system/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/system/Config.in b/system/Config.in
index 8f3579b7e0..8ff6c7213e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -149,6 +149,16 @@ comment "systemd highly recommends Linux >= 4.15"
 
 comment "Special purpose (read help)"
 
+config BR2_INIT_CATATONIT
+	bool "catatonit"
+	select BR2_PACKAGE_CATATONIT
+	select BR2_PACKAGE_SKELETON_INIT_NONE if BR2_ROOTFS_SKELETON_DEFAULT
+	help
+	  A container init that is so simple it's effectively
+	  brain-dead.
+
+	  https://github.com/openSUSE/catatonit
+
 config BR2_INIT_TINI
 	bool "tini"
 	depends on BR2_USE_MMU  # tini
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
