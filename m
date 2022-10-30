Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AE6C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 13:01:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D59402EF;
	Sun, 30 Oct 2022 13:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74D59402EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o2Ik2-NqbWd7; Sun, 30 Oct 2022 13:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D76C402C5;
	Sun, 30 Oct 2022 13:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D76C402C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 61A941BF48B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 13:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CE518125B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 13:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3CE518125B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fmvIPbg7K2mK for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 13:01:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4032B8125A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4032B8125A
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 13:01:52 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id j15so12496781wrq.3
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 06:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VyRQackuiPFajMy+qfPUd03ku4pIvyD59sWRBK7rpBM=;
 b=vl7yvpTqxGbzjtpzOrXXJ3W4FteQQ3h9fa+XnF/euMBx4K/bsN+o0/9VCWkK6kT0Wx
 GmcBDl6n1K8EhHMM2d2ABSzYQuUM3iiakcmj5gyUw7GIulwLmlUhaQoNhB2g41qB/QHr
 lFyIKTGR5pQVu0DORQ3pHOmHc7V+Z/dvGI6dM73aLizJ8gbPrAI6LHrOq/vJPj8IZLwP
 lj0z+0ZQw5ob54tEsGv9kXkP8IwTz27q01yuPm6KpdpBEMf/Rd7VD2M9dCS6bStdUAsQ
 RDWQpe8jamupIxEEGTZnBu1nARUQ8+1RPjcRwyt90jdD71uMMjrCA1Pkhkm80spO1kJy
 IEuw==
X-Gm-Message-State: ACrzQf2JGsJNgNEBOedNllHDOuLkdRuY5+USlrna6ExmyLHpWT9NL8C2
 WJZidiZ4RgdD5oKHlWyyjmWI3UsazfU=
X-Google-Smtp-Source: AMsMyM7MI69WOETLXhik/47X11266K7JYwPgoF2EJ0j05KV5ScUdajBHPWrQfuCPkRlcgNU9zz5G4g==
X-Received: by 2002:a05:6000:156e:b0:22e:6bf3:79d0 with SMTP id
 14-20020a056000156e00b0022e6bf379d0mr5054143wrz.456.1667134909930; 
 Sun, 30 Oct 2022 06:01:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 f18-20020a1cc912000000b003cf5ec79bf9sm4317033wmb.40.2022.10.30.06.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 06:01:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 14:01:44 +0100
Message-Id: <20221030130144.399291-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VyRQackuiPFajMy+qfPUd03ku4pIvyD59sWRBK7rpBM=;
 b=L0pPwcV06jONYf+6V8YF+jdrbjUSQYlPYizC/FPTMCm4vKITdbzqQWY/9CtRrxsEcU
 bpo97rGvo5uoZbRIIzoC6Dm96xbB3ShES4yAARWSJZMWdAZwtBDhcaw9GHwRr7UO1aJZ
 ZjpgIty354X1vevHUgZv++rVW9AxBvoeE0kW7d8h97HV2PMN/B9sODEh1ZQDZqAxrJY6
 HyHKXn3wuS4riUfdavWjD7rIFrDQEIKAkwvSDjLtZRgI3mnRyY5UIn9PktAxSs9JBdgN
 W1vCjTPuCeS4GQQDv6QT6ArL2B9JKEmkuKfZktBfZFkeXOmWCO8unUcAEGw7D+AxH3nb
 D8mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L0pPwcV0
Subject: [Buildroot] [PATCH 1/1] package/mbuffer: bump to version 20220418
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
Cc: Mircea Gliga <gliga.mircea@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbuffer/mbuffer.hash | 4 ++--
 package/mbuffer/mbuffer.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbuffer/mbuffer.hash b/package/mbuffer/mbuffer.hash
index bab568d1d8..8f7b8dd07b 100644
--- a/package/mbuffer/mbuffer.hash
+++ b/package/mbuffer/mbuffer.hash
@@ -1,8 +1,8 @@
 # From http://www.maier-komor.de/mbuffer.html
-md5  b6787260112e3ac416c0febdb097caa8  mbuffer-20211018.tgz
+md5  90e183efeec2812e2413e97b65600acc  mbuffer-20220418.tgz
 
 # Locally computed after checking signature upstream
-sha256  e240c1e4e4ac14c28be8c660ec47d44ce16b1e8ec92aa907ad13004ffd5db6e3  mbuffer-20211018.tgz
+sha256  6e5801f9f5ff11445d1d03028b5a03cd08af5408697b7f94c427833228a300c7  mbuffer-20220418.tgz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/mbuffer/mbuffer.mk b/package/mbuffer/mbuffer.mk
index bbf27579f1..6381d97e8a 100644
--- a/package/mbuffer/mbuffer.mk
+++ b/package/mbuffer/mbuffer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBUFFER_VERSION = 20211018
+MBUFFER_VERSION = 20220418
 MBUFFER_SOURCE = mbuffer-$(MBUFFER_VERSION).tgz
 MBUFFER_SITE = http://www.maier-komor.de/software/mbuffer
 MBUFFER_LICENSE = GPL-3.0+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
