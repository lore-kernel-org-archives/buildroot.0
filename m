Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37177C04A68
	for <buildroot@archiver.kernel.org>; Thu, 28 Jul 2022 19:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF3C283054;
	Thu, 28 Jul 2022 19:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF3C283054
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tz6vFLkzhnrE; Thu, 28 Jul 2022 19:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB44882ED2;
	Thu, 28 Jul 2022 19:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB44882ED2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 287FF1BF21A
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 03B95402BC
 for <buildroot@lists.busybox.net>; Thu, 28 Jul 2022 19:16:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03B95402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCMwHvdeQQkx for <buildroot@lists.busybox.net>;
 Thu, 28 Jul 2022 19:16:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA95540127
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA95540127
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 19:16:52 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id sz17so4735269ejc.9
 for <buildroot@buildroot.org>; Thu, 28 Jul 2022 12:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bJ6cIBf7kbetXIq/BCufYULZdI6ZvJkWiQEaZLnLRaE=;
 b=mO7tlIORZK1UunGmfHn60S806Dxw2KnkNYDgs7uBXCLYgM/L1z++AeHk0Z5JwwOgKg
 NTt3fF5doaRU0AOuExVjPdZcpOCcq+QN/rg4FN2BI2/RObPgqVuKSz1vQNamtd8NU4JV
 65iyOcTSK8K0MeCUXre16iW1YGDuGspp0kWTJNu9+iLi5Z1JUeyGMyPdsYFm8xKR0KCj
 MeYgxLRRlK+6pJUngoUOIffFDrQ93Fjgag7+qZckoB2UcNTw3v1Y2V9cOTOvMoK8/A+C
 zugI+2g5/BVRN2656TpX+OGQMLrE3QjnQ6lcx3DrHooIR9etABUf/fdUZa1tYIYynqEu
 mI5g==
X-Gm-Message-State: AJIora/bSHvPl7L0YBvvD/PWNj/4MefPtv8Vw+/DdU19dLaggtdFXThW
 HZcZdcpnKVyZ8gnwMO95sPGLOayZLHwxAz4A
X-Google-Smtp-Source: AGRyM1sZqrtHV/oaghZ44WjV1xd4K9vUDAlxsKU8mBQpUwLcguHCtBeT8aHtEcQUxm/I3kyxWy4dsw==
X-Received: by 2002:a17:907:a0c7:b0:72f:b204:c281 with SMTP id
 hw7-20020a170907a0c700b0072fb204c281mr289748ejc.720.1659035811101; 
 Thu, 28 Jul 2022 12:16:51 -0700 (PDT)
Received: from arnoutx1.. (ip-185-104-137-32.ptr.icomera.net. [185.104.137.32])
 by smtp.gmail.com with ESMTPSA id
 10-20020a170906328a00b00721d8e5bf0bsm734594ejw.6.2022.07.28.12.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 12:16:50 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 28 Jul 2022 21:16:48 +0200
Message-Id: <20220728191648.1201217-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bJ6cIBf7kbetXIq/BCufYULZdI6ZvJkWiQEaZLnLRaE=;
 b=g1lW+/UlGzIb9uySfhdZOPfK/QWVA6xdnS2IQ2VUNk0C/fLOjiEj5tP4SR8cIL/24t
 4rZgSFol+fT1ekyyzZoNcvUure9K6fDRxbHGUGqSqqipANVOzKubYgiRu8qMJQXTmdHp
 x6DFz9uGnJnzCLYk+QBD4a9K1RX7cdp0g1gx14LF2zYhk6uOLy/tUqK4rira+7/NfV/X
 1u8c0alODrl4K4/87ZOntD2jn3QrUXnXhUPAkB0RR38ByQrF2HHwxFzc9KSW5S3Ithyi
 vrvqOqI5fYEp17NsLtcio8Xk8nJNmdK/5cFz2mqkP5FgmwK1SJ1NkkvFXbevHVPEY0FF
 dmIQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g1lW+/Ul
Subject: [Buildroot] [PATCH] package/zsh: add more cache variables for
 TRY_RUN
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
Cc: Phil Eichinger <phil.eichinger@gmail.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It turns out that zsh has a number of additional TRY_RUN calls. We
already set a few with cache variables, add a few more. They are found
based on reading the configure.ac, aczsh.m4, and the configure output.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Phil Eichinger <phil.eichinger@gmail.com>
Cc: Norbert Lange <nolange79@gmail.com>
---
 package/zsh/zsh.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
index 4897620a00..688c6366e8 100644
--- a/package/zsh/zsh.mk
+++ b/package/zsh/zsh.mk
@@ -14,6 +14,14 @@ ZSH_LICENSE = MIT-like
 ZSH_LICENSE_FILES = LICENCE
 ZSH_CPE_ID_VENDOR = zsh
 
+# zsh uses TRY_RUN to determine these
+ZSH_CONF_OPTS += \
+	zsh_cv_long_is_64_bit=$(if $(BR2_ARCH_IS_64),yes,no) \
+	zsh_cv_off_t_is_64_bit=yes \
+	zsh_cv_64_bit_type='long long' \
+	zsh_cv_64_bit_utype='unsigned long long' \
+	zsh_cv_printf_has_lld=yes
+
 ifeq ($(BR2_PACKAGE_GDBM),y)
 ZSH_CONF_OPTS += --enable-gdbm
 ZSH_DEPENDENCIES += gdbm
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
