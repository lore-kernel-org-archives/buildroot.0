Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E63CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 09:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2B2181FC5;
	Sun,  7 Apr 2024 09:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXMg3ixpNxtK; Sun,  7 Apr 2024 09:21:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB7A381FC9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB7A381FC9;
	Sun,  7 Apr 2024 09:21:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78E521BF296
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 651EA407B7
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 09:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wPN93Tp6xWjV for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 09:21:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A7DC407B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A7DC407B4
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A7DC407B4
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 09:21:56 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-415523d9824so35550785e9.3
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 02:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712481714; x=1713086514;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdjeSYi5Xk9PEbuVfak6u+XrULUcEencUnYMnAJKIBM=;
 b=Oxp2CudwmoSp84v2svwhK9Nv8bg91kJGalhmpOE01icSS74yioTfcmDZ9sYfPfZSDS
 Sj4DetoSAlyNQ5zewu/LRUqIVlt4sfH1mHyXBqWui1AJpoR72Euq75eOu6lNR4AgYDVY
 sEbyrEK7o6ip7pxgl6/bIrg2cXjWg+wsSGUAlocP6ugVnycYmerUUwM9xmHgnajl/4q0
 R91OW+Nc8sXwpBh/jPwF789vBQOqUk4IVdbFb1WgORX7nLwiRHSocVhiYbIOqgv65IBl
 SVIy/U0CW3GxsgaZpPw8KapVZ9TMDiEc2ux1uRgEvkir3Sz781kGA/hDQ6ZfmdTIAcOv
 mW/w==
X-Gm-Message-State: AOJu0Yy9utlQAC/Jpcmicnv+5jYdT9v7a/PtoXX6up/R1HwV86fA70gt
 eTspGXgmVAY87MrctYWwUXyxGp+a4oLKFQ3v+3rJiGM1SmAOfnspROlYyjbp
X-Google-Smtp-Source: AGHT+IHuEHy2rimb52ooy31QishUu8ooxyg+EpdgVDFP8bxSY1khy2PbLBeLvmFkWn84U8z6zTR5CA==
X-Received: by 2002:a05:600c:35cc:b0:416:5e85:5ef7 with SMTP id
 r12-20020a05600c35cc00b004165e855ef7mr750724wmq.38.1712481714052; 
 Sun, 07 Apr 2024 02:21:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b004156b689edfsm9397478wmq.33.2024.04.07.02.21.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 02:21:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 11:21:05 +0200
Message-ID: <20240407092105.276261-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240407092105.276261-1-fontaine.fabrice@gmail.com>
References: <20240407092105.276261-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712481714; x=1713086514; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EdjeSYi5Xk9PEbuVfak6u+XrULUcEencUnYMnAJKIBM=;
 b=P2CPfrgRZ93ZZTidnXc+7N1GHBL7L793S9A+mwMvWu3fOKCO5MCFvrawDWAcEPo8Yh
 9XbBGsumkBRzZPWTW5Cd1Y4cKCoxKDsWqX2+PKwCLocXNOeH7SJB21WLhjrFrV1F3QbH
 ISZ9VKFxcBYwiGQH57KPAES84hCZfoT4H83G7qUqBdOK3oojTyErsNTHZ8jVPqVyKQ/Q
 9iGOS92Fe5xO9GXosRH/i4Bb/dxtnqKp9dgsbvvZD3A2rme2faHvnyERu8SethCqZaBU
 CJM8YXgrkiUghEo2CYRKvQ9Yq0GOIIj6XZ+elOm8N1S+VoKHrfcW+nr+dGEmV6V6iQde
 WB/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=P2CPfrgR
Subject: [Buildroot] [PATCH 2/2] package/libnpth: disable tests
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

tests are enabled by default since the addition of the package in commit
5d74d39cb421611e7be8ee73a308d608c47cfa28

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnpth/libnpth.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index 46c8154021..3fa5e1f905 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -12,5 +12,6 @@ LIBNPTH_LICENSE_FILES = COPYING.LIB
 LIBNPTH_INSTALL_STAGING = YES
 # 0001-Fix-INSERT_EXPOSE_RWLOCK_API-for-musl-C-library.patch
 LIBNPTH_AUTORECONF = YES
+LIBNPTH_CONF_OPTS = --disable-tests
 
 $(eval $(autotools-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
