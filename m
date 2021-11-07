Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06D1DC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 10:03:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A6D4613AC
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 10:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A6D4613AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B063605D0;
	Sun,  7 Nov 2021 10:03:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eVcHF1CD3Acg; Sun,  7 Nov 2021 10:03:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74C01605CC;
	Sun,  7 Nov 2021 10:03:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC011BF317
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 10:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1816B400E5
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 10:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ROuYnNoLpqOR for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 10:03:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 516FD400D2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 10:03:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso1555317wml.1
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 02:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lSwu3798WrM+l9VMXJruLQU9E8R98SL7kh/qvyzV32c=;
 b=Au5uzg5jxQAJu2RzxI0Fc1jTX5X3vhY1XHRDH3RaP7IuJ0Ep8aH6tX7oliaIS1pxKX
 HS9BjjDL5gHCzj2ZmipDL5xWC8+R4EM7+JugPaENq6s8A/Vzeb493LX6ksEqmSUBC28K
 REpUKz2X8n2IjWV53u61QQPNE/dzx9/Mlg3F0m7rlc/J0GUTItNkMXgrjjtH9NfziwlY
 VnaA4y9Ss2YacCCspVGXbE0x6YNPs/C6O6FNUqy02F1C3NUyF5mGy9oO9Z52hxaYe2Ol
 a0tP8DULkzICv7mJIjPFzeMYjGJ+e4fTOP0Ve7YInYxLB1s7NEruReOlCfRVXtRqp8rP
 s4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lSwu3798WrM+l9VMXJruLQU9E8R98SL7kh/qvyzV32c=;
 b=rpck27wyYV1V/S8lY/SSGO5hGvUCmOYT/IUqTWL/Gen4t0YENRn7sEzU5g9iEo6t5Z
 PWC6f6FL5uRDVq6ABIrSM0Iume+iW0Si+6wXWFpxr0vzPX3EkMe8aFE+LiYZ0iwLc+SA
 HFI5PV8KB/Jg6MP1l2mIwcKZ0PTJeo/4Kziu22tQPa3FB5dlxvoOIg3KyVkYln7M0nL/
 eSCLrUbxCRzIYfLlAI4ihN7S26HZXiod01v/VT7coMYqVzvrQ6m1y1fTyqbNoPBWivO6
 0Nc1tqgQDwx9eu63LIDk1vuhblAk5qSqb3m+q3Qdi1wmg6fdRiwwRv/TM3maXdDX+6vE
 wxPQ==
X-Gm-Message-State: AOAM530zFAr59NVohPJFpnF5uw5aqotwDhC5UxIK5kN1EH0XVefKhTLb
 yeT89x+z9RpArejgujsvDsYFrIIU6pA=
X-Google-Smtp-Source: ABdhPJy3z29i+VaqxK+2UxVylTUSulVh1ZA/ufxN5pFl30e3NhE0qR175K1NKTqdDPG+wxPMg80UAA==
X-Received: by 2002:a05:600c:22c7:: with SMTP id
 7mr43623742wmg.58.1636279401406; 
 Sun, 07 Nov 2021 02:03:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h22sm14448586wmq.14.2021.11.07.02.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 02:03:20 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 11:01:09 +0100
Message-Id: <20211107100109.3511154-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/audit: drop autoreconf
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
Cc: Clayton Shotwell <clayton.shotwell@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit aaca5fa97198fa1836a477f2fb2e3ba5872a0be2 forgot to drop
autoreconf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/audit/audit.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index cc04969419..7f364ab010 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -8,8 +8,6 @@ AUDIT_VERSION = 3.0.6
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-# 0002-Add-substitue-functions-for-strndupa-rawmemchr.patch
-AUDIT_AUTORECONF = YES
 AUDIT_CPE_ID_VENDOR = linux_audit_project
 AUDIT_CPE_ID_PRODUCT = linux_audit
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
