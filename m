Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5271CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 20:47:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1BDB40681;
	Mon,  1 Jun 2026 20:47:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id daR6ACdzQ6LE; Mon,  1 Jun 2026 20:47:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C839A4056D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780346871;
	bh=tGI7oA7/njJn1s9v+8L1m+kQBdeo/DulU17LGzsZOxA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=biozQ5+ae4cFFK6nCMiwAZXLYFtdDTjrM3aPVpJyF3vQT+K/nov3YRSi2WARA013+
	 d6ZZBOPVpkM9qqyuw43p8r6wxAralEMeyuSS4L93Sc/4Bm9PbbiPNaQjywd183qSXb
	 bWcl0MNlLXYazAWSbkCt8ao/ajnFiHXCk5MKRySOKiv/L5mHKx/kWg3hg1DLZQk19O
	 /3cAlaocZgO0t6z8XL/c6+eQLOwRUYTgS1QzmyI6KrcrDaMB+RpElv81Ho2EZfulW8
	 aglv6RZgP9xhkI8FxXT42NdeW6QDC5UgwgTueCmXT8guBF+SzalCkYfF9RUEu2sbbz
	 kObC35bl9Lnyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C839A4056D;
	Mon,  1 Jun 2026 20:47:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A7F7F4
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 490BC40523
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zRY_Mq4ZzVUl for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 20:47:48 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 67AE0404F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67AE0404F2
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67AE0404F2
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 20:47:47 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5aa6fee4ec6so1075375e87.0
 for <buildroot@buildroot.org>; Mon, 01 Jun 2026 13:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780346865; x=1780951665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Wu7XcsQ/BcnTumRrW9+MV0Cq4OZs3/q4kPLsN9pGkcA=;
 b=FknTzX6xxMnMWyCXJuzKzkJy2JzPoeOVEUGTTrCLN3YXxCnXRBZ/q6/rubf2obGUpP
 08VXvj5CptNpcRzeGd+iMW0Ttn9Qpe998ltbys5hvvanQKSn5hgimdjXbtBTHHPBI0Jy
 vHLhlkatIKryjD/+/HhMCMYOxZAhi4MKiRgDo1HnblSTC54Y7VEYLiQMe0Tihna8MXq0
 OcsC7CFUKM13ZmbQaC6YxD0i5DVKxtrgxb9EB7D1jNZdoOEZV18ay/5E2yc6if77Wr68
 ltmYNRq66c3IYLCIFlUW/fsNS8TWVPpyOEjxRvTpNDFVTFwgv4HdCiLsq6PAeZgvdjkA
 2clw==
X-Gm-Message-State: AOJu0YxMjyT1qJP/DvZgItgsUFy8T/a7M+wzZuZ6MzKfll4s96wQHMg2
 LuyJSWs+4106K2JAh9PdqMwrR49Owi/tHwj7TPL6gVfVdGkLUtmj0kDsyppn5cBoJtRRLV/aXxH
 28cLC3Kv16g==
X-Gm-Gg: Acq92OFVxdRThvITDtLYa5i4c14fUwVHPfq6AQUrJnSlrxzpxHGMx2KytE8majEs+Nu
 mInhixhhKrwppIKUJm9NhDSAOSt9WJ35u/wpi1DixpRfXAaJtCzhFGKgROyuuQmElIBKMSjegRj
 3/FdMGXkjEhbU4rJCoedv5K4mRR3dHwav40qM9H8qTQP6Xf9oWA86vreEVAn3XIxezGLx8qyH+D
 rkzBvkQNRbxGyqJj0N98loSwE2mnJkC/pfJTR3pELDx2STcvybTb2DT8ntGIb8n9zfyvr3lWpHO
 nKfYoGzSXLuYnmcOM8WUSLO3HJ1iUzF9eCwllYyO8kQwKH6X4QiG/suvc0nqPdlUDuETH9ko4Nd
 8zomePEk8JKejQA1FQGr63t/kJp++d4FRapmspMv+vjz7mg6iwqzzjBhDJB5JzQPAfZwRj69489
 HocJjafpZ1rBGdV1JucU2HHoW/9GMCHS2AWHGwPk+OVYBqUxq7ik0UO3C6WpeEdg==
X-Received: by 2002:a05:6512:3e2a:b0:5aa:7107:2693 with SMTP id
 2adb3069b0e04-5aa7107283cmr1353226e87.24.1780346864339; 
 Mon, 01 Jun 2026 13:47:44 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5aa70b75865sm469692e87.18.2026.06.01.13.47.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2026 13:47:42 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>,
	John Ernberg <j@j-ernberg.se>
Date: Mon,  1 Jun 2026 22:47:27 +0200
Message-ID: <20260601204735.888967-2-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260601204735.888967-1-j@j-ernberg.se>
References: <20260601204735.888967-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1780346865; x=1780951665;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wu7XcsQ/BcnTumRrW9+MV0Cq4OZs3/q4kPLsN9pGkcA=;
 b=neK9Kw0P+qd7Y1VnrCrz7ufVyzVPkxy2DTktSS9LbfhUWF0Dg0LMNhqflPGkMQxGTa
 NWExHeHThHZ/tln5KjFW2ltHJYY/5ZZDUacUOKwqwT2kswiMjOcadn+t6SKdca+NXDi7
 QnjjTTO+riNkZXYb+FWeX62ROY59348lJgwi9nAHD2BEmPc/AUk5vEG9480orOb0qWED
 EhBgh/M5siJ3ugLUA6qGwzRyqvYhUUgZw/x5L2VifwkC7U0U2QkfBt1LeX7BraCM2/aF
 CEeN0JkpwLqTwEJcWdVF6pciCjcTofoxUvFHRn87PjMpXDQZf2d33jqm0+buvyWp52AL
 7CIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=neK9Kw0P
Subject: [Buildroot] [RFC PATCH 1/9] package/foot: Prefer ncurses terminfo
 if ncurses is selected
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

foot's INSTALL.md says to use the ncurses provided terminfo. [1]

If the ncurses package is being installed, disable generating the bundled
terminfo in favor of the ncurses one.

Link: https://codeberg.org/dnkl/foot/src/branch/master/INSTALL.md#other [1]
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

RFC: Because I am concerned it might break stuff in ways I don't know how
to test.
---
 package/foot/foot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index 3e37d41557..1275b08c4f 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -27,6 +27,10 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 FOOT_DEPENDENCIES += systemd
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+FOOT_CONF_OPTS += -Dterminfo=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUTEMPTER),y)
 FOOT_DEPENDENCIES += libutempter
 FOOT_CONF_OPTS += -Dutmp-backend='libutempter'
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
