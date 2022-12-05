Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627BEC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 07:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B53D7403E2;
	Mon,  5 Dec 2022 07:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B53D7403E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQcHog4L5zbt; Mon,  5 Dec 2022 07:55:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3F7A4047C;
	Mon,  5 Dec 2022 07:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3F7A4047C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0CBA31BF336
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 07:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC065818D0
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 07:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC065818D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flLihGuDGyZt for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 07:55:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6AD13818B5
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AD13818B5
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 07:55:17 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 136so9810427pga.1
 for <buildroot@buildroot.org>; Sun, 04 Dec 2022 23:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hFjkRPNwiRFzSykIRBHGvjvvV/U5nIKn/V5+hCweQGQ=;
 b=HKA1RpowS4VONcghl6ocxYrsPizrh0a/BvC9knS5fkYuD/uSDB4cHHw3k9LJuHMqh+
 aEN2IlZQky/7pEnv/XXr9nzKNEWjcGAyW3yW3PMOqLjpw7br1CcFeRLAbmBFUbVKaNXS
 MaZNFrL6hXmLmWErngYqmAHNA3Tg8P2xZLi5uBYO5CJ6UkU7ohluhqGfSxYS9mvXRfir
 WeWpdnYi9M4bi9VNKV6CP6xfZgYcm6aiFyNZlxr4K6BSqsXBPv8zBSue0Lcdwpf33FwK
 DxRALt/vDX7hpNj8yfG876r7+ZawG6M9GCueQa681WY6vFJI75Usa4UfJo9RdoC+roEi
 6Pyw==
X-Gm-Message-State: ANoB5plOdwdpnOYx9OzYLWrEIWtLadusV0XkU3NbN7vTOCIlVVbvIj4b
 n73S03KJW4pm/3IIYV08NPeblxh8uT4=
X-Google-Smtp-Source: AA0mqf5zthv3QNdl4vGls5I2j9oNkyU6vs8DYo2FM7PAjJGWp7veNJtH6jqu05TtO9utZQshQkZrZg==
X-Received: by 2002:aa7:9552:0:b0:576:755a:777b with SMTP id
 w18-20020aa79552000000b00576755a777bmr12872194pfq.58.1670226916732; 
 Sun, 04 Dec 2022 23:55:16 -0800 (PST)
Received: from [192.168.43.80] (subs03-180-214-233-83.three.co.id.
 [180.214.233.83]) by smtp.gmail.com with ESMTPSA id
 e14-20020a170902784e00b0017f9db0236asm9895486pln.82.2022.12.04.23.55.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Dec 2022 23:55:16 -0800 (PST)
Message-ID: <7d7a72ef-07fb-1732-fa90-d629ce90dfdf@gmail.com>
Date: Mon, 5 Dec 2022 14:54:33 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: buildroot@buildroot.org
References: <e7c091e6-afdf-4f1b-0d38-dfabc267bde0@loongson.cn>
 <914d20f0-6668-50ae-fc9c-22103ff65e57@gmail.com>
 <499fc771.104a2.184e100fe86.Coremail.duanzhiwei@loongson.cn>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <499fc771.104a2.184e100fe86.Coremail.duanzhiwei@loongson.cn>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hFjkRPNwiRFzSykIRBHGvjvvV/U5nIKn/V5+hCweQGQ=;
 b=KUwed2IMQeKUSxYlZi10oTek9GseLEAs+eE5GYSVPck+NhWMrkgsHiq3RBSxUs2GKg
 ok2f+4w0Ral6BlnvfaOkdtPRx30WViC2uZPmhpaamRfEix5ZHvlt3XqqOwdzXggSKoTe
 p9aLgn3C5LDjlXFZhUmO7E6lj/BbAyEJTkyCeDjzPSAs/vFT7MW0IrBs1yfmUZqi9gQZ
 5bAtfbdxLTN/0PNjdSBMWj8YiH85kMPngIJyBPWXowyZuR883SdczsNCjjqfX8VYS300
 sARnA0JabGxyNXcXQGXWbhuCu9Gp8WePXTuDH2fuz42CywRe4jZer/CsLdNXG8B4RAiV
 0uWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KUwed2IM
Subject: Re: [Buildroot] [PATCH] buildroot: Add support for LoongArch
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTIvNS8yMiAxMzozNywg5q615b+X5LyfIHdyb3RlOgo+IEFkZCBiYXNpYyBzdXBwb3J0IGZv
ciBMb29uZ0FyY2ggYXJjaGl0ZWN0dXJlLgo+IEJvdGggZXh0ZXJuYWwgdG9vbCBjaGFpbnMgYW5k
IGludGVybmFsIHRvb2wgY2hhaW5zIGNhbiBjb21waWxlIHJvb3Rmcy4KPiAKClBsZWFzZSBzZW5k
IHYyIHdpdGggbXkgc3VnZ2VzdGlvbnMgYWRkcmVzc2VkIGluc3RlYWQuCgotLSAKQW4gb2xkIG1h
biBkb2xsLi4uIGp1c3Qgd2hhdCBJIGFsd2F5cyB3YW50ZWQhIC0gQ2xhcmEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
