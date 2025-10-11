Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9B1CCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 20:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58D5760BAC;
	Sat, 11 Oct 2025 20:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9OcdNogDAlv; Sat, 11 Oct 2025 20:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8784C60BA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8784C60BA8;
	Sat, 11 Oct 2025 20:18:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F0679BC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D602E60BA7;
 Sat, 11 Oct 2025 20:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuNq_KPqJalJ; Sat, 11 Oct 2025 20:18:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB4BD60BA5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB4BD60BA5
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB4BD60BA5
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:18:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e6a689bd0so21901765e9.1
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 13:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760213885; x=1760818685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2O9ylyD8Z4PWgm2x4jnDMc6HGu9DxZq5FTuWFzLTN8c=;
 b=tB7Bg2ekLjP/LrvSGNJNpFJitg7eDjmWBE8jqYgA/jJQZTi/f4hg0I8Hu//R+Gybly
 b8jtts65t8KNeb1Yf8zv7mBxm6m5lIDcKtocB+aGJ1bCa0oGt5bzhgGfwNTK8BewWhEP
 aiYtNR7m6eRKohZAroNjI368tdKxlkoWpRzkuL7GPzd53mW6Kh8QIJc9+mbIqb3dJjZk
 e1Ui9kwbbGrja8C4UVqORXaC7cCot3NNerkaxQz8FyNdymCFy93ukdkp89P3tjiZ0kRY
 J+VlvPcbAaNIn3HMErrANBpA2cNcYvuDxIgeELShb/qW18h2q5T9m0E+/vofI1Y2YvWy
 b8gA==
X-Gm-Message-State: AOJu0Yxnu9NDudli1P+2GRzz802ZifIR8QMtOfyrEj4Y+SPLuszN4L9y
 4QVNIehI8GGu6gC9j1Tgjz1MxpqmFmgVP+JJItT5++QumqAuL86GDUL+K0bdlg==
X-Gm-Gg: ASbGncv6BQ92Y1fkasfrU8/Hu69oRpOrJ39s1xgG8N6clxXOfhjwoVKKLDX7BX3/6nX
 wNCBrdM62KWjqiy0HpGq1QTOYnGYbL//hISTtdfRbWTRXE989PK3+TYqyMSeTAouVl66lxplRr9
 joRW82HNY4bBxD1WdNP9+KLhROLY4ekMvP70XfImJPHGHAn2aKTpICxMNDP02JcUO4MsusVSyku
 fwAI2kwieyZVSkGd2fIyRaTlO3Mm9NLuoQImsYeWttPBaBa3119s3ojIjxHhJqn4OdMuotoRhIJ
 Od3VOHRw3QNVEv7RKtLtn4bvP+kKx8GUm2eoGHtjhuA6JauZy/hETM/2QN7SfUpaXJFZHO4EvC8
 Rvgq5bWeGKr000+rZRaFnITv88IUkekJ21m9SMLUIXtzhvEtTrnHn8lIfESdrg9Y=
X-Google-Smtp-Source: AGHT+IEv5JoDNWI+xW+ApS1m+ITuycpa+pOdNJy/zOaR2YzJ+sotJCi+zhpyzVLe7FdYt9HFUb9gbQ==
X-Received: by 2002:a05:600d:8108:b0:46e:4580:c6c5 with SMTP id
 5b1f17b1804b1-46fa9b175a6mr114235145e9.35.1760213884612; 
 Sat, 11 Oct 2025 13:18:04 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fc155143fsm31339675e9.11.2025.10.11.13.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 13:18:04 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Chris Packham <judge.packham@gmail.com>
Date: Sat, 11 Oct 2025 22:18:03 +0200
Message-ID: <20251011201803.2005973-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760213885; x=1760818685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=2O9ylyD8Z4PWgm2x4jnDMc6HGu9DxZq5FTuWFzLTN8c=;
 b=cGdOQLwA4L9Dex8dGb0tGr5SY5nA++0c5LDUEzuI2OhaDDDqTQd3rg0pEkyUdLGC5u
 pUXDx8SkZ5S3o75ga56xjFo76tS7b0qI+e+T/O8ob+Z/JGv8vfI5y/Y1iLDuCm+fOFud
 f+1nyvIlNYx9972l99+VqSl51JvPROhuKWzy0gaQZhgqcHfVgf1vbMbNP2dBRhGLTg89
 D+MC2OBmjaXDk+P4t3gCNhqeMhRurK/u6SCjFEjkxvHByQwW4KrWQngbD2cybFkWGKui
 j9PXNVkbkFme0AwY/rGy/uYkUQgHre7JK4UBYldkPclzoR4cDTJ4iVZJLrHJrvBNFH+W
 AkDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cGdOQLwA
Subject: [Buildroot] [PATCH] package/micropython: use append-assignment in
 conditional code
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since its inception in 9646e80fca28 (micropython: new package), the
ppc-specific CFLAGS are simply assigned, and since 9fd9f4e6752f
(package/micropython: define MICROPY_NLR_SETJMP for xtensa), the same
goes for the xtensa CFLAGS.

Although they are mutually exclusive (different archs) and that there is
no prior assignment, the customs are to use append assignment in
conditional blocks, to avoid accidentally overwriting a valure set
previously.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Chris Packham <judge.packham@gmail.com>
---
 package/micropython/micropython.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index e1e1f88d51..826247069e 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -21,12 +21,12 @@ MICROPYTHON_IGNORE_CVES += CVE-2024-8947
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
 ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
-MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
+MICROPYTHON_CFLAGS += -DMICROPY_GCREGS_SETJMP=1
 endif
 
 # xtensa has problems with nlr_push, use setjmp based implementation instead
 ifeq ($(BR2_xtensa),y)
-MICROPYTHON_CFLAGS = -DMICROPY_NLR_SETJMP=1
+MICROPYTHON_CFLAGS += -DMICROPY_NLR_SETJMP=1
 endif
 
 # https://github.com/micropython/micropython/issues/14115
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
