Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D21BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 15:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B509560E9B;
	Sun, 27 Mar 2022 15:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m0MQBNTkUXhl; Sun, 27 Mar 2022 15:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D139760E27;
	Sun, 27 Mar 2022 15:40:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D3E261BF3B9
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C208D40133
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 15:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CjE1ScRhD75Z for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 15:40:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FEB740104
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 15:40:38 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id h4so6579816edr.3
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 08:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=KhMxkHrW/Sfd2UoyLpY17YXZHo4MdIaGdxexokrUzo0=;
 b=L2pPyA5doU8hs4fD5EtWJneBa1AJ+n8UjwOtynrasrX64EmPEMjBnJdWbaFhnBqTUp
 iZyshed7e63cuhDX6eNBI13uYisqyxSt+tRkCxvEP/lWM2mrbJUxguZuL6yvh6XFwrzA
 LhK6kuIJOtmGW8Bt7wKMVTUYCoYeuzMtDl6WD8Bp4R3A1UbiFxgygoOIUN20FRhWsPvO
 Sg2Mc0CfiysKQ29FEq0MXTMaqXik+Dr2aDbe/WokTR40Crq4+1Ay2gBU05QUv9jtXxAN
 13LXk76+ckv2a4VNScPzpGAdyJRmD5keLpUwLFEZTZ2cs0Uj01LrVda81VazBywhKajL
 Afeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=KhMxkHrW/Sfd2UoyLpY17YXZHo4MdIaGdxexokrUzo0=;
 b=J/DmZmvq1cN1ke/YenzbNR+AVHwxqVQfGGsQ5X3yt9WYZUULFNJ5IZmIPf3E31OnQF
 YQ+ujruec2vPJG8av14j0AhlsqnabZpnrOo/uw9tabkP8kBzKOj8UA7uBbTbKDEqYOYt
 dlge8KEY9nWqU3AQbFN7MRvtYxpUH6tiV9oAxru034zhw5egcy/TxqlMg+pbAG4tlisn
 cjGvc6yiCoS4xUjbMZEYcjkw005244hB9zYkrEprxapHSY4qGzN3isF52WhcdTN9JS0P
 qnQrJmnBlFwZCoDpOdNDbLwtwx4GDy40By+7xjOGuiZ20CUrSJ8pGD918IdD8lTzz28r
 t1QA==
X-Gm-Message-State: AOAM5314yq9XGzHRwMmkEzjjfWPXkWNXEnnmVb/AvgUMUZNOaVdkXfxc
 K+4B/1t3QRDNZtd79yyYX/Ix4dnTGypH7g==
X-Google-Smtp-Source: ABdhPJzKQBfEoVnbAoNGMui2OkZA+O7lvyBXRa1WOebgJHo40DS1SIhMKBqOoxK/l3L/OVvqOv2M9g==
X-Received: by 2002:a05:6402:27d4:b0:419:5105:f7e7 with SMTP id
 c20-20020a05640227d400b004195105f7e7mr11000205ede.356.1648395636774; 
 Sun, 27 Mar 2022 08:40:36 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u4-20020aa7db84000000b004136c2c357csm5816201edt.70.2022.03.27.08.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 08:40:36 -0700 (PDT)
Message-ID: <9657bb80-5111-136b-7148-7793eb088dab@mind.be>
Date: Sun, 27 Mar 2022 17:40:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>,
 buildroot@buildroot.org
References: <20220318173347.68409-1-joerg.krause@embedded.rocks>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220318173347.68409-1-joerg.krause@embedded.rocks>
Subject: Re: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.43.0-0
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxOC8wMy8yMDIyIDE4OjMzLCBKw7ZyZyBLcmF1c2Ugd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+CgogIEFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgcGFja2Fn
ZS9sdXYvbHV2Lmhhc2ggfCAyICstCj4gICBwYWNrYWdlL2x1di9sdXYubWsgICB8IDIgKy0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL2x1di9sdXYuaGFzaCBiL3BhY2thZ2UvbHV2L2x1di5oYXNoCj4g
aW5kZXggMmZiMmI1YzRmYy4uNGNkYjkxNzI5ZiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2x1di9s
dXYuaGFzaAo+ICsrKyBiL3BhY2thZ2UvbHV2L2x1di5oYXNoCj4gQEAgLTEsMyArMSwzIEBACj4g
ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIDRiNmZiYWE4OWQyNDIwZWRmNjA3MGFk
OWU1MjI5OTNlMTMyYmQ3ZWIyNTQwZmY3NTRjMmI5ZjE0OTc3NDRkYjIgIGx1di0xLjQyLjAtMS50
YXIuZ3oKPiArc2hhMjU2ICA1NjdhNmYzZGNkY2Y4YTliNTRkZGM1N2ZmZWY4OWQxZTk1MGQ3Mjgz
MmI4NWVlODFjOGM4M2E5ZDRlMGU5ZGUyICBsdXYtMS40My4wLTAudGFyLmd6Cj4gICBzaGEyNTYg
IGNmYzc3NDliOTZmNjNiZDMxYzNjNDJiNWM0NzFiZjc1NjgxNDA1M2U4NDdjMTBmM2ViMDAzNDE3
YmM1MjNkMzAgIExJQ0VOU0UudHh0Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2L2x1di5tayBi
L3BhY2thZ2UvbHV2L2x1di5tawo+IGluZGV4IDJkYzlhZjNiN2EuLjM2ZmNkYzc0MmUgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9sdXYvbHV2Lm1rCj4gKysrIGIvcGFja2FnZS9sdXYvbHV2Lm1rCj4g
QEAgLTQsNyArNCw3IEBACj4gICAjCj4gICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAgCj4g
LUxVVl9WRVJTSU9OID0gMS40Mi4wLTEKPiArTFVWX1ZFUlNJT04gPSAxLjQzLjAtMAo+ICAgTFVW
X1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbHV2aXQvbHV2L3JlbGVhc2VzL2Rvd25sb2FkLyQo
TFVWX1ZFUlNJT04pCj4gICBMVVZfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiAgIExVVl9MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRS50eHQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
