Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA5BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 08:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6145B42455;
	Sun, 24 Jul 2022 08:44:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6145B42455
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eRDs-XQ2c6rM; Sun, 24 Jul 2022 08:44:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0ABAB42448;
	Sun, 24 Jul 2022 08:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ABAB42448
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C6EC91BF312
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A0D9440253
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 08:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0D9440253
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X-kq1IUKyViE for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 08:43:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F27B940025
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F27B940025
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 08:43:57 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id bn9so1062821wrb.9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 01:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W7hbrH3phomRxz8dxlEY7QrF+ffklVEu9rQScglINHE=;
 b=h7Gnpk8x4RptgyzBApw8X16JyTTZk7/d2YJsBFE4YlFEiwCooGTMBtSHYauMfmKOAP
 dehWCTdUlcOLaCaQhxdIBWvamII8zQhWgTitAEh35mAY7A+vBMyIbd/7CIVnqq4/vqdK
 Ox1tFI8OvZ2lUK/WTp4g9LZGbX1BoPAM5Vo9nw4SG0Y0xZVFWHBAU204L0XkmtOSbek3
 OfqZ7hsQc8TmxCElUibugbOj6Rz3io5Ydoxllb7TJbbmIqab/X5P55APslcY/+3fZM6M
 YZkGjelqGndWF6MoPmNhnnRPxZL18ekg7qgRBqzvf184RK+30WTVQZGeSz5GN1rvzg67
 P4MQ==
X-Gm-Message-State: AJIora/QIDKRj5UKok76sYV37lDGwGHAGm6poEAoAlfkusvMS8gtmpOe
 suKWWJBxxLTy1hyBYxI8ANfzhw==
X-Google-Smtp-Source: AGRyM1uNB+MjHlv99rxzBG8iVnmCa5XZ9/P4kIZZ0al1IY0112Td0EdSqr2tLmG7deaKsy8JqFFCog==
X-Received: by 2002:a5d:6285:0:b0:21e:6554:5e31 with SMTP id
 k5-20020a5d6285000000b0021e65545e31mr4595490wru.21.1658652235557; 
 Sun, 24 Jul 2022 01:43:55 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 e10-20020adfe7ca000000b0021dbaa4f38dsm10753435wrn.18.2022.07.24.01.43.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 01:43:55 -0700 (PDT)
Message-ID: <bc802760-2f18-0456-57f9-d035e2c2c0d4@smile.fr>
Date: Sun, 24 Jul 2022 10:43:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220724073726.A0A3B854E7@busybox.osuosl.org>
 <94a2d730-3d96-6a3b-77bb-0b2ffc2eabb6@smile.fr>
 <CADvTj4rwgF=gpjp2zEpPwTKb37cQ4Q54W1PdrO2Ej7GnAr3Xmg@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CADvTj4rwgF=gpjp2zEpPwTKb37cQ4Q54W1PdrO2Ej7GnAr3Xmg@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=W7hbrH3phomRxz8dxlEY7QrF+ffklVEu9rQScglINHE=;
 b=f96Cc4MKd7Utl2Y6uI5/Yp4YHNfWiMXMnFUEgYy8XPW2TbDOK2oPg7ALbqqNxLvt/e
 nwetvZjX+8auU+e3upnqrc0ruiGiUKTonihB5C5kKjpmu5Sq4NG3YHZtiuOEUtT14B5i
 tlLjx9Wkq1Eq9Stg79s6uc4dX0miRlGNkUfybC8e2OkK//DA9zevzvSsMby8nenEA9wL
 MQZwctt23B0A+z2YuvyanACjKHv/Fj5MUZXjh/qMGTbqlLYZlOnTPdhVFaEF/8qpmq1K
 jlpoj4nxG0NW0U8NqLHzi+tsbSSBy77GmTUKEwxeiavz6YBzqp+JUUnHHzT95DThUU6W
 xBcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=f96Cc4MK
Subject: Re: [Buildroot] [git commit] package/python-maturin: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjQvMDcvMjAyMiDDoCAxMDozOCwgSmFtZXMgSGlsbGlhcmQgYSDDqWNyaXTCoDoKPiBPbiBT
dW4sIEp1bCAyNCwgMjAyMiBhdCAyOjMyIEFNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNt
aWxlLmZyPiB3cm90ZToKPj4KPj4gSGVsbG8sCj4+Cj4+IExlIDI0LzA3LzIwMjIgw6AgMDk6NTAs
IFRob21hcyBQZXRhenpvbmkgdmlhIGJ1aWxkcm9vdCBhIMOpY3JpdCA6Cj4+PiBjb21taXQ6IGh0
dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9MmQ5OTFjOTJmNWJl
NmE5YTg1OGM4Njg5ZWEyZDkyNzM2NWU5YzY2NAo+Pj4gYnJhbmNoOiBodHRwczovL2dpdC5idWls
ZHJvb3QubmV0L2J1aWxkcm9vdC9jb21taXQvP2lkPXJlZnMvaGVhZHMvbWFzdGVyCj4+Pgo+Pj4g
VGhpcyBpcyBwZXA1MTcgcHlvMyBidWlsZCBiYWNrZW5kIHRoYXQncyBhbiBhbHRlcm5hdGl2ZSB0
bwo+Pj4gcHl0aG9uLXNldHVwdG9vbHMtcnVzdC4KPj4+Cj4+PiBOb3RlIHRoYXQgbWF0dXJpbiBp
dHNlbGYgdXNlcyBweXRob24tc2V0dXB0b29scy1ydXN0IGZvcgo+Pj4gYm9vdHN0cmFwcGluZy4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdt
YWlsLmNvbT4KPj4+IFRlc3RlZC1ieTogR3JhZW1lIFNtZWNoZXIgPGdzbWVjaGVyQHRocmVlc3Bl
ZWRsb2dpYy5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPgo+Pj4gLS0tCj4+Cj4+IC4uLgo+Pgo+Pj4gKysrIGIvcGFj
a2FnZS9weXRob24tbWF0dXJpbi9weXRob24tbWF0dXJpbi5tawo+Pj4gQEAgLTAsMCArMSwyNSBA
QAo+Pj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+PiArIwo+Pj4gKyMgcHl0aG9uLW1hdHVy
aW4KPj4+ICsjCj4+PiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPj4+ICsKPj4+ICtQWVRIT05f
TUFUVVJJTl9WRVJTSU9OID0gMC4xMi4yMAo+Pj4gK1BZVEhPTl9NQVRVUklOX1NPVVJDRSA9IG1h
dHVyaW4tJChQWVRIT05fTUFUVVJJTl9WRVJTSU9OKS50YXIuZ3oKPj4+ICtQWVRIT05fTUFUVVJJ
Tl9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzM5L2JhL2Zl
YzU5ODk1NjM5MzIzMDM0MWRlZjQyMzY3YzZhZDBlZmJlZTZkZGM4OTlmODg1OGU1YjI1YTdmMzdh
NQo+Pj4gK1BZVEhPTl9NQVRVUklOX1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCj4+PiArUFlUSE9O
X01BVFVSSU5fTElDRU5TRSA9IEFwYWNoZS0yLjAgb3IgTUlUCj4+PiArUFlUSE9OX01BVFVSSU5f
TElDRU5TRV9GSUxFUyA9IGxpY2Vuc2UtYXBhY2hlIGxpY2Vuc2UtbWl0Cj4+PiArSE9TVF9QWVRI
T05fTUFUVVJJTl9ERVBFTkRFTkNJRVMgPSBcCj4+PiArICAgICBob3N0LXB5dGhvbi1zZXR1cHRv
b2xzLXJ1c3QgXAo+Pj4gKyAgICAgaG9zdC1weXRob24tdG9tbGkgXAo+Pj4gKyAgICAgaG9zdC1y
dXN0Ywo+Pj4gK0hPU1RfUFlUSE9OX01BVFVSSU5fRU5WID0gXAo+Pj4gKyAgICAgJChIT1NUX1BL
R19DQVJHT19FTlYpIFwKPj4+ICsgICAgIFBZTzNfQ1JPU1NfTElCX0RJUj0iJChIT1NUX0RJUikv
dXNyL2xpYi9weXRob24kKFBZVEhPTjNfVkVSU0lPTl9NQUpPUikiCj4+Cj4+IFNob3VsZCBiZSAk
KEhPU1RfRElSKS9saWIgaGVyZS4KPiAKPiBZZWFoLCB0aGF0IGdvdCBjb3B5IHBhc3RlZCBmcm9t
IHB5dGhvbi1jcnlwdG9ncmFwaHksIGZpeGVkIGJvdGggaGVyZToKPiBodHRwczovL3BhdGNod29y
ay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L3BhdGNoLzIwMjIwNzI0MDgzNzQ4LjE1MDMy
MzgtMS1qYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tLwoKV2VsbCwgc2VlIHRoZSBwYXRjaCBmcm9t
IFlhbm4uIEl0IGFscmVhZHkgdGFrZSBjYXJlIG9mIHB5dGhvbi1jcnlwdG9ncmFwaHkgYWxvbmcK
b3RoZXIgcGFja2FnZXMuIEkgZ3Vlc3MgaGlzIHBhdGNoIGNhbiBiZSB1cGRhdGVkIHdoaWxlIGFw
cGx5aW5nIHRvIGZpeApweXRob24tbWF0dXJpbi4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAK
Pj4KPj4gU2VlCj4+IGh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9v
dC9wYXRjaC9iYzE2YWRmZTNkNzE0MzEwNWU4NDAwNzJlZGIxNjllNGNiNzM1NGNjLjE2NTgwMDcw
MDAuZ2l0Lnlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyLwo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IFJv
bWFpbgo+Pgo+Pgo+Pj4gKyMgV2UgbmVlZCB0byB2ZW5kb3IgdGhlIENhcmdvIGNyYXRlcyBhdCBk
b3dubG9hZCB0aW1lCj4+PiArUFlUSE9OX01BVFVSSU5fRE9XTkxPQURfUE9TVF9QUk9DRVNTID0g
Y2FyZ28KPj4+ICtQWVRIT05fTUFUVVJJTl9ET1dOTE9BRF9ERVBFTkRFTkNJRVMgPSBob3N0LXJ1
c3RjCj4+PiArSE9TVF9QWVRIT05fTUFUVVJJTl9ETF9FTlYgPSAkKEhPU1RfUEtHX0NBUkdPX0VO
VikKPj4+ICsKPj4+ICskKGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKPj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4+Cj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
