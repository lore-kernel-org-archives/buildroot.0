Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343A3FC6166
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 01:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C24CD82152;
	Sat,  3 Jan 2026 01:00:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYiGo1eswDQ0; Sat,  3 Jan 2026 01:00:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9C698216F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767402044;
	bh=ASb89/Q23YweQTjsGq6/6UEIgD2Uq6RAYGI5Ju3cyYA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=b8jbN5GVIfGOBqUNjSE5y1Uxb5Dfyx2QqRFfEXrB4fwho/6Km7l52xpjcSDjve7G/
	 /687ql8LzBKHxtDO99sKUsshny7Ljf2Of6WsHIz2yexU+wdZLdWx9LHNuhSA2cwaCA
	 K8l4Fq+akTt9/FzQ6N9yCZtuh/ZS0F8CGFN8KO+oXyrWdBLld0Z3THkOixC2WSGO44
	 EBKSmXpRfOaDAknd9zPKUw3AKiGG9zDmPkMk1I0l8Xzx5fJ9KjFecokPeWisUXkOiq
	 Csh2HuVFemfpnknF3qG+F6V6k11ZSh+fklzBgSLitWMoWXQY4offasqxTJM47faevz
	 5mma/JZEGmXsw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9C698216F;
	Sat,  3 Jan 2026 01:00:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 80712440
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:00:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6799640738
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:00:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dAV1qxjigELQ for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 01:00:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F8EC40730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F8EC40730
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F8EC40730
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 01:00:41 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-455ddb90934so3073888b6e.0
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 17:00:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767402040; x=1768006840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z89oSOAWZK8yQd35fFHRF8Iu/3J8MyKu38XjldtLvGQ=;
 b=Oh/1PaZdsKfAL/Ly2r2wNSp3fY8bFh5/tbapGW/NtA6uy7KLcqlymvm8rfCjyrl1l0
 /Cu4MBpycE0ASa1n6zCyia5QdXkNleFyy4nUnHcASzIM+i8/i1vjXRI4FuPnoEN4owH9
 Be/HRx+hiIpdmmJd8+vZ+NBS+AwOpfCDKU+63lPspThI0BeqDHBw4IdMEo9ivFctY487
 1H2Ef3fSRtRISlXz8brjTVGf+umS4myic4a+DGU347dw6FIbuJslIbaLBDG5w/63YHIT
 I3Rxz3JGGsugl6m0ztAf8fhUYmGtfGgy3Ty5tOKUTw4SduaOo3tLym/gOIgzfKG6GWlR
 20nQ==
X-Gm-Message-State: AOJu0YzXyrDmNwC+jNa2E5sOHj9mxveJC9qrBDh3YeIyeJXjigXXeruT
 VfTEkMWJaJj9awGKOkdQJ2P61wsS71UFgJKiS8qi9W6xU2K7EFPxQB/uBUloHsOhKOw=
X-Gm-Gg: AY/fxX4XGCe5VVG+n9x1+IgHw7ZR0PX0xdp84KbB5lBc7rcYNL88i8QqqoUZhOecXpj
 dA+jWm/XZ/YCeWCAuB5hvtD9pSbLmbmpUSQexy3Gpp5sZPtvvDeiAnUoLcKk5ZKjR2pq1gMtBKa
 ocBdCatpoZYBt35+6nrAYLs2Oh5pp6PoynZqPMPfhnH8J10+rrKvAGK2tH4GZBDfLbm+hRrwePf
 Qy7mMZrZUsgrUKSoBVVZTvKexbDY9z1Lo1L7iFijSpNM9ykgvd7HS7BXXJyQvbzhduMRDrJRWTO
 2Wsf+vfy0pRMdKO0vO/ox9lK6qCSMe1Jte8VWrfvCbtbimGa7qBTb25xU0amFWs8N/aa89qOr11
 dVgG051KkK3gBPXaxgIWSYQNwi4DNYWTbuPwiFoGeffVxDPsSseRqecf3bx9wx+9jptCMYwje4Z
 aWtnfXK3fNesyBk9pojAC276UL4guiZVIWHyiNJ5bX86OWlY3W6+z5Cs5v9RYhiE2n3cSH9jqam
 kvhi0qgYE7Xwdr8wrZ5PkpgQvvNLCmoQYEu1/kUnB0bn6P/mJIioyY=
X-Google-Smtp-Source: AGHT+IHPPuaXYtq8OmgVQTk+WzLWOLKwwCixr1zaREN+3I2ZEfQ7svkBqZs+IV+SLbZw6Yi6/LXkvA==
X-Received: by 2002:a05:6808:4fca:b0:455:daf0:9999 with SMTP id
 5614622812f47-457b200e4d4mr15455234b6e.50.1767402040151; 
 Fri, 02 Jan 2026 17:00:40 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaabbf2e6sm26787868fac.17.2026.01.02.17.00.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 17:00:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Jan 2026 18:00:33 -0700
Message-ID: <20260103010034.713506-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767402040; x=1768006840; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=z89oSOAWZK8yQd35fFHRF8Iu/3J8MyKu38XjldtLvGQ=;
 b=MZiJHhK3BUsxyB7jAEsP8fVIJ7v4EMw+omUIjbekYWpMobevJc497DSTqjBGqRIYek
 21ljpUjYliWcskbI24qvFTWxbhIFjeWUXw1gryUc8bF4moItshz/DhHnG+NNS643GzuH
 IaD28mm5/RnyUv6THyC4toGkEsOmzQmg/FvNRy5A5xsAXGGjkCYfqlAm0s3jnqqPsHCs
 aec1boAHokVPk+7HAnTk1fmspcehVzVgLTnZauPRrotdqe8tTS0mcm90WZW5nCapWsDk
 agfBEkjkQ59KgjV4+3qDP3usKC+oMhnDHxb/e2EMd+ka9A3lXtblPsqSODFmIZmESV61
 LzPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=MZiJHhK3
Subject: [Buildroot] [PATCH 1/1] package/python-git: bump to version 3.1.46
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-git/python-git.hash | 4 ++--
 package/python-git/python-git.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index aac8b3fab0..cda8ae49e1 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitpython/json
-md5  14e2083b71e235ba4d81fa485ce9153d  gitpython-3.1.44.tar.gz
-sha256  c87e30b26253bf5418b01b0660f818967f3c503193838337fe5e573331249269  gitpython-3.1.44.tar.gz
+md5  e011828008698572f60dbc3a798e594d  gitpython-3.1.46.tar.gz
+sha256  400124c7d0ef4ea03f7310ac2fbf7151e09ff97f2a3288d64a440c584a29c37f  gitpython-3.1.46.tar.gz
 # Locally computed sha256 checksums
 sha256  86fc94c321a9afbc11514713511bafded225f25100dcc0f7350e82bc231b8beb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 318cb614f0..49cd04f66c 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.1.44
+PYTHON_GIT_VERSION = 3.1.46
 PYTHON_GIT_SOURCE = gitpython-$(PYTHON_GIT_VERSION).tar.gz
-PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/c0/89/37df0b71473153574a5cdef8f242de422a0f5d26d7a9e231e6f169b4ad14
+PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/df/b5/59d16470a1f0dfe8c793f9ef56fd3826093fc52b3bd96d6b9d6c26c7e27b
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
 PYTHON_GIT_SETUP_TYPE = setuptools
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
