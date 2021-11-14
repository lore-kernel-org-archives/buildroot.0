Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B0AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:20:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A46160F45
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 17:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A46160F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0F024026D;
	Sun, 14 Nov 2021 17:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M6mVvIpQg2rZ; Sun, 14 Nov 2021 17:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C21340266;
	Sun, 14 Nov 2021 17:20:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78F8A1BF2BA
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75CF940266
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 17:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZmzY0xRycDz for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 17:20:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C19F840265
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 17:20:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id b12so25901275wrh.4
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 09:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=AoJ/U65vY5jL6qBD7xcymQvNrzfnjetk0fWMD5QcGGU=;
 b=k1wrpIWUNVuMq+s02NKSlW9u4ZW6QKeq6PS1O/JHGHtWjXGeWy2FFUa8axRW0hV+eF
 IiBKN5IJiDSLfgvx/hnTbDuyZqE9kl63G0d8ZElKI5cCbt8gPwnAfKeMZ5ShEPcxuHSP
 IXG9k1mX+hJijd/9ztOF3aEkxMS82LjoWa7U0TZ9R4Lhl10AkiOe7zJgaQJJeyxK+H/Y
 WEu1BOZTHQ4gWVWZ+X0G4HuTyttG4hoJI4/y0zDLybjF6y9h+LDdZsZIjeh+4SO/xrq9
 VtLJahtsjRhtaejIXyqOOXcJjAdTWX6pN4ny4Cil2LVqLyQEXDkCEq0SUtzmqQlBitvo
 dXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AoJ/U65vY5jL6qBD7xcymQvNrzfnjetk0fWMD5QcGGU=;
 b=dsxzE3Z+aykCjZVcBbRu81iS/yQSsAmL39z45W4UMMra78RpqwjIk548MNOWE0eXui
 z0sLfZh3626O/bhlGiPbnxa62v/+5Mvqm2PnIDbiD9jd/WbfNwYdDm1vJJN0WqBcHSkH
 WPRHIz2F9PbYu3QaFYy3+2kk0z6+pEXkdSV4ERuP1cXGGMnXcFjKvEa0V85axXUi9If5
 iS8IKTvY2qB5joye+I0PgBXaRHC+4sSfO0Ih4x/jWQk6Z9JyoYOwkcj6afPDDRkMjeLc
 huhvOzGiH/fQw7WTh7G6HW2mvIufAOZV1yJCOh3qetwjiOY0k6xuzfc0Wu6+CwpwN8L5
 nUUg==
X-Gm-Message-State: AOAM531GBvbia6UTjU/s0Fq6EhZGSoHGIZJ6RXO+yciCZJQApE40Ij1d
 pk055Ef0HpTJsi+f14pxro96nC6xJTE=
X-Google-Smtp-Source: ABdhPJwtPHxZCj9iuGr7klUYzWWPh3eAldKAkxQ9NW2Ftfetph9Lm3KrROgaMiQiFO+seVucWBfQnQ==
X-Received: by 2002:a5d:47ab:: with SMTP id 11mr24927205wrb.148.1636910425136; 
 Sun, 14 Nov 2021 09:20:25 -0800 (PST)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id a1sm13837515wri.89.2021.11.14.09.20.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Nov 2021 09:20:24 -0800 (PST)
Message-ID: <ddecb718-ead4-c25c-64c1-33fc15b650e6@gmail.com>
Date: Sun, 14 Nov 2021 18:20:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20210912141140.253778-1-romain.naour@gmail.com>
 <20210912141140.253778-7-romain.naour@gmail.com>
 <87y278ftck.fsf@dell.be.48ers.dk>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <87y278ftck.fsf@dell.be.48ers.dk>
Subject: Re: [Buildroot] [PATCH 09/16] support/testing: test_openssh: use a
 prebuilt toolchain
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

SGVsbG8gUGV0ZXIsCgpMZSAwNC8xMC8yMDIxIMOgIDIyOjA2LCBQZXRlciBLb3JzZ2FhcmQgYSDD
qWNyaXTCoDoKPj4+Pj4+ICJSb21haW4iID09IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdt
YWlsLmNvbT4gd3JpdGVzOgo+IAo+ICA+IFN3aXRjaCBmcm9tIHRoZSBCdWlsZHJvb3QgaW50ZXJu
YWwgdG9vbGNoYWluIGZvciBhcm12NSB0bwo+ICA+IHRoZSBwcmVidWlsdCBCb290bGluIGV4dGVy
bmFsIHRvb2xjaGFpbi4KPiAKPiAgPiBUaGUgdGVzdCBkb2Vzbid0IHJlcXVpcmUgdG8gYnVpbGQg
YSB0b29sY2hhaW4sIHRoZXJlIHdhcwo+ICA+IG5vIHByZWJ1aWx0IGdsaWJjIHRvb2xjaGFpbiBy
ZWNlbnQgZW5vdWdoIGF0IHRoZSB0aW1lIHRoaXMKPiAgPiB0ZXN0IGhhcyBiZWVuIGludHJvZHVj
ZWQuCj4gCj4gID4gU2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21h
aWwuY29tPgo+IAo+IENvbW1pdHRlZCB0byAyMDIxLjAyLngsIDIwMjEuMDUueCBhbmQgMjAyMS4w
OC54LCB0aGFua3MuCj4gCgpGb3IgMjAyMS4wMi54IHRoZSBCb290bGluIHRvb2xjaGFpbiBibGVl
ZGluZy1lZGdlIHVzZSBrZXJuZWwtaGVhZGVycyB0b28gbmV3Cig1LjQpIGZvciB0aGUgNC4xOSBr
ZXJuZWwgdXNlZCBieSB0aGlzIHRlc3QuClRoZSBrZXJuZWwgZG9lc24ndCBib290IHdpdGggImtl
cm5lbCB0b28gb2xkIiBtZXNzYWdlLgoKQmVzdCByZWdhcmRzLApSb21haW4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
