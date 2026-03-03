Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F8C2EDA694
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 16:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C03B61375;
	Tue,  3 Mar 2026 16:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPmzU8VJ41T1; Tue,  3 Mar 2026 16:15:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D72661245
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772554548;
	bh=P2qt6UqaGo/XuerV4fMq4oxPoOg3MUctvX1BnybzJXk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JVFX3VZYwaMCdTTU4nbrKDq62p7DdQrv9tEDZALdgi/8CIMAh0mW8TM2LElCXBdgA
	 pEtwRhTnaHAU94mUG525Yr7PAQp04qIXI0YcqLDMZM8GPB+YdyWJUhc1soq7AIAvQd
	 LpcD8QbahQry3wJXyEfz02M2E3SEvt2orHRRB3/ok+S3b4A4H03x9uvxmOAMvYeDQW
	 1+dWA3kzNCeRiyRKG6xFUfO98ZTArSuby4LpAudbu7buDJXbYOdZf3yKMtYwdR6X/A
	 WXAGrIajs6FPDJH9MLQwSogbQGTcl0yJokYoH1uKRp048B6lJtMkU4xQcgi+muKIRV
	 PyoAarA+wwH8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D72661245;
	Tue,  3 Mar 2026 16:15:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BBF9425B
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 16:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2024828F7
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 16:15:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60qPt-d0b-xl for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 16:15:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::733; helo=mail-qk1-x733.google.com;
 envelope-from=wsherrer16@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D998F828E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D998F828E3
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D998F828E3
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 16:15:45 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-8cb3b3e643dso344409485a.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 08:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772554544; x=1773159344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v9j5ckkguHxBfek2wxER36Wcl+xHvEcQCiCWqQFjqRE=;
 b=poLsKkW7D6i9HV4Q+wF+tAZkNretqOKucLQFymVMLP9AR8OzlEg236JPgHa9h0eSEh
 qvMQu9Li+bmrDyz2HydM22TYOnZYWyAuYs2mTIf09vCvESjPV8W6qHRbcjIZTxLmaqy/
 jYLYEhVSlgI8qLEfW3SaQtMYDj06UsOMp03fqtXAx9nrKKjrcSREISjSGHwe4/jPFhHA
 P0Z76c78+lbRKtlG9wQ85JXKvGmdJQS6MBQV2EkUIf9rknHktxEXbkFT5E1HBCrpxuGR
 MJ2u3zj3QKE9cHCn0NG2QZKps8EH6Hvx2671XkaRVUonjG47EjMQoWhxPHRAfY/jTnNy
 j05A==
X-Gm-Message-State: AOJu0Yy9pRTYZOjfPjlyN06VSp2t1536r98Me6DtcdLRzZjkaeRZD25S
 3Mv1nMEKPt/dxre2LLbZXsZ+R5K/MbNDitaZk9iyguoy7pGvDAT3iBpxYlYUsQpfs6I=
X-Gm-Gg: ATEYQzwEI9ktEKLjA9n8ARdhK4Ym2G9yO9HiWHmCdLVnwBPboos8DAXk261c5G2wWLd
 Upnr+KWk28a41J539IPu8WMa+6844t4zTJvSdICcM2Qx1VeCfYZ5i1cJQIIFFUpJJCkK87u6hJH
 iJom4EHvga48WfcH1YP2UWgU1UQZiv8H6j1qaZ2UANQcQOzg4DiykXaXcfIkJHvBJCUin2Hqu3b
 XBu19N4fAdS9XB/OFQRd2qoQ7/FyEmf1ZcX+2SfEKrg99mdk3dbq7+/znWsz9dQLQiKNVWw9G7R
 +W9WrCIKOYn36ebWsrEQciJQwTMypjaoUjYEJZeHnfAMZFOgXZWWHngi5ad4ffbPs1qMpiolPkW
 5sw1e+PgV2YEPMJ7eo7NlUXPShVRJKyaHqS+mt9WlNlBLEEaNgT/2ECbLpapiidkBrPcfdhDcv4
 bRRvwgn2B7DgKu/2odiJp9cVavUKEim7Bkvx9kMt6yMTpMvNvNZEhf/1w=
X-Received: by 2002:a05:620a:171f:b0:8c5:3067:903c with SMTP id
 af79cd13be357-8cbc8e6a228mr2089916885a.11.1772554543828; 
 Tue, 03 Mar 2026 08:15:43 -0800 (PST)
Received: from scooby.. (152.sub-174-216-7.myvzw.com. [174.216.7.152])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cbbf66b9d9sm1433918585a.12.2026.03.03.08.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 08:15:43 -0800 (PST)
From: William Sherrer <wsherrer16@gmail.com>
X-Google-Original-From: William Sherrer <william@sherrer.com>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 11:15:39 -0500
Message-ID: <20260303161540.2906268-1-william@sherrer.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772554544; x=1773159344; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v9j5ckkguHxBfek2wxER36Wcl+xHvEcQCiCWqQFjqRE=;
 b=AZaPvOIw34GD3tCTovXSmAdfJV4SLQF5XkZX2OQVfG0AT6gJ1cviiYvV7Czuhz6g0e
 D75Cu/oA8jb6GXxc3g6DBAxvFaaKCXxcIfdCANF2qA7ZoKryjCqnsqQlO43WQ8lCDsFo
 zUkD03shUlZfwZRXrJ+mikftQZya0bHB8BYgswGG+ut/11AWlnXqIRcw6uD0tRXTNhMq
 wXGySgAhgvfZ9MaPcGlmXM5fSwnfOJ5wF6+n9G5Pk2K7ra1BVHbHdyhzZA9dctFLpid1
 8WJ172p+BTcYzyOBkX8uBDmraA0JLCYd+evJyb9wlqEp3E+gc3g4IS2xtIaCb1Wp6qGs
 GRiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AZaPvOIw
Subject: [Buildroot] [PATCH 1/1] package/ruby: fix extension dependency
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
Cc: William Sherrer <william@sherrer.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: William Sherrer <william@sherrer.com>
---
 package/ruby/ruby.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
index a9668e36f1..5d5a34c096 100644
--- a/package/ruby/ruby.mk
+++ b/package/ruby/ruby.mk
@@ -6,7 +6,7 @@
 
 RUBY_VERSION_MAJOR = 4.0
 RUBY_VERSION = $(RUBY_VERSION_MAJOR).1
-RUBY_VERSION_EXT = 4.0.1
+RUBY_VERSION_EXT = 4.0.0
 RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
