Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EB3C83F26
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 18:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36233608FC;
	Mon, 28 Jul 2025 18:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FJ14Rc_A7Imi; Mon, 28 Jul 2025 18:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58F486077A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58F486077A;
	Mon, 28 Jul 2025 18:15:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B628BDA
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 18:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BF3D80E97
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 18:15:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0AM0wG6GtMz for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 18:15:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98AE680E72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98AE680E72
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98AE680E72
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 18:15:35 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ae360b6249fso833003766b.1
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 11:15:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753726533; x=1754331333;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QlSRWFtgm6QCQ7Zz6jWdz+2fwOFXluqtuYEMi8vcoRo=;
 b=typI6WZnQnPsQxA2Md31zy6HtfB00Mm+Qf2j/S+CsTi9UiV/SFA0AhD1eyHiBUSyb5
 fenf4dQnd55EbZZhv56/Se3OTDBw8rLpqYqTuSfu9Y4JpbvZIAsDq7HxPSWNdwwZxxsa
 6rrVbauDbfkEkYx43461OPCxuTC9rz7n1aB940uyTAd6Fq+gtN0pZtzxwRwUiLQNLNBf
 YgJTdoJurwx+pyMxKc4kcE9QTajOBzwNHh/7M4bQqxDnaLDh2w3O032IGMMq04y0I5L0
 FeQBmUpO8faYRnQKMqpw7tK2UWhe5tUV4843grjivd1n0m4nU9Z+1tBvBV11n4qXsx/7
 rw+A==
X-Gm-Message-State: AOJu0Yw/Mg+fRKmKizgkrLb56ro+UdW188XJF8hNUdxEJAz8uZWvim98
 aHLFhLflIplLoSyX1U4JfhcKXuh+3PUDARIVCAhbI5YmY1m7oNlLBcQSV77+diQTnyAIx86eu0U
 6MS2v
X-Gm-Gg: ASbGnct7tbs2SYuv8JK1rAa3zQa8do4ML7wQDyIMjdfFyeKvwGCeD2pOphwzZ8tCq1i
 wGVxH+PrnrepkhG9XhgCOTrPd/5HZy7uTW6PWv+SlMlXGTXlXNHIFDMgqndGk5paQJ+GrhqWwmB
 Bz1WCqHKnVNXNCj9KFelBPrumcDgxagyU0/jRvdG5QHAKHpJJsQsheNMnMgRqJjmVjbryCWI69E
 NVnBx1IjOm5HTddyNRoexWYzghzhlXx6qohKRPgeT8I72rvowL8uSLKmVQnCGxOWHJGaBDsEp/v
 KA+M3mEsXj62mNN6V0qFnwdl01RSAPajJt4i6r3qmqdcLPpA2NQSBMev+kXvBM9vg93Eme7jTIi
 nivZrFC+RGZvrA7UEqpEIsgq6hq3auZvwB60P+IR0dwiBEEeI2WfM2x2W2DQhWTaYwoa1jzXdMb
 LDnHHFDwpIHu7S1N1NP6wfnnA=
X-Google-Smtp-Source: AGHT+IEZR5YjeuMZFVto3MjRtXo+3wPZma/Ezb5jejEtwSJCfEmLK4jBn2zUXVwU3ooO8x5MFmZl9A==
X-Received: by 2002:a17:907:7254:b0:ae0:b33d:2a4a with SMTP id
 a640c23a62f3a-af61e051379mr1241961966b.35.1753726533345; 
 Mon, 28 Jul 2025 11:15:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.167])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af63585ff5asm461234766b.11.2025.07.28.11.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 11:15:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Mon, 28 Jul 2025 20:15:30 +0200
Message-ID: <20250728181530.2655314-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1753726533; x=1754331333;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QlSRWFtgm6QCQ7Zz6jWdz+2fwOFXluqtuYEMi8vcoRo=;
 b=EH8o5BVss9Ri6Dkkykib/VTdrkpTdmtLzuoc29TjCIfgSG4o01gY0oj5e2aITIACfL
 XLz15aGEXkKmqKOKEjRvWg3a6ZIYEaLKnzNkp/KD60AZpOtDfC64jUEzP2KO9Ss6O/lH
 auRCsKVJRKrmEFWwXcQzGYQA4JZdEUm+c44FY=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=EH8o5BVs
Subject: [Buildroot] [PATCH 1/1] package/inih: bump to version 61
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
https://github.com/benhoyt/inih/releases/tag/r61

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/inih/inih.hash | 2 +-
 package/inih/inih.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/inih/inih.hash b/package/inih/inih.hash
index 2d76a75563f7..72247439478d 100644
--- a/package/inih/inih.hash
+++ b/package/inih/inih.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  706aa05c888b53bd170e5d8aa8f8a9d9ccf5449dfed262d5103d1f292af26774  inih-60.tar.gz
+sha256  7caf26a2202a4ca689df3fe4175dfa74e0faa18fcca07331bba934fd0ecb8f12  inih-61.tar.gz
 sha256  9ae3b39e83e9158e44b67733baa3bb2d84e80efdcfb14a5820210a42c7abdf7f  LICENSE.txt
diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index 0d6b5ddbb767..1607ccc0f5a5 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INIH_VERSION = 60
+INIH_VERSION = 61
 INIH_SITE = $(call github,benhoyt,inih,r$(INIH_VERSION))
 INIH_INSTALL_STAGING = YES
 INIH_LICENSE = BSD-3-Clause
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
