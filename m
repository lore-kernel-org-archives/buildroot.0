Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB7AC3ABCC
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 13:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 060FB41554;
	Wed, 14 May 2025 13:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wD4SBMBcd5qG; Wed, 14 May 2025 13:43:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BF5E4154D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BF5E4154D;
	Wed, 14 May 2025 13:43:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F7AA150
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6566940C0B
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SkYnLKbezONC for <buildroot@buildroot.org>;
 Wed, 14 May 2025 13:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A02B404EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A02B404EC
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A02B404EC
 for <buildroot@buildroot.org>; Wed, 14 May 2025 13:43:25 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ad243ec738fso66056666b.0
 for <buildroot@buildroot.org>; Wed, 14 May 2025 06:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747230203; x=1747835003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRuHBt0PfHpVe3GcTNIfCcsYIaGUI6mNBbmWmJOsBsA=;
 b=BNBF6Zde5760Qht8jWqBDJDBg9GmnYOWyQXHkX/4gTo5RlFM6F/ryqF2Rm7cx7gWDi
 dD8KPWJL78ZMbuEa7txDk0ySxUss191ozdGgIq5yEn9H1wNkHZrOyajZNkB0JYK85sYZ
 UZT2YGLLfefQX9/UqyOQBwCAepUK1qN8JYCJPcfD8k7nvgVTqPYA+ICRk2mb1lJzv8cA
 g9iKxdrXvVOP0inT5PnbaUkFH/QEaThQbd7bojIeaX9D+/siBdMveD/pweOMj5OvHnF/
 iMVKMQ39GYoiWLP11pK7Djyu4PX2D4g9orHSckomasv4lIJHoxQhT1+p+SVa0eItdJ2N
 VmWg==
X-Gm-Message-State: AOJu0YzhC8Ovc4a3VyQ+nzoL7afSif3+a4q8GocxYhM66yWJA3h1Ltas
 Q12R0E2QdziQYAJfMIJURhWf4jw5JVWeEEGdYxiQGuCDi25zZCmyG/fGIczFUYhvMj9JjfSzz8M
 m
X-Gm-Gg: ASbGncv1l4iLaEWreO6b3Tms7tmY598Xye2GFteiygkk/P+STC3wcmoaQOaczvOdJAE
 5YtlCfBxhP1hA6gxP+xbCSbQGAfDUhmVSA8XYNh3XJeggqfrLqokmAEl927aIdxncxjNn+tTq+N
 gsMgYDvrtqhghGjoYHPf5s8V/aoAMqQ1hIE4hym0jEbur9RfD6jzQe+pLdtuIAAKvq1UQtPV9TY
 3zeMU65Xsn4NNNdbjUPDtvy83zwrWY5JLVLKhaX8XLOdpTndrCkp9bNOt9o9vuhnpyWHk7hl/DY
 FQe+MiFOMphSY2qwjo0g0EUgfXrWb1Fhuv70QNdtkGTByi4kUazNfMLMbCc9pDk/azSqWnTwtd+
 tiJNgXSQ6CSh+QTz5FyzetEngnnMue94SwiK4MDXAI9BjeoqrMaXQIEZINVaeReTr0FHfvBEYsr
 FLTJmVmaRv6+6bOhmXsPFm
X-Google-Smtp-Source: AGHT+IFKo0aRE8K6ybJsKClNjsi5RLOzo7SjIp1GPl9YuE0EdvaDfCOii47G9zcqy4xRuXPg9DRqJg==
X-Received: by 2002:a17:907:2722:b0:ad2:3665:9dcd with SMTP id
 a640c23a62f3a-ad4f74cd7ecmr98553866b.13.1747230202832; 
 Wed, 14 May 2025 06:43:22 -0700 (PDT)
Received: from fedora.amarulasolutions.com
 (2001-1c00-8182-4700-cf31-04f3-d898-af42.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8182:4700:cf31:4f3:d898:af42])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd3a6sm934783866b.131.2025.05.14.06.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 06:43:22 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 May 2025 15:43:13 +0200
Message-ID: <20250514134314.2405052-6-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
References: <20250514134314.2405052-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1747230203; x=1747835003;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zRuHBt0PfHpVe3GcTNIfCcsYIaGUI6mNBbmWmJOsBsA=;
 b=kqkLohL6Lu6qnRijLnp/Ey910+sVJLZwQtdCCkfOTpkQUlO1feXJ/GMGAQLi0gsAfz
 yg0GxXuNh7SZ+wNYiuABRPJyFi0+2JsNmz68jBsgzPKmgYxWIzJZpU1xFz53j3C1UEO1
 vW040asuCP7NfvkAAGM1JFbsaDsxw/irn5RYs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kqkLohL6
Subject: [Buildroot] [PATCH 5/6] package/fcft: bump to version 3.3.1
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/fcft/fcft.hash | 2 +-
 package/fcft/fcft.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fcft/fcft.hash b/package/fcft/fcft.hash
index 431f2218c6..d95111d4fa 100644
--- a/package/fcft/fcft.hash
+++ b/package/fcft/fcft.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f48c793f354b8be95477e475dde7c98ac9d2628c52ecb42029dc6d20b52d787c  3.1.8.tar.gz
+sha256  f18bf79562e06d41741690cd1e07a02eb2600ae39eb5752eef8a698f603a482c  3.3.1.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/fcft/fcft.mk b/package/fcft/fcft.mk
index 62c85a15c5..5fe38b5bb2 100644
--- a/package/fcft/fcft.mk
+++ b/package/fcft/fcft.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FCFT_VERSION = 3.1.8
+FCFT_VERSION = 3.3.1
 FCFT_SOURCE = $(FCFT_VERSION).tar.gz
 FCFT_SITE = https://codeberg.org/dnkl/fcft/archive
 FCFT_LICENSE = MIT
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
