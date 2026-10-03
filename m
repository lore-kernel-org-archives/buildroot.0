Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92717CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 08:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D40241003;
	Sat,  3 Oct 2026 08:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBrAn5Iz4j_g; Sat,  3 Oct 2026 08:45:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 556A741021
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791017141;
	b=L3Q7K1gzrKuO/y8TH7m5jkDDDa/HPiSuh/X2zGGm4zWfAONgjkhSrOJAKNDGRYwFKyAW
	 dU6eiuUb22TV2CJRKhffgb583101DoZGs55ZIdK37m+Zn/sCTtV6DB2sn3L1PF/LPQ4+6
	 FNisyO1eu0ldl8P8ERm9nFgGS7cxTsSIrRcJPaJ/21oeC3HzNanWHs1thtbodRYlxykcK
	 /pdYzywEI1xGUI0MB/dFAcYh8dQAybd2m+txaEvBSgtYuVJ6yTH4fjQCCbwL5ULUfH0qE
	 5ddhx5dbgOSucUt6IViUp5CB/E4zpg0OiYsCfJ2OJ2ghik9+iynsvWHe39JpVqta0Ww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791017141;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=NJMqgme8u0ErQbcuBlJoKVtP+Gx2LxfxMAvKCc9rp8A=;
	b=ZZXL/LLeTmfi2AQ2igoc9+m4t0mHOPl1yYAuIjhuv6aZ4vppuXbzSDggQ4EzxpbOSNt7
	 mt7HL2bgG1DHZB64zMUS2Y7dh0KM7mBzIEvpfodBF16tZR9kIttiw0s4Lm+8SqDdBL9lV
	 h5yGX1Rlf3gHB30O3/pZM6LqO69JrwuOxzIi8LACF4L7xcKxpSPbyTyGfzFw1VlwNcHQc
	 fHEcSzl0Z2dQ7aJBOAvNLYwBPFCYsPjXKqgIolNZLWthXwy4VC0JXuzg8bEm+Fp0Z6JiI
	 4WN9RHuRbGpQCGkK2HhfqZwHRAlX5rs18f1WmsmlAYYtEgiatD7mywp+oWFNOE1kAsA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MCxCVujL;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791017141;
	bh=NJMqgme8u0ErQbcuBlJoKVtP+Gx2LxfxMAvKCc9rp8A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RM3SJg+plgeXShAIKSlRwwDNTxl1Ea8L2XCLUurVftmb0RBz/XgbLSKrpenvz6z0W
	 1JfdFmRoeUckFHLDKTfWD3KPmOjbT/sQ5qnDB6qQhOG0fdcifvoaFtGhNLiGMaDghk
	 Dxxp6WikvcWlA2KEjmDcX+fbQ5qrMEu/CMDPfFTzlp0v+OwThZmjW26P/OWJIZR+WW
	 nx/tZe83FN/A+z7AUSZEaGa/OoZHyMfQCJ2OdXaf+26BEvXjlrjzp85apEXG2PZfkj
	 OTbWJysqz/S9/OB/IJ1E95rqdfEtcf6PHkZfZlcUjS4a+KBvg/ZT68sMUH9ziJ40av
	 RA5N2XL3ucbXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 556A741021;
	Sat,  3 Oct 2026 08:45:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AAC9E32F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 996BB40FF5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6LazNM7t1x3W for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 08:45:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C4CF441000
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791017135;
 b=Oi4qQw5Z3txlzDtnLEOybvFufU7JBJshT+pPuMcmtjp+iTY7HTo2saq7nKSRmJNvDfq5
 t3NktcGkSl7ZoWIkzu54quaMkKX6+N2vEKQnFLqSfWf7lsRydVC/cnE+gzDcC4A82TWgB
 OE3xU6GC+II4MVkLgW7ANvcqgie0on16fWibkP2+u9EumkmnKiFvi7HFOUHUuDvhptjv7
 JGrdwZ8C6OxZv0xS8Ex3fsqKlEk5tJ1jzPFBqKb+WvemZnMRLgtPClez1A9PxE1cJK2lW
 1XoxUHODabMz2MF4oO64V4eaVOi3WVh6d3sq+O7d9O+m8ZAuyFMEY575p0TmFA3ydvA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791017135;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=2pEIxxMewsNBbD50+gYKR9Y/QsIYm4aVXMurIOAUwnk=;
 b=f4u/O6ud3mS1yqAygI+SAj/uvST+3lovYzXuFRin+/KeR0damDC8csQzLEE2EVzzyL3Z
 7FY80z6CW8SjXjONUdjtMTMbUfZ2y3zuvV5P4bKlxH06oMFlF8Bo+pvwJtcKltMYmOBB1
 8b5irGKonzOu5x12MNT+ecuDwh6uByUTNqa4b46f07EJVSe+boB5TPD0BEFdNPQLd+JNK
 Aj12lqbT00Hb8qnP7NnPwzDe6GhYy6O/hztcB8v4E82WWZ4NMeQE/ssVzX8U3sWyr6CB2
 OzdOjd2UmVs1FhqyA+FRu1t2zm1lbnqVmYkvH52iBeU6hGC0YDTqUjsQJ8hYmVIDNtQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=MCxCVujL; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::2b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:31::2b; helo=mail-oo2-x2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MCxCVujL
Received: from mail-oo2-x2b.google.com (mail-oo2-x2b.google.com
 [IPv6:2607:f8b0:4864:31::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4CF441000
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 08:45:34 +0000 (UTC)
Received: by mail-oo2-x2b.google.com with SMTP id
 46e09a7af769-823d139c181so487476a34.2
 for <buildroot@buildroot.org>; Sat, 03 Oct 2026 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791017134; x=1791621934; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2pEIxxMewsNBbD50+gYKR9Y/QsIYm4aVXMurIOAUwnk=;
 b=MCxCVujL1qlgnKyLMBwwgd4+UJD+ASRjrtgy4Eh6+Clft3oAvUdihkpVpfReun/qiB
 TyT4DN2CGgdzw0F2/pfQ6Xr2ubRl5eDKXiAG9xw2/BXhqeKCGfVNk6HXcCgIcirrRQ04
 610ENi31u6EfhF6WCoTzp4V8hKhwkzzB/gANqxdrtsNgfRYSN8m4edwk9Ho5KNgyLmcV
 TQT274++YGGHHd5+zJpHSTjFAST1W8EzMeGZqUqFMlmzDgPoqBAE20dhWBgKneHoMKir
 e0RkSHjgaTAX8EXzD2RnndjV0CD4HKXnem61ifxpZwiF9dXsPZfyuOzVj2KsCEzOU7f9
 FRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791017134; x=1791621934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2pEIxxMewsNBbD50+gYKR9Y/QsIYm4aVXMurIOAUwnk=;
 b=NWbqUUV3QFzm3gcI+BbhkVJxUxEyuQcN6DV1w9ihd+6yRgRPJS4ddRQRWcIAGuHC2f
 b4XZpI3xPiNySGEGKGog+l/0ZaABP0/Vr01KgD72U4k65sESUYlpFG3iBVzw3bMhfMLA
 apeDlfisLXNpsZTbJFOIG7CiNyNSgy37kORQAtgnnuWZlEn4ylJmZ6ZbvLLXqFdHoI4x
 Ol3vtfVrZ0sOMNE8f55ertGE/FjuspJBdfg7x0gR8Ez5kutl029KZlvHgviyOA/Q9ZKe
 J8zk6QH+t0mAXEQeBW32qFNlFw9HmOvoFS8PCy/91WszD72fORLtzFgh3nQ58mVK+mPl
 1r7g==
X-Gm-Message-State: AFuF++nxU3oPI0IvLfLAOOcAc3e5s3UZgs1WiEg3P2mJFDggJ8ntWPgF
 L/Alas5/ONnlmEGIn4CwJFuYOKewDXltZtfikjYlZLBYP9YM1iJiuhq6izq3iw==
X-Gm-Gg: AYBFou2exbd6kKSUCZwh9s1an/UbZyZRTbPiMwI9EsedpR0VWsXZe0K2St6dbt3tV33
 DAq7oSJG8HWflnyp7AEYdXsO8D5Lh6zQmUTWGpjZGmz9sGOgXOXuFama3/R1wuRi4Il7WcwYrzL
 QcWjpD5+VGnJYYmUB2pQ7Y36VAzGPKcH6k5dN1apY9gTh1ZXibso+5h3ICB8LrIEPgyzzTfu01O
 ntVNT7LRW1ICZjoUfxjfVSlty0yHFIYni9TN13QJPufhkIxH7ho8CH2Nhsi1V+fpd0MGOftQGeM
 cPtNbipCpqwGUV6w7Aq9iuMWXtbX9dFcryvwv26v2LOxH3ouUNjEOVWXRbaRJ7+1I/H+bSNj9+5
 kBMs7bLFpZq2nxMV61y/qhudFFHWRbX+hDZ2HkPtOj5zVCHkDgn7wRBKyM6E+g23LJfK6Wb8EUU
 NkHZnmZRKnnQX5dkyh5+hxiWggm8SezKRSIX3mrs2MYpyiILowaLe9z5AHXZuzDb8bdivmqd48s
 wIEoioXLC6QJk5q5KNgVLNl0z2tE7QrHqN4zsdXUpugkn6xNtNtbmnPS35wCdqM6Wm4jN92hTcF
 dNhfLheIEZVvqpJ17Nh0wi1kynyhLZyaH0tH3SinZauE9ylR73xoDZAMrmxAMpHzVd5WeE7ieYg
 OZc6f8CnnAsmCL+IqgXHQccuTJ2AMCMMsmsrar5WPuw==
X-Received: by 2002:a05:6830:4910:b0:822:e7cb:3e8b with SMTP id
 46e09a7af769-822e7cb3ebemr3718996a34.30.1791017133895; 
 Sat, 03 Oct 2026 01:45:33 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-82273e27adesm5208385a34.0.2026.10.03.01.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 01:45:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 02:44:05 -0600
Message-ID: <20261003084453.545653-20-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-networkx: bump to version 3.7
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update license hash due to copyright year update:
https://github.com/networkx/networkx/commit/92392ba712131f01652a822b7dfb127e0762ee14

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-networkx/python-networkx.hash | 6 +++---
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index 5c39a1ebbf..c2a6b64708 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  eb7fada9285b28cc9d6327c19240a793  networkx-3.6.1.tar.gz
-sha256  26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509  networkx-3.6.1.tar.gz
+md5  c5d993f3052c946b77a36904d92229c0  networkx-3.7.tar.gz
+sha256  fd77a511bd90f39f3d016351345b52cf5319b813bdca01de3f755d3cca62e96a  networkx-3.7.tar.gz
 # Locally computed sha256 checksums
-sha256  3cf7c3a179d817b23b8b8568211769fefdf93797d207d984b8b2fa24d0220b33  LICENSE.txt
+sha256  6025f323ea29dc2f0ee0abd9523bf910186f55b0e148e6ebf646c55566278e2e  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index d2495590be..f35e3677c7 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 3.6.1
+PYTHON_NETWORKX_VERSION = 3.7
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/6a/51/63fe664f3908c97be9d2e4f1158eb633317598cfa6e1fc14af5383f17512
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/dc/76/3af777226b63a5e64a6b36b1ec5855c14e2b94a37096d4760e595fc43511
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
