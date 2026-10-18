Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73AECCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72D1340709;
	Sun, 18 Oct 2026 18:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIL_FngUCSf5; Sun, 18 Oct 2026 18:25:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8F245406EF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347929;
	b=VjekYr9Gr1i/NLCmpM+JKcTEfCiP/B+lpxWo79AqvWl/Qm2esvxpzqDS2+uHcSrf3Ysx
	 Zd0kGPcK3xgu5TUDBNqba0Rp75vvkg1slYqPjR9WFb8SZwN6l6k4/3+j/X1r4N8maeteQ
	 IQ82gxjfo05CIUC/h+y+Wa1dAjfArtwNO9JShAyNv//RmPGGAEb1oPtXZGyfkV62GNxvW
	 no1PC4uU2SYuU+CL+hjBxrhYdqGu0IO0NvjeOoMHfIj+8BtcU4LJBl00gu/kp4LfuQrYN
	 Di+Rlrocdd+n+hSmPLcLM2TgJ9zaSbFPUQC38d6WlX/AkbodrXW1SyfJGmur4YlTwpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347929;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=KzyOeiyJyvDBi+o3AHG8dSwABtu9cmkw2sXL0tHXSjs=;
	b=YIWmGN+e9Yy4XeO8nkZ+M4Q0YIiGz5dr0DPZtTJipkwEmRGXlDmtxuCX4jKidWodPfV2
	 CSsXpn39+5IpGpRwKfOYMuyxRtUpLknf47emPXThhqYBUYptE+ErNd/WZmm/aRXssCtEL
	 ycTCheFwqYSclZNG+7cr3ETImYrJwEvgCL+6ZJtoRZt66flNBqbIL3Di5HZ2WKQECQAYj
	 OZBRNvzaws5OC0VlmMpNpFe9pyQ5gpaLsKFYFgIfGlA5yctGVtLM4mHEBsdwtVBQ0Jbqv
	 Cu53GUaaMlt2EtGnGBbE5GLJ0NMWwQOTBwFpDEuLZ8boGBCeb6yXLvwrGU9/OEEAzSA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WQsYoP1f;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347929;
	bh=KzyOeiyJyvDBi+o3AHG8dSwABtu9cmkw2sXL0tHXSjs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=sIZC6YumPPYKaVfvA0JWzMi4wSPDGZHZgTMYzwHvInN8F1S6M1OpmnE/SwXAvtT4h
	 nVZ4kiDwPO1eH7nIpQxOgYDbWEm87F1iUij0H9gzMheMoc9PxBVj4flxUAB3uHBr12
	 1+7FVu+Z/ChtzaEiWc2Bgnu8QmF7n4BlNWP2BpBwYSpyzK8SrxXzMP3vtThD2eSi4F
	 /Jp6JCfUzLeb/6hqS/6glKd8owRIusa/Yf807dS3xmn87jFmpOy8YzX+W/E1IJCN0N
	 yd/oDvL1yn5CYMceKu6mb10o3o2w0A7zgGNMQ/G1EZydzf3mbAE1lLqOFQIWljBDLu
	 JX6ouk1VAaXyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F245406EF;
	Sun, 18 Oct 2026 18:25:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C411061
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C12AB40709
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIeSgugfHXgT for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D397D40707
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347926;
 b=rpmB+vB0Y4ak9cOw/dMU2YRVU+sW01t8i+v0/0cW++oljkjdEVZe5jz4RIWREABGDPPi
 j5OFRkGOnucGgDthHlplQFbLaZK81F8npFSJfrm61vD5dmyCBAbwaKL7H3mH96ySVd2X/
 7BG7i8DueJDPUzmoz8jUKWtJSR14Ko94PWlCGb03yiS4K9cBIJjra4LOZW8WYYJKKpCYF
 Yplb9KrRma8j4e2LcxvzhoGNulbRdoLNOHtN058rBLHM21rlFdx30G4XMkr1qKTXN34oT
 T8qKqwtnMKvg3Yd/EQHYR+b11wdPgjHm5P0k1K4VXLp2XRTCVGnNEvjioDe0Ty6HtRQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347926;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=g9Mi60Q3t6bPWfxdxdNgfhU5H4CPgXbLdk7HII97Ipk=;
 b=aXG8nxDpuumsp1BLeKTa6PfRBOhBt3P2GCqhfQe23RdQjqfY4EEygY/ffPRHdD9GTgK+
 OBz/LKChJqI0xvnmP8o2UFW7J3CfUyKr8rc7DhCdwUNLJ+H2tTsvFGJgg5K/5MUTbyCxa
 bystQqTdLTKsYPGtGTzbf2hjcGEizMmTJoR6RRN75wL5YrW808mGLdNXRD2EdC9G71Pm+
 jmGItsfdXt1b4vhl9dOUhff+EgYP/ngEzW3U3LmK2RxqBsFGd9QA5Ss44g3DKULB0RlyL
 1vEYMtihuUyrht0+0wJFsDg72yO8WMLyYHqABG0/idC7atRsysdm4Te2hcLK3FAOCMQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=WQsYoP1f; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=WQsYoP1f
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D397D40707
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:25 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-8470d7d430fso345026a34.3
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347925; x=1792952725; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=g9Mi60Q3t6bPWfxdxdNgfhU5H4CPgXbLdk7HII97Ipk=;
 b=WQsYoP1fu83DdJCi7+fAI8qrlA/zc+kmm7mjH7FmwiVQT0YWcMua4BzRUmE3jYVHZB
 4/DhrzQgZCqKh33KNKM9F/VDxR+8fcJX4yBpc2w1TfzKVhDJLox3nlkSdXglncyCvtgn
 1e4FjKEwRzM6rgzLIbqZGja61NJws/JI8mbMpGXYVzUj8HjpFng5d98xAZWlvulF1rZN
 k+EDQkFV22NfWFOZ/S5FhgRoj3Q7FooIWveIUDxjg+qfnSG3FXFa3JjbbwQxK+yK/Xur
 k00YQJdCictE9YxRDA7Op1uHaXABvmmNMv0disO7XW0t4fVaQM2MZ13qQvTq6dbL3lJ7
 2Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347925; x=1792952725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=g9Mi60Q3t6bPWfxdxdNgfhU5H4CPgXbLdk7HII97Ipk=;
 b=ltTaPHw41gRBBatPh0Dv/55aInbr6ytIZ/tlYxXih8PuqZjr2JwguHgD7SOwJlBRpX
 hvqKfOVTYJ0o9hk/TGjp6V5GKdlmyNFJS3yeQ2j03i3ETc99nFgqEAV115vbgsnIxm+Q
 ZjwDLTLMiIo5NpTewbiK/CiMYq70sczjdH+stHx2+erQoG7fi6MxW4gzvVXlULcUwNuP
 3aTEKg5Tes9s/2HDlTAYHVnLg48wUuOQXBhdMysbtmyafMMY8Nj0aYVGV/rVNg6uFWhB
 +w2WMTnn1+og6j9CykzP16Zl4s2LV+7yg1oydSBk6/3Tz/4Mj2yDV9+j1VuGASPTdShF
 L4Zg==
X-Gm-Message-State: AFq9FYLw+hLIVlSnWJlY7tBPSpW2/e5KJmWoTLAPbbA4ARXy1l9Cfhfl
 UfruE2C2BkLv1Oy4O6rYWF3J76Owl/CsQaWVaSY4wJBhx6gK+3k3uQgM+o6vpw==
X-Gm-Gg: AYBFou15vLLIjejU4JPcA5Jf9azNJJH+zbY597iX0I2jmb5ZKIFOCJJz5W2G4YZZujo
 WmOeNs4+Bk5EvpJ0VG5p0cdssEhTmIg0EQDOsDEBAB5eEa6uB9WMPfmPh2weiDndFqvaVpGcU0y
 xOdwKs0yT2bj6xZTzIbkeMfVn3pw0pakvEbEyoHw9tRjREsRvslI4Rf4PgMJyqKwqZR4B9KvUe+
 4h54oclRnJshoKrQgMwYQBTKeU8topdfax4KHc2ceuzlkAyo0/eU/1dGwGfCzknonEvwVq6acSq
 v+hUfnKFpXfO+o/0rD0+qmLqxphCh8j4LX4D3uaxiszfwjhecIrbo+HapSIoIrv3yUwzqgt527P
 Nf2mNyRyQDGjvT0MLp52ojjgefdbGD9REqz+TkRNDPF0MA2vt1BswvdY8gCpbE5MyKK+Ghq4Saj
 ydHPRDmdv3t8Icsn0F/ibrIxfqYqKIWuBELhYIwxvFw3x/7yE6Ex6o68VAc5zv7E6W75VgF31OT
 xg37NEuoEkF7pHhm9i95lzV/6dWyeWluh6LxvxwN7BUQW6lq/wY8jay6qqiTazn2SPCPzbI3egI
 qdkDvJTVhHdNQSRle1ju6ydtfQaIePYGHzq9EpedorrH71EWE12EHZGK7jneqZwkJxEaNtQko0h
 15Sa0IT3C7pYZQ4LJbFYPPYPlC43/pMDTUIVSyzrdMiA=
X-Received: by 2002:a05:6808:2384:b0:4f5:98d:d1ae with SMTP id
 5614622812f47-53cd2a5c092mr4152306b6e.55.1792347924755; 
 Sun, 18 Oct 2026 11:25:24 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:49 -0600
Message-ID: <20261018182507.536698-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-paramiko: bump to version 5.1.0
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
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 3815f5888e..818f4cd909 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  5767a11ec78dc1da7cb9e99559aa0ab6  paramiko-5.0.0.tar.gz
-sha256  36763b5b95c2a0dcfdf1abc48e48156ee425b21efe2f0e787c2dd5a95c0e5e79  paramiko-5.0.0.tar.gz
+md5  ececaacb7fe9cd84bc611c8f8d752369  paramiko-5.1.0.tar.gz
+sha256  239b5f9b2a53006cd54f83cf8495ee742083708ead947882c8dd2786de79f39b  paramiko-5.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 6f313ecf3a..a0ed755961 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 5.0.0
+PYTHON_PARAMIKO_VERSION = 5.1.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/62/93/dcc25d52f49022ae6175d15e6bd751f1acc99b98bc61fc55e5155a7be2e7
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/76/cb/b1fde76618d84b1acf54d3d03d2b833ba5878afd12b9899346cc080f209d
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
