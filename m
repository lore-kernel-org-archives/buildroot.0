Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23AAC3ABD8
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 16:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81E6A41517;
	Wed, 14 May 2025 16:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhSqRmMQ1029; Wed, 14 May 2025 16:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7CBF41549
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7CBF41549;
	Wed, 14 May 2025 16:58:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B9F12A
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECEAB41525
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFs8t39Lmj1B for <buildroot@buildroot.org>;
 Wed, 14 May 2025 16:58:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0EE2441506
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EE2441506
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EE2441506
 for <buildroot@buildroot.org>; Wed, 14 May 2025 16:58:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so528085e9.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 09:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241912; x=1747846712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TvkBZd8mQyRVu2MDJD5F7E9T+Bw7DMTN0fSmEzqNPS4=;
 b=lqkQPgORVYS00LsqKZb4e+k2fYgtR8RBC9PGNDcALBB/nMGZ+7xRyWEhmP5OgehS0E
 QMr8v2c3RvlKEjY8GclfU80WE3tGjeMcPwXloFWI3NfJ+cINwc/dz1DhILeri1lsYXpQ
 NUC5Pi0TgQHF19Q90c7S1oibrRV/4j/OHSW3qHw7broU3HKSKEQdb2EEFT2eALQYGPZS
 OdDHXa+EKZPz8jY5hvPPg/6wqUKcHKln6CASfxDXjH68gJfOxyKhETqw6y0LH58w0p2Y
 m/W3tvhkXU0scPM3PHdMhd3L8bP0iNUoJgWq4lPEmWNdasK1zQlXn7tXqzui4CsGSXnf
 3skw==
X-Gm-Message-State: AOJu0YzgXaE4FyHX//vPg3a3hCMFz4m/zJrVWnJtvsMCcPdSMxj0S/0d
 0t68c8o0ffZMJHoMxX9Hf2v881cxKSIJ+odL9c2KhSZeIsfD0ZANGTfHWQ==
X-Gm-Gg: ASbGncvRBhfYiSesa2sMCcOKSnRlcJZqo3wlZRXZSbg5J/gmXaO6uyBbSBhjX1pSai6
 Fwm+0NhP4sgMrRaBLX/NQXulqXG8av5hyLDks4ECBuTUeVxETwFRoUkqAZZzdQpxU6cjNtGJt+j
 62NpBrCSZwdDVztx7OLhqVbhBUte3Y7xnlh/+de9+xfdJp38v3sQgvZ8PZVmeP1x/DaNo85rE/r
 XpHWEjEd1y7nNMb+MWAz+tL4plVE79SZqU0hhc9K9xbJXv2W75W/0KV8r5hOQVD94NsIWVoSAwf
 0wvPcgh4OPR9fDZoj8Kc+t/qtAaQB5AY671AGgZUZwegiv2trtyL9a4WPGYgzg==
X-Google-Smtp-Source: AGHT+IFxz5cjP8hK69pItitxN4jnRVL4Ju2a3qaG7NyvQdqwOzS2zC+jRIWdmBqElqOA8ED1VcDFyw==
X-Received: by 2002:a05:600c:5248:b0:43b:c6a7:ac60 with SMTP id
 5b1f17b1804b1-442f84ec7a0mr2314505e9.10.1747241912406; 
 Wed, 14 May 2025 09:58:32 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3951494sm39815585e9.22.2025.05.14.09.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 09:58:32 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed, 14 May 2025 18:58:22 +0200
Message-ID: <c42b40ff2f56229833f342db28d1823402d00447.1747241900.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1747241900.git.yann.morin.1998@free.fr>
References: <cover.1747241900.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747241912; x=1747846712; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TvkBZd8mQyRVu2MDJD5F7E9T+Bw7DMTN0fSmEzqNPS4=;
 b=l6NBzwGWNhMrUm11+yO50UkDw0I3V4mnChpFr9CzA9TmwoGkGR3A0KBMfugNbLUIdl
 jZ/J+S7xqa3eL8y5QKJOYUAVA4XljUFSlWCmI0cSXyYYFCBbNgfBcsVigSnLAHZPuUNV
 SCUfoSEG78kekM8Pk5aqJyo195uxuL0Puc53kYBZtlyRxzWYDZsZDKDPcBohhOIjZ+Gi
 Jewr+q6KPsiA76e9frS8U0UgbCQhmcg0aoM+5a8MSXTks3armkc+y8Lfr0GOmMBPQlNL
 DqGxUbvK4ckSYrIu4LdA8pyW5/art3ezmBUR0/GN0V9BxKY7jMqPw/GcDITA48fA8AHn
 BM9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l6NBzwGW
Subject: [Buildroot] [PATCH 10/13] package/coreutils: no need for chroot
 workaround with merged-bin
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/coreutils/coreutils.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index a6d193b49e..cbfc2cd88c 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -125,6 +125,7 @@ define COREUTILS_CREATE_TEST_SYMLINK
 endef
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_CREATE_TEST_SYMLINK
 
+ifeq ($(BR2_ROOTFS_MERGED_SBIN),)
 # gnu thinks chroot is in bin, debian thinks it's in sbin
 ifeq ($(BR2_PACKAGE_COREUTILS_INDIVIDUAL_BINARIES),y)
 define COREUTILS_FIX_CHROOT_LOCATION
@@ -137,6 +138,7 @@ define COREUTILS_FIX_CHROOT_LOCATION
 endef
 endif
 COREUTILS_POST_INSTALL_TARGET_HOOKS += COREUTILS_FIX_CHROOT_LOCATION
+endif
 
 # Explicitly install ln and realpath, which we *are* insterested in.
 # A lot of other programs still get installed, however, but disabling
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
