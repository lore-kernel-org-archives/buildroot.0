Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D7E6CA9ED1
	for <buildroot@archiver.kernel.org>; Mon, 12 Oct 2026 09:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4EF4405FB;
	Mon, 12 Oct 2026 09:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fNxvvwzWuAak; Mon, 12 Oct 2026 09:50:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C4E6A4052B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791798615;
	b=hOUVYq51DSAmmOUUKhBK6lPK3YS1/bwWyE1gehwAF/2TSfIzjttCFn3wo0nDlS6zDZ0F
	 ZG9hiXYl0D02nS/sPsxtNA5UM09V+fbU0+nhs87w9ndxWfEOTgnKs/RuAJpWLWNlEGY/C
	 DPS6ow02pqW7xZ3WiiMfm/XPW5f5yn2tedLIKnMyfjdK2JdsFgNKg9FSQDKaRjdnXyQkf
	 d5w65kFVJq809YGN06K34qCfWszx5WbFmkqvAOFSO/GpbpTRx6ufkIASvAF36Flhf58VB
	 qCfoShdWtJanelzfY+J/dbyYhJAf3Miq0K4TYeNx5c28dgLwJ91piYQzbXZ9QPgfvyQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791798615;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=BZWEinUYBvNuN1xSe19iJhV9M9uzsY1hNt53V2C2VGE=;
	b=kc5ghExPnWGWOa6QKYMbqygg1mpbxA8+QTVpQaSX7XVMNjDXz7jQ1vJ+Rv2b/rYk6zOM
	 y9thTyMbmfQDtRenxMiiSZWTP7UtpiogPnuLdnjGseju3MKtWvBb/CNjVkySnHN7twXeY
	 kfDmJ4Gx30Qmt8taNdOlDzg4AZZHWfmifXQsSAuFM4dlyrLQoolPpBlXOzcT00XJaqxJK
	 HT5RQyqAsXsDQrlkjw1dJ7cxYctTv2fbBQzSy4Iqm2A0wMqyZs0hkRoMt6KH4SUqJ6PUI
	 hoBTCp/cb3+1GnTa3dS50l4SxIVybIiygbZCjod2YvPK9zxVqbRk6voUjaZawM4/wUQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791798615;
	bh=BZWEinUYBvNuN1xSe19iJhV9M9uzsY1hNt53V2C2VGE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hLFpT+IA5XN+MDx1NBQGZPr/gufXv38WOj5rnUdmxbOCryoSb1/8qQjwxcR+8Du4A
	 Fi7JTs+/+abmjSIXpYyqPCNOB7lMmcHNfxVIB4LiDkLaefpCWQ04x1o7BRXnrw5/u9
	 1n/TEHXes+IJw+ULv+Se1VDMuuloj18zj30EjkTzNKY19nK9qnh0AR8KE/fHV/88DZ
	 VT4TedFlMtHSuBISLFXJFFGaGwsQJqLRiY6tPFDmuz2KSEIj/rPz0YmYl5jQVnvevE
	 oqAob0jDm9HHo6wqd0zSU1awANMblyskOlmaNu0/EtmcIAfffcTU6YiIe3Uw/He/jK
	 FUnVGrNPxZW/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4E6A4052B;
	Mon, 12 Oct 2026 09:50:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 21090194
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 09:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E24AE80D09
 for <buildroot@buildroot.org>; Mon, 12 Oct 2026 09:50:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohdx435kvP0L for <buildroot@buildroot.org>;
 Mon, 12 Oct 2026 09:50:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B30CA8097B
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791798613;
 b=PRh3p47jMj80bEtMGrmgXhI8+B31rmot1VhMS4UQWp4464kgH09y9VY4oRi8nHdpBShQ
 DivrE0O775MkpQzEwod8ptw8CGgYh+/ZfL8iOICiuBc6C5hUTVbXELBzsX8UaJY2rhp6u
 vD/B0ONAIX1JsSkpiD2EgjbsB+HjMfMOOe3mRvbbTlq13iNEtLBj5WTNIrNp5pLZQ3U1Z
 ZGktPO7q2Qeb6Gj1HbRXndux9iYCvuP9puwLFluiBZCC6466fx0q+Jn9rN3G9dhOjcJ3Y
 atP/bsj0yI8NYr6QL4gXjbe3Gz68oKs9yKDP0MLUfuSYVDgvJbu4Qp5oyBWY5nvptCg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791798613;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=q3s4y1fkbVw0RmyE2CMpWtN1WYLnvPvXao2HBNjaYYg=;
 b=DOlEdwaiew0UaktYrKCRz+Q/pYRf+W6Jg/8F5hTgT4POAfJDGZdNSMV+czYEU+iikazU
 aRo89npY/SehnNCHjrV4QqhFOeNdMBiQdI1wxqNg/GE9ORDLxMwji/KimTfLHgJojUfMf
 Wu8GdpObySuILosi1BWtX4D/2yQVS9mkQ9DsOw7cXfuSA8cUF4MX4mESD/gqcB1O0Bd89
 vpIEPDjRZIEPHN/xbi3k21C3P/pWyKktLnM6UqiFit1Gh0VmcvXX9n/IJe1F+qP45Yh5V
 OGgzEcydhacIciw9P3rYsfNY+WJ9YR0W6q7zCowW7xSNxxBHMOmnkQoEQ34NydFb9Jw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fdtfJBJ9; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fdtfJBJ9
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B30CA8097B
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 09:50:12 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-48c6955a7c3so283532f8f.1
 for <buildroot@busybox.net>; Mon, 12 Oct 2026 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791798610; x=1792403410; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=q3s4y1fkbVw0RmyE2CMpWtN1WYLnvPvXao2HBNjaYYg=;
 b=fdtfJBJ9L/REWXgTPJtcFJmKczWI5hiCk/Jm1R0G56UQR0YK/kqjhX80S0nCL/YAtT
 Fnv/Qv72FFEXuMEb5L1Eqx75NwqaiBTQfNOBqqOg265veuYjG2zYQtfkOx0SEjPqqxf3
 IjdsNAyM4XP+RLOOfJFiKRwdqXauvvDqT3oVoIH7KevM8P0rlknmrugm8XIwc0iIXn0B
 RxyJAzqrJlv/zvGho6jIpMqhcGwJGZTxnBjtQqJnapY2HtLhTfLh0vBzksHGY4gc6RsE
 BEcu7Mtat5covmXq6fD7z7oXm++ezyZm1prDF69zRxM5wLXfyevKtrPUwcgMRX9zQOf0
 4YnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791798610; x=1792403410;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=q3s4y1fkbVw0RmyE2CMpWtN1WYLnvPvXao2HBNjaYYg=;
 b=g+tTaNU9GG7ip6ib28p6NCxiYzO5jbjggd+EQoa79Y5JGGhtiWPPAgR6WPEsbnT5r3
 2aMoivuCE4iAV+mgCLfMPGr8mw9nWLbXjITufwjJ0+rndzn/XaH9L00IxfIpiVw+zf0e
 RWhFrtw98p/9PIIKbV4dpUkgJ0PecArOUGYngVxSBpN/E+y7zTJnVSGVlJA7/gMmi/eu
 wXa+ilzljj6MVghAQJT5P7tDMl5NAyqw6iZLv/RKXEqxS8QNhTYQTDsXctsm8o0GgU6c
 +IZLxRmzFZyFEe4sNWUa5Klv33Ce6Cm/i1d4NcdXls4djgueJbSpKHXhi6YfCyOylhcA
 mU0Q==
X-Gm-Message-State: AFq9FYLf6/FS9D0UjNbiJGYEVwgoafe9fmsuzw7nNQU3BjTIScyzNhvP
 4d43puMSePg1xmm/ivWNPZ8SbW5RNpdYyF1KmL1y394B2Rxn1WpaDG4b8GVmhQ==
X-Gm-Gg: AYBFou1OFumStpE/BfBa/lHpbv7qA339v/4Lnd/9s+aKyoZpm3IpI7UuV1GHGb+26Uh
 9L7q/HmP7VpTCOQNVjOZ+LYSPlMLTLvugoDjVDDSfuep33Mq1DFP1FnpdYft0yFm7akysWdR1Fe
 IKaeSOtkiWo6t1zMv9GN+0JqLYm0Cq3beFGQxLrNcStYSX3HiBH0EQg3dcp9cbHRCvG9NIqxwpH
 0czcvE9FUIvboc5fQvuiu4/qDrSPe9wi5jv4pOxh581UnEX4p6bycIel3fQOzFLoalPDaFqQv4G
 TIlLns482C66suWI3m9lXB9wEXzHSVET1UhCFrNmGC3lfyDjw+UBFLiurZbYXHHzyDj5r9cbvon
 JwqLARblWWgyEOibVWeA/mZ4tNYv2CUs60/fBsZHkOYFirk5wPN4m6LEUfejBJGILXJsdPHmuFZ
 WJMHocQrL4WFXFkrdwKt8NT4SboNZRrGo1+9JRYjMpipfZkgd8wcu4xjurEOl4+D0gEpEFtWxDA
 f5jTaIpNkOIjipQVmZnZbuPFl9nvVJTwdXFBWR53jZIsv+Zngw=
X-Received: by 2002:a05:6000:3102:b0:48d:ca32:e90f with SMTP id
 ffacd0b85a97d-48dca32e9b5mr9377492f8f.55.1791798609810; 
 Mon, 12 Oct 2026 02:50:09 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dba033a0fsm16595933f8f.14.2026.10.12.02.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 02:50:09 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 12 Oct 2026 11:50:05 +0200
Message-ID: <20261012095005.87417-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luaposix: bump to version 37.0
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

see https://github.com/luaposix/luaposix/blob/release-v37.0/NEWS.md

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/luaposix/Config.in     | 2 +-
 package/luaposix/luaposix.hash | 2 +-
 package/luaposix/luaposix.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index bd2105743..6f146afd5 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LUAPOSIX
 	select BR2_PACKAGE_LUA_BIT32 if BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1 # runtime
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
-	  This is a POSIX binding for LuaJIT, Lua 5.1 through 5.4;
+	  This is a POSIX binding for LuaJIT, Lua 5.1 through 5.5;
 	  like most libraries it simply binds to C APIs on the
 	  underlying system, so it won't work on non-POSIX systems.
 	  However, it does try to detect the level of POSIX conformance
diff --git a/package/luaposix/luaposix.hash b/package/luaposix/luaposix.hash
index fbcc0dd6f..ec2afefe3 100644
--- a/package/luaposix/luaposix.hash
+++ b/package/luaposix/luaposix.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  82cd9a96c41a4a3205c050206f0564ff4456f773a8f9ffc9235ff8f1907ca5e6  luaposix-36.3.tar.gz
+sha256  3a0cf9fc9459ae0975afd1e24ea552decfcda2231651a0d3bd6e1f075e089e01  luaposix-37.0.tar.gz
 sha256  0aaf3d6797693f3ea0ef4df2cb4d43627b00eb08213ead4fb037a8c4a04f8631  LICENSE
diff --git a/package/luaposix/luaposix.mk b/package/luaposix/luaposix.mk
index 46be3b42a..385b0ab41 100644
--- a/package/luaposix/luaposix.mk
+++ b/package/luaposix/luaposix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAPOSIX_VERSION = 36.3
+LUAPOSIX_VERSION = 37.0
 LUAPOSIX_SITE = $(call github,luaposix,luaposix,v$(LUAPOSIX_VERSION))
 LUAPOSIX_LICENSE = MIT
 LUAPOSIX_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
