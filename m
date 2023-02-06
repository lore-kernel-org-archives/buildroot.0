Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4CCC636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 16:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D9A6760B3C;
	Mon,  6 Feb 2023 16:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9A6760B3C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Xg4nu0ChsL9; Mon,  6 Feb 2023 16:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A26D60B38;
	Mon,  6 Feb 2023 16:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A26D60B38
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 066271BF33A
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1EB6403AC
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 16:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1EB6403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vRCNNv9lN_Xw for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 16:24:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F434400D0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F434400D0
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 16:24:14 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j25so7382544wrc.4
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 08:24:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vJ8FYmCDvgQM0Xl/hvuqPDss0FVPXmtbfySEheeV8rs=;
 b=NK8j8pghOQvkXcjvAu0VHl+ay9+Ducd3tH6VLI2SZkkN0HtQTtY4Lh4xGf4Mp5PBLC
 /R9l3W48+Qo9naB/G41MRjMHsIByWYJd3I2yLeTfGHRw/3I7fOuTI5zYeuWFZNyBYj9P
 TmQBcsCBSe/WUnIW9O/IUcQ7goRUNpbibLR8UBCaEJr7ck1WRF6oz3GhMH6+y+MoGOzv
 At4rT8ubjlR0pZun8Sgt2/xLO7sNpYz5r/CL88PoKrCL2Dxhk+sOu8TjJ39llj2pWHI7
 t93qEszGyuOF/ttwrxoeGXg42xwEt1PM4AWGN7vRjUkPkV+wYxGEAXZ7/9Zivqlua8zA
 u8cw==
X-Gm-Message-State: AO0yUKVr3tmLN35/mf76/tc0bPIXaejh0MZXYzs4kXPlhsYXAmwoONAW
 i/OowQDeWubGIsjiJDp1ElBmJw==
X-Google-Smtp-Source: AK7set/Oj5pbOoe9D3tY7L2x18+c3V+RtraW556dK+BO0QjK9t3RQQWCF5zOBYqp/AI+28BAx8Jw/A==
X-Received: by 2002:a5d:6089:0:b0:2c3:ea86:863b with SMTP id
 w9-20020a5d6089000000b002c3ea86863bmr2995082wrt.29.1675700652508; 
 Mon, 06 Feb 2023 08:24:12 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a5d4c81000000b002bdd8f12effsm9045182wrs.30.2023.02.06.08.24.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 08:24:12 -0800 (PST)
Message-ID: <282c5a46-37ed-6c07-9b72-86133a71750a@smile.fr>
Date: Mon, 6 Feb 2023 17:24:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
 <301bf244-5eb8-3903-3371-80de9a6810aa@smile.fr>
In-Reply-To: <301bf244-5eb8-3903-3371-80de9a6810aa@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vJ8FYmCDvgQM0Xl/hvuqPDss0FVPXmtbfySEheeV8rs=;
 b=1/5b+yhKeCyI0cgPXwqENPFlOBp+Vc1SV2lni/z980bIAGe/kR5IKibQEjWd8NttxE
 jOvQpUNAgJaW8wimX3Bq5FVQfkjMssgRUWJSPB/fYUdcAIVC7E0G3b5aSg+gdJMpgVo9
 qGHdHpPf8rH194hBahJ6YTU9ks8ZjpG0AqM76GEje0BFfgD6u7FK7ySxvbxnDjbcFDNx
 95tYmVBtW/qe9w//cgfcfgMUXAoDa28kQA66piCqjKiwj1GwvuXytOuLih8aqiGnd1DC
 KXhA7DIj/VGL43TvKmmZDhcLv3VGEZ5G1AUkh//5zkHeDHyY+nhL20j8orGkQSk0CJS+
 MbPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=1/5b+yhK
Subject: Re: [Buildroot] [PATCH v5 01/10] package/cpuinfo: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAwNi8wMi8yMDIzIMOgIDE2OjUzLCBSb21haW4gTmFvdXIgYSDDqWNy
aXTCoDoKPiBIZWxsbyBKYW1lcywKPiAKPiBMZSAzMC8wMS8yMDIzIMOgIDAxOjI4LCBKYW1lcyBI
aWxsaWFyZCBhIMOpY3JpdMKgOgo+PiBGcm9tOiBTdGVmYW4gSGFnZXIgPHN0ZWZhbi5oYWdlckBn
aW56aW5nZXIuY29tPgo+Pgo+PiBUaGlzIHBhY2thZ2UgaXMgcmVxdWlyZWQgYnkgdGVuc29yZmxv
dy1saXRlLgo+Pgo+PiBBZGQgYSBwYXRjaCByZW1vdmluZyBjcHAgcmVxdWlyZW1lbnQgd2hlbiBu
b3QgYnVpbGRpbmcgdGVzdHMuCj4+Cj4+IFRlc3RlZC1ieTogU3RlZmFuIEhhZ2VyIDxzdGVmYW4u
aGFnZXJAZ2luemluZ2VyLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhhZ2VyIDxzdGVm
YW4uaGFnZXJAZ2luemluZ2VyLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4+IC0tLQo+PiBDaGFuZ2VzIHY0IC0+IHY1Ogo+
PiAgIC0gZG9uJ3QgcmVxdWlyZSBjcHAKPj4gQ2hhbmdlcyB2MiAtPiB2MzoKPj4gICAtIG1vdmUg
dG8gbGlicmFyaWVzLT5oYXJkd2FyZSBoYW5kbGluZwo+PiAtLS0KClsuLi5dCgo+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9jcHVpbmZvL0NvbmZpZy5pbiBiL3BhY2thZ2UvY3B1aW5mby9Db25maWcu
aW4KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uZDNjM2IwODQw
MAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL3BhY2thZ2UvY3B1aW5mby9Db25maWcuaW4KPj4g
QEAgLTAsMCArMSw4IEBACj4+ICtjb25maWcgQlIyX1BBQ0tBR0VfQ1BVSU5GTwo+PiArCWJvb2wg
ImNwdWluZm8iCj4gCj4gSGF2ZSB5b3UgY2hlY2tlZCBjcHVpbmZvIGRlcGVuZGVuY2llcyA/Cj4g
Cj4gSXQgc2VlbXMgWE5OUGFjayB1c2VkIGJ5IGNwdWluZm8gaXMgNjRiaXRzIGFyY2hpdGVjdHVy
ZXMgb25seToKPiAKPiBDTWFrZSBXYXJuaW5nIGF0IENNYWtlTGlzdHMudHh0OjY5IChNRVNTQUdF
KToKPiBUYXJnZXQgcHJvY2Vzc29yIGFyY2hpdGVjdHVyZSAibCIgaXMgbm90IHN1cHBvcnRlZCBp
biBjcHVpbmZvLiAgY3B1aW5mbwo+IHdpbGwgY29tcGlsZSwgYnV0IGNwdWluZm9faW5pdGlhbGl6
ZSgpIHdpbGwgYWx3YXlzIGZhaWwuCj4gCj4gaGludDoKPiBodHRwczovL2dpdGh1Yi5jb20vTm9i
dW9Uc3VrYW1vdG8vbWV0YS10ZW5zb3JmbG93LWxpdGUvYmxvYi9tYWluL3JlY2lwZXMtdG9vbHMv
dGVuc29yZmxvdy1saXRlL3RlbnNvcmZsb3ctbGl0ZS1iZW5jaG1hcmtfMi4xMS4wLmJiI0wzMwo+
IAo+IEFuZCB0cmlnZ2VyIGEgYnVpbGQgaXNzdWUgb24gdUNsaWJjLW5nIGR1ZSB0byBtaXNzaW5n
IGhlYWRlcjoKPiAKPiBjcHVpbmZvLWRlMmZhNzhlYmI0MzFkYjk4NDg5ZTc4NjAzZTRmNzdjMWY2
YzVjNTcvc3JjL2FybS9saW51eC9od2NhcC5jOjE5OjExOgo+IGZhdGFsIGVycm9yOiBzeXMvYXV4
di5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gICAgMTkgfCAgI2luY2x1ZGUgPHN5cy9h
dXh2Lmg+Cj4gCj4gQWxzbyBzdGF0aWMgYnVpbGQgaXMgbm90IGxpa2VseSBzdXBwb3J0ZWQ6Cj4g
Cj4gY3B1aW5mby1kZTJmYTc4ZWJiNDMxZGI5ODQ4OWU3ODYwM2U0Zjc3YzFmNmM1YzU3L3NyYy9h
cm0vbGludXgvaHdjYXAuYzo4OjEwOgo+IGZhdGFsIGVycm9yOiBkbGZjbi5oOiBObyBzdWNoIGZp
bGUgb3IgZGlyZWN0b3J5Cj4gICAgIDggfCAjaW5jbHVkZSA8ZGxmY24uaD4KCkFjdHVhbGx5IHRo
ZXJlIGlzIGFuIGFyY2hpdGVjdHVyZSBkZXBlbmRlbmN5OiB4ODYsIHg4Nl82NCwgYXJtLCBhYXJj
aDY0LgpBbHNvIGl0IHJlcXVpcmVzIHRocmVhZHMgc3VwcG9ydDoKCmh0dHBzOi8vZ2l0aHViLmNv
bS9weXRvcmNoL2NwdWluZm8vYmxvYi9tYWluL3NyYy9pbml0LmMjTDI0CgpCZXN0IHJlZ2FyZHMs
ClJvbWFpbgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
