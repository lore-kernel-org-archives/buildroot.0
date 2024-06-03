Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4BBC25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 18:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 378F241363;
	Mon,  3 Jun 2024 18:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h2qtwUASSFL6; Mon,  3 Jun 2024 18:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48B134148C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48B134148C;
	Mon,  3 Jun 2024 18:57:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 39F3B1BF35F
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D529842F2
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 18:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Q2_HCoY3fCe for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 18:57:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5510E8457C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5510E8457C
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5510E8457C
 for <buildroot@busybox.net>; Mon,  3 Jun 2024 18:57:54 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a6267778b3aso426816266b.3
 for <buildroot@busybox.net>; Mon, 03 Jun 2024 11:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717441072; x=1718045872;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AfjWyuhYgbBNI3pOImRpod7c5C0aIG4tO8fUZKI3U5s=;
 b=ZMTH7qmzyQANZl8IOknkeApbrEhrj/yBh5CqNvHIsJ+jWs4ZuJN/yLzxMnwBrPsrAV
 o0rjeKSAf/1zFy4qaKnEg1rWrj4hpr09f5kRWKkzElyzj7ZcLmL1WP03rOK+0/u1LN/f
 1bQkbje4uZ0fbFmuPL0g4UM5vS9g6dAN8LlfoPAm2pVQngTDY9jg1g62lO9EnNVU7yF7
 2SqkUSGtlAsvvSV7JIyNRTNycEh1Lsep/ja0bYEOI4zSwkyBrS2l1IjT+T7Wif0ldE9A
 IdUUTajK34K2NuSuFBLNkUgPzqUh5ESmJvd28aS9EpukfKKbfz39ZsCO/OWGMDFvuY3K
 3Qbg==
X-Gm-Message-State: AOJu0YxJmkxGf0+d6mau6ni9pr09/hmh3ZETFuTRpTWixsW6wT4hGP6d
 /2AWLzm1EZqy4Er3zP1WVguXfIcaJXRwGQxK3GGkoNJLdufxsZwEIdN0sb80otfdlj8G7RkibfL
 DUw==
X-Google-Smtp-Source: AGHT+IGSi/9DdzvFBtccLWhAG2/0v9S4fqBwHDKHnVJglLUvRCVMzOmBChbFcB9ctrVYZMIW1Co63w==
X-Received: by 2002:a17:906:6089:b0:a67:7649:3c3b with SMTP id
 a640c23a62f3a-a681fb5fa1emr669428266b.5.1717441071643; 
 Mon, 03 Jun 2024 11:57:51 -0700 (PDT)
Received: from vm-2404.. ([37.65.6.24]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a68a1dc4e8csm420876666b.225.2024.06.03.11.57.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jun 2024 11:57:51 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  3 Jun 2024 20:57:50 +0200
Message-ID: <20240603185750.1082857-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717441072; x=1718045872; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AfjWyuhYgbBNI3pOImRpod7c5C0aIG4tO8fUZKI3U5s=;
 b=dv98Lzb0FmUGNOqOprz+YzEvLwpAn8I8ndon/605B8fgPF28f5rOr78OhvjCj3WUC+
 c/+TjUG3SOVLW7e01tsmKF/31CgtBDxFPgxavoBO46m7TWWvWap3eOniZo29aHx7Z+Er
 1oK9PdtGelaaY7e16HJ/aHqYE5WJzMVT9KnP0UtioOT8gJ99H5zr3oHkRPlkhYK34TQM
 hHbOYX2Rzo+LqjGohDKRxLuBoGrCKjyI42NnY+g+IIP2MmfpWtsECmBkl3LBbTapJ2KQ
 E1D0S9VJt23++18DnVoHQ+oa9/MUUFC0K0R/JpP6TN85/izxKGtF0uFgP/YtHqk1SQTH
 mTeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=dv98Lzb0
Subject: [Buildroot] [PATCH] package/open62541: bump to version 1.3.11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/open62541.hash | 2 +-
 package/open62541/open62541.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 366a0894e..be9ee77cc 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c78e0d2b1cb1a22db0102ed7f439073bc22ff44c5e9d9175f1b8e644f7b21f44  open62541-v1.3.10-git4.tar.gz
+sha256  34fbf37e7f8e159b0a187bf8b0663af0187161ba4c5015828590c919645d596a  open62541-v1.3.11-git4.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 1be44eb0b..26c3cd5c2 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = v1.3.10
+OPEN62541_VERSION = v1.3.11
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = https://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
