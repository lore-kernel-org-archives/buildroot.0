Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636C6C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 16:35:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1D9C6101D
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 16:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1D9C6101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AFBBC402A0;
	Sat,  7 Aug 2021 16:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Plcrwcz5IySN; Sat,  7 Aug 2021 16:35:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6B42401D0;
	Sat,  7 Aug 2021 16:34:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C27A31BF5AD
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 16:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B41AF4036F
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 16:34:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajajAjsT77S6 for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 16:34:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AD454032C
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 16:34:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q11so3168949wrr.9
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yUqJa5hCfB1LdGeTpjcOWkUB3QQ+st5fOeQa/Y48ufI=;
 b=hlHNpgjyKqtylLd12vJeynHpf/ZuIRQFkXE66tJ2McZ6WW2KDrmJFvNnuUVkWiUT/D
 f1tEswOL6bjJDPR4FyKPz/F+cLImnuuRkdRMWQQ9nBf19D6DZfOF9SgXjMcAT5PPWsyP
 6TOc6qMmAyGtiSGgzwn1jzXlgepNJCSztuJTIWXccfcgsSLcBHyVlS63W2KKt8kZ39I4
 42SqXrjnxQyifo4CqXuGZW5V6VWeW/llLm+iwpP3RL35DXJwIyCou33oBwezSVipWLmZ
 T/IgcaTirMu5SOaKOCxjq9sopomrYrCu7rCLPAH9rynMRABSbUhwNwlEeGFM+X00JbWP
 WSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yUqJa5hCfB1LdGeTpjcOWkUB3QQ+st5fOeQa/Y48ufI=;
 b=LoN4/mHL3dRLq/lR13uRxV8FFDhhCqImn/OYJKmGGCmpjTeLq9UD1yA2xGJyg+maFL
 +7VHJCOB6O/DQ5M/eqAwH68g+HOLdKGLRiJjSCkLX504a2jdqlDAcLJRuPhCHLDbWFEl
 srp0wI9Cm21hkHP+DSA+XtPGp2KXptZXviBMs8UzsFDWzXhXCveZynwc/4+MW+NP9xFk
 leUzd9RS+FZ/HQv2ES2w1Ztaxvp/uCVgkheor6LFEKqVwRQl7/gh+xMwe1kgJPPgD08i
 b4U+UN/6cN+Ks8QFnicGcFoyu0TG8ua6UVu36KFWpKrDPjTrwiuJTVzNt+H8rffl4KfF
 KWkg==
X-Gm-Message-State: AOAM530tkhSdn6wtT268ziJyqJhM6mEjy5rppusmiIl5yNhKj/LLnX60
 vuKaA71hCiJrrME4mnUZLSLeBAgwCfzehQ==
X-Google-Smtp-Source: ABdhPJyfC3X+fzmVZBbLdpdM/J6ofC4tTQgUGCf/4x8b+pDWCXbkYGC/PnW2SXp3+9PGIoIqRTIZoQ==
X-Received: by 2002:a5d:6107:: with SMTP id v7mr16222880wrt.107.1628354094268; 
 Sat, 07 Aug 2021 09:34:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id w14sm2430979wrt.23.2021.08.07.09.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 09:34:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 18:34:44 +0200
Message-Id: <20210807163444.631063-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: nss needs yajl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

nss can't be built without yajl since the additoon of the package in
commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

../output-1/build/libvirt-7.4.0/meson.build:1986:6: ERROR: Problem encountered: Can't build nss plugin without yajl

Fixes:
 - http://autobuild.buildroot.org/results/18db9ec30d5e60fbe9f5096c3fd1a30396e11856

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/libvirt.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 198e64d24c..feb2d6aa84 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -171,8 +171,8 @@ else
 LIBVIRT_CONF_OPTS += -Dlibssh=disabled
 endif
 
-# Can't build nss plugin without network
-ifeq ($(BR2_PACKAGE_LIBNSS),y)
+# Can't build nss plugin without network or yajl
+ifeq ($(BR2_PACKAGE_LIBNSS)$(BR2_PACKAGE_YAJL),yy)
 LIBVIRT_CONF_OPTS += -Dnss=enabled
 LIBVIRT_DEPENDENCIES += libnss
 else
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
