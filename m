Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8550CC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 12:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B303830C0;
	Sun, 14 Aug 2022 12:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B303830C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofckFcTo5Ckr; Sun, 14 Aug 2022 12:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3302A82C9C;
	Sun, 14 Aug 2022 12:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3302A82C9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8B4A1BF364
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8054782F87
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 12:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8054782F87
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ly99tXLCglgt for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 12:55:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D494819D6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D494819D6
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 12:55:59 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id b16so6609402edd.4
 for <buildroot@busybox.net>; Sun, 14 Aug 2022 05:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=Gmr9kOFb3PK84FdDau1Ev+/wva69UCQgs5HH2ySTRhw=;
 b=cTxZYy98FiaIUR/hM53PnV9fOnXRCSDt3YBVWxoTMJt20MCNKXc88gEnof2b4JHldh
 PZ/ahOe6G+9ZQtzI4PKvhhF3TDN74h2UXE+yTZ4LzwXSt6r+st96rGKLRpYkFFvo5l79
 qYtfBb6s++UBRWcqK5P659rYSfS2z+c/bBlDaC7qLWbtDkwvqZKahXzXHxM3M4ZIxQ8E
 TAF3QWxIM1TFJj2sTYBkPSIkCNJmC7Xve4PxzmuenzQZMqGNbSNnuxgxMaXZWy+42bNZ
 4vu1FccsfP6dQQFAkCbzFNRri5XZhNKYktg0Y7SsQBoJ3g+18iQ/jY4fZCRGKuDIqANu
 5/3g==
X-Gm-Message-State: ACgBeo0KsHa9yYf3sv7xmfrJhqFZwKz0YmulUTx39NReZ4wbM+6Vs5yi
 SmNIcrJ9C/KgZQrdCSj1HYbgGBm5UIs=
X-Google-Smtp-Source: AA6agR42vrc6fwXUaF9imir+Nzg5H24abeu8hf1tubZT46cXuzFETZeHi1kCMtjDAkp6E5RPNKuB2w==
X-Received: by 2002:a05:6402:2756:b0:443:4a6d:f05a with SMTP id
 z22-20020a056402275600b004434a6df05amr8757588edd.396.1660481757237; 
 Sun, 14 Aug 2022 05:55:57 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 cs1-20020a0564020c4100b0043e35ae2610sm4663568edb.27.2022.08.14.05.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 05:55:56 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 14 Aug 2022 14:55:50 +0200
Message-Id: <20220814125550.1227865-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=Gmr9kOFb3PK84FdDau1Ev+/wva69UCQgs5HH2ySTRhw=;
 b=LZWa+igkK0OyWDU4se6CIfjNqem6krKncnx/ThDN1PruIID7SWzkqPKHkYSS/D4cD4
 4jK8922OYPhPWzG3xUol19QUzB/S0iKrc3y1TDV/osiWlUOesW/kW9CrvSqM3P7tI2h+
 Wwo424OCJq+gjlR6hX1HBYI2TR2S0jHUkFnUCf5UW3X9K28ujMEtUZSRzZglp+mD1CRg
 9rAw1NVWs3AKla+x0jPekYmX6iAJMJK89XgWgZp8qwXUzNBjLwhZ0wsBUylSwmcduvC5
 QOWY9cDGLLrp1GBo2h2OTopHfT5OJ8l6IMN+2bpNheYt8IRnrEXXyJlFv0xT70oA9bQo
 6h/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LZWa+igk
Subject: [Buildroot] [PATCH] package/libcap: bump to version 2.65
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
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libcap/libcap.hash b/package/libcap/libcap.hash
index 7c48cd950..5fc817390 100644
--- a/package/libcap/libcap.hash
+++ b/package/libcap/libcap.hash
@@ -1,5 +1,5 @@
 # https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/sha256sums.asc
-sha256  c8465e1f0b068d5fc06199231135ccac7adb56d662b1de93589252e8cd071e13  libcap-2.64.tar.xz
+sha256  73e350020cc31fe15360879d19384ffa3395a825f065fcf6bda3a5cdf965bebd  libcap-2.65.tar.xz
 
 # Hash for license file:
 sha256  f58c80bcce8c929db39a23c32e924876e3311f3ffa54f66076c38056d38fa59b  License
diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 91e02638e..728a6ba6c 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAP_VERSION = 2.64
+LIBCAP_VERSION = 2.65
 LIBCAP_SITE = https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2
 LIBCAP_SOURCE = libcap-$(LIBCAP_VERSION).tar.xz
 LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
