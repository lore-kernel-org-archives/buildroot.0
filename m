Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF27E6F068
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 18:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE8BF820B7;
	Fri,  1 Nov 2024 18:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBp4tV4EqxY3; Fri,  1 Nov 2024 18:34:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0841284060
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0841284060;
	Fri,  1 Nov 2024 18:34:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87DE560
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67DB384060
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TYbE0Dl20J35 for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 18:34:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB836820B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB836820B7
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB836820B7
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 18:34:40 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-3a394418442so8112525ab.0
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 11:34:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730486079; x=1731090879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hPod2o3YlAm5jQIyTwDm+0Df6BBr5Ej9+v3ZSL0pAgg=;
 b=lZT6HxiWq53VsyPqWCP+Nq27+js4AGVa8ls8unVVbFUo3vVyHOX7ijzUZ+WTEuhbNr
 yVYIZMXj4cR2dd8AjHBJ043yG+E1EK5dXasqyELNGGDIAZbe3t4lyh7kkFad6UMmsLX/
 IVep30C1UGQInE0VtVg330AlbYOELG+Mv+dTXxkQ/q7mY4Qi7B6ZMqGYFs0Q7njnXQH3
 1GzIqV3BitteW/DuAh+NzldWIQNAU9fXb7rL3EOd93DOaI4IyWDRP5emx1BEuD9iapo7
 AaBF6kb+TQezNZWN/x3ZdWFN43wmHaxMZ1DUJWho4FyaCeqU/NtTfEpMEzo96h3h5/s4
 JgAA==
X-Gm-Message-State: AOJu0YzBUmkeLBauxq0gWyfm/5V8c1J/2/6O8dmdtHTgOpBvLLaxINYP
 xFHeHve0WUvrykMqQy49k9J7jG6BsmwGe5ubjgH0J6Bo9OkZC8AAriC10A==
X-Google-Smtp-Source: AGHT+IGpjhJ9GUAK+E8D3OC6Tz5ET4mci7IiyAg5ArNr8O6/jWtMIQYGrx2ute50pQeiYRZlWc5pTQ==
X-Received: by 2002:a05:6e02:1487:b0:3a6:aa75:5a59 with SMTP id
 e9e14a558f8ab-3a6b0288ce3mr50976985ab.1.1730486079542; 
 Fri, 01 Nov 2024 11:34:39 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a6a97cf255sm9574455ab.23.2024.11.01.11.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 11:34:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Nov 2024 12:34:32 -0600
Message-Id: <20241101183432.1047982-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730486079; x=1731090879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hPod2o3YlAm5jQIyTwDm+0Df6BBr5Ej9+v3ZSL0pAgg=;
 b=O6YKIvfi5EYHIou+gJ+m8Vyj6TA1QWVSpK+YD6bNKeHjaGDxo9BiJ6PDzBLx6RBBn4
 8O1QhdSY8hbp47rNJD9GjDSgn21kxu3JcfnxWcj7y4K+Mp2CraLqbho+9cjjzcRgcQzi
 nOgNyZRZbRobQFDeM6VRmzzqxvDgLPN5KV3QeNrUX6kwXjhXBb43i8uAwEXxRAvSnPMo
 m1whSHE/22F697LGEU728GO/OM1mGR9Lyn2NUI7iZxbmBhLx63INMZ2kyFWS0QytHi4A
 /up0kivqAxc2xlEsUmwR+l2rnz+WrovyfsnQewUDSuobBXG9/93OxKpxnt5coc+ZCeGW
 1YHA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=O6YKIvfi
Subject: [Buildroot] [PATCH 1/1] package/python-pdm-backend: bump to version
 2.4.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index e6868dfaee..9e33849329 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  6a36245db609345cd0f5f0443d00e19b  pdm_backend-2.4.1.tar.gz
-sha256  d6404e94a612459c5213cc63df035711244173c57441b8312a2a6f4a8c110934  pdm_backend-2.4.1.tar.gz
+md5  3aad60c8b253336b09129551677912ad  pdm_backend-2.4.3.tar.gz
+sha256  dbd9047a7ac10d11a5227e97163b617ad5d665050476ff63867d971758200728  pdm_backend-2.4.3.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index 075bd59782..0565de5b8c 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.4.1
+PYTHON_PDM_BACKEND_VERSION = 2.4.3
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/ab/5f/a77102e4a50d0b80ed4371425a3279c57b0a09e1658f9f7b4f1fbc44db05
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/d9/bf/d75d568521cef171ae9138d9ab55c169a98ee803853ca87b7096e4636d5b
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
