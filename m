Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B1DC64ED8
	for <buildroot@archiver.kernel.org>; Fri, 24 Feb 2023 10:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68F10405BF;
	Fri, 24 Feb 2023 10:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68F10405BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LOO44IUrQHoT; Fri, 24 Feb 2023 10:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD68D405BA;
	Fri, 24 Feb 2023 10:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD68D405BA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 318B31BF3C8
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 10:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B68081F06
 for <buildroot@lists.busybox.net>; Fri, 24 Feb 2023 10:17:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B68081F06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsRcQHqbmigI for <buildroot@lists.busybox.net>;
 Fri, 24 Feb 2023 10:17:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12DC281EFC
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12DC281EFC
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 10:17:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h14so4704012wru.4
 for <buildroot@buildroot.org>; Fri, 24 Feb 2023 02:17:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Rz1xhDpNPBAhxDfutdb496bReiI3xnoPWDUgQlIfY8=;
 b=2YIdZ+zz7xP+fWSqo2upzejlVw6QTzilkia/qB2ngdKHLueiUEKAXJraQ9EzHvj0bJ
 5rmyYuw1+cjfl2twTzyeVPD1C8vMlqsYeGRfOMn9BFiYMEp0w5tf/4TyhgoYgsXLaePA
 MQ7WVm3GcATl7FUFnUjfM68hZtvf4IFuav9gT9TZcvrpwR3lDnuI8+PYQ8JX6UyzAthE
 PC9qrfyYv4ozW4OC/s24Ka/baSb5Pecn60y56WBI9jkW2EVAEqH7sxk3juN/BSDV4ylD
 7Rr0c8+pTlVEfOZgfe1kPgOcQB8Pu+ZUHmmEVXWGr6wXz83vVGFB7zgQWWZ3ABt6EVfT
 g5OQ==
X-Gm-Message-State: AO0yUKV5KD4GIBXhfqeYkdRMIUqLZr06BkG4SDUrAlCK1lye+PRfP3Zn
 ofPrHGLLqg26fRMiHs0Pv1+ICQKLNDs=
X-Google-Smtp-Source: AK7set+sEIHiabhA4ugjVEJq5v4uA++44fdNTvUTvGWSliUSTzvSWArkjKWWFr9G/BAkLeBlgFOr6w==
X-Received: by 2002:adf:d08f:0:b0:2c6:8e3a:f6fe with SMTP id
 y15-20020adfd08f000000b002c68e3af6femr12709681wrh.51.1677233842796; 
 Fri, 24 Feb 2023 02:17:22 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 l11-20020adff48b000000b002c592535839sm12553459wro.17.2023.02.24.02.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 02:17:22 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Feb 2023 11:17:20 +0100
Message-Id: <20230224101720.1458102-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+Rz1xhDpNPBAhxDfutdb496bReiI3xnoPWDUgQlIfY8=;
 b=eekIF0FqnaZinNtzzU1rPr01aCpGnshisEVTiFz8ZfqnO0On3AThaSErFOUxhWihTz
 SgcTDLXlUtXKIV6a6aRVT7kovSE6YuT4R3KC/4dFYLRlQxyabDT596ntDSj2HHGW9lYS
 Th//PNXS6WyxRgDcXkpToD6i1tLSJI1flTvrMVq6hR6NlQC9VACS+JWm/+O+RUm+4xy6
 3R5RUGZLnehNUyvoI+FoiWCbewtgcr89oASyCi3q8hEOnHTVHjRY3EFosOrAr71zCtqL
 47EKwwtqhS+5+2pyVUpkAUn0WlbeAh9H3TFa0auZMItcMCxiV6loRCgJsegtFX4rnUAE
 SI3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eekIF0Fq
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: add linux-pam
 optional dependency
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=15316

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xscreensaver/xscreensaver.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 6cc7e8febe..dc5f8b7e1e 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -42,6 +42,13 @@ else
 XSCREENSAVER_CONF_OPTS += --with-png=no
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+XSCREENSAVER_CONF_OPTS += --with-pam=yes
+XSCREENSAVER_DEPENDENCIES += linux-pam
+else
+XSCREENSAVER_CONF_OPTS += --with-pam=no
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 XSCREENSAVER_CONF_OPTS += --with-systemd=yes
 XSCREENSAVER_DEPENDENCIES += systemd
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
