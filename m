Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F243CA5FE8
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37B9340B26;
	Sat,  3 Oct 2026 01:33:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id un9QV6CuquHW; Sat,  3 Oct 2026 01:33:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6128140B0A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991195;
	b=els6eUqerDyb+8dbArcSfzGpsid2UuhYekRyehutI7kQMeelXo7gte1L8NyLNZjAb3rc
	 xARY+Anfqg+uRRUWil//fPU1y+TcxbtbqHAk+PgFvkxXvjjzfYduEi8+XZcAAZOD9s5pi
	 CETd/AbYtAv5u6EfTVR1Ztkfd2mL1nhz6f7lG9iET+IwBYx3LmTAHrsD+MFEGMbFxB9fs
	 Vnu0AvZUma1YaNpaa26uT9e6wL7ROBHL3U6Is+qLPZDpLlecN4tdak6ttPty6Il9/Fzze
	 DRHfid82ljqNDLDs5AFBo9YNiS2sro6lLUpl31ChQmUfkKUXSRTDxg5Zsq86lEbQr1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991195;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bHZEv/a2a0NJUTyWvJ74o5WP1r8SgKgJmBjV37cmzIs=;
	b=UgJ1gPpUlcpjyiRxD8VdeIM6mHrPK9nxiRRODmmHsFPJ5vQsot7J+QDelYaA1qZ3pB2n
	 DAG/qHrS8j57KSYmUTvwQkAoa+Y7ArmAaToLbcTK1EIyy4G+bW7P2T2PF2l6/oPXJuGmQ
	 KWqR/T7g/HgP5mBNCIHxwsDz8hgWBM+1o7uMwfBDiidkKLpL9Vtjfg1cxnKkC2YU9dbI1
	 sNlDx7VI+Glygj2TUA8xCIO8KLmSOg0J5llsLBt9bG+FwvZnE7SGASswtXGpYM7PcEC78
	 jR0wE7Yr3Byk7Li6w25YDxwlObA6q3TN8u3GiOaKVgoYDoQTGDoO9BlcnFQj7YnC4HA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991195;
	bh=bHZEv/a2a0NJUTyWvJ74o5WP1r8SgKgJmBjV37cmzIs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mPXHj1FaVl2vfQ5QY2SbJM10cTRfEiJjjcVGmEPz9YAexoLkoNp4r54IlcjmonbqH
	 +yjFv/dgx1A3+XxzO1YC0FTg33gw/ooWi9GwzHPvzNI9L8veTcoCDYvgcFfbuzbyXM
	 wIlb8vzbMC3ioEl9zrzNjDq3+QNkQDfnW10UZpDCKa5ncX2iNPKVsFQlHtuFiyDta7
	 1pmVh65hcZbAH59OKAWg/F7dVpFjd3S8zbLVVD8ylRCPr1gy+IHy0sFFtIuA8BJ5k+
	 32A93Up9m1LSmOyCbQXF3gtirQmWZD7pk+TgOL+iitH9VNJzyjl/NiNdIvM82twyju
	 cv/TiqhwBO89A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6128140B0A;
	Sat,  3 Oct 2026 01:33:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A5B8A179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A149A6064C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCz_vY0rtCta for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2163E6061D
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991191;
 b=RRW+ESCEF5Bqd0gjqyiP8wsJEnt6f2YMr3IoTKp3h/VyF2yI8L5CRqAQKBYbdLzjyRRx
 hOjNDYFf+33LSgQNF85KzQyORpYxFsMTRWfH2YF1g32t+TDMQZr/r77LDBR8W2UauK3TQ
 2XrvIMF6Ex4l9+qUfwJmN/yUDsO1dcSFUq0vkKBu2422VMXEZZ62HZWlDAMymv0weRDPW
 nyhbD6MKK9YVxkVdj8Ud5rOYII88j2S+pX01ZbbJYxWsmw66sFO65Onz1CVh7uvKYwqfg
 Da1yyIFuDakhAnUagLf9PLinKSk+soE7zVtMD+XPWpCBAJTcBMzbMqa0LHqlMifbdRw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991191;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=1aLlQoIPOuKRKhHEvdUDKKMxTWuvwzIILB8itPyQZrE=;
 b=gouyNmiyFkhxwMb+VukhY5fbtb7oJC1/TZXV/fXpYOlx4Ah9J9pr4KPG7TfwfY/UTFeE
 Cz8AHWpV/50XNdSnk3ERUQ1nGLk25zO4LLTs78zXflLspuA0+W11xVHVUM96Ci3zj4CIO
 GwxbqOkzY21fYA2+q6eErPPtXfEzMek8linZQ6fHfbMJKs5we5dch2YAqd607b1dok7w5
 BPU1LzXvZI2MLnXehhxu1Di1NYys9GRG8haCH2e2LjVyqkwmirHlYjBv14v9O+zrEQi3c
 KBtaWmZsGDq9mVL8Mog/s/QoHz4US2jH0vsNWezu8Ybt+SsAcWYFl//a4GB8BjX8PQQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nm8zQJkI; 
 arc=none smtp.remote-ip="2607:f8b0:4864:31::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:31::f;
 helo=mail-oo2-x0f.google.com; envelope-from=james.hilliard1@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nm8zQJkI
Received: from mail-oo2-x0f.google.com (mail-oo2-x0f.google.com
 [IPv6:2607:f8b0:4864:31::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2163E6061D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:10 +0000 (UTC)
Received: by mail-oo2-x0f.google.com with SMTP id
 46e09a7af769-821ff9f018bso372690a34.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991189; x=1791595989; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=1aLlQoIPOuKRKhHEvdUDKKMxTWuvwzIILB8itPyQZrE=;
 b=nm8zQJkI2E/uT2FF4/AnrQyu7MLyUuGYAUBPQPI55vX5fSJryqQcW7F1sBYaS8cwxY
 FZrt7Ic6yxIbM2ZHVFPdDEyfR2EhkMOpd15pRoEpUTvdifCGzbCag1rAFdZZG6QPT21N
 hWVEFbABfgT9ZQ55eovVMjvQepFvfmuMCwdV1ijPwtx/6tGHHGL3FLLPzee46vL2InFy
 EsUDlyRmRgu2Ebh8gCiyPcqnpMj1vzMLtEkBGSHZXugvjK1GOZkaHZExBFCXfEFob5lK
 pI/3puk4Ur8UX8lKQynS/JBDE1y+ymG0EQXH5BHEE/mbb4YYQzJguBoGyFD4sdifMS92
 6uTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991189; x=1791595989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1aLlQoIPOuKRKhHEvdUDKKMxTWuvwzIILB8itPyQZrE=;
 b=pj9jhoPopfAfHt1IGdtZc14s3uAtuwY1RlDJx+Pz4xTo74D22nbb/Nfburm5EPfZvh
 2tMUKU2gMqCipv0qA6wyOgkc91tP+4mAGCpVtJoAei6uv/jTf1FuvrB5Ztg4ZO7ft9Xz
 JGhdPiCpntqFbRv89l3n4SVGmaNXmEh69TJGGcuU9xotkyJrybeU4SH0DiliREXU/ceU
 m2B9qLKnLQLdtsu8MO0bBGuFga6bEUuHUXyEo8KdClHeZgs4nTTDCEegAqIr+FodIEwe
 ozSG0s0VcEsS/PEG39PbsmM5jMKWQRH00fyLzryR5GiC/jy8BBED1cvPzdxJlAvv1tUN
 +TXg==
X-Gm-Message-State: AFuF++kFK/W9/DqpiDui7S50d5rmYpwOErMoEsVrgJxJN1z1xRom9ORl
 TEnhoq6UUnvt6zdWOF2iiGtGO8+GNJZzLKjsTHqpE3CW/2hZhWw2Bd30kpJYew==
X-Gm-Gg: AYBFou1Ful2PT/KX1oCXdD/4O1CH5AZ9ASQubeWYM+CrYvY4lXFg5lQsXg4Fiuk2k9z
 lP+2hNx7BSuN5YwhnDYob/jRfAd/H70qBe74+JwX6Yl6onSZ1Jr1uH52+55MRqqzbZBsBVTBttb
 M2ZlJ4VseazjZYFLC8aQ1tNDNZ5zMo/TCvCToBI/ThRne5t2xCZsOQP5GOGycI059oixb/BloTq
 SifzER9FdrvCsTGuLdYvvpse+Vu9yQmwtOcUznT+8gu2uQQlD3D/Qtth3QVZGHBUp2jiRPsqsyo
 Tqoe3mXxLU8ALMSOFRZT5MMLz0KX30xYGjgr8pK4LEKIZeqjLoC1EvZV0E5WmjgkEWygIWBYvST
 OhSpZvYJkE4ZRQ+j4V2cx8qKM7aWyPkU6zxUh3nEZYqm7z7ZjNN7LY87eCCabJDIguiipWEqYFm
 cxpi05EH+rZVAlyE1dGadFLr7UhuUrwSIQLM2TAkifvvIJr6eQr630Row2TxV5/612oIlrYQMhF
 oEewPEB1mQSq1Py/mSE7tbTBfK5KZmhRIkV4nnooqVGRaaR/3dlE6vgV/PQCvYaq2PMvx7kYrGc
 1jCw/mWUfwLpwaZyI4doFKyN9idqS6hMd5M4q+uJYXR8w88DOJERkuBDHn19OuMU0RUMaf+WEXn
 YQw3XYujdSp/TyOhF2RqGxBVhtP4yImzpTmzOetwtvw==
X-Received: by 2002:a05:6830:64cc:b0:81b:a5f9:3490 with SMTP id
 46e09a7af769-82283281f9fmr4256417a34.24.1790991189474; 
 Fri, 02 Oct 2026 18:33:09 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:03 -0600
Message-ID: <20261003013304.400979-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-annotated-types: bump to
 version 0.8.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-annotated-types/python-annotated-types.hash | 4 ++--
 package/python-annotated-types/python-annotated-types.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-annotated-types/python-annotated-types.hash b/package/python-annotated-types/python-annotated-types.hash
index fc92476eda..7d76c76c25 100644
--- a/package/python-annotated-types/python-annotated-types.hash
+++ b/package/python-annotated-types/python-annotated-types.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/annotated-types/json
-md5  5c943b7c51b0b7dcadf46da4a99c84a1  annotated_types-0.7.0.tar.gz
-sha256  aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89  annotated_types-0.7.0.tar.gz
+md5  e82458911a4050ecf61f2a4c6015b7e9  annotated_types-0.8.0.tar.gz
+sha256  13b2beaad985e05e2d6407ee4c4f35590b11f8d693a258a561055cac8f64cab7  annotated_types-0.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fe1049884b1a0d9342901e88e07f32925d24b3121d9972b6a6805fb9824b095d  LICENSE
diff --git a/package/python-annotated-types/python-annotated-types.mk b/package/python-annotated-types/python-annotated-types.mk
index b962c1a07d..677a1f92e2 100644
--- a/package/python-annotated-types/python-annotated-types.mk
+++ b/package/python-annotated-types/python-annotated-types.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANNOTATED_TYPES_VERSION = 0.7.0
+PYTHON_ANNOTATED_TYPES_VERSION = 0.8.0
 PYTHON_ANNOTATED_TYPES_SOURCE = annotated_types-$(PYTHON_ANNOTATED_TYPES_VERSION).tar.gz
-PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/ee/67/531ea369ba64dcff5ec9c3402f9f51bf748cec26dde048a2f973a4eea7f5
+PYTHON_ANNOTATED_TYPES_SITE = https://files.pythonhosted.org/packages/5f/56/a8120250d128bed162cd73c76d45f6ef9991f3e068f62a8ee060afa3104a
 PYTHON_ANNOTATED_TYPES_SETUP_TYPE = hatch
 PYTHON_ANNOTATED_TYPES_LICENSE = MIT
 PYTHON_ANNOTATED_TYPES_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
