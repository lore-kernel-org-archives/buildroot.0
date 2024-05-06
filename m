Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEFAC4345F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 08:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D13B3403CC;
	Mon,  6 May 2024 08:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7dfYK65x9dHL; Mon,  6 May 2024 08:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81C2F40492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81C2F40492;
	Mon,  6 May 2024 08:43:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49DC81BF38A
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 432B9404E2
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 08:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yVmFQ_iD4vLe for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 08:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CDE84033A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CDE84033A
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CDE84033A
 for <buildroot@buildroot.org>; Mon,  6 May 2024 08:43:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-34e0d47bd98so2217823f8f.0
 for <buildroot@buildroot.org>; Mon, 06 May 2024 01:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714984986; x=1715589786;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YzRMtF2Fyq5lDzoTr76iSpfqLvnm7GnXXqsNnw6NeHo=;
 b=LdRYcJmfYwHqsWMCnrsDm1swK4i/1EowSgPooeEE9Nyh+gx5Lb7vcgg7biAL4hCiDJ
 9IvzlXycNM8FCjN2FfdgQZbv4ni2N4LSGxIphD1aK0zoaXpuvjYZacIglFYekGeZd7JD
 PtxxeiOcJy64D7ZOHizucCiJSuprHppvNMyS4HQDWmCZygrg8HXnYJcVz9C1/+qdL50p
 0U0e3iUOrTun/5JVOjhGp7UHeJlwPsxNvymUoPI9LYLVDugtNZcPb+NWV6mnTgkGwEGk
 dT7Av+DsWTcvDvfZuo/M7/N0j0EUVZSskD01yXMQgHMVkZQlO6vDs6bUkUIV3/GJyfhE
 p8Lw==
X-Gm-Message-State: AOJu0Yw5Krqg/oOv+qD84hMw0K/hu5S6ZRWLSjiCwz3kAdRwGjXYr0pT
 z7VHXBpfvaP0lRUn0jAgqnqYdV0zseMB0vAogoSkZmRMMJp5znQuLDt/pZC+SF68y6BwtZDJJxA
 C
X-Google-Smtp-Source: AGHT+IHmsm0U92m///0mi3CQZ1K7Mnfw0EwOdj5OrJLaLitKVlW4OK2Jq9I2iiGd70shtCoKQ/pBnQ==
X-Received: by 2002:adf:ed83:0:b0:34d:b3a0:5614 with SMTP id
 c3-20020adfed83000000b0034db3a05614mr8933417wro.8.1714984986117; 
 Mon, 06 May 2024 01:43:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 r2-20020adfce82000000b0034dd7984d7fsm10104121wrn.94.2024.05.06.01.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 01:43:05 -0700 (PDT)
Message-ID: <a41aae60-cded-427a-9bc9-10c330eaf37f@smile.fr>
Date: Mon, 6 May 2024 10:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240502141809.2292787-1-romain.naour@smile.fr>
 <ZjfTtH0pArzsV4fN@landeda>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZjfTtH0pArzsV4fN@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714984986; x=1715589786;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YzRMtF2Fyq5lDzoTr76iSpfqLvnm7GnXXqsNnw6NeHo=;
 b=T+9mN97cjCtiNFmUabGu8QPtL4VDtxcPyAAWDymq39fw0cYLQJpsdyzHvXD7wd/JYd
 yDu6xYa+vqECUiANBbkaZJ5QfrtHJo1UGNiMwwZu+YHrt5Swvh9tjz2FFIs6hhzMmySH
 CVaHyUHpTKEJXgMoVP+GGDVwBgHRsAx+DUOr/sHCWqxpN/OoxEpoC0hTlIfHP1+aKhkS
 ykNucKo9IKwwEaCeSYqBZQqqHyyG5E0gmkJGnOe4v6sO/gqVH9DPVFYlLqvUNxhjOWW8
 L+GH5HOHen8h2CCSwO1qeWB2AYTwPidiV2ACCbm4HBBw/ENVG4crnZJs0XRCl2ulm67x
 rnsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=T+9mN97c
Subject: Re: [Buildroot] [PATCH] configs/beagleboneai64_defconfig: new
 defconfig
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDUvMDUvMjAyNCDDoCAyMDo0NSwgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IFJvbWFpbiwgQWxsLAo+IAo+IE9uIDIwMjQtMDUtMDIgMTY6MTggKzAyMDAs
IFJvbWFpbiBOYW91ciBzcGFrZSB0aHVzbHk6Cj4+IEFkZHMgc3VwcG9ydCBmb3IgQmVhZ2xlQm9u
ZSBBSS02NCBib2FyZCBieSBpbnRyb2R1Y2luZyB0aGUKPj4gYmVhZ2xlYm9uZWFpNjRfZGVmY29u
ZmlnIGZpbGUgYW5kIHJlbGF0ZWQgc3VwcG9ydCBmaWxlcy4KPiBbLS1TTklQLS1dCj4+ICAuLi4v
YmVhZ2xlYm9hcmQvYmVhZ2xlYm9uZWFpNjQvcG9zdC1idWlsZC5zaCAgfCAxNSArKysrKysKPiAK
PiAgICAgJCAuL3V0aWxkL2RvY2tlci1ydW4gbWFrZSBjaGVjay1wYWNrYWdlCj4gICAgIGJvYXJk
L2JlYWdsZWJvYXJkL2JlYWdsZWJvbmVhaTY0L3Bvc3QtYnVpbGQuc2g6MDogcnVuICdzaGVsbGNo
ZWNrJyBhbmQgZml4IHRoZSB3YXJuaW5ncwo+IAo+ICAgICAkIC4vdXRpbGQvZG9ja2VyLXJ1biBz
aGVsbGNoZWNrIGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZWJvbmVhaTY0L3Bvc3QtYnVpbGQuc2gK
PiAgICAgSW4gYm9hcmQvYmVhZ2xlYm9hcmQvYmVhZ2xlYm9uZWFpNjQvcG9zdC1idWlsZC5zaCBs
aW5lIDI6Cj4gICAgIEJPQVJEX0RJUj0iJChkaXJuYW1lICQwKSIKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgXi0tIFNDMjA4NjogRG91YmxlIHF1b3RlIHRvIHByZXZlbnQgZ2xvYmJpbmcgYW5k
IHdvcmQgc3BsaXR0aW5nLgo+IAo+ICAgICBEaWQgeW91IG1lYW46Cj4gICAgIEJPQVJEX0RJUj0i
JChkaXJuYW1lICIkMCIpIgo+IAo+IAo+ICAgICBJbiBib2FyZC9iZWFnbGVib2FyZC9iZWFnbGVi
b25lYWk2NC9wb3N0LWJ1aWxkLnNoIGxpbmUgNDoKPiAgICAgY3AgJEJPQVJEX0RJUi91RW52LnR4
dCAkQklOQVJJRVNfRElSL3VFbnYudHh0Cj4gICAgICAgIF4tLS0tLS0tLV4gU0MyMDg2OiBEb3Vi
bGUgcXVvdGUgdG8gcHJldmVudCBnbG9iYmluZyBhbmQgd29yZCBzcGxpdHRpbmcuCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXi0tLS0tLS0tLS0tXiBTQzIwODY6IERvdWJsZSBxdW90ZSB0
byBwcmV2ZW50IGdsb2JiaW5nIGFuZCB3b3JkIHNwbGl0dGluZy4KPiAKPiAgICAgRGlkIHlvdSBt
ZWFuOgo+ICAgICBjcCAiJEJPQVJEX0RJUiIvdUVudi50eHQgIiRCSU5BUklFU19ESVIiL3VFbnYu
dHh0Cj4gCj4gCj4gICAgIEluIGJvYXJkL2JlYWdsZWJvYXJkL2JlYWdsZWJvbmVhaTY0L3Bvc3Qt
YnVpbGQuc2ggbGluZSAxNToKPiAgICAgbG4gLXNmbiAuICR7VEFSR0VUX0RJUn0vYm9vdC9kdGIK
PiAgICAgICAgICAgICAgIF4tLS0tLS0tLS0tLV4gU0MyMDg2OiBEb3VibGUgcXVvdGUgdG8gcHJl
dmVudCBnbG9iYmluZyBhbmQgd29yZCBzcGxpdHRpbmcuCj4gCj4gICAgIERpZCB5b3UgbWVhbjoK
PiAgICAgbG4gLXNmbiAuICIke1RBUkdFVF9ESVJ9Ii9ib290L2R0Ygo+IAo+IENhcmUgdG8gZml4
IGFuZCByZXNwaW4sIHBsZWFzZT8KClRoYW5rcyEKCldoaWxlIGF0IGl0IEkgdXBkYXRlZCB0aGUg
a2VybmVsIHRvIHRoZSBsYXRlc3QgNi42LjMwIHJlbGVhc2UgYW5kIHVzZWQKdXRpbHMvYWRkLWN1
c3RvbS1oYXNoZXMgc2NyaXB0IHRvIHJlZ2VuIGFsbCBmaWxlIGhhc2guCgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKCj4gCj4gUmVnYXJkcywKPiBZYW5uIEUuIE1PUklOLgo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
