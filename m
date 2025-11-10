Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F2ECCFA1A
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 08:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7A04608EF;
	Mon, 10 Nov 2025 08:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KVANml2EqiG5; Mon, 10 Nov 2025 08:23:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EBD26086C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EBD26086C;
	Mon, 10 Nov 2025 08:23:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C74F11CD
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 08:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8D996086C
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 08:23:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rExmkJHzsITH for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 08:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6ECD6061B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6ECD6061B
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6ECD6061B
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 08:23:08 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-7aab7623f42so3172912b3a.2
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 00:23:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762762988; x=1763367788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vaKKSi0jUNNG6nIsgxZxTp9cdzFFlklk6XW2itr/Kzo=;
 b=C4PjA6OtdaU0VK8QS15ZvnJeVkfimExvUO4n8IlRPSSey8SYvrw3xxIYVG1H93Poen
 g7WPeMT8ewv19fbAJTavJzWMmmzYb4/pj67ebDNnPYiSzjJD585L67KKLMRzhqFQlCYW
 qZqLKAlpVTRMHPqePAEttCf0h9ZC2IgRjHOKB6hCfnlIdZZFseE5OFSyiq005gGDJw/G
 DGQtPLMh34bc2cUNP7G9mSIXPlU4Bpxne3Jp6+WCoMazNySZWoBdyvsTz43P586Kh74p
 KFg/z8XlXaHW0hXnIDWMeMQ6DL4+cqlmuXYI28QJacW8l0tSNHPipNO58oMx3tjTQOzO
 Rnew==
X-Gm-Message-State: AOJu0Yy2Qvl4vOa9ZXvjH2CT53gbdJnK2nSjBXnHe46JAQuhc9uCTKnQ
 HopwUWlIRobWYPsrqK9fVSNlrTBSQY0bTpQ2mTq7eAxCU5lKzYZfctbmswSrTTrO
X-Gm-Gg: ASbGncsuJS/A7INVr4wauaIRiekIX7vsU7vNJ7+MikS/vkXdfetjmOJJq8+OgaCWh85
 1oVRUPFaEKY68RrAxzUi491j2BjYcFXbbRtnF0vnpGvxGsZt5oNU+/7FG9cqda6PTIpoFixgSDJ
 RUA8nc9oHrRVMq0p2thc+1p0bkjMDE/wGciB8BvxymlstWKYv4TxWvhgPY+pcjEV8YYB1HILsi3
 DHT4JgTR4ayBdf4Vv5YX/5ZUr1GYhrOfnGxvxxgqlstsKfUaeCYFFzN6Im0INK/E+GKe0RnQDCQ
 Y8Vmi8Fnt7ZozoF2MBoFbKuAoL6giRmvhSFs0ZWLud0Dyu9eL4pVFxehwou4hFsz6r6qWsclFso
 mcv0NrIz0uxhgg4EDbCpnBTH37wAbeZRnpvPQIaFYzggjEuNVv9EGWuPRfHaMjlrfveY0Z6NWk3
 nTuEic7vwuopdEEM2dZBwZIlwWLYLlD0i1yVgkFShnVozqqVXltN7gkV+d4hE=
X-Google-Smtp-Source: AGHT+IH8nTYtDjGh8L1DUKziDcg87ZcCat3/Whd8GW9idOZnyl78WudXoF0Hf4DZyppSv4egyXoYLA==
X-Received: by 2002:a05:6a21:6016:b0:341:a18c:dd80 with SMTP id
 adf61e73a8af0-353a0f9d54emr8461393637.4.1762762987676; 
 Mon, 10 Nov 2025 00:23:07 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba902207227sm11817297a12.33.2025.11.10.00.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 00:23:06 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 10 Nov 2025 00:23:03 -0800
Message-Id: <20251110082303.413036-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762762988; x=1763367788; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vaKKSi0jUNNG6nIsgxZxTp9cdzFFlklk6XW2itr/Kzo=;
 b=faMPeIfJAxM13LKOfycS2mwJlQ17a/89R342ONYSesZKiYuxR+aah+05e3gU25Cse8
 7k3fcoI4AQBalmsv1VYEGilRScfLvYMfen1yTzRdNkpO7Gy4DokS8QAmBdNtWEfbvdmd
 nLkj3p1IO5nsLbwes4ssGkdCLoUkt1tljes8JoIjh2oj5TcS0zTSHNRjrmATLL34o9Ua
 5TCDwS/t1AarZNKiGUI8L+bxlZK81IqS2nrqdMkpj57St2da5aYlQ2hEyOqMuef+i4Gk
 LvcZZ674RGp5hnfyC00IxBJ4I/fbtLuCVV6xo9CWdicxOU6cub7rjoJyY7mtekPmzp0H
 kUaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=faMPeIfJ
Subject: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.32
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

Release notes:
https://marlam.de/msmtp/news/msmtp-1-8-32/
https://marlam.de/msmtp/news/msmtp-1-8-31/

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 4ac80bb1b2..30e1d19059 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.30.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.32.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  f826a3c500c4dfeed814685097cead9b2b3dca5a2ec3897967cb9032570fa9ab  msmtp-1.8.30.tar.xz
+sha256  20cd58b58dd007acf7b937fa1a1e21f3afb3e9ef5bbcfb8b4f5650deadc64db4  msmtp-1.8.32.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index c391ce8204..485d2a1c1d 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.30
+MSMTP_VERSION = 1.8.32
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
