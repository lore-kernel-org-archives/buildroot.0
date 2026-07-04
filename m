Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C83BC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 13:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2897660719;
	Sat,  4 Jul 2026 13:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W57ZD6vRzWN9; Sat,  4 Jul 2026 13:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23DAD60706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783171912;
	bh=K9330ccwljVhgd8owacHrq/CrelIQzxRpOfFwi8blpQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fxDSwXSZD5/3k98qN3kkbfL3qouakwBI50S+g6L5yz6wHomkTHGz716x/9uDe4LWS
	 hJ0RvHp26buHZ0E2Eg+Pfoeohg2LKpF/I4Es2T/dnIX0qe8ucJLC0wvWvFb0MmqmHD
	 jVxTtke0Oa1f8IbXKfGF8yFL8rmVhjV7QjuFW2VIMU+HvZn5R53tndjmOQccuEVeWV
	 L6hSDJsCNJglu06SO1eULLRan1+bXQ2H1hOqOnezhDf5C10vVyxc8b+1+28dj89aIE
	 dqj4MoJS2ywEOT9zrn6WbeRv6LR6nbBOnOjDJeGY/EThjKo2ku756HJ3TqAju1iH4/
	 xf9V9Rj48Bi5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23DAD60706;
	Sat,  4 Jul 2026 13:31:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1815B316
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 13:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F21B7408A1
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 13:31:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lgNwrb90oU9t for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 13:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fbstachura@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EA02D4089B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA02D4089B
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EA02D4089B
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 13:31:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-493bc8fda98so15690205e9.0
 for <buildroot@buildroot.org>; Sat, 04 Jul 2026 06:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783171907; x=1783776707;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NRx4DYyqCr5HSuLpqXFswRQ6YKgQHCQvCoBWST9/lb8=;
 b=VOp2v0EcQh15xKotBrv+oHWGgVT1IVFC3zJGf1pofnt/88QzrmhgZuoGRru5GmT1+f
 +klQv8GCKQEp8giIdW+5E3asVru/OL3HWnnPpF1Q0/n33psVs7Jorp4196lnzV+H+rU5
 +wLbKTt0viWEBhfSvP0i6vt9wiPzqNUQ67LuYZ2QAjLSbNlgd5datuPH8FSIKzbmWvCi
 +v0cybhWnkCMmMeVwubtCTUlJ0/80KwBv1+i4rZXihAD2eNcIC3+QBEW+KXzk6sV9ng1
 Q2uWKRytjq52VBWdEFuHWa4HY0p5NSVYPQt3wOmO5RuvrQRWrBaVZOkTzhARX0lqKMvB
 QwnQ==
X-Gm-Message-State: AOJu0Ywp2zLSY0StcCVfTqJb6xOp9qk3N5SDYO9QnAlNWqu+y7gINOEh
 +ZKNWrwMY7Uvgp0+nNKr4AkTgh4B3MMLVEperM6wcZyxlioOZ5xB1P7vaazuXw==
X-Gm-Gg: AfdE7cnh0EQmQxOb8tZikkZc2SbhXZgkZAhXjeB81cJe/nk/xOgEiRZStPii2ytVv/J
 qVuEOCnO9RXVVmfL7obcAV7BvlZjZKzrBd2zI8Ok22/TLeEqqiFzMNxylMSiRzZZCQW0DiLRsH2
 29E16JJT/TpxZlkMr1B1sCBizmO3lNwBUDsOHTeqrx0eRuNZcg5piy1rFjZzJAI3GW989PekYYT
 sLIhHNyTGzKS8DPkdxMcSLmTPI2wlsPU1WPY0rUT+c3OAF0D3YVJjpiDnBsbQIE/7M5H52HfpVQ
 0nOJ3j5jZoTdOXSrjiKxvC4CRjp5IRb8F8+VFiaot/mWxC2psQ4eYiU2n6aRI9GIRsJiQPWiuCy
 Na9kDDQxFZ5sCr5PUtU7IRJOOfB4IsSDlrM5e2RyAbweif0su2m/H0XcCJv2Oe4y1dxmCm2wPg6
 xpNbLcyPTukzwId/1ivG0TPwYUlhVnkA+PvcgBlJNFV0uMzvUMP4WfAvwKTwhDU9Fi4zV1HhR/z
 KHwSzhPyyNZScCmu9wf1G0/3MqmhVI+EvMG2KCDI5uesZ85mJ4N9A==
X-Received: by 2002:a05:600c:a01:b0:493:b2c1:b2f8 with SMTP id
 5b1f17b1804b1-493d11cec87mr34866825e9.4.1783171906299; 
 Sat, 04 Jul 2026 06:31:46 -0700 (PDT)
Received: from trial.home (aoy29.neoplus.adsl.tpnet.pl. [83.26.132.29])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493cce11497sm134456255e9.12.2026.07.04.06.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 06:31:45 -0700 (PDT)
From: Franciszek Stachura <fbstachura@gmail.com>
To: buildroot@buildroot.org
Cc: Franciszek Stachura <fbstachura@gmail.com>
Date: Sat,  4 Jul 2026 15:31:19 +0200
Message-ID: <20260704133118.1245367-2-fbstachura@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783171907; x=1783776707; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NRx4DYyqCr5HSuLpqXFswRQ6YKgQHCQvCoBWST9/lb8=;
 b=gjFcSe/7hI5EtOG92tCZaNGDD4URtK1cLXsOp2vBgQ1bLkR+jObLd4p9OI+wzXufdO
 K6sCAWq42vtui/kDqummRwUa3m8USHiOJKRSQmMjlVGJ8M5PfcrtUaBgWC7BH/EER1iB
 8Yr5qW89+AT4QE4V8o1C3qHHU5m30CG/9wtYxRPZGaxZWuy1q6xRc9Rbkn6ws2GWIcFF
 wDTVWNrIYHpEI/eHp1pmq/plgxWrt8YpM4wVaMSAahh3O0uIme5jCxcdymccpRFGIUi/
 NfJTeRNwDf800/P5RwfAvSlYiYP6rIPfspRHPyGBk+w2JqmlIsRKB/5U0rg50jUzb9kx
 8buw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=gjFcSe/7
Subject: [Buildroot] [PATCH] package/memcached: security bump version to
 1.6.43
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/memcached/memcached/wiki/ReleaseNotes1643
> More likely critical security fixes and less critical bugfixes.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
---
 package/memcached/memcached.hash | 7 +++----
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index f241723111..93480d338c 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,5 @@
-# From http://www.memcached.org/files/memcached-1.6.42.tar.gz.sha1
-sha1  de453f58745238c70091fe243549c406aabdc3c5  memcached-1.6.42.tar.gz
-
+# From http://www.memcached.org/files/memcached-1.6.43.tar.gz.sha1
+sha1  37307d13528f355fb282bc8841ca033272e44ac9  memcached-1.6.43.tar.gz
 # Locally computed
-sha256  50f08b879d4f9d36dea9d905e9eaade15c708e38db7e9a73fc21dc8b45395de7  memcached-1.6.42.tar.gz
+sha256  8042ee26e004efa0db41ca4a7c713f759c3280c2f8bee438579f13de1e509435  memcached-1.6.43.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index a164e82a51..e297ca17ff 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.42
+MEMCACHED_VERSION = 1.6.43
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
