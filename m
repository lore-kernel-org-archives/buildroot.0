Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AE2C021A4
	for <buildroot@archiver.kernel.org>; Sun, 16 Feb 2025 15:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4124840E46;
	Sun, 16 Feb 2025 15:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mz7lqNeOcF_L; Sun, 16 Feb 2025 15:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C2F540A04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C2F540A04;
	Sun, 16 Feb 2025 15:35:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A355C8
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C2A581136
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bg7z_TzdD8iS for <buildroot@buildroot.org>;
 Sun, 16 Feb 2025 15:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::933; helo=mail-ua1-x933.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D3DC81165
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D3DC81165
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D3DC81165
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 15:35:15 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-866e8ca2e07so1089327241.2
 for <buildroot@buildroot.org>; Sun, 16 Feb 2025 07:35:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739720113; x=1740324913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J7BNMbkoqYxSOCzgbFSGuVOHbiCNTNuBQbfXxjgVTLo=;
 b=kz+FxhQl7QfEiWphC8x+e8I9WpQfprn1vkdfi2O5ESIMhmHjHrywNOhTi+vzD9np/J
 NqsO9CqJjJqjXJc5UN8GLnTJMeHC5jDvsz4EdIYOLOGw0BraOMHFp2YHqjlaf0lBQm2L
 36z+RIa7d4aaqDbUuGE2XA2RVwkXd9dpWPwdzPjBV4Ulcb2CnsafmxadWW9MPRoFiMRl
 jGqCWbqqmp9gAhMniiIgKKSRQql8Or/MpLdFd/JrgRIKqP0xvymWyBzHHzVNwZNJIEEJ
 PbzOT2y6yLD61T+fOQV4VXKiO1+6E7OIu0cRszpWRBbHAoVZjZKFJ9EOOJzkANDT+AgH
 +rRw==
X-Gm-Message-State: AOJu0YwP+HKZqXdFIwDWNaZUHdcEv61m4SDzOCdslDUaHusls6U1+mSY
 0TWYMVKoEk+xiOsdQSBN3uvN2u4tG2XMtz7Ka5A3rR54OGdXoZm7+KediKlZ
X-Gm-Gg: ASbGncuD33AdSRBapwqeC1MmAbVVmso9BFluA8QHCoO7MXaW7aBieE/p1YKxqkY/0GS
 k9jsvrgsMduJ2j/nifUgiiF9vE6VSFJcF5hkzMaBWUgV0Sq46l53C6GJgJTOraSe8dJa5Mf5sNl
 1o7CoxWp+VFFQ2LKwxIbkf2FpB7usJLqUBJ+7rQsHMoUFH60QQLP+cF/NxKJ/kwwXU4bgxLmZ5w
 Lt5Y2OjK0Izcnmrby7xQxaMTff0EWiUuMdEQXauFwwDXiXtA/Hf/FjwInUcNoGGkitagyeaKm2c
 lQAkSnLz9hOTX0iXu3AIpd2y5cHkREh+/IPt
X-Google-Smtp-Source: AGHT+IEjlJ+/ivX78l47hAMsYgJZ2Jpy19Eg+03hQilY1GO7hYZCDHE5dZmzRc0fUj0yh6Q5lbRqtg==
X-Received: by 2002:a05:6102:4b12:b0:4bb:dc3c:1b72 with SMTP id
 ada2fe7eead31-4bd3fd504d1mr3404109137.13.1739720113598; 
 Sun, 16 Feb 2025 07:35:13 -0800 (PST)
Received: from localhost.localdomain
 ([2605:59c0:148d:1710:69c6:af1e:5931:a271])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-868e8548ae3sm1528875241.2.2025.02.16.07.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 07:35:12 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Cc: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 16 Feb 2025 11:34:41 -0400
Message-ID: <20250216153441.2706067-7-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250216153441.2706067-1-gilles.talis@gmail.com>
References: <20250216153441.2706067-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739720113; x=1740324913; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J7BNMbkoqYxSOCzgbFSGuVOHbiCNTNuBQbfXxjgVTLo=;
 b=EXobrTCINA17mSGXmUStSX8jxCYRVCHx/oe7w8+bUlqFqOkOliZA9ckpG+a/SaNiG1
 CQLk3ajtAfevgWEWoP9Hghui4EybKI/rKz0OzQOU3f0G8k7HCl6k5RiqBXGe+moaY69y
 c4LuwuxQelagcV1KQitAo7JGEnZ/f7fnMsIU2O4xa2cnFjxKDiM1WTOyiV7c9klr78o8
 0Y/Y9BTDc4ASKt0Bk+XK/oVJqIcVLJLIt78vyf7IprORcL+a/QbP1e7Oyo9EIJufmn8n
 wml/6g6asC7xDr9cf5w//LVARd5Ytzrf8aCNGTIEMW7yfARgZe70mMrm2ntDSwSh27w7
 5QcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EXobrTCI
Subject: [Buildroot] [PATCH] package/xapian: bump to version 1.4.27
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

Change log for version 1.4.27:
https://trac.xapian.org/wiki/ReleaseOverview/1.4.27

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/xapian/xapian.hash | 4 ++--
 package/xapian/xapian.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xapian/xapian.hash b/package/xapian/xapian.hash
index 01d6c19ad6..898d2e4eff 100644
--- a/package/xapian/xapian.hash
+++ b/package/xapian/xapian.hash
@@ -1,5 +1,5 @@
-# From https://lists.xapian.org/pipermail/xapian-discuss/2024-July/010052.html
-sha256  9e6a7903806966d16ce220b49377c9c8fad667c8f0ffcb23a3442946269363a7  xapian-core-1.4.26.tar.xz
+# From https://lists.xapian.org/pipermail/xapian-discuss/2024-December/010056.html
+sha256  bcbc99cfbf16080119c2571fc296794f539bd542ca3926f17c2999600830ab61  xapian-core-1.4.27.tar.xz
 
 # locally computed
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/xapian/xapian.mk b/package/xapian/xapian.mk
index 7677571288..187e366066 100644
--- a/package/xapian/xapian.mk
+++ b/package/xapian/xapian.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPIAN_VERSION = 1.4.26
+XAPIAN_VERSION = 1.4.27
 XAPIAN_SOURCE = xapian-core-$(XAPIAN_VERSION).tar.xz
 XAPIAN_SITE = https://oligarchy.co.uk/xapian/$(XAPIAN_VERSION)
 XAPIAN_LICENSE = GPL-2.0+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
