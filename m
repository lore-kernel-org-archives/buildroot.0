Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB11CCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 20:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 001DC40895;
	Sat, 11 Oct 2025 20:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HB_I39Os5BqO; Sat, 11 Oct 2025 20:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30FCD40899
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30FCD40899;
	Sat, 11 Oct 2025 20:17:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39815119
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3636140899;
 Sat, 11 Oct 2025 20:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jyZc-MhWE4L4; Sat, 11 Oct 2025 20:17:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1DBB740895
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DBB740895
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1DBB740895
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 20:17:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e2e6a708fso19756655e9.0
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 13:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760213869; x=1760818669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B7t0j6pNx8PIMQfOs+ypcMrEEz6D+qYMNxn3vSicNic=;
 b=fB879vWjpn1GujvOSKORSE1YUqOVRNbl+4ywvWRtMpyDHXaYgyy3XG2UAf83cvkefI
 C0pO9yAEuMztwcpRp2Z5tI4+EcG/Y2A1iJC+XuWv25/SjCk1bQy1ylFIw8LefMABMlfg
 /oD2tHRhsGSWW3MDt6U7OO8hDFM6RyCBQLF/JxWUR1mJkqKok15R06WzLpPDNelehmAS
 xOUBXY4kJlPusH3XtmJlML5QKVxL4/fAQjg/UfYY5vKm2UabAfcXjT6KtdNLXVAm08bK
 K2jMpk1hMBXHrjv5wlugmB7HFK1J3p1JMgUnpbueV4cyRwpPAJ4W+x3TFC6wXQyD5Icn
 ygwQ==
X-Gm-Message-State: AOJu0YzLlMfdeedFjQ1XygKxZ1OEoFn93noztUKmwqz51HQFx3+5HsVo
 T4A4gYQA+Heq4xji/CJJHdglcXc6YE4qoNXqezexPNcdMeR+0dwtXKl9HYGpYQ==
X-Gm-Gg: ASbGnctuPVahrIDmDb3MA6Fdxi3NOdPdBRZz+M220wRkSz4PDmQtt9Emrd/xHCxwFh3
 8baxehMSrwnHYiHNFuS8L4KIWUeJsL50SgCYaBXn85y8JTwslNojtTG2ALRCgjo/M14yyH1G/TR
 jfoDA10rx+wDQZ3ivSlBLWmiDl2oxA5F828p+r/3KxWgCAMo6R+awYo4aJ4919l+UHAVCoLCc3X
 6OQllWecHZ4HHuuax0Qxj8MsgQkweywiMRoaQfx44CTNC9wHKrCT+ik10XEN2Lfx/biqvk7r1X4
 DyM6dLhtM5JeiyhdO3Pj3rFVfr0hXriYhblNCtQ0P+XogqMTbjPGbWHy+RFTGQCSymmWLR3bo8/
 Hm9qclUA+msrxtBi3NSYSmMppglWHWoXQK1df5bhi6iuoXJSJVGo8
X-Google-Smtp-Source: AGHT+IH29XfvGaqmButUtbKygqULR0IlaahExf+Z1N4UjN02Kdc6RILA3dD2FRNf76go57Vl3fVq1g==
X-Received: by 2002:a05:600d:8221:b0:46f:aa02:98b2 with SMTP id
 5b1f17b1804b1-46faa02ed74mr83045825e9.19.1760213868675; 
 Sat, 11 Oct 2025 13:17:48 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb49be017sm104591555e9.13.2025.10.11.13.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 13:17:48 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Chris Packham <judge.packham@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Sat, 11 Oct 2025 22:17:47 +0200
Message-ID: <20251011201747.2005570-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760213869; x=1760818669; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=B7t0j6pNx8PIMQfOs+ypcMrEEz6D+qYMNxn3vSicNic=;
 b=YqSY+bg9mMSUvmSj2nJnmvceqdyBL/EeJ+x+NmY6FxKM0DIq3du+3PqLixeHdVHY1q
 qFNXgdXkMhAbs5Lw/Cpa7SLSQHhFsTHZX9QQn5DeAJpb3+6NXdi9dplAzkxzzXirHHBm
 zdCpbe5z1N33ZFVlRs83kTB9XeWSZfgGqe87veviq9vuHfy/9Oi1MJmEvYNDRboUCrYH
 N0gZQBK8Ou5/ZHu1v1xVkuQCUOQuyuRXvsSMGZFvGk5GaDNg26f29Tyzz7FclsoJR8pB
 Umy6D+ttfu5gaVJF5nLeLg7O+7Scfl01g6zjzS2mvkrO1hen0X4+wZkxpudk622gS7hq
 yCFw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YqSY+bg9
Subject: [Buildroot] [PATCH] package/micropython: fix passing multiple CFLAGS
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

Before commit 50bc5aa17b32 (package/micropython: fix segfault at exit()
with gcc >= 14), only architecture-specific CFLAGS were passed, and only
one per arch. But 50bc5aa17b32 introduced a non-arch CFLAGS, for gcc
versions, so when the build happens for an architecture for which there
is a CFLAGS, and when gcc is 14 or newer, there are two CFLAGS added,
causing build failures:

    [...] /usr/bin/make [...] CFLAGS_EXTRA=-DMICROPY_GCREGS_SETJMP=1 -DMICROPY_NLR_SETJMP=1 [...]
    /usr/bin/make: invalid option -- 'D'
    /usr/bin/make: invalid option -- 'M'
    Usage: make [options] [target] ...

The fix is simple enough: just quote the CFLAGS.

Fixes: https://autobuild.buildroot.org/results/b18/b18d6fa9938c1267a771fdbcd8b4c3df812cd6b9/
Fixes: 50bc5aa17b320d91809048d5ef6a110f8c0b9157

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Chris Packham <judge.packham@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/micropython/micropython.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 32b361db16..e1e1f88d51 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -42,7 +42,7 @@ MICROPYTHON_MAKE_OPTS += \
 	MICROPY_PY_BTREE=0 \
 	MICROPY_PY_USSL=0 \
 	CROSS_COMPILE=$(TARGET_CROSS) \
-	CFLAGS_EXTRA=$(MICROPYTHON_CFLAGS) \
+	CFLAGS_EXTRA="$(MICROPYTHON_CFLAGS)" \
 	LDFLAGS_EXTRA="$(TARGET_LDFLAGS)" \
 	CWARN=
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
