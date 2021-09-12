Return-Path: <SRS0=7Pu+=OC=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E413FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:53:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3A8561026
	for <buildroot@archiver.kernel.org>; Sun, 12 Sep 2021 19:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3A8561026
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B4716071B;
	Sun, 12 Sep 2021 19:53:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DMyLoeVQ2ugR; Sun, 12 Sep 2021 19:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CEF606B6;
	Sun, 12 Sep 2021 19:53:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 829F61BF409
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B09681BA8
 for <buildroot@lists.busybox.net>; Sun, 12 Sep 2021 19:53:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4THKPZUAoMh for <buildroot@lists.busybox.net>;
 Sun, 12 Sep 2021 19:53:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 311DB81B9A
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 19:53:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id g128so673080wma.5
 for <buildroot@buildroot.org>; Sun, 12 Sep 2021 12:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hoe91kL2crfOv4EuU48xy3lQKlL8FFZ4XjlQIB3/tEQ=;
 b=YcDRevO8RSlPv1E6T7xeJXkeRiiZEKhW9DjW/nORomIX+NfOKZEdL5ZtHdyw5E5+sh
 B8OwL/q23aCT8wL6wAz34e/HqOKeMqSmF0Qal7yHSPCbBRl9APd7g1KsKK75C5aLSqIb
 KfBiMGrRzMro8l13lQ3ZxkATKAbfxqytGGxgF5o/cvqp2RC6lF+BVqPL4rDuqaMekXh5
 /SXYNBJ4bCFVhircZwFF7wI55agyjiRWpB/RFwljAgUiPRS+v0zR9ZM3epDHEoFPjKya
 TZaa8FllD915HPsRqUPgQkhLMTTl6LQZFsjQ6AQ9SLmZYV8MFPAsVZ7HhQUmSDQ0CIO7
 uPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hoe91kL2crfOv4EuU48xy3lQKlL8FFZ4XjlQIB3/tEQ=;
 b=z+U0DPs0cP1xfZRT9rnJGSJcx1nInwDYFcedh/G3OMRtpVW6X8i55wjTaWNynAzkKW
 4/7EezfHodYE48OcjJAyvwAZg9J8SXapL+aj7AneLMtSkEodFD8EFYMc9N0BTtgRW7Wh
 Su2JBEoYgZQevV52rAfJfOTqx2iwndrLvJVLRhc4rkaweNPpSnYb2ujTlWB9GQVkBd+k
 ZZ7IRpk5XBmh2FG6WNG52NvU1Wf1hmXZijQSw49RMY0Y1u7sdtOaQu5Ur4Lk1E+i0fFD
 xnibMZZgNKTF2O5QqO3BoQ1Bhe/4IQl7T699WocX/PKrmyMoXgWTqGlMQEgOaF884UKk
 zxKA==
X-Gm-Message-State: AOAM531LGY8iJq0qDVcfxjv4iEQ1i9UfInAj9bggROrq85JgkSxVzI/A
 fyM4pF6XT9sr76fra/MgB8dA8vhNJPY=
X-Google-Smtp-Source: ABdhPJwdxV0K0gLm2a9gPSyOPw2/HIrslKqSXfEW4jVcppi2gutI8I/L/4uJF2atfRGQW5+eYIO4Wg==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr7869234wmp.173.1631476428140; 
 Sun, 12 Sep 2021 12:53:48 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id v10sm5432828wrg.15.2021.09.12.12.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Sep 2021 12:53:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Sep 2021 21:53:33 +0200
Message-Id: <20210912195333.2718045-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dovecot: drop host-gettext
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

AM_ICONV is not needed since drop of autoreconf in commit
03fbb81b8bab7bad135b59267533be7688babe39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dovecot/dovecot.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index cd637f19a1..733917b062 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -16,8 +16,6 @@ DOVECOT_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	openssl
-# add host-gettext for AM_ICONV macro
-DOVECOT_DEPENDENCIES += host-gettext
 
 # CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm, which
 # is part of the Red Hat packaging and not part of upstream dovecot
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
