Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE26FC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 20:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80CC4816E9;
	Mon, 25 Mar 2024 20:04:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPZGVqZIG_FV; Mon, 25 Mar 2024 20:04:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B27A181746
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B27A181746;
	Mon, 25 Mar 2024 20:04:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2DF261BF3E3
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 20:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 282A060625
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 20:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QG2nZVTHtiNV for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 20:04:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=bleemayer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A465D605DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A465D605DF
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A465D605DF
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 20:04:25 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-5cddfe0cb64so2007240a12.0
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 13:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711397064; x=1712001864;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uSdaOswq0ch2aEfsIMuszkt6Ts4yuqYGICsbr/d+VZ8=;
 b=vMDIzkPymoeJG9AIn8LAp5r+9yYpgMDul13PlNPcUIrrLFFVSmk3HUQoceLXVOCPOA
 O2uY4S9ketdPM4uSSOeIhQoNsPjncUIBE1ZFaNyFrXb7SyjjMNkwmTnoQonNR2C1P3/x
 2X0nineksojE6+E8acL3SUlswdWy7j17EpO83Yh6EGGm+U1JlsV5zvKo5BZSd3emyE74
 CtuN7NRotPT18o50rV6QH/ZAOdb0bzZosNj78AZt/oY71O55guPKd6Zt4Wp8zEqATUh3
 D98h/h1XjcQx9s1y8We5X/IUOXsNaLkpUZi0QgYshogqDa+7l+7dspsxr77zsrmCKrHV
 stcQ==
X-Gm-Message-State: AOJu0YxiOKkhYcUN0wZtlS28xBtYachK+s+9rgSTDz+J1tpvwToxahmP
 7cNVS5OjzRdHURXpFRyPpZVjpzgodMS3Gr6OPODDQIgF7zOx8sQXBZMHlZKDj16zalsMLyTuiAG
 FZy5BdmWEbaYTwpCBl5mOVKi9zG8c103SA6k=
X-Google-Smtp-Source: AGHT+IFFPjJyCo9dzNbWd0TUnhnbaLX9v3CF/D1SOD8sLvfvGjxuf6NYSU1CfdIbeVod4mMC7u4ZmuHCWJt7Al23Y/E=
X-Received: by 2002:a17:90a:a083:b0:29c:5b18:2983 with SMTP id
 r3-20020a17090aa08300b0029c5b182983mr5680676pjp.16.1711397064392; Mon, 25 Mar
 2024 13:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAB3eKoAK26-HuqGE+ewedW9-o6izS754ybr_KdanQwERZebapA@mail.gmail.com>
In-Reply-To: <CAB3eKoAK26-HuqGE+ewedW9-o6izS754ybr_KdanQwERZebapA@mail.gmail.com>
From: Brian Mayer <bleemayer@gmail.com>
Date: Mon, 25 Mar 2024 17:04:12 -0300
Message-ID: <CAB3eKoAXBR9MSf1od3mqBnaBV1+xD8BYegFkRQo31UDSx0JQZw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711397064; x=1712001864; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uSdaOswq0ch2aEfsIMuszkt6Ts4yuqYGICsbr/d+VZ8=;
 b=gvBlVKGrLAAGIargkdfgtgwIOy75D+GHXbFF49zoei/IlAp7QIQFUu7N93bWeFH2JN
 9hPwjI5dYpGCjhed4yJDPhXMrTuPUo8brMmw5hwRKY2SQySP2jZrJn6U5fzBlbEIWkUZ
 mZmUF0UJcry/htHfbhQ2/TZ5BSWr1GBZQmXaDu07/KnII9Y48wCQJpx4o1RGSGen1U32
 vsdRP5vEXrlJ7ZRJZVIcisJLfM7awBOS//1JnxTaemU/XQufmS1mcF8IpNcFT/urTZjK
 0HdarPaseQmlBthey6ClbfMWKAAm0wrTyymdM09RaJJBDzFDr3vpsIblvrTgP5uvARAP
 /WSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gvBlVKGr
Subject: [Buildroot] [PATCH] package/sbase: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

sbase is a collection of unix tools that are inherently portable across
UNIX and UNIX-like systems.

Signed-off-by: brian <git@myr.sh>
---
 package/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index 1a62bfb1be..177b8a89ff 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2549,6 +2549,7 @@ endif
        source "package/s6-dns/Config.in"
        source "package/s6-networking/Config.in"
        source "package/samba4/Config.in"
+       source "package/sbase/Config.in"
        source "package/sconeserver/Config.in"
        source "package/ser2net/Config.in"
        source "package/shadowsocks-libev/Config.in"
--
2.44.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
