Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F2C8C433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 10:37:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63FBD60E54
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 10:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63FBD60E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 234CA402F4;
	Mon, 11 Oct 2021 10:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtsnLEsNfnSS; Mon, 11 Oct 2021 10:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38E1D402C6;
	Mon, 11 Oct 2021 10:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 722C91BF3EF
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 10:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64ABB81D0C
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 10:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jnW_LmbmmtOj for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 10:37:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EDD681CEF
 for <buildroot@busybox.net>; Mon, 11 Oct 2021 10:37:10 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u18so54791164wrg.5
 for <buildroot@busybox.net>; Mon, 11 Oct 2021 03:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9UTNiuC6OwA8UmkTC4K7eoqepAIXvxl3gonb88aFgo=;
 b=L7qN38jzYhObP96l5t1POF+s49eYkzcwyVnvRSsyv6wX/1RLZpc51FIEtPwFvTRovF
 HdxYISeR5ZRg2XNLYWoUyu5nTn1i9RSsKoiy1Ta3JZPNZ98VRkdLyiBML/CtwtC5dsCN
 v9iK3BCRt3CcvXzodB6eODlAiHBu0iWbBvRuEuXLDoSqaa520HqZ7pHXG+JECsS2u8iR
 x9Ugx7BWm3srspf7E4OJCA2WvstwaBbNnrqLJ1PNzZxkl12qzi7ePE1w1yfl0SuLNPjB
 gfvLjV3HhjbrjXkCaqd18G9zqX373qRzi92IFu1TkuZ95s7rMvaCFruRZVJpqYYaIrRl
 ruww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9UTNiuC6OwA8UmkTC4K7eoqepAIXvxl3gonb88aFgo=;
 b=ptLGBF+0yUEx9NopQ+wkqZ+sALteXQsoy+f6IkfKGvLVB619A7e8DF+gPnrof/ZSeJ
 SSZxD9A2lr9E7YZQojjNAWGejaILs1e2BZhnqiQTQgqCsbHpmYnwyvpBnedIpuuJxn5v
 KgWYyOXWt6KxSZuWzraLykZLCOaLZxX6bZ4ljjRkMQWx+AwcG6PZSu3Zmodi/9TXDIka
 UFQbu3aPeT629tRfLeqVgpBzYR1oBUqyTSDaEvZngbOcgPuhR//cybsk9+zrrqPyTjlq
 sGzm6VEQvntJWGWiFn1dGRMv+w2XVQn2URLa0PU+N62SjD6QntyxHGoOSw0nPk2vdGaW
 UkUw==
X-Gm-Message-State: AOAM533DbDxL/DAXjdFNlqlrgeRe5/ajFUaTVZQiGXqgyApACiYNR7UR
 /aYsFaBl1ng5GlRlecdXvgdsFEAIVbg=
X-Google-Smtp-Source: ABdhPJyysGtsJxnkBoHSFBLaB4tIlePyd6mdjLOwoWv7HKHduKRcdAuDID5KLB6PiX0Aqui7F/Rhvw==
X-Received: by 2002:adf:a550:: with SMTP id j16mr23248953wrb.384.1633948628455; 
 Mon, 11 Oct 2021 03:37:08 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id x17sm7498287wrc.51.2021.10.11.03.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 03:37:08 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 11 Oct 2021 12:37:00 +0200
Message-Id: <20211011103700.153400-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nano: bump to version 5.9
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
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index 277f22401..c2af67a0f 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v5/nano-5.8.tar.xz.asc
+# https://www.nano-editor.org/dist/v5/nano-5.9.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  e43b63db2f78336e2aa123e8d015dbabc1720a15361714bfd4b1bb4e5e87768c  nano-5.8.tar.xz
+sha256  757db8cda4bb2873599e47783af463e3b547a627b0cabb30ea7bf71fb4c24937  nano-5.9.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index 2a20eca21..fba318b03 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NANO_VERSION_MAJOR = 5
-NANO_VERSION = $(NANO_VERSION_MAJOR).8
+NANO_VERSION = $(NANO_VERSION_MAJOR).9
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
