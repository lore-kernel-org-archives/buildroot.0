Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC18AC02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45AEA417ED;
	Sat,  8 Feb 2025 14:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PRn6dmvZ6gJ2; Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACA16417E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA16417E5;
	Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6021C1B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 438E240516
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCdW62zBAy49 for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EE162404D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE162404D4
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EE162404D4
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-38dc8b5bb0bso923898f8f.1
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024611; x=1739629411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5tJFxTGzBtmVIzVl1EPh5EycRfknMjdwEXoPqTLmsl0=;
 b=lKYbYuNiu1zhhUx0hbW+4VY27HYsKbxXCrLBmwO0WXVJLOmPqTAxYaZl+zvrmEoXDF
 Y14dLa5yvOJciFjfAiA+uhVCdcWdqFAY+iz6UyaUTZQtZTF4fgfVaFlF9y1XHgOSClAc
 VULZ49JvA6r+vhrA+AD5/AF+0rfe9jNA+JOSfgnYoEhV3G9fixn+X4dnnheUI2M3/lLR
 i37SaYDbKUZCx1SAatxOT+i1PZR3iYI4YbvG1wYhbJwMCER59mhnqmxsV6uYcUB96fOB
 jV7Rlti/JeoGiHJGnp5qG2ayJXIU0MUkS6yKuQOWiy5QGOJiHy2SZyWlYTEOfJpWAqo1
 9/ug==
X-Gm-Message-State: AOJu0Yw2Rt3iVwElLQ4TK3p6cyfnQxV8I7W4rWNEdZLzlMWWwYgyyYSs
 oAPoLlGQzkN61nPmbW664m6qMNXR1M3CtVqxOTmpej3rBhaaeU3ntPB+L/7gftmCpHQi/SIPpGM
 a
X-Gm-Gg: ASbGncsSYaG/9XpV5wT6Mm7wZXoDkAVvkByUz6SZiogOmcyzdQXsWXi8PzekM5O2py6
 U9pIdm1AazzZwki7OO/ZfT5NDIpdB41NLLQ8zLwmfHdIuOuZWqKN4BX0bPV5rzx52hMH6t+CBiH
 KdgHNWAtwvTZvy4S0Hjh0+3NruSM/5jan65fnRkFfWrL9dotzBH2SskxkbBvu+ade3lAwIkDcxq
 gdnoKZETIXbafFR9hG/MAerP2u2qBEgAJT3aXSm+n06WlJoFes/LEIbt5AjZf4uZ9R7ZObuU1C8
 MQ/xdoMM0S+9qcZZ/QabSK3c2gDWNQjP05f0R0/S4isqLSSKcvPg8DYc2MXLJ4gfJlckYkNbilG
 x5PlnwznYzl5l
X-Google-Smtp-Source: AGHT+IG401lFsihSGqnyp4oGsg39d5FZdVQAQSD6iPUQwpUKMpchw6lgJno5cKA6CrE0+iWMkxtmcQ==
X-Received: by 2002:a5d:6da8:0:b0:385:de67:2269 with SMTP id
 ffacd0b85a97d-38dc9374eb6mr4198310f8f.36.1739024611105; 
 Sat, 08 Feb 2025 06:23:31 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:30 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:17 +0100
Message-ID: <20250208142327.418271-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024611; x=1739629411; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5tJFxTGzBtmVIzVl1EPh5EycRfknMjdwEXoPqTLmsl0=;
 b=wEQWJwKSzry5w4iPikPCwuNGgUK9TKj6zYRIhF+xw5LBX5xH4WGgh2c3vNE/2aS077
 y8RMx4RTtpeNqDDCMFqFlXAXeQdcDY+zCHn5G9LNLJrSCEyO33lPLhm2E/zALUIepc8S
 QHrWVsv/z4Zgu3/oZ1oOL9tpebhsDSHVetiLM=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=wEQWJwKS
Subject: [Buildroot] [PATCH 01/11] support/docker: add flake8 command
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When check-package fail due to flake8 coding style checks, it suggest
to use flake8 command line:

  run 'flake8' and fix the warnings

But flake8 is actually missing from the container used by
utils/docker-run, so add it to the container as well.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index e5e45d5a6f..8b8a478f66 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -34,6 +34,7 @@ RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
         curl \
         cvs \
         file \
+        flake8 \
         g++-multilib \
         git \
         libc6:i386 \
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
