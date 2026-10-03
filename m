Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE82CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B50E4128B;
	Sat,  3 Oct 2026 13:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgWLCBDO1viy; Sat,  3 Oct 2026 13:39:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7633541212
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791034774;
	b=RkeKWqjVUYmJNYLRF1VlsBjUAFP3vhrlxwCtFP1bK9IzcQsjq8IixVaQO80gndjNqwZ3
	 m2+OPKNh9pTE4R8gNNGe5GIfPvUYH/d+s/Tlu7/BRVlE/snFY85UjtEuAq8x6R7e3YUOr
	 JEBzFB+hibeG+Aai3Zl2reZ3Dyt3ADANeo5pDrDTPoHyN1vm0+/BVYhFJl3QQen3GHk6a
	 R6u0bwQXsiBuCC/ksg4Jd58gbPKxWXW7CU2VfVBLBBsGn2i4utCB5uoUFdePYQiXS5UWo
	 KbLDigJhEj/q0tqqsHt/aiYGtF7bB3ggibJEJDd6DQ7n4PVyL5zjXQNoBvZiGTKZ0Sg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791034774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lATxY5FK++EgfPlIirhgtjVzpxPJnpzewiyqv1FGBPQ=;
	b=eeKNHn0oUJqj+PFPkkLfvELzLKzFjmS1KT4IGsCpHmAcAp3SXyVebaOJXo7OdT0ZC0xU
	 Ecc+oHiXldiMlI7zvAPXITUWfKwzOK1NG8AppQ9kscLRt7pLftAT9wa+0qsZ7DCrVenGi
	 fTmNyWkxbwEEHbkNdyNWsP3InzQDDd0HSVIvmQaL4uO2tDTGbEUspRe8nwPpaiJFYnsZR
	 J33Tf7Ja7Mo5g2dIx7DHT1VSc2DyV9SSn1PCeSDF7WkWKO0x8hpEyejKaoe+JvkQyV4Ex
	 B+koQUpFj1In5YwLjsJtW3aOwt5Q0NRGnqqe+C5PNijTyPpb509jBTcaAq+kYDzfV6w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791034774;
	bh=lATxY5FK++EgfPlIirhgtjVzpxPJnpzewiyqv1FGBPQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qR4OqlcdWysNaQO3dz5cSTmkyXuzNWZ8e5zOWAqq8fHd2g5Qwb5bUrVnx9t06sWui
	 SctGFIxPDi5OrVuyNHK1iG147oSasageCXQzWj7x61PJQfOWFFfb2+sySK2KxyaX4j
	 p4g0aCC2CT1iXyygA4R2BWm91J7lOlcEmU/ZLW/Kl5XDk2TUxovDKRi/5JOL62j0aH
	 iRBWZAbNg45UiEGReSQNYcpRSupArdHS+5/2F/c3CEGpgTckUsahCS0F37WutmABrL
	 dYpW1QItiQd9xSbs4bW5h+g6uhUcHNFxMHhFpEDHgOmhLBAdJMfP33o/Dazl78qytx
	 fpY0JBUgpisHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7633541212;
	Sat,  3 Oct 2026 13:39:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40BCB179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31C98813F5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQTrNVZ6hoZK for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:39:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 45D41813DC
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791034772;
 b=jiEwUAj1OVShFP7LDPQFfbgHq7cfMO/DT+VpjMAO4gHTINQnGAdY+Yo8Nw0lR0THN4w+
 Jpm3V9BXmN56RaPjouWLIFIqTKgcNnq9wxy2og0ZdL4UzfcEiFWWvp5irkRCi36QKf0q9
 mpkkbCtE9GaUyaFd7ct71p5oYZJl0H8Z60L1Ts75dq1cSu5oZFm3xCTP7pA4aGyYFL/ne
 SFWOd5KqvO4LSorywyQ+1g30rgNA+Aoqm4DnG0fEatKh5f1vHJYFwty6Rq9tosy4n0n6x
 eQx5OytdowJschvRUeOLMOAAzzFGN7azOhzfoeIuqunyPcSasc8xKVAPTErJD2wjnSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791034772;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=i8zkpglfgWIpzuoSY6mBGtcARt6nilUgbkWqH+MFWGo=;
 b=DCg508TrNPfss3l4yUMQxKnrJjqfvs4H/Ym/+hfDiUEyH+dwoR4R88bKdtpnHtrcoBwu
 wL/zMQu+rdGMg8YVIZ3Vm7GSs8ljIZtjXWnMwuexEWdfMeUzD61e8aVYVJWEqJN8cxzgh
 RXK4ngAOmKVqVzV+8OForpD0kzzBZl8XHiYZm5cXMb7eQNsBiKbVJkomFjWm9z4jLot0r
 cV3iSdf0lQvd+ThXv+1TxMOMYbB52QRMHqxRD/BQJgw9GQhlWYp9WQEAcJeG3hZL8E/U+
 HNjN8x3GOPLNTEb/S55MpU9FXrFpDrw/IOfAetLwkXS2XjA8WpEu8VC/v7TdSyZS8gw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="GBTXd/+R"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GBTXd/+R
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45D41813DC
 for <buildroot@busybox.net>; Sat,  3 Oct 2026 13:39:31 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a1635f7c89so5717935e9.2
 for <buildroot@busybox.net>; Sat, 03 Oct 2026 06:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791034770; x=1791639570; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=i8zkpglfgWIpzuoSY6mBGtcARt6nilUgbkWqH+MFWGo=;
 b=GBTXd/+RbmL8CWQ7h2fAh2HlFg5z3+96lY997eIKpsW1j80kAmRIsf8eREBDJhFa1a
 GV9ahWba3f8+7O7CqYr7B0snJaFaGGzNlHrIDVBg0dkcuAfXDFh5/kjU0btIN2kvWGJV
 nwlDHIw3pJ0tgBsOs3q85L9WomWaAFLGlEGlmWe6wFIRkNvongySVJFjcUhkW3XnWlgw
 wNti70LqYbRdTNDT5/LzxCq7yWI1Hyhn7tYUNxE+4ykGWSjvKCgEWrsrlxIa1yQflxss
 5tv86J6+jUXL5L/Cu7Z924W9OPL42twn22dZOvjA7pCLtV/hB63C4offPWoyMrjt6UcT
 Euhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791034770; x=1791639570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=i8zkpglfgWIpzuoSY6mBGtcARt6nilUgbkWqH+MFWGo=;
 b=an8lT/xDh6DuiCPW3/nSuLU9cmAbtElvZiDFb0rP6ABPuL///NltCGQDH2+hhUSGqn
 N+yaEZ1/psXjEaP4pz49rMMEn3Kl3LpQnwI96/rIejCry8NHJarCYvb+Oe6mzsltwIAx
 qhOARPoX7YiWgMghWW3TzIb0N0u7TPdDSHXGN+/ZWZpFc/sXdOGAUQUm8KgMwlPai0sV
 /8+0jB0PiyO+mP6Zkl4+2E8MVEbgQ51wzPHLt3q9VcQIaphEYd8Ifo1QiGqn5c5MYbZ2
 XNLGqn60s+wP9HFc6yrI5gQ3I0P1Le/O3dGu9E3SYko6tafjlE0vMGtBp70v7yea/YY2
 W9Ug==
X-Gm-Message-State: AFuF++lbfN2kidkEDC10mP2xQRdDF6QfXYYmg3sAqNz8ciFkm24XyPYl
 lBonNPnMOdmaMb1hWSx5hAoo5ZbojcjJKSh/mSZx+saTnYS+JbfEPikuE3Jusg==
X-Gm-Gg: AYBFou19ONbaQYD5rc0B7qPFD9kv8tjcS92fu52oloczXOeI3TEUG/6bIJqcKhtH5ky
 7XhnCl2D+E/pjh2eAD0mMf+RTDDCNbJI6QG6V5/x/WRV+GK9+FOkXQ7moH93mKrwCJOCoyLAlDX
 7BST6uZlIfmgExiJjxk/imrlmwqGN99ji3z+b3lZtXG+uqbXxpfkb0dFvmip/aIxCVJTtwSb5WQ
 v8t4NLdjIkzTLHBBtha475c8jrwDO6zBSPC16jbzG5kr9WHPodCTTu23+z4XyLZWwPIfU2uVQuW
 n9piXAtk+Ih+mtlCrqYtMmU7MspAiLxaNKQd119ljD2/A0jBcz9OmPUBoMjvs75pTirz97QoOND
 fNwx+YxYtm5REWnby/X96AIOfIC2Ulvf3wyehSy+BZQYEnSU1Zu5erxGBCOFk+V4WO6xicHEoo+
 GhSjptKvZlyHLSIkfUpX61k4lNiQytiLAnHOP0GQ9ovhHhyiavI9InxyGzbhQTgNIP+Jg2jxn83
 vHfsufIEv3EVDp48cTnwOClUOORM5IhWQGwsR/VJzI=
X-Received: by 2002:a05:600c:34ce:b0:4a0:1cfd:314 with SMTP id
 5b1f17b1804b1-4a1680f40edmr35193345e9.26.1791034769473; 
 Sat, 03 Oct 2026 06:39:29 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027741586sm171880425e9.14.2026.10.03.06.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2026 06:39:29 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Sat,  3 Oct 2026 15:39:21 +0200
Message-ID: <20261003133922.122516-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lua-lsdbus: bump to version 0.9.0
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-lsdbus/lua-lsdbus.hash | 2 +-
 package/lua-lsdbus/lua-lsdbus.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-lsdbus/lua-lsdbus.hash b/package/lua-lsdbus/lua-lsdbus.hash
index d6f30c052..430d2c0d5 100644
--- a/package/lua-lsdbus/lua-lsdbus.hash
+++ b/package/lua-lsdbus/lua-lsdbus.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  fce5db789b18663c5c48010eaa0b3411f63a7f0b3c70c761535c0d5e3f9f5e11  lua-lsdbus-3704232a634d1c866275b9a138b860421fd1c8ac.tar.gz
+sha256  8315e02c6bdf92bf02c3ed600d12b0eb24cca20c56207a67698e18ee3c51e3f5  lua-lsdbus-0.9.0.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/lua-lsdbus/lua-lsdbus.mk b/package/lua-lsdbus/lua-lsdbus.mk
index d398af029..9c58ee930 100644
--- a/package/lua-lsdbus/lua-lsdbus.mk
+++ b/package/lua-lsdbus/lua-lsdbus.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LSDBUS_VERSION = 3704232a634d1c866275b9a138b860421fd1c8ac
+LUA_LSDBUS_VERSION = 0.9.0
 LUA_LSDBUS_SITE = $(call github,kmarkus,lsdbus,$(LUA_LSDBUS_VERSION))
 LUA_LSDBUS_DEPENDENCIES = luainterpreter mxml systemd
 LUA_LSDBUS_LICENSE = LGPL-2.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
