Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35613C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEFB060C2E;
	Sat,  5 Sep 2026 08:12:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayc8znF5xx3v; Sat,  5 Sep 2026 08:12:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0239E60C34
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595960;
	b=gMfIMYLg8fPheE8ezp+4Qgji+eHJT4Wl9azAx1vVPpFxtDG6OmmI67SL7zlb+zv46JyT
	 RfghBguM3yBYnkpCO1c9iLMCXqQGQvEH4CUPDD+9ca1hXNJW76jZbrrnKD4tAFTR2V16x
	 aLq81LGi3GQmnyPNtoH+Tdr+kWRjYQb8Tp8UUJVuPleJfA2xQHcRsYJO+JTuQowDZ1Dtb
	 Ok0bR1NJEYj+lpczMyHH9EVW8GW4NeIsxw/78XVvaDfBSaTaaU8MhtACWt0Uq6G4VSoXs
	 WYlsVztfy6femIjhlHkX5hoJkK5gu4M7WpzLH7wc4Zcya2nMJcALQXXEWeLA5qf/G4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=J9MBLu0YHiMKgvNHoUsXJesu21w+CjE6918l4HT5ZMg=;
	b=SiWkL9GhMD/5PKZXuREMBLJIheKFWsFelfGP5U1lXb4JoW5CO5Jp2/HHZLUklMfZwXOw
	 2+/82YQflIj3iy/0LHIDRxtzDDpUfuCW7G4S0fw1Huo5dmcJOR1OdAoEVaIGwcyWK0wcC
	 gXGoJ9bxmFgCRpgLDas8BFkpP1GT+L+FS6FIzeO+/GJXIamNt69BveP9OlmBolGnW/57D
	 vfAtmmPuMFYNWLpIcdf8Q984GmxtPvErFvou6PH4PWveiWfPWfwXXxx2wad5buWeRxsKZ
	 qZ6Eq3A5dtOtinCnUivTin6rdTBkbqsgxnzhNIzWHIycMGYHAz3q+iOZKQQJYMCzj8g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595960;
	bh=J9MBLu0YHiMKgvNHoUsXJesu21w+CjE6918l4HT5ZMg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SeU5RfopQpoPZyF3JsEdm9K2h+/IPAFlyJm7tdo/51dHXnBsgNnX2JBD368H7MSSP
	 K7KyDKGc1zL/InKKdDFJOARp/esrQL+AW9cojrEk4qmEr71sN498ym7vsyNTTUAVGz
	 TL81rUQ0NDmqq0jG/6WmJlGV00e54NUp7k1QhEmHsflXaF2fwQEgAsvO9zbDRjTSKy
	 peJZglpV3XaSjvFRfmcgiL3IFO7y68VV9pvU2pnlbBBPglvrvPY00cL4sPsP2K2sVr
	 tAKfMdYQKED0hi44Mrsi+7uYLJnAfxGLlpyOrLsPkuqNmWEY3+8wtwDpXBBypEiK2J
	 ybeomk4bOEIrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0239E60C34;
	Sat,  5 Sep 2026 08:12:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C5A32970
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7B9781128
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frDrCcuv1AfP for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C69B98112F
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595953;
 b=npq6/H/umo7DAc+9tT5+WQ4X8iASc+QyBgq65LFgRUZ30ShOzgf/7SZb5CRIWtTyXA3i
 a+D1tuq6zWRX7uG8CElzLhYXkPqS6w7Igoex73ocZUhs0Wja/TW5bOzOTspm3s7oeusj0
 quP1OOLgX4tq40qMdh/vr+TcR5lIdVRA/5FOmV85r0KYOvUFgL1R5u+YJALR05eeylCux
 y0kQ7tV2qg8RFkc3u5GYxayk6wYhlyxCdqZAmWTIqgqjHfUbR7E/p07mzbUwEtUc2iY8q
 Hsii3oOsngaRG4oBqzdzgvYmktdjh+zZjmitst3ObKLIAncumwJqfBtoaLS6NuXWpJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595953;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nT0lJ6MxCmZfg2f1ugkOMqFJi275mb1xqD0tXDjiIhg=;
 b=R3kXKHkNeeXpUaHRhjDf9LAPb/hOVzrzR6AJlfhi4b2WDRLcnfulmP/OtaXCbCwk7OaF
 akIQegYcXiQoI1tGfoQ+RHe7UkzgGW3qZdTW4HUarALyxzSazjVHSoZ6OzzDPthkioZU0
 jMh0CCPAX1EMCcs/nv4hNJC9c+a6PpmUIZRHAKrN+Wda2Nt9N0lsF/SuSlzNgqOKBds+R
 FY63PmtJ6ApODmFx6paUeoH+9d6mGnZHnz4VyZ5FxJLl6p65W3hS0DXVP/mWB+TyXSaqG
 YuFnHhe28k0LQJLblB2Q7dT+J13WBu4HUAhLAcN6ta+seLHr0gA4X0TIKA3nzZkJxpw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=TJ1euGGZ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TJ1euGGZ
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C69B98112F
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-49557167508so21857075e9.1
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595949; x=1789200749; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nT0lJ6MxCmZfg2f1ugkOMqFJi275mb1xqD0tXDjiIhg=;
 b=TJ1euGGZ94lckaSrVcWjj8tTn9FulT3KrbW3qWmPRWYP/JGvxhJpgpOsu8jirGlQdO
 qv8OJB1y/pHyMldkSmcc9CepgaR6vEt9vTVN4Fen+fGxQixjjFYa0kkG49/h9Abv36Ij
 uJJQnC2Dmi5UK7ywCUeIUe/S1Y8KBWIuye3KlrYop2CiLvL2pqQ45u725ZaAdjbLWuq3
 uSDzEF3ffgAcokeDlnmmj7rhJuZAXKti/wBLKJBlEaFOJ/uYJHuLD6/KNOfLQ0h0f0Ni
 /XJLTcxCBpIDg5NnaCdrwE0cC7xLQAgAPNDeyRlbbQvbWxJF74a646sdkSdr1Fq8DBaX
 KzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595949; x=1789200749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nT0lJ6MxCmZfg2f1ugkOMqFJi275mb1xqD0tXDjiIhg=;
 b=S4qH+GD5XrwZynEYRp8tqNBhpID0MenkupLCAYYydHYxE6aIu5/acj68ySywHcVcGJ
 TPGlJCE8VtZZ6RxbkHsMIVsaHR2+3BLclaWyh/FqMiUfEl2+qgNUWWwqpI/u+EvtLW/k
 4eMIBryPGyjo4YpaPNhGzZ/LfRQjTMlbhxxfE0K/VIEhmws0OKA1i0MZijbn9OWYqvQ0
 q+3D75QIeemQDYdJvRkoT2LIsVuepGelLfa6JVtMlgBmzh628ffM1LSzF2VbehYJ9IIi
 6eDopUAxG0psIyBZ27y/JMeRmYzhd5Jhqb+3H4S86duN8XaL5QmqD07jB9iH40ymzEfJ
 zbHg==
X-Gm-Message-State: AFuF++ngR4FuUafr06rMiUlwUeSwMRcbgqKazlirTYS6lU7o5S5s0t7m
 RTSSK9/XuPz9ut47YNEwoZHaL3uEHvivWqzyZ0fJy6ZQ57BND1HMPiKq5nkhGg==
X-Gm-Gg: AYBFou3jc/A83ax4h5oobBzyU+OfhgqIdNkxJN9NyXWK5qbeVHJ0t4PBmnmjcK669+w
 gt11FULHboQ5DtYutn9up8V2NPYp5vvaiDn6Fjr6OYoSTYASToVxWmwktydytNMkindjmUlsjMi
 V8L/gbHq/L6jGEBTvvTBHih0EAKNm99faSlDAQ/Xcu8ncR2JL1r0TeJM6arHyuPUqEf8hrZMtT8
 crS7y1xIcUq1pyNYPF23oS66ucO23SsjDBpa0GGjZZt6pE85vl87v6nMGrFPB8JHekBf0QO5Kpn
 St4UdeXtLOs3WFSSXx4EyVxCdiS6eTuOQMnbURrzqX0+xFJMBRcLhyhwHEkM+cv9gNCsRPsjFkz
 J5SxxBKkPe4N0UFwdwy9fAgS8h5ESSYm/q6qyAIbzpClbWp+iR3EblC6h7odjafabBQU+bOicct
 tqBN+W9X/z9DguAnlpEhswrWHAU2GBqBK3tsqJt9Ax5mlrZpI3Td9q+meaNwHIaGNM7SDQXg1aX
 aQKHw6RZxeF3NZdpX0=
X-Received: by 2002:a05:600d:4452:20b0:493:f140:c3fb with SMTP id
 5b1f17b1804b1-49cf81f1542mr154709045e9.7.1788595948966; 
 Sat, 05 Sep 2026 01:12:28 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:28 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:15 +0200
Message-ID: <20260904185921.587878-7-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 07/12] package/luabitop: bump to version 1.0.3
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
 package/luabitop/luabitop.hash | 4 ++--
 package/luabitop/luabitop.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luabitop/luabitop.hash b/package/luabitop/luabitop.hash
index cfbf2b651..283c90352 100644
--- a/package/luabitop/luabitop.hash
+++ b/package/luabitop/luabitop.hash
@@ -1,4 +1,4 @@
 # computed by luarocks/buildroot
-sha256  fc7a8065a57462ee13bed7f95b0ab13f94ecd1bf846108c61ccf2c75548af26e  luabitop-1.0.2-1.src.rock
+sha256  7117260eccc04cb5bd2f2148109d5c56d5a562ba82a62d960e51b9a5e5e88629  luabitop-1.0.3-1.src.rock
 # Locally calculated
-sha256  25e331120d0c2f95fa2ac6e439ca920f0a4362c366a4c7382d843113743a3ba5  LuaBitOp-1.0.2/README
+sha256  9a0ce7818d769ea3de40be3f8a8d7a39742ed5a6eb0b89de6fb8df3978a8fb10  LuaBitOp-1.0.3/README
diff --git a/package/luabitop/luabitop.mk b/package/luabitop/luabitop.mk
index a36a2feaf..956e90030 100644
--- a/package/luabitop/luabitop.mk
+++ b/package/luabitop/luabitop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUABITOP_VERSION = 1.0.2-1
+LUABITOP_VERSION = 1.0.3-1
 LUABITOP_NAME_UPSTREAM = LuaBitOp
 LUABITOP_LICENSE = MIT
 LUABITOP_LICENSE_FILES = $(LUABITOP_SUBDIR)/README
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
