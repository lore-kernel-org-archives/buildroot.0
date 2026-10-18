Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2615FCCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 14:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C536A606CF;
	Sun, 18 Oct 2026 14:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXzRBJ_ohnOm; Sun, 18 Oct 2026 14:24:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B78A6606E1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792333474;
	b=X1zGm5IA3+qVUErlIeaaHYunW3oOP7FrwaPXmUYjIxlsy+pquWlEdNiH3uTZC046XH6M
	 4AC6Lm2lNStPj1gZOj4QwDMX9G/MSk2U3t8V80KFIk5RfyXMmB46KNzQJQaMXi0lycT+A
	 W8Jepy27xaofAkOHp4SSRju4fgVouQDp30K88pLnZjtmrSKCBiZKanESAH4vLTPIfl8YS
	 +s43KnZA1DGhiM9pzazRwD+GTteV6D2vO3Kk2Q7yiWG/afvXdHcNbbvYxFsnoVOvmhDlk
	 Ugak3xPJ30wYYzlU3J7YVeQQHcuFl6YpiYGhS4AtmUgpnWDstqaV2np391zEGFHtkQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792333474;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=V5pgx7U+4AKuns5iZ+0wxT01IWOUAsEej+s2GNQDlws=;
	b=VysCqza5Bo8EvI8mrKLT2z5SQuSGH4YX5I/1jCCDXbNqNx3zFS57ZdJpfmVHnFvSvx99
	 83MeoqulaAM5G+U/r6YFVSLC/RhI1X+P+mfnO6BIgvF27bqBYcG76vVxttIzEunMq+/7m
	 B5/nXYtpFX1jh4PUCC75qAGtko9XvxmInV05FYDyNgJb7GMyCFgN9yCxgM+Ue9ozfhZKV
	 tb1M5lDDw9YRtVKnsT3hd4UodZJEMt5owqg37tJ9CPZf3/Zmfn0+a/Y9CRcd2NZ7Pb0cR
	 qD3s/y0x8+IyfOvTYnJIB8dcdaHADJqd0NRlcFLaRysb5V3URKVSWMuQUc7Fp2uXQMg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792333474;
	bh=V5pgx7U+4AKuns5iZ+0wxT01IWOUAsEej+s2GNQDlws=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mik/6vGm21+OidGIQZJmRmWuctWcqbcLIvxJFZ3Fb8Mj5NOsUyE0rXumnffdImajn
	 NezB9N8XEc6PBF1wdpQlSTojdEsvFvXvuECnbDF/04BakN7ojkGrQQ/7FlK2o5u5as
	 nsT1SQj2OWlKWf1ttXSb7akRMoZmpEPl9NAK6C/i/mLOEmWleZWDwHIc5giU26UDtz
	 rYj06ltghslJJm3x2vYIhZ+uEMTQ/dQDikPZZV/3Pi+R7kiCvAzoGIwQNPoY+9w2sf
	 7Xsmj3ezJZgQol0Yzu3seXTMGdv/HtS1upxTjonNcpJFF7BYPImg2xyaI5QQUTsUN6
	 4ZW3mqSEbUFlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B78A6606E1;
	Sun, 18 Oct 2026 14:24:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B802761
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ED3B605FA
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3IPW_xMXav2 for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 029AD60601
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792333466;
 b=GfO0hKsxXfDO0OElXQsuiGcczVxEcVyf4mItz614o8M4zjT225P9PyfRsAw9+h0cVpN6
 ARIZAq1k3Lv1cuseljW6F3npFJ0BhOBRnahmg/d1nKkK5jMIwLjidBXwCBrJt5e2aT96q
 jayw4bkYlbYvIWYaweoWwY6ml2BKqnTWnZO4FeEsrh9eR7lF52kRClDjHXIckoJh28e3C
 crH5ou2PCrxTOr+Kw5Kz5Y7xRj0v8y4d9AqbSba3Xm72tXKIuDhZTs4Pc26kvneeR9vJD
 wbbcfypN5oj5PKeiWDEIdioyULFp0ecNOYh2wp6MYizz1E/W1S1/A/mEjBTMTCl/94g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792333466;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CU7NIX43QUUWgDqcss7gUB4+47/4sGC/NU9S46r14kg=;
 b=K7bZ8fF6VMvDtyzImT6P/q501ax1ZFD+qy8g7xfFNI203G582BM7+uyFRUrjFtNFEPU+
 /SwdJcdBrbL2Etcgh4+H2k7v9xWJdwhEjIvH6IEIOlWBNmBpfGkTbxC/VFxhjfNfydW6X
 Y4Gw7/d1cT9obwv6EDXAElq1LHbV6/suiRnEIDCxsFx1pCPV7vfETV27niHQXJJBZd5xL
 B0rqUdQOst8hmfy0OqoVy+yaXJ3qA/qeOrWpOXm7kfUvb8yua992Uma7Kj31SLozcoZyx
 KEGDHJggIw62vI5z0eaxDriQh3r7iebM5cg20EuGlj/SweSB5LZQ/ULJIQWEW6BGDig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 029AD60601
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 14:24:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E545B98290; Sun, 18 Oct 2026 14:23:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:57:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ace110ce2656eb9aff799fd78953e4a0f2f1fe8
X-Git-Newrev: f9eb1cb09c7e96b9891a9c866617a20fd6482e42
X-Patchwork-Hint: ignore
Message-Id: <20261018142303.E545B98290@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fonttools: bump to version
 4.67.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f9eb1cb09c7e96b9891a9c866617a20fd6482e42
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 388546308e..23167e17d8 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  2a762cb1eff7c310f0be506618a23e40  fonttools-4.66.1.tar.gz
-sha256  64967c6ddb0d4c610dfd8cb1485981b2d27972ddfb7d4bbbd9e199d2a089c450  fonttools-4.66.1.tar.gz
+md5  95a2a896db1eb6f319ec454d1d9490fd  fonttools-4.67.0.tar.gz
+sha256  3cb57e6600ca77c0b1729cf8adc23bc0652633a37f18cfa934d9c7bc3de25519  fonttools-4.67.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 028861f4ec..0c82bbd62b 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.66.1
+PYTHON_FONTTOOLS_VERSION = 4.67.0
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/87/b6/126c659ab7e0e03e01a5f5d223abf7b2c0691ae92718085a212a3924a2a3
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/94/36/102e180f8f5dbaee88b26595b01ca8aa80bf4e62128d9aa94265b3996c96
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
