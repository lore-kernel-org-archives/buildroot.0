Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3727C83F17
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 20:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADCB2820EF;
	Mon, 14 Jul 2025 20:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WD7k2k4YN4tK; Mon, 14 Jul 2025 20:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1BAF8212A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1BAF8212A;
	Mon, 14 Jul 2025 20:26:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EC4DDF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70D6A4085B;
 Mon, 14 Jul 2025 20:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SaJMrNK9ddHf; Mon, 14 Jul 2025 20:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87E28406FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87E28406FD
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87E28406FD
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 20:26:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4561ca74829so11904915e9.0
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 13:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752524770; x=1753129570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=pemJhsOjIPnyWSPYmoqr1e0ByhoNeN0Fd3dyHyrvT3Q=;
 b=G0xP/93msVbzxj3oFDimYcFJycKOZW22TP6Lgggpa+DoNeG7WaMpE01AERGsdpNy+W
 1P0qe+nCxlWAjNTnD+stSCnlvefyquWR8iunIcT6xaL6NkYlBOQ2zCccdUftpFg7EfRM
 eceq+K/wH2R8/pCSOl63oE/P0Ldd0KY8fuVAnd4XSsi/sDWBggTWfvjwjj1Khi4r3Ms/
 96cLxEnYk6E/RUw9TnrZZBVW38Cmq9RNi+N+2bp/dFOKHhPQKAvDJLmIHPvvn38osCWC
 lIbiOZiPnKD3ZFAlJJMVV+/v9IYPYniruZo1ubiuCpwukt4TW8suXrlxYHmJH2WORoGo
 WPOg==
X-Gm-Message-State: AOJu0Yxd+bg9xgRLX9vJgJnpMnLISf44RrzIKrBS8E+fPMOWXHC8WZxK
 POXrmAezVB+mJe396ev/jXaSgZKz/5Wqy88ynFDyW7t0WjB6qF+TNy/sQb1b7A==
X-Gm-Gg: ASbGncu/5tT4ZOXptWIKcMUmTkFLMjkX41nYnEs929AWa5KVmEuuguYghIO34rSVNR8
 5GNAf8dJKxDj4MoeYvoFsdBJAgc0vW931VVU8CrbLXzkEqPPlBZV46b3R+5UFDHcPmw1LwehNTe
 sts8YrleeGjasX1SK7+TFSvfij6UYIEi8XsMgaW3bk+ulSZOFrJGumd4F5sY6i1lt1S7kMHPxJw
 CZ0qsxbhyXFnQlvDTOquJpyI7Wx3HIoubfzhsQ24tCV+NS2Crgjrhl5nzgbnM43e8X2aTFGWULt
 WDoo8cVKMiZ4CoPTj6PvtNl/WX4ybrg5K9j2D32kz0y0eqRit7f76GphzuHIQOGyNYpZ8SUhyh5
 eOVsCaNktDdc5N1eNNpMzyrt8C6fHHtP/
X-Google-Smtp-Source: AGHT+IFTNAnyHwiCqth0l5O6lW3vh3X8UotwKGkXGz0/tYYjkHQi9BeEinBwQ3X5sML3PKk5cF0kHA==
X-Received: by 2002:a05:600c:3155:b0:454:ab87:a0a0 with SMTP id
 5b1f17b1804b1-454f4257f20mr149418185e9.17.1752524770081; 
 Mon, 14 Jul 2025 13:26:10 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc91e3sm13144838f8f.43.2025.07.14.13.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 13:26:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 "Yann E. MORIN" <yann.morin@orange.com>
Date: Mon, 14 Jul 2025 22:25:57 +0200
Message-ID: <55fa2375d41ef6b3ff664452a0c3641df6d7145e.1752524763.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1752524763.git.yann.morin.1998@free.fr>
References: <cover.1752524763.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752524770; x=1753129570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pemJhsOjIPnyWSPYmoqr1e0ByhoNeN0Fd3dyHyrvT3Q=;
 b=edgLjDG3tCgKkMH0cBpMWZF2AyScS/RXK2LmUMBqCUQE/Lk15+CEF4ndPMxowvtvdj
 jg3zOAA2ssVF6T7CvZK1ObhnHgsn9pw1HPCJpHbnGQGPhu8rfwbLE6NbQBnT/lwOAxcn
 iTLPSkDlmqNOrfKM0OljWvUoVSVxCqDIN6J8AiZClEkqNmeE1tLaJCgdR2qjqf+E9C5K
 GnF3QhvEP1j+/ue7P5DTYYygrifyqzgptTsdxjrfMSomWR5bGVsZz/BnSwwZ4WvWp0nG
 BIRfDdt16ieHWazmVP5O/5ohXciY3HTGF/yaxAao4DiIj4YAuk2iGEEJT0XuQ2T8ApCA
 1jBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=edgLjDG3
Subject: [Buildroot] [PATCH 03/13] package/amazon-ecr-credential-helper:
 bump to version 0.10.1
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yann E. MORIN <yann.morin@orange.com>
---
 .../amazon-ecr-credential-helper.hash                           | 2 +-
 .../amazon-ecr-credential-helper.mk                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
index eaac8efe35..250ba6d4ff 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.hash
@@ -1,3 +1,3 @@
 # Localy computed
-sha256  53765b3e441a0e785131731d0cee4c0e2b2a22b90e523e9e4ec3e461c0ec5b05  amazon-ecr-credential-helper-v0.9.1-git4-go2.tar.gz
+sha256  4114241888385d3794ca639f40bb7805f31eb295559950dd940aeeb6b74792f8  amazon-ecr-credential-helper-v0.10.1-git4-go2.tar.gz
 sha256  ce65129252f145d6dd627bc354ccc28ba07c6cd27a8d278b7dcfde3ed6976a5a  LICENSE
diff --git a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
index acfeea16fb..06bc98bc79 100644
--- a/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
+++ b/package/amazon-ecr-credential-helper/amazon-ecr-credential-helper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.9.1
+AMAZON_ECR_CREDENTIAL_HELPER_VERSION = v0.10.1
 AMAZON_ECR_CREDENTIAL_HELPER_SITE = https://github.com/awslabs/amazon-ecr-credential-helper
 AMAZON_ECR_CREDENTIAL_HELPER_SITE_METHOD = git
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
