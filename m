Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96CBC6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:03:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 933E56121F
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 20:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 933E56121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 577E840146;
	Wed, 21 Jul 2021 20:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XUgAel3A5t8a; Wed, 21 Jul 2021 20:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AED6F400E1;
	Wed, 21 Jul 2021 20:03:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73E651BF337
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6246182849
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v0Vdip3Mvpj8 for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 20:03:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36C2181D5C
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 20:03:22 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c15so3440907wrs.5
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 13:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f303gRAIfpHnFx5/qzxYpbdzEEuxEjFZvbzLB0QMrXs=;
 b=ITsMES0ebkRKkq5oBd2fxg/hVJhBOInPEwvg1Y+LlcieFxyNJR238Ed2vMfDfQTOxb
 +i995TJ1mYimZjWbuQzBWrxgIBq4DzxbHYPEakiGbDAZUYrCuyiRYmcx8X5if/N7th5A
 TDKUx+SL4TBqcx5ze9jksS7C1YF7DUmoiebJEr2UnEGw1nOWKrBQsS2H6tBQLkA4KU7U
 6PYt8ecz8hyMsM9Anvkh2dVT0AxKM7spqtLo/P09RToW9o+CZB+0S7MDUyUhN6FrUbO2
 vGn7rRmDw8fG1V9nvDClB0GDlF6+gn0gMld0WYXiO4Qyupy/m+SQnGZ8YMzxL30bnvuk
 mmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f303gRAIfpHnFx5/qzxYpbdzEEuxEjFZvbzLB0QMrXs=;
 b=UqYPLGOPw2ouiAtZmqTp8tdQGivbdeC0FpRcOBNyvhq4YO7kEkH5GWSBOI2MGNVh5Z
 u/Vp4HJ/76kSq7j9acBD46S9NanLdPJd5netvf2OJojfcMn9qBxI9FHSCs3SOX435pEN
 uCziRnb2rG0Hr97zeQWPZMNpIoKQHoIh8oZT6QYCwYHyXmZY6OsvZ3geC+FdFHN8KTrK
 30ZbdQj5uuG328OU6JYHln1TNMV7OVFZHlji9pRKX4AzbaZFX5s7649myvhtHUtsZXe7
 Q8+IIwk8Mv7X3jdyEkgwgttWkBeA68PRqgXkSi79TTsIkq87G5fZB7U+5LOyRxqLxTHh
 iRMA==
X-Gm-Message-State: AOAM533F2ddnS55+b2ew8r8wEVnxCC23xocHjNCw7kmxT1+U1rEXSUrY
 dTXD8p0HNViNe4JMkCJbq7I8vf7kuWMnwQ==
X-Google-Smtp-Source: ABdhPJyNP1ELxf47ojBKgDqG9EnJmzxk+Aa3z2it9OVathpG29oq6Swvyq79bazYx+x1yyY3GZuI6A==
X-Received: by 2002:adf:b305:: with SMTP id j5mr43624151wrd.11.1626897800186; 
 Wed, 21 Jul 2021 13:03:20 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d14sm28001508wrs.49.2021.07.21.13.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 13:03:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 22:03:13 +0200
Message-Id: <20210721200313.502434-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/chrony: add SELinux module
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for chrony is added by the services/chronyd module in the
SELinux refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/chrony/chrony.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index b73ddb56b2..dc162a6c40 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -9,6 +9,7 @@ CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
 CHRONY_CPE_ID_VENDOR = tuxfamily
+CHRONY_SELINUX_MODULES = chronyd
 CHRONY_DEPENDENCIES = host-pkgconf
 
 CHRONY_CONF_OPTS = \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
