Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67390C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:15:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2794061040
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 12:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2794061040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E25E4401CF;
	Sun,  1 Aug 2021 12:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yG-5BfZGco0J; Sun,  1 Aug 2021 12:15:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05AE640236;
	Sun,  1 Aug 2021 12:15:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 73F681BF2EF
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6273140236
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 12:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iy_5aeW2kk-R for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 12:15:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 113FE401CF
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 12:15:41 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 d131-20020a1c1d890000b02902516717f562so9306721wmd.3
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 05:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Py5NhvQpAui3NllQ/CYoZ6/lhlkwrs2QNn6pMkQ9lZs=;
 b=CkuJNCGWI63xP8PdmJb2KTEUKwJpsvw7z/MWMTEGsc2ph2J8yEfbLOM2J3t/gGyPc9
 CDktU+/HnTNh+IIYNxPWaBo2H2Vvew5D3SK7Aw0elTKnDw6tG92nKfS43zq73ZgihHg8
 BxbNsRMGPyhcLfcFVbzIGqkCW4RDVioxldYjm0r621WV/WW2XZ/JmFranjcEkFJVQHGR
 qbD2O4GXJSgkJLdv/dKBeMaB2QITLGFuKOxeTOMRkgqLbukuAfwM0VsokyNKOm7K1c23
 3vVsf3Xp1wntVRWcRBKGG2zvxYT31jjZSnTLhHWdbC3Y4wx184z9vDC9pVQDFsumuOMk
 6zxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Py5NhvQpAui3NllQ/CYoZ6/lhlkwrs2QNn6pMkQ9lZs=;
 b=KHV80ngKONezA1lUTjkaRYVEJC6Hi3NduhkHNMYNXEIEYFhS2XacDugQpESPuDyxqa
 sMk7X0a8YYpnbn0uqg3p09iwZoJOqWTFHE7oMo69W+L+SI9L/PRp/K9r26Kq+EC856g5
 DoHvtjhZDLi5NGzh3MckHRN2zz5Branjph5kgcXr+UhcQBTGvJGPorGRRz4yzBLcZCQu
 zGLFypE7uWjVsvLLqIBawfZwj47wfmR6Hib01iDPB1zhMbJrcol8B6irFBD4m9NyQQI8
 zQmq9/uPWMJdq9lJ7+lapdrkHv1j61Tgwzd6V5KK70fJB0aL+PowxqSMuqzFLxGs8pE2
 6lZA==
X-Gm-Message-State: AOAM530N4Qm3UJkn852hm6AaiMbQ2YRgOzVCgBSjYSBLMo8D7B7JmiTr
 VshV4sO/CFntVJ6dzfoHOjapRL0PL+2H8Q==
X-Google-Smtp-Source: ABdhPJwXpumjwEL14WvmfUdzzpKGxOHTuvw9YRE9w+OoUNmFDbe58z698Rznaovh4+mh0WnI0IailQ==
X-Received: by 2002:a05:600c:a08:: with SMTP id
 z8mr11973797wmp.52.1627820139835; 
 Sun, 01 Aug 2021 05:15:39 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id j4sm8004905wrt.24.2021.08.01.05.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 05:15:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 14:15:28 +0200
Message-Id: <20210801121528.3056060-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/postgresql: add SELinux module
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for postgresql is added by the services/postgresql module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/postgresql/postgresql.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index cab5553805..143bcd895a 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -10,6 +10,7 @@ POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
 POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_CPE_ID_VENDOR = postgresql
+POSTGRESQL_SELINUX_MODULES = postgresql
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
