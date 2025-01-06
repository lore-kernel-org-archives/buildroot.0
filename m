Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40659E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1D1809E9;
	Mon,  6 Jan 2025 13:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ta_sNNLr5jk5; Mon,  6 Jan 2025 13:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F05EA80AA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F05EA80AA3;
	Mon,  6 Jan 2025 13:42:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CB116B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56A8A40339
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gFpSeOjmn2ZD for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:42:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5663A40216
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5663A40216
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5663A40216
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:42:47 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aa69107179cso2389154166b.0
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736170965; x=1736775765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I9Vo0aHA72neRnm1nwU7u1dR4Nx5V09umqNiLLXMqXE=;
 b=ZU/9PLHZUps5jIoZpyzRxnFztDz7D9cYlT7y/nOgywvdO3yKSTAIcNjpxLQ8p/3g0q
 bnGRT+/nUiJlKTjN6BgtCpqvXTTji4alYKcqNm0umWUgm3IowFqgq0Ool7tPbezyt6Cl
 LOXkAzhc740Af5axuxWF2zdujLzrHJ/GxDyPU+9g6QO5sl+ou8TdsWlw1hc34/exWDxh
 1QE2jVIFkZve4WmswdWkalwf4NJdChWb9RJS/NiE314NLoO2bM/WlzNlr8ScaqZhbU2i
 9RnIUaABMRsjGnK6JhwQMmHe09ufL4xSNEXC8OOx0jDhP+RdqnE/bVEXenXZFY+LjsIn
 Oa2w==
X-Gm-Message-State: AOJu0YwU7NFj7do2iPSVBq2bj57HddwHdkqsNa2j/eb5tpIg2tCBRqvf
 iu1G8GzlgmTwXZnyY728Gs9EeWgRBHqLF/kKGiC0Epq6Ms8RBNfHlxOh0Q==
X-Gm-Gg: ASbGnctWNGGj/188a0l44VzBvhOWxcbPsZBHkbBKICJJfviCKoSwr3I8Q9hm6Zjy1b6
 qAPtD7oe0m89SUK7Bt+Yu5VQU1bgDZoZGJBEdQ5ycl0YDs+JnOBczbhBoFzMXd318F9sbIwB6lf
 tfwMVxef4jFGokojhJMy8R0mpYYuOLZliVX/v6+n9SnYG1rwQvtQo7DbdxCVpb+dm59SaxO6rsM
 C/MJ2DvfU8V1VUM/7BYRfujJEtOQUwNRqfXlc8DCegONtsRXGLQWY4mI+G3M+jccrSuUYwtOg==
X-Google-Smtp-Source: AGHT+IHfF0L5cJPt5oPWlMW8QNu66LHDp1dGgdQ4GZvru6TWcyJ4DSiBuyrl72ZroJDezA2KYaI49A==
X-Received: by 2002:a17:906:c10b:b0:aa6:7d82:5411 with SMTP id
 a640c23a62f3a-aac334e4c3emr5287610366b.40.1736170964522; 
 Mon, 06 Jan 2025 05:42:44 -0800 (PST)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0eae74e4sm2243847766b.91.2025.01.06.05.42.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:42:44 -0800 (PST)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Jan 2025 14:42:14 +0100
Message-Id: <20250106134219.1914954-3-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250106134219.1914954-1-heiko.thiery@gmail.com>
References: <20250106134219.1914954-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736170965; x=1736775765; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I9Vo0aHA72neRnm1nwU7u1dR4Nx5V09umqNiLLXMqXE=;
 b=dMthewEJSY+eDRhKIBjwYuIxsBqwxedFdr1yplNmH7U/n96578rTg4+IhXbLTsz34z
 YG57PgXPU9nqkcIinwJ8a/p3qKNHIkp4CwGss+RVTEWETipvoDm083EGt+D0mwyhdVe8
 RZ52zhOWa3vnGYHxKhU9lWedVfT7k8UR2wzAjjpoFhouP+tYBsOGuiWPhLLVHVYbIHgs
 FkEoMDZBfpdv+Prf6P85AuOzvvsMf3FPIt4omppfyVU0uKE1Wau5+XSRfXOkQnLGvh4p
 BXbjhurMCfrY1qJ0F5jTENJ7c8fXtbE7KfXPHEySI5XZjVwoqhlrCkRNzuy7K2Z8vAjD
 UzCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dMthewEJ
Subject: [Buildroot] [PATCH v4 2/9] package/libyang: bump to version 3.4.2
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

The LICENSE hash has to be updated due to copyright year change.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/libyang/libyang.hash | 4 ++--
 package/libyang/libyang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libyang/libyang.hash b/package/libyang/libyang.hash
index e03278adfd..eb8388166a 100644
--- a/package/libyang/libyang.hash
+++ b/package/libyang/libyang.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  77a0aaaeb3df720aeb70d6896e32e2c2be099d48df73e3cfb52567051af3e44b  libyang-2.1.148.tar.gz
-sha256  0b7ec43747d211a1e49c53588b0822062947bab6bdcc95238578beab34cba5bb  LICENSE
+sha256  2767902aeffc55c55767f4ecfe5371c422174794edd8aa2b02028d5fe3f8b82c  libyang-3.4.2.tar.gz
+sha256  f4fbaa09c8b2faa6a873a38181ff860e2ff90808320f71deb369f03ddfb920da  LICENSE
diff --git a/package/libyang/libyang.mk b/package/libyang/libyang.mk
index fca0cd63f8..2f095c7e9b 100644
--- a/package/libyang/libyang.mk
+++ b/package/libyang/libyang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBYANG_VERSION = 2.1.148
+LIBYANG_VERSION = 3.4.2
 LIBYANG_SITE = $(call github,CESNET,libyang,v$(LIBYANG_VERSION))
 LIBYANG_LICENSE = BSD-3-Clause
 LIBYANG_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
