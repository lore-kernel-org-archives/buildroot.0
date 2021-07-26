Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD1FC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:32:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18B7360BD3
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 08:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 18B7360BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB9D482FE7;
	Mon, 26 Jul 2021 08:32:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5npCmzs4fs_Y; Mon, 26 Jul 2021 08:32:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4754F83396;
	Mon, 26 Jul 2021 08:32:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 886A11BF293
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D33C40208
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 08:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqDeRXBf1lZj for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 08:32:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 661A7401C0
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 08:32:13 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b9so9198735wrx.12
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 01:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZO6qOXRgtUyzWacB9dDZvAu3Koj485Ym5/l7Shmaxro=;
 b=dy0FcqK0DkxHvX9gtYLsa+T7fvKE+380f7GkjUEeNrh6ne5mJ2yX4BUlhGM/xnoqRx
 gvUFAkZEG25KTOJrT1pfG83ZhAwH6jtDyCE0yciXB3ttQKtnhoR1pS3pT2cEkLHVyg7/
 UcHsJYcbS44slhMOJ1MPoVodCfoTA8nzkDsVlBgUYmZGEq96bAGvBEcwQgKdxCIb0mjK
 gBVsblkyBaAOv+zIXPVcs9kx5KcQeVUGHxDsP3gt1Pv7nd2umiLkEUIC0pYP8NFfr1Ki
 hPWXvDbWfxsOCo7wdBC75R9nz/lfL2afXOnh7baAWmqUzfIilW7Wdu+lEsh4UORzaRSX
 Umlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZO6qOXRgtUyzWacB9dDZvAu3Koj485Ym5/l7Shmaxro=;
 b=A6nzzC8iJj3r8HZnZX3YBuoXJJdMakNrhJMKKWT3qBNmaDp3OHOGtYLGFIj1NGqmjy
 NX6oyth2jzjF9vcdpS2idJs/6UsFFEtV9cwoiVeSj+mi65BpE/evhLv7u82RvqUCgS0Z
 ayn/z0+yfrlQqZY+pjCruoPrwGJs1qZAI8RO7s5DsSYMeVQKdqgD0luY+rYbGiiVIUMb
 Qtm4TwIbG9CvuZzaBRi+WuXGDkg/spGOtOSoC0uo5rEFMOM9rT8dandvRwf17nEJZjWZ
 RvUmU2nIjACYPCK+yHhHR9yYrZfPSt2RK4gOUnOc16w1NfT5TGrI3DSNGpOrXXnETCDr
 1eYQ==
X-Gm-Message-State: AOAM533OJU7P3E15HQYHNJo8f6HskO5htJ+Hd5YOfBRMRfzMqnr4N5ii
 01w1bS5rYF6VXxt/QDp6HcrbsgU9lX+aSA==
X-Google-Smtp-Source: ABdhPJx5igBIR4EoRE2UeLZpZ9I0GbfABPs5c7/1YHhIlfemSJkTC4E9YF6Gocr5FxAZ4BxyAN0KZQ==
X-Received: by 2002:adf:efc7:: with SMTP id i7mr4429018wrp.87.1627288331449;
 Mon, 26 Jul 2021 01:32:11 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d8sm43396516wrv.20.2021.07.26.01.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 01:32:11 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 10:32:06 +0200
Message-Id: <20210726083206.1707131-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gpm: add SELinux module
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
 Julien Boibessot <julien.boibessot@armadeus.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for gpm is added by the services/gpm module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gpm/gpm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpm/gpm.mk b/package/gpm/gpm.mk
index f59d059a41..695264348c 100644
--- a/package/gpm/gpm.mk
+++ b/package/gpm/gpm.mk
@@ -9,6 +9,7 @@ GPM_SOURCE = gpm-$(GPM_VERSION).tar.lzma
 GPM_SITE = http://www.nico.schottelius.org/software/gpm/archives
 GPM_LICENSE = GPL-2.0+
 GPM_LICENSE_FILES = COPYING
+GPM_SELINUX_MODULES = gpm
 GPM_INSTALL_STAGING = YES
 GPM_DEPENDENCIES = host-bison
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
