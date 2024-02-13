Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75678C4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07F0381EAD;
	Tue, 13 Feb 2024 21:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ry-0S-wXBZPp; Tue, 13 Feb 2024 21:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18E5C81EB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18E5C81EB0;
	Tue, 13 Feb 2024 21:01:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7F3C1BF2AF
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B250A81EAD
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:00:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZKmwM_1qWEI for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:00:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59BBF81EA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59BBF81EA9
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59BBF81EA9
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:00:56 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so3902484f8f.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858054; x=1708462854;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dp04HjSsci6ZkepgDqOyJCAPYqcmkVHxSS74DBt/psc=;
 b=HPYCBRP03DtzrsjI2TVmD5ulfwjXQEhsO5YF6VdYPH/8XPO0v7CB9uxMLznToxb0XH
 suvA0dhIVTC9GqLxAi8+9+HL1zaGqEK2E7MsU9B75JX3PPbVdhEikjhgBDLIxjL1GJOz
 4WSHiY/xCP+oWixTt+Wo/UCJ3HddCbHRFJKqtz8FTji/M8RP4fHevc3dKb5xkEDrYh1v
 T+SgVvX1/3E0vCZe5d0SBCz4UMEmnyg5G1mXRGrVuuX8oYutXZ97fcaHR1wouMkv7wgl
 K7VtTBEjAA5QIfYtuN2gW2mLH4Tjk6RQp+gHdQC8NpDtM/Q7go+as/YHIx5DpUktTD+1
 KPLA==
X-Gm-Message-State: AOJu0Yxhn+HRXftnBpiujKmNjtFbS0NjA0xkdzS3VvVGVaZCC4qIO8/5
 2XHuqTcCdWq2Gxulo1ADj0qZTwB888h7S4Pp5RMoSRuJDcKEo+r28LyoiyDMALo=
X-Google-Smtp-Source: AGHT+IGfDVBUYYDKFotBcYXxF4lEKSukNEYblSFhYayxhAAJf30MgcolORLQzVsNl7KhQfS77CAI6w==
X-Received: by 2002:a5d:4651:0:b0:33b:3fe8:640e with SMTP id
 j17-20020a5d4651000000b0033b3fe8640emr296915wrs.16.1707858054084; 
 Tue, 13 Feb 2024 13:00:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c298400b0040fdc7f4fcdsm12745941wmd.4.2024.02.13.13.00.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:00:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 22:00:51 +0100
Message-ID: <20240213210051.162913-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858054; x=1708462854; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dp04HjSsci6ZkepgDqOyJCAPYqcmkVHxSS74DBt/psc=;
 b=k2p3fSKnV6z0Bo1dOgnyvVoqVKq043Ls9uxVCFvr16g7XpXwhf28/70yidyk+DHAzK
 3eqjstG5OJH/ZAl+ev/TYfzHeJJaYwLuYXeXvKLc7eWNlWI2VjywzYWr510tXg2izL/M
 li3QPxWC7hWCPLoRdBdsZZxQDvj4vzigsxc20BZpX3AGGZJeHYB0fkg9xwQE7RCBSXdB
 a9RCeRBzcivDef2jPUhUawVULyRCWz4p3ZKHzVn/RbK1hjBI/ZTek5gHcuJjl6/bTFRU
 YbuVBwajOPifG5C2AbahzrgkM8Q1+nXCg2eAz+cJZa1CmLsE9awVZX7milPwTx12/HaH
 m4bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=k2p3fSKn
Subject: [Buildroot] [PATCH 1/1] package/botan: fix uclibc build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

getentropy is enabled by default since version 3.0 and
https://github.com/randombit/botan/commit/8642f2a99deefc85cdb512ee50d9f62c5e0ae4b8
and explicit_bzero is also enabled since version 3.0 and
https://github.com/randombit/botan/commit/e6819a380fb67c1be546dc618248b62d93266423
resulting in the following build failure since bump to version 3.2.0 in
commit 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813:

src/lib/entropy/getentropy/getentropy.cpp:26:9: error: '::getentropy' has not been declared; did you mean 'Getentropy'?
   26 |    if(::getentropy(buf.data(), buf.size()) == 0) {
      |         ^~~~~~~~~~
      |         Getentropy

Fixes: 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813
 - http://autobuild.buildroot.org/results/d58c4730c770467b42af426545dd917ecc5fed17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/botan/botan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 7c290f04ad..88dbfa5807 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -49,7 +49,7 @@ BOTAN_CONF_OPTS += --without-stack-protector
 endif
 
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-BOTAN_CONF_OPTS += --without-os-feature=getauxval
+BOTAN_CONF_OPTS += --without-os-feature=explicit_bzero,getauxval,getentropy
 endif
 
 ifeq ($(BR2_PACKAGE_BOOST_FILESYSTEM)$(BR2_PACKAGE_BOOST_SYSTEM),yy)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
