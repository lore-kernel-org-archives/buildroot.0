Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E663CCA462
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CAC560AB0;
	Thu, 15 Oct 2026 21:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFxewA6yiKpC; Thu, 15 Oct 2026 21:52:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C02E460A97
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101135;
	b=jmeSYD4oCN7Qwr5GSQwOmKhVUCxVltvgDd7uyJ+U0Xy6tiKOVQDB4vMpoms1slOUqTSG
	 U1cmoXtcrdIDuYG3ILsQE12JMD0KegIE9BbG8a2AX92JRcjt09CEXArv3JtzB22K+8aZK
	 46MZiRmzwkUjVmhv3W9TkbmG+oG77jRWkPokQAzpOl8iFr9KlRPaaltI7CunEkiw7S9EX
	 k7jJW0k/WgBJWFDx9pip5ufg0owX6RpLLA0WSkROoq1tni9BTQ3vvsRrFjrSPxZTIjSXS
	 XdopT/IWVfOWqof/47iKrzZaNJKcZfyGgB1lUWYg8n66rXSuYIxA5+yWjQaUC2pyWlw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aMLGu8BE20zrRLc1B64TyDmOiUnYiY7RlSjLJJgi2Ik=;
	b=cVilSiSUmQwVFnf+yI5F182n424wQRnxG8vQKi6gYdpbCzrSKL7TO5gnM09yHa3PFG+D
	 9Ug6f79Gnj4otByi2eUzjMDe4c4WZKtPjr1ktSROILK9blD6rPbqR2ugylQASX7al+Oyz
	 XNMsPU8cF4ZZ5nHEi8kETrpNZok5cvzSPDICsr8mHKAfm97sEiYjzmUVbJXcXZIKOlXvj
	 UNNtHSFU7uYrPhIElFTT7lg7P1IXQU+xDMFHl5rIEb0CPKijq9uIwdntV5dktnemXqc69
	 xpjdCBUakRE4C0k4tbgUHkogaeHoW6Xh2Gn16IN4HjzJADyDC3SYQ44jSqNVxEZo2Xg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101135;
	bh=aMLGu8BE20zrRLc1B64TyDmOiUnYiY7RlSjLJJgi2Ik=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=X/qDI4J0rKWfyYolnP2Fwn41yLR6OSkEZUB70wCBpNNXH6izYp4lJH4BxHNbg4sXO
	 aFSj8ZghHE9b9yNJlH4m1vDf17KaWy46fnoYXUh8MI2KSi29CnQkDjuWzGQoKQp9L6
	 Iig/GLR8SoD5sKxdeZBGJ7PRV9Tt2wt575sZDz+DYZXJLwOAGy3naSj+lA/KvJ/27f
	 Cstj0S30xjasSLRf1KTLNtoksoDb4bCGcmr3hqYRKadmsfiZhwEjvhtyZbq3boi5kA
	 mgpGNb7NDpV/uND+Oc4ddUTd/9ew0OI31bbz6QAlf7spUq5N95DKCXpO9j7877mpjj
	 3P94Ju9woUPgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C02E460A97;
	Thu, 15 Oct 2026 21:52:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A4FC332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F01998121B
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LJQXdaXf6y1Q for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 034A68124F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::35"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101134;
 b=QTHkqRAjd+qjUNR1CuwUfZ7L7gYeTHtVAg8u/tA9ElNPzIdCQBz3W2dXkMHA6bek3JKa
 gYLcsK/CqZL+yGTXYWy0/4YFxl5kUOC3/0CZ5tCaWz0nCACg7wDrR2YsT5mvZf+sG7HF+
 YX27EWxOP1qjkF7cyB5qfnkzTzPFM/kXFtWA66ERgxu56NVFY1otTvSespOcw6KbH1Z+a
 muumYBuIUAD0AwsqLo27fJQ0T+Ugixa58kjMCb54TjXVO1P90/ey52Ju9/2kZrznoPKlE
 3hZdRPGNTVu866sI/uFtRPy3KualdAuacFfgyYi+MYgFFOpGd5JWuZW+5NbbmrL6Jag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101134;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=uByO/nT4ksaAzOQDG2ubaGJHzNAyeFumS1U7VDW7rwg=;
 b=igM6PwLNWkIOnib1gSopJIJT2Gf0vA/Q/vB1Mbk/9xTpgRpVCs2tCWQ1DCehyBDwqUNt
 BliP8nZAbZc0tqddAjEySHB30cNfLpwZ3pN++nA76TsdZlKM4FPXKXzINDy7+wU1ShAY/
 5Fw/3YhS1rpKOxcr8SdEXeBq/B2XoM1Ph/1cPGw4QIwTRXO12T4XFAWA0IZWJuzUn8zGU
 lPlW+fRX5tD8BvsRnp7dryfIbqJ3mGh7tDjLGg87KZyApeBPdF/Kbh3VLMhhQQsuX6ExB
 hG4PizQvUJQ+h2EQnU3zFe/gnRgm57NSRBMbwogLgQvuMZ49kYfaENy5oSBQ9HDvf8A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="Lwlvf5/6"; 
 arc=none smtp.remote-ip="2001:4860:4864:20::35"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::35; helo=mail-oa1-x35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Lwlvf5/6
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 034A68124F
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:13 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-49e13495e5cso391701fac.0
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101132; x=1792705932; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=uByO/nT4ksaAzOQDG2ubaGJHzNAyeFumS1U7VDW7rwg=;
 b=Lwlvf5/6+8qdNSK05liQkoaIBOY1EYwY1Wd3Czr3p0UWXnW6ZbX9o1ZEllAiWXx8N2
 OUNr/o0Qt3meLrqMD3Us6uc4kbRtzomSflqmbwySFZzSijQCzyO1ZLh6TAW3u9VPKmPu
 IoGtZQVJhrbD6pFrsA4F0qFu8tJz41s7gPuMAdFZSDxbmnE+UfUUfkW02pf7GNeifmIU
 2ZKqmBVPjCL+LV+v+zl8K9P91X3XCgB9X5MxnIgE8AzeYRhbVsqwS5fVuIb7WO4fkfPO
 Fk+JDq0u7jvaaOdo0Svu4rqkExJvx6b9q+dkczcnxDXyYCSL+WqNme7RzdZlrml/IUyw
 8oWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101132; x=1792705932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=uByO/nT4ksaAzOQDG2ubaGJHzNAyeFumS1U7VDW7rwg=;
 b=wPeaBH5/+MWX0vrz/QkvWaeCkP9cD7lg+gUCZjDKHJKCwExokkmQKUfprX2+p4vcJ9
 b0Tt4bDzmaxRLVo12kn6eUZ9t4eIM4xjn+8XMAVS/BSS8hHmR2y87tUKOfQgdusiXFP8
 ycWKvV10Mz3jIHUEZgSelxwMA/t6KXo9vnqe6wuHXi/H8E06z2f8J6K6Xm1bHWuUvdM7
 WNJK+5NnlXW7iFUJdiJHE8U6DyQwxWeCgcPpmnZGUkWlHFSMZr8r96AW05s+hYt1I3qm
 jng9LdxnBRx1KUPOiQ6QUqz08JMKf1yt1+ej036+w9cLOE/f8vJQSSa54LBNOUAdADtW
 UPxg==
X-Gm-Message-State: AFq9FYIEU7oZK8alA4QLqqzXsTPz6xvPTJbZeSzHrQd8Xa02cPWPjTr7
 8ZS+/IFlYdwNeduQwS/ZJvbyshxQDU7DENeiP4QjjV4MINC/IZowrltj9Qi19g==
X-Gm-Gg: AYBFou2jTVaFqCIDIxUvcX1zdGBmjxfBS4c2Em9wwYmpCrj2GLC2ut6rV2dtasLpjsh
 22FDGEBwxuy41Bmz/5e2u1ZA/yJ5Nqxx0yT9BcXTGkWUEP6MOxHEsGoF+JJ36RYgpjDHMHP9hFj
 jL1ncX0yEOSf3jIA3zNRXjbiGPTX5u7p3MdssbAw/7TXo+hHH2JASHqZ5ROQze0Y9AZXiRnJezD
 IXFiIsfqgNOYQXcO2C9UnjfhUgojaC7sWuePBW0VLqdn2nWKG6iIWw6sH5ZCZaJY5Tw+Eejl6gV
 xh2sSmpWESti/s/VBdpsOysxcpWNIZKeAO+eCLFBPoo5fnC0lKrtIcMwqSzDdrlwHwxCiKn0dnl
 /W1RIkV6+dzEdtbGIPPRyD6QepJ9n2EtYgstpXaKiAFEoLKI6m0qXJcKnHLzlLtFNU9SqVO0Bkr
 HrSW54e9flA4FR17/k8tw/pj3t/oFc/vfZ5UofSkUP2MwS54V0BkPEM8nOJKrAI/+QuC5PQPdjq
 3deSsHdBDQ4fysmwBa5ejNf30EfbjnOr52cdKZOa8+TdRQHWaIHJL7vYpDD4KBTaw5th/M5GyoQ
 4rxWMHGbBKIxrdNretGwK8LKrkRlu4QQKJoII7ilaGJr609UqZCouxiN1Qw9pqim/eJmf5LerSY
 cnoRQvXHevC7vqD95HsdiOYdG2seTwDVk3IGAvOVFx4A=
X-Received: by 2002:a05:6808:c227:b0:4ca:9850:4dd8 with SMTP id
 5614622812f47-536fafdd8ccmr1116159b6e.10.1792101132509; 
 Thu, 15 Oct 2026 14:52:12 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:37 -0600
Message-ID: <20261015215210.3426895-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-bitarray: bump to version 3.12.2
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
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index b9ff325312..41d9c1389e 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  0c5925f54da81648a14ec51368134c27  bitarray-3.12.1.tar.gz
-sha256  b712ea178c26c00b60b14bfd17fd0bab6138a05b515884b0ce418c0f6fecd2f3  bitarray-3.12.1.tar.gz
+md5  29c4785c85eac1d397d49fb27c4b1cd2  bitarray-3.12.2.tar.gz
+sha256  940b64a0701cea18c0698ef23ec2d9a038e47103b0402b19cfb298d71817d27b  bitarray-3.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  e19b1180b6ee73307a8545716be9b36318cf4f926aaf3eb43f7fde3396a102dd  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index 4ebd26e593..40dd9cb2ca 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.12.1
+PYTHON_BITARRAY_VERSION = 3.12.2
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/e7/af/9f136a8191822bc9277fa6af9241619ad6a21e0638b694bcea1b0f8d0d88
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/21/46/2e429b78a594006417d8a5f8971e027f3e6a2657c288d7875cf9bde64295
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
