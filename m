Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC1BC02182
	for <buildroot@archiver.kernel.org>; Tue, 21 Jan 2025 07:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D1A68212D;
	Tue, 21 Jan 2025 07:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mwk4le9ZimN9; Tue, 21 Jan 2025 07:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DAF084951
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DAF084951;
	Tue, 21 Jan 2025 07:41:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73B45959
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 07:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60E6841695
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 07:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51ePj_6Fbtba for <buildroot@buildroot.org>;
 Tue, 21 Jan 2025 07:41:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5A4344144B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A4344144B
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A4344144B
 for <buildroot@buildroot.org>; Tue, 21 Jan 2025 07:41:01 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-2ee9a780de4so6712055a91.3
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 23:41:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737445260; x=1738050060;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EeIJ9mrM+UcEE31zhaM1LqtQxGKbBcAK2eZn/Qc/upg=;
 b=eHfvgMgdCl+XAdqSZL0jAgMQIrEDslFaWpAeepGlY/vzQnmlOf4lNBMaPy0v9qiw3p
 Gn9VWSB3/qs3J1XTS/2FWUE5UlgHy6cf04BL+lieoH0NrDokZhn2LOgromo6caf/g2B9
 Qsh0uH1LSrQk602kt9Jho/u8eoR9RXaGsfPDB5FFOWiflFOQ4YB24tKvtxd1VWFDTmNy
 y/xuIa2O/vEjrU/ZkuwHNec5M5vrtpm4EstYklvh2uXxRSh0MMafy43NYDboaVzXEgh/
 MM9JTo2ktSMgGh7tEVb1/UXR/kCjgOCbWPGbkuLyq+M7HhIXbL7xAiptgnVyAJ4R7vLc
 Yz0Q==
X-Gm-Message-State: AOJu0Yyy980ScRwi1K05jj72Js0Xz4ncX2FPD2nyvMMbm15kAAzv7K2h
 H/ZhdgtLB6Bd3wY2vpbCvf6UKOlpV7I1uuxB1i36g0LQXXxzwKuWp0NNUAuC
X-Gm-Gg: ASbGncthEPx69X2wciuPGPsCb/48hUXLsKHu3KGU5YhsGThJMMgVftI4QnNEMfpRiS7
 wPzi4VUFpqwOijY90ZOeJnGVe0FZUVJWVXBIBx0DeqETqROwWXD593/Kw4rVvjMNzf7YKcae/9K
 he821zXVty/BMPrF6UK61Qvw3kBEHaH3sA65AjFRxUloUGagrTCMa4I96sKKYZpCC52q6bSotjR
 xW7Kk+wrNrMnrL2nD11RshYQeFXAEAxnVTT5iLa/Dm1pQyJhVd+iYw2ZyvpzTZBZ12lJnr4otkB
 MDCndR8XJC0T4YjnOZrLgByepE1dMbFY56uTx/9+8QgWD1jDa0uj/g==
X-Google-Smtp-Source: AGHT+IEbaG1nYZNbDD6/H8rvyHhebzfwK7y7NrChg8giOqnEmCWlUkapGzTYBd3HIRLjw5Dx6QKY9Q==
X-Received: by 2002:a17:90a:da8e:b0:2f2:3efd:96da with SMTP id
 98e67ed59e1d1-2f782d38a48mr24741677a91.24.1737445259871; 
 Mon, 20 Jan 2025 23:40:59 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f72c2f6bd8sm12131932a91.43.2025.01.20.23.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 23:40:59 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Mon, 20 Jan 2025 23:40:56 -0800
Message-Id: <20250121074056.18087-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737445260; x=1738050060; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EeIJ9mrM+UcEE31zhaM1LqtQxGKbBcAK2eZn/Qc/upg=;
 b=XkbX1LoGd3vjNp8tzC8hAXBFeVMxBV71RYhFwK5JNTxwyLV+29XH/sm52UYxfFSxMc
 lPdYWy8NEoQvrS2BWwVW8kfqfo/801qaV19pl6cBU0acU5HZa/Elirc34/k4jEP6/IFQ
 h7pZQ/p3vMIeCje18MWfucSO3PXnvZTo9S2u/f7ssH1wKKZ0zXfnR8vAiOd7pOOuO8Jb
 RSHM8mG2egu7FRWLcfi58P1Uk0QVDATFTHuiR4uZYmKuP1uhziPM3tGFJfwWqm9LYyWh
 J5mYxeidNTIoJQiI2gYomLU5qXEFhT50vxjNAMQ+F3yIa+75b50IK0Hc4xNCw77DQ+CK
 tn/Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=XkbX1LoG
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.27
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

Changelog - https://github.com/pikvm/ustreamer/compare/v6.22...v6.27

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 4b33d23e70..e46411b5cd 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7d3fcd34ee57faa4eae6505fba75ef35b36840083d50f581208f402a206032ad  ustreamer-6.22.tar.gz
+sha256  6089137576520e3162fa6574853a15da1a7605f7e9a550c2570b33cfe8a39046  ustreamer-6.27.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index 813f219b89..eb707cad00 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.22
+USTREAMER_VERSION = 6.27
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
