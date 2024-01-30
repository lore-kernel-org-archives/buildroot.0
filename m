Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0FAAC46CD2
	for <buildroot@archiver.kernel.org>; Tue, 30 Jan 2024 20:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3551B83DA3;
	Tue, 30 Jan 2024 20:42:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3551B83DA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4BnUJYXauC8i; Tue, 30 Jan 2024 20:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85CF983D77;
	Tue, 30 Jan 2024 20:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85CF983D77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA3471BF591
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE65440A66
 for <buildroot@lists.busybox.net>; Tue, 30 Jan 2024 20:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE65440A66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9yXR0bjPL_b for <buildroot@lists.busybox.net>;
 Tue, 30 Jan 2024 20:42:44 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DFC740A1F
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 20:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DFC740A1F
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40eacb6067dso57117465e9.1
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 12:42:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706647362; x=1707252162;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FxGE5fw4NvoUmGo8qXSZ19lQHA6Vj8lq+wviuUn4qrk=;
 b=OwL9SFo4uQhU/MkNVsKLW195wp/VHFRxT+qhYkn1az0AxBqdU8Rq+0CiYhHj2AqWTy
 AKBnvomhohVB0/V4tPnrOLC76HeWCADI6AZ+F/bBVCnwDOtOuQJp5pehPuG6sYXjEsby
 7js5uPtTwtOLesw/wImuv4ncjNsJsnoXsPIWtS4hDCqBH/9sH/isOoTSd5yTPAGh3xro
 xGUxA39xlURFSdYxk3A5n3A8B6x7ugaD4ZTgJffmhPX3YP+5Uj8hsGkmUlFMAU9e10Za
 6uWICggWK+/1D10IE32FK4oYtON9Cl+HZVd+K5o2Cqv6j9Bao3ZisY20+bdU87RgCirF
 Sb8A==
X-Gm-Message-State: AOJu0YyeQlQPkNRvxdTt/55yzUT3EAKNT+89o/117P54Qef/h9c5NLE2
 on/E2IZOUHVkoPrYE7G4YmR4U3E7mFAArR8dae5zDmvRW/i+H50ohRxnCbHoC08=
X-Google-Smtp-Source: AGHT+IEKbyigKJTbcQjdsaqcvAzokN6E5FVBPJq2CU34sIvWjOyDn5as0SnmbfJ41ObAUiGppZm8yw==
X-Received: by 2002:a05:600c:35d3:b0:40f:b33a:a6f8 with SMTP id
 r19-20020a05600c35d300b0040fb33aa6f8mr140359wmq.18.1706647361666; 
 Tue, 30 Jan 2024 12:42:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n13-20020a05600c4f8d00b0040eed5dcb3fsm11005762wmq.48.2024.01.30.12.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 12:42:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jan 2024 21:42:39 +0100
Message-ID: <20240130204239.49546-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706647362; x=1707252162; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FxGE5fw4NvoUmGo8qXSZ19lQHA6Vj8lq+wviuUn4qrk=;
 b=PDZLN3ASoly7Xq47NMV8oUXiLGC0gHmZ2oNJnxgqrPw1mz9jyY2nQXquHitAshIphN
 DjzUYBQEHwi3amk+MAvw512lNoH6hulWu4hylrxCiL3jVlL0dbeWhf1np97YIYVcddfE
 YSTpYlqsVq80x3J8nZ4iAFEhS641BxtjNGQGttgEFSoTYp901S15vEwGiSzBRT01jwE9
 ggR72+1fVi2fN6342gCxEaDPXoJmUf1jVHaainvaa7VOt3qiIMrlYMFXGtXIh3A87ZSD
 /sbgl8XO6bUIW/nM0a+fVk+FKympueJCd6YX+jIt3Da6gGIyrQDE7dr7bgFVAGhuJR/m
 Wopw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PDZLN3AS
Subject: [Buildroot] [PATCH 1/1] package/joe: add JOE_CPE_ID_VENDOR
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

cpe:2.3:a:joseph_allen:joe is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/5F530947-2060-4842-92B9-5BC61D9C5430

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/joe/joe.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/joe/joe.mk b/package/joe/joe.mk
index f0cac402e1..9346ec1fd3 100644
--- a/package/joe/joe.mk
+++ b/package/joe/joe.mk
@@ -8,6 +8,7 @@ JOE_VERSION = 4.6
 JOE_SITE = http://downloads.sourceforge.net/project/joe-editor/JOE%20sources/joe-$(JOE_VERSION)
 JOE_LICENSE = GPL-2.0+
 JOE_LICENSE_FILES = COPYING
+JOE_CPE_ID_VENDOR = joseph_allen
 
 ifeq ($(BR2_PACKAGE_NCURSES),y)
 JOE_DEPENDENCIES += ncurses
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
