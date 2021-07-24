Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F11FC4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 12:21:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E851360E97
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 12:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E851360E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1C32401F2;
	Sat, 24 Jul 2021 12:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zlKFnGWsa6S2; Sat, 24 Jul 2021 12:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10929401E1;
	Sat, 24 Jul 2021 12:21:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE4291BF358
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 12:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC8F34027C
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 12:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bNtldaA4qywF for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 12:21:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88F9640274
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 12:21:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o1so5198034wrp.5
 for <buildroot@buildroot.org>; Sat, 24 Jul 2021 05:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AfJufVrqIdsE9cTnr7KbgsfEMxztJMsjErIG+u0o54E=;
 b=pkXlhAIuDy6XfnCb9jfGg0GOdxEKGyzbcjGN9Sj/58V+PJ9O79ikPXNLUNl17dCCBM
 AvMv7nJo6Ayl/u7Pjp+rqvaUxpF+fKob0d5KNIoB8ymWJsST1R4HFKRgNtdxbw8KLyH+
 gcj2agmFtA9I+oyJStpUUur8gJDfFqdV29y9NRcRijRswuOEOvI+yJoQcj7NyHqsolYI
 /V7pbndATV5+jl4ceOOh6B7eq1OVPvg8ZBEXpPPMSdc8vDUOMKT/GEBvHWuJ68W2HxwE
 AtBMemIOfZ91CGwCB3e4UeWmUiFDenAq1gHx1p6nfYBPdu9eZAPb02ODLOkOQXdUiM/9
 jaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AfJufVrqIdsE9cTnr7KbgsfEMxztJMsjErIG+u0o54E=;
 b=bpsxCu3y9NmxbCtyycOdQ4zvhxpCHl/NBIoG26xK2nY30/FDoxig1/MlWBhEKze6Jo
 OmYyaCgrWi+cSxJMlDoS+rMrnxxYrRdAz2ACFZfr4ntBYFWSSJXbJyOnb4KLjEVnGEHs
 kF6iHMctVT33oC8NnVWyXviSBQuRiC4n+hzVDJGfHZxndzrLSp/UzTK0Bi1pemis+ill
 UnGLA+OpTI/jVtSUIR3Ax7Xm2D2ogk56ob13CePHFnkLT1GcZ4TFWm+/F4GYV8+RENCe
 MXIgDQMYhmb3WbAUns4OSrkncfhtSYuDuOUs0Xbx9JwXaEeIFANQLxO8/9IZoCT7DoVL
 OezA==
X-Gm-Message-State: AOAM533r9NMtW2YsSawEEPoq8OinyGESWUtbaJrNp9xpb6wH2k6di5Jb
 DuQWotG3BxLSBKo2pMZNnVOwLkFOpLYBNw==
X-Google-Smtp-Source: ABdhPJwNVKqiJ0bzHDA2OM6hpM9n6cVrNkjSoaz9VelJDMyuKnekv6FhEumHY8ZKSOBlEhj0XNOLAg==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr9737382wrw.412.1627129288321; 
 Sat, 24 Jul 2021 05:21:28 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id p11sm4171561wre.83.2021.07.24.05.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 05:21:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jul 2021 14:21:22 +0200
Message-Id: <20210724122122.634455-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mono: needs host-python3
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

host-python3 is needed to avoid the following build failure since bump
to version 6.12.0.90 in commit 4be06fa8aa054e59d97866dc5568f4e10762e353
and
https://github.com/mono/mono/commit/0f47ea5d8088ede472650da47bf58e5a0e063ad4:

checking for a Python interpreter with version >= 3.2... none
configure: error: no suitable Python interpreter found

Fixes:
 - http://autobuild.buildroot.org/results/6a185e69fe8e123ba26c26b69091d001656693c7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mono/mono.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index df3481a498..27f7886224 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -53,7 +53,7 @@ HOST_MONO_CONF_OPTS = $(MONO_COMMON_CONF_OPTS) --disable-libraries
 # ensure monolite is used
 HOST_MONO_MAKE_OPTS += EXTERNAL_MCS=false
 
-HOST_MONO_DEPENDENCIES = host-monolite host-gettext
+HOST_MONO_DEPENDENCIES = host-monolite host-gettext host-python3
 
 define HOST_MONO_SETUP_MONOLITE
 	rm -rf $(@D)/mcs/class/lib/monolite
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
