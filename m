Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB719C46CD2
	for <buildroot@archiver.kernel.org>; Wed, 24 Jan 2024 08:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F1FB42C5A;
	Wed, 24 Jan 2024 08:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F1FB42C5A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzKs86o2eF7c; Wed, 24 Jan 2024 08:39:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C741242C3E;
	Wed, 24 Jan 2024 08:39:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C741242C3E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09F4A1BF339
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 08:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D12B584DB5
 for <buildroot@lists.busybox.net>; Wed, 24 Jan 2024 08:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12B584DB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UBDUv_46VlY8 for <buildroot@lists.busybox.net>;
 Wed, 24 Jan 2024 08:39:50 +0000 (UTC)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 15FDD8402B
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 08:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 15FDD8402B
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3392291b21bso4448047f8f.1
 for <buildroot@busybox.net>; Wed, 24 Jan 2024 00:39:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706085588; x=1706690388;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NAzQqiFirAut7m24G6+gpmsVgyt9+mKGgmvcE1QnM1Q=;
 b=aqF0luGdPxISrLY7PIim0VRQSW8TK/5mgypEH9LxgZReWNMfIzf1tqpi5fqGfMJ0IR
 cUQ4dknTAZCyiDUCTBaJK90xYFXLgEgrazbhyuhNMfEyTzr81u1H+i3mT9zJDkwUi5TK
 8d+P1kaJQat3dzGkvZ8WJYZIvG71s2tRn8tq+Q8PwCxTJ6RHrCY/9MZ1xsdxR0aJOH9O
 +OBhwshePeCLggS8Vsk+eyXPnBcKA0FMtrED66TrKkppwfiRLxuZqUn+myNbrm5qS8sO
 IxlddtwzwblC/rrcapXkaeD5K4ppF+ksLSGxez9IQ7lPc/fbFsWHF8Qj3v1bujnTchQR
 onrA==
X-Gm-Message-State: AOJu0YzRBtqR//1CNOPGMWWh16iIqi+8eBJeh8wL1DUDLKJjcPrwQPfD
 H8vS+8vPyp+jc8L5CP+5nEG5KYJEQB4mEpFKBblpEegb+cPHcgHhM3RFNgxv
X-Google-Smtp-Source: AGHT+IHNnAe0HspxGylbecUMR8pAMW6ZerKcYkpTflxcWjeZotuNRzHdo0vBznsGavvxgWTCZzJ+ww==
X-Received: by 2002:a5d:49d1:0:b0:337:9b4d:be05 with SMTP id
 t17-20020a5d49d1000000b003379b4dbe05mr294217wrs.80.1706085587621; 
 Wed, 24 Jan 2024 00:39:47 -0800 (PST)
Received: from xubuntu-23.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 cg13-20020a5d5ccd000000b0033927ccc725sm10845527wrb.50.2024.01.24.00.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 00:39:47 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 24 Jan 2024 09:39:43 +0100
Message-Id: <20240124083943.484010-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706085588; x=1706690388; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NAzQqiFirAut7m24G6+gpmsVgyt9+mKGgmvcE1QnM1Q=;
 b=HDdboRDdO/NbBnAPi5tKO/aWFsfIogTgwpBfdQz2wnnd0rsV2scmpoPVkddbdFaEvf
 s+QxW9qoD0UPaxGSPovIs/+3VSP8Ri+1fVwFxg+wvYGIFnkJF7LQxGAVo/vbYmOlSw/n
 AiU6JsPjTFixW1OYlKIqnDmIywcRQd//8KOCWLpa2SuTjF9fpz4Rd3os2rt1qjleiE20
 QcOwVi5OXr0qJ8b5wTVYzp3DrhJttqXYAu8W/+v2mYgjBf8o5Q3J9IKAYbzlwmRmEMjw
 MNYvE4YqD8e84aT6oSMdtIpe9yNTK0yutn7lxll7GjXff5drDTH9Iim5HJVdW0NjhTkO
 L9Gw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HDdboRDd
Subject: [Buildroot] [PATCH] package/janet: bump to version 1.33.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/janet/janet.hash | 2 +-
 package/janet/janet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/janet/janet.hash b/package/janet/janet.hash
index 148b55d95..33bbad585 100644
--- a/package/janet/janet.hash
+++ b/package/janet/janet.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ac74444f1b545830c34738fe9ebb58c865ea4b819b0b0c3124315c646d9ce4cb  janet-1.32.1.tar.gz
+sha256  c9018fbd69b825cfc706d8c40e9464be37e924ce07089933e92f4f931ccf0d8d  janet-1.33.0.tar.gz
 
 # Locally calculated
 sha256  95fca700e8dce9699248e7cc80ac88ce2357874c8352cd2be4d18f183dc9710b  LICENSE
diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index aa7d85fd5..ac34ba0a3 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JANET_VERSION = 1.32.1
+JANET_VERSION = 1.33.0
 JANET_SITE = $(call github,janet-lang,janet,v$(JANET_VERSION))
 JANET_LICENSE = MIT
 JANET_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
