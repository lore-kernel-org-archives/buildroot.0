Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163C5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 21:38:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ED5161051
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 21:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6ED5161051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28838401D6;
	Sat, 25 Sep 2021 21:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NtzzZ0I1-qnJ; Sat, 25 Sep 2021 21:38:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E4BD4019A;
	Sat, 25 Sep 2021 21:38:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DA841BF33B
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 21:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53D1A40001
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 21:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2HaeVcRxsxF for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 21:38:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A34F40305
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 21:38:27 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w17so38481961wrv.10
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 14:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sbNf+k6x5xQJmrWC+ud2o3hSKiKIw6VKxiM4VjqdPig=;
 b=duc3vlQ2ztS0gaYwx323VbCZ/11ycLnbPS/9c+khwp/2Ool8FzPjoY3c6B0SX+xWHF
 tjz/KLLzosQKFY3Ww0Zc/nys3xotgN5we9+C3UboErZNCk6suW5GGfKbGGCOyiWlmRy2
 uB7GAXXCC/0zUmzOdqqthtkmS992KsHrH9PwYzEuJ+kDojxRdsG8R3UiNDrnrxar221q
 vMWWp4TwaWXLz31W/SyQmXNdSmmBtMxyB/QP8J9Hob3k0sLslfgG4Uq5l/9PCCy/vGZ0
 4xgszRi/i9TWvmUaabNs8b00FrdxwwEjpmeCydLX9l2KJ24v8gKbjxrppSikjWERVksf
 CAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sbNf+k6x5xQJmrWC+ud2o3hSKiKIw6VKxiM4VjqdPig=;
 b=K9r+KbBqSBOkOz4sGwOUrPG/XJabWTKETvjPmf0QPLMYWkNCygpfsdEMHqJeWTQ16V
 tOdb8Uuyf+jph4WeSt2gRQCEm+AHN+GgMF89+ud3cEyifnuNoILqp3WJFWk2/QA4KjYQ
 8L4sfYfQhHVwhwmalQKIKY5oPmgA+Fr3ivCaf65gwX3v+Ar4lssFC9O5uTCNgH+Lfdzq
 Fdyxl1Wgd4HijrH3BQL74q44pz334y2lLGfAdptSH4vN5phiq5SuJATeZDaOF8nyMYmf
 5q+kA5qLnF3SN0wUzOsEl5VMGwbvLLwdF14FKxAAmWh2E27mwTPnDa6p8SAg7xAvt9f2
 5CCw==
X-Gm-Message-State: AOAM533XqC/hTV/ZfKAeTAsoMuUK3l/ppZB3re1ir0BOZDhhFuTyNotD
 gi5KF04FoLeUtn6edSuX2/72QQwOMi8=
X-Google-Smtp-Source: ABdhPJyw8e57Pf8bQvPIZ3HDfhOYgwwUnozuvJPWST6MIaJSi33zT/hnziV6+O4WeDeHTMG+N4U4Zw==
X-Received: by 2002:a5d:69c8:: with SMTP id s8mr2741923wrw.235.1632605905169; 
 Sat, 25 Sep 2021 14:38:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id r9sm11921761wru.2.2021.09.25.14.38.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 14:38:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 23:38:03 +0200
Message-Id: <20210925213803.3405981-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mtr: add libcap optional dependency
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

libcap is an optional dependency which is enabled by default since
version 0.88 and
https://github.com/traviscross/mtr/commit/2ff8de310222d26d10b13a104a1a82f2b86a84c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtr/mtr.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mtr/mtr.mk b/package/mtr/mtr.mk
index 263482534e..7198cbcc1c 100644
--- a/package/mtr/mtr.mk
+++ b/package/mtr/mtr.mk
@@ -8,7 +8,10 @@ MTR_VERSION = 0.93
 MTR_SITE = $(call github,traviscross,mtr,v$(MTR_VERSION))
 MTR_AUTORECONF = YES
 MTR_CONF_OPTS = --without-gtk
-MTR_DEPENDENCIES = host-pkgconf $(if $(BR2_PACKAGE_NCURSES),ncurses)
+MTR_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
+	$(if $(BR2_PACKAGE_NCURSES),ncurses)
 MTR_LICENSE = GPL-2.0
 MTR_LICENSE_FILES = COPYING
 MTR_SELINUX_MODULES = netutils
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
