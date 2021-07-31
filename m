Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFA9C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:33:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B383C61019
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 08:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B383C61019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81221404BC;
	Sat, 31 Jul 2021 08:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ZYs3Vsp2OlB; Sat, 31 Jul 2021 08:33:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA9D4404EE;
	Sat, 31 Jul 2021 08:33:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 22C6E1BF836
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:33:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17EBD835B9
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 08:33:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kvfQ5P0HXStJ for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 08:33:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CAF1583566
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 08:33:20 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z4so14428228wrv.11
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=28oOtE8V708MkW4JKuXxgIVII1gjlZ7hzWmGCQf1XYY=;
 b=LK1hk8pYazh1edvuMcXDdrAj05H4REIJ3S8O+x200lb/oiIfVBqLjXjaPsg2tvFwey
 V+G6ajpS42OsCAuafDunO+1S8cwi4LL752xRCMzvsQRZ3xQ6NzhD+1op0R+d+MTLn/fn
 +uT/qln/EwGqItZlF21OVBUMMaa2IyleFg5nWA3NefufUqqmHwELYrV4N+SUYsI4kk3C
 DwuVnwUWkRk57PoQVV+nllAR+dH9XQb89Gu+V+3vsNLJ2+VWtf+09ST+aovAaBmu2do/
 pNqovrjon2PCu/KcOOisda6233IwQj4PL2lKCl/WLxrbvv5iFWwr7zSXDsF7gQ7HxGie
 joTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=28oOtE8V708MkW4JKuXxgIVII1gjlZ7hzWmGCQf1XYY=;
 b=dcPMvXBcw/ExTFAuI6+20YPWmy50R5dxLkCFaF8eCrF7Ey6vXXvRnX3tkWeC+1DffJ
 L2gxDoAYa9kDnEb6XsG77H1ZoziVS8srldyskMYAkSuxQwN4bmeMQXaiaVCNxtdh628x
 4GqPWieULjnTNErjMgK0/ywwFwI9BELea6EHepidcKGuKyEwerjqfZSZ3BMJ0deuNRW3
 UiqFgPWOGZCLoinf/wbk0Mz2O+ugQ5XIMGz7xwUOEzZeP1wbSKtybwg8RjVQyU70z7b/
 4KY1mPrbiUagdU5he+wXvZpSIqkQFY2T+KGMXe+S/c9sXyeQkZ02DBsqzCMtxGMHoLbZ
 AxSg==
X-Gm-Message-State: AOAM533OJKTpzMxW9lyoZ0xyImAMyyTAbZC4z/Gswsysv57A6rBY1urU
 SpktPap72CaoPq4qx+PsMzBoU3lCqcPtwg==
X-Google-Smtp-Source: ABdhPJyrlgGJOWv/ZHPVDXND9qqsDXFRT5oxzg9+95i7UiZIz0cCkuJYShpV8oZkzCySEKWyNtQkNw==
X-Received: by 2002:a5d:674f:: with SMTP id l15mr7241522wrw.354.1627720398654; 
 Sat, 31 Jul 2021 01:33:18 -0700 (PDT)
Received: from kali.home (pop.92-184-116-151.mobile.abo.orange.fr.
 [92.184.116.151])
 by smtp.gmail.com with ESMTPSA id m20sm3766054wms.3.2021.07.31.01.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 01:33:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 10:33:01 +0200
Message-Id: <20210731083301.623101-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210731083301.623101-1-fontaine.fabrice@gmail.com>
References: <20210731083301.623101-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/cvs: fix SELinux
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Add apache module as for now it is unconditionally used in cvs.fc

Fixes:
 - http://autobuild.buildroot.org/results/838266bef1deec560e336d03a64d64fa1990c344

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cvs/cvs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cvs/cvs.mk b/package/cvs/cvs.mk
index 8200997d3a..bd1e04eee0 100644
--- a/package/cvs/cvs.mk
+++ b/package/cvs/cvs.mk
@@ -11,7 +11,7 @@ CVS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/
 CVS_LICENSE = GPL-1.0+, LGPL-2.0+, LGPL-2.1+ (glob)
 CVS_LICENSE_FILES = COPYING COPYING.LIB lib/glob-libc.h
 CVS_CPE_ID_VENDOR = gnu
-CVS_SELINUX_MODULES = cvs
+CVS_SELINUX_MODULES = apache cvs
 CVS_DEPENDENCIES = ncurses
 
 CVS_CONF_ENV = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
