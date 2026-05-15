Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34776CD4F46
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 22:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2ED541EEC;
	Fri, 15 May 2026 22:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BjmfHkGSQN-b; Fri, 15 May 2026 22:43:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E8C341EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778885001;
	bh=6xqjnHVCYrtTY9laBC4RlrmrviwSPT5lsFHBdZg32cY=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ULhWy5ftEV/LBbY3keqIshf3rdte/9daPa8n6madRQFdYlRRb87wXXffYWkc6yC51
	 Ym9F7Ii4AZUaJHC9UeB3ZtXXEvVVwEdCg6SVCZDAjSX82ju5QZI+9eUPJ3qxAeXeWF
	 +vU/PpINHroDoE17Sl5BgUXMORdrJgASdF0wPJymhlNFvsA2iflgcdJlgKXX8gHr+n
	 oaXJ1x1WX9vKUUjxJKvhO7N9dL/od7A8bJQxaaTgz5wsmVEy9xh9G2EiX6x9sOu7fX
	 PsMps9JiXi7BC6u3Gd93wclkDYJnbfDpHGzw2gUAJdBLs7YSfKGEp8UJK8DGeFOdxK
	 faieW13/6nmMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8C341EEF;
	Fri, 15 May 2026 22:43:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96295282
 for <buildroot@buildroot.org>; Fri, 15 May 2026 22:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 877D460E4F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 22:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKeJP2cWfDoK for <buildroot@buildroot.org>;
 Fri, 15 May 2026 22:43:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D64761798
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D64761798
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D64761798
 for <buildroot@buildroot.org>; Fri, 15 May 2026 22:43:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1Ygz-1wPP5u0wsF-008bZP; Sat, 16
 May 2026 00:43:13 +0200
To: buildroot@buildroot.org
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri, 15 May 2026 22:42:56 +0000
Message-ID: <20260515224257.29328-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:oDmIBwTQBa5WAwdCxz5wvUGdB7r2Sp369zhL4eNKC1pZuklQezU
 OhqISPoDgvUy7QRT6XefeBt+xz1KgN7nppEhMqJE3R2GYlNyPR8bixYXUmgitwQjGttmiEq
 iHYZHVarxN+P6j6pj873uIzklRcpaj1xtgjT/DrmpMKwIuI3qqwfj5OZvE/Un6/nyHI3RUv
 SvQx8NqNSWzI+HbFhxQZg==
UI-OutboundReport: notjunk:1;M01:P0:KHcRPHfCDR0=;KjODxCBlVqbTBFXtrfpLqvBRPxN
 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
 BjBIDwHxSQb3Kiz0vi0NDm8NguQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1778884993; x=1779489793; i=and@gmx.li;
 bh=5f8QvYVTnkT2EPYBmiGbgMJXHQytbekK4MP3XitWRt0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=qFoThTwGCVaUS68tpYJ4OZNghwtGruseZe/4qkRZdqCQdPCP7aAll3SQzTdtWSZp
 JsI1noaXf6Qn3P3ZS1ksDPLJiKAaM/yn/+bFKI7OES1HwKBB0MLSFUkSbBOIqFScr
 L6Mt7tOgglh12rYV7U87dqZLCxPK/JZUF4zbx69rWDwlxqmt3lC9W6vAgtIYgdPD4
 WLzX/lCL+occd4XSWoxjZM9S0xIISNNSEYMmaUeMrN50bXKJ08J8p/6ZP2GKjCv9n
 6sAMaf6ni1/Cd/RT/6zh1QGILe7/T5hIoe/2I9M07NXUTyvacvqluPvaf0Sp4eUbm
 9RFBAlGXYQgA03vqeg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=qFoThTwG
Subject: [Buildroot] [PATCH v2 1/1] package/libargon2: conditionally
 shared/static lib build
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libargon2 build shared and static lib by default.

Add conditionally BR2_SHARED_LIBS and BR2_STATIC_LIBS support.

Signed-off-by: Andreas Mohr <and@gmx.li>
---
Changes in v2:
- add conditionally shared lib build
Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/libargon2/Config.in    | 5 -----
 package/libargon2/libargon2.mk | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
index 6bba74cfb2..73c1e0d777 100644
--- a/package/libargon2/Config.in
+++ b/package/libargon2/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_LIBARGON2
 	bool "libargon2"
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	help
 	  A modern password hashing algorithm
 
 	  https://password-hashing.net/#argon2
-
-comment "libargon needs a toolchain w/ dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
index b3f6e1b216..8ca0071a15 100644
--- a/package/libargon2/libargon2.mk
+++ b/package/libargon2/libargon2.mk
@@ -23,6 +23,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 LIBARGON2_OPTS += NO_THREADS=1
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBARGON2_OPTS += LIB_SH= LINKED_LIB_SH=
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBARGON2_OPTS += LIB_ST=
+endif
+
 define LIBARGON2_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		$(LIBARGON2_OPTS)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
