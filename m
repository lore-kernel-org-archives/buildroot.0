Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECB6C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 20:12:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16AC460AE7;
	Sat, 10 Dec 2022 20:12:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16AC460AE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JhwuXshm5nLY; Sat, 10 Dec 2022 20:12:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52BB560A92;
	Sat, 10 Dec 2022 20:12:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52BB560A92
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B1901BF3E9
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7349E817B0
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 20:12:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7349E817B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mcYAsrqlQyPK for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 20:12:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 267B3817AB
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 267B3817AB
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 20:12:48 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id j28so1558964ila.9
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 12:12:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LRUePTrMfqdAfoCWYSbbeUC78cnvFBK92rXflRGu5tw=;
 b=Oe6f3WdvvX+dg4Zp6OC954OvZbgh5gbQi+cUHBgLQpKt0J+NmqPEgR3R4gJEwWKjqa
 pM2OBaBWCNPzeiLUmhep32HeHKH1+2nomns0ubLl+lE6E/AlgSBgrY/+VSRMev6B9/hf
 U9C/WPbXLrhNnDPS7KPrWT7TakfErL0kKnP8K5tKYTYSpLOXBfq+c6Ri5OYV6YIJT3pN
 X2CePwnqtFKgjnmAhIZuAiCiKx80il396n2JFclJ4twOCMW2Gnsi6Bq4tbgfAWjR71Lb
 Ce++L48MPgBKImglXNoCS0zqiITLKfMhgAunEomEJeCxmsHyp4JGgZ0hR/EMV277MtR0
 I0NA==
X-Gm-Message-State: ANoB5pnopYc45d+iE5oaGFFwDKiuD4STZcI2kWFr7o3H4vgvds/x+UQy
 AjbaGWWgzpAM7+oj4H8tIzSaNMZrrSgyG0MZ
X-Google-Smtp-Source: AA0mqf6RAvOtKXgRjmAkw5IhWDR5ov/ygDqevfbLjDAE1zmdrR2xRqQwpbEVvSgmzE7X2ebQbd/5Bw==
X-Received: by 2002:a92:cd0d:0:b0:303:3034:3bf5 with SMTP id
 z13-20020a92cd0d000000b0030330343bf5mr5971202iln.8.1670703167048; 
 Sat, 10 Dec 2022 12:12:47 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05663810c600b00388660ca27dsm1652858jad.4.2022.12.10.12.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 12:12:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 13:12:39 -0700
Message-Id: <20221210201240.3504734-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LRUePTrMfqdAfoCWYSbbeUC78cnvFBK92rXflRGu5tw=;
 b=gJOxI5i4tvkIad11l9OEJ0dJd6gc5GEwaGa8LUh+MF14kDF8AcfIOIKYidKqCOq6wE
 tji3/q6Jt74qPgj+YNNkX3cgEHIUPTwsNlwj3i2Zt+YQW+iHIlfUJRhwLIsv5GMSRRHR
 sS5eJZmMc1XhgMo4LSt4Qm/EVS4bxXChqJuhFb/6OmB0ipUzTdSnWPyzMVlXjOqa+pRU
 L95axTHR9iO7KTgxJZBL6Vwx8ORjbToar819quH7DL76x3QG7y+uNxscE7AvaQ+USZFu
 0+YlflZ5b8x6saQTf9J3CqelYvUNpeo4apOFpAZcsQIRNJlLeXakhLgtpFXPPDh8GgHD
 XqSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gJOxI5i4
Subject: [Buildroot] [PATCH 1/2] package/mupdf: bump to version 1.21.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/mupdf/mupdf.hash | 4 ++--
 package/mupdf/mupdf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mupdf/mupdf.hash b/package/mupdf/mupdf.hash
index fa24e741c7..6785aa163a 100644
--- a/package/mupdf/mupdf.hash
+++ b/package/mupdf/mupdf.hash
@@ -1,8 +1,8 @@
 # From https://mupdf.com/downloads/index.html:
-sha1  f27108668e876b47d7438e2a8b2295654e66f42d  mupdf-1.20.3-source.tar.lz
+sha1  27d75cae256450abb9f50cd00b3e5a895fc684cf  mupdf-1.21.0-source.tar.lz
 
 # Locally computed:
-sha256  6f73f63ef8aa81991dfd023d4426a548827d1d74e0bfcf2a013acad63b651868  mupdf-1.20.3-source.tar.lz
+sha256  f23fc1ad9081375d9c5f2318d6e6e5c5be490ecb70b10ed7167932afbe1ccfb5  mupdf-1.21.0-source.tar.lz
 
 # Hash for license files:
 sha256  57c8ff33c9c0cfc3ef00e650a1cc910d7ee479a8bc509f6c9209a7c2a11399d6  COPYING
diff --git a/package/mupdf/mupdf.mk b/package/mupdf/mupdf.mk
index 1fc54b2d35..e93a41bd00 100644
--- a/package/mupdf/mupdf.mk
+++ b/package/mupdf/mupdf.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # python-pymupdf's version must match mupdf's version
-MUPDF_VERSION = 1.20.3
+MUPDF_VERSION = 1.21.0
 MUPDF_SOURCE = mupdf-$(MUPDF_VERSION)-source.tar.lz
 MUPDF_SITE = https://mupdf.com/downloads/archive
 MUPDF_LICENSE = AGPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
