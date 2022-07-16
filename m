Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DA0C43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 11:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB04384F66;
	Sat, 16 Jul 2022 11:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB04384F66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuBEtXccbrZ9; Sat, 16 Jul 2022 11:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6356F84F5B;
	Sat, 16 Jul 2022 11:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6356F84F5B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 775891BF57C
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 11:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5161660E9B
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 11:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5161660E9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bGrEsd9P1Eih for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 11:31:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2416260E28
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2416260E28
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 11:31:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id bu1so10032062wrb.9
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 04:31:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nzqpXpP9rRTxSfsNjMk+yqoR5zQ5Dzx1yueImi334Cg=;
 b=4UbHsmgOuuYrFld4KoTD+brTk1Myh7g5S3z1dltx7wgmlSoN/Uc7QMgF/ZMkhRYNZd
 rHtYpeiIDGmHqOyuBMAiQoCVN2sKumt7+lVwvFJIQxMQe24gmJTq4gM7kri/q9Ij+0CA
 SnyCw50gN6GMEpP4+JjE6KPJfu5toNSr8jgWz8QagjxdlBvR34i4PMAc3B8YZW+KnuZ7
 tsLjD/dgpJ2EtuDr7gzjJ78iuN0W8FcQ5g7DZp8zGUIW8/hBj5f3rl5NpX40YPOQ4Jak
 hj1n0dxcAjS5FW6d0yVjrFPrZuasEUCuOS/srBFFmoeMVbZ/3GDzYKlJAieLJ/X6Za5d
 vsJA==
X-Gm-Message-State: AJIora8KGRsYzDZoJeHizVpaHtD98riam4cS5GR9URi1gZOtVDvk2KGb
 jlKAAjbG/e78rVZFt+WTV8E=
X-Google-Smtp-Source: AGRyM1tzATdCO5NciAjyCOw3Sw/ipfE6fOF3wN399mIlDw2yK8CFfXIwrTnk7ebhUQc6HA/a0o0q4w==
X-Received: by 2002:adf:d1c4:0:b0:21d:76e1:bf2c with SMTP id
 b4-20020adfd1c4000000b0021d76e1bf2cmr16341468wrd.576.1657971075144; 
 Sat, 16 Jul 2022 04:31:15 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d4-20020adfef84000000b0021dc289b72fsm5896321wro.49.2022.07.16.04.31.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Jul 2022 04:31:14 -0700 (PDT)
Message-ID: <33065cf2-4fdf-1abf-75ce-b737e55fdd7f@gmail.com>
Date: Sat, 16 Jul 2022 13:31:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
 <20220529131811.481017-8-romain.naour@gmail.com>
 <CADvTj4oSsDgObzR=zRD_g0rHYn6AHEKQp7g0OY+qRi29wo=WNw@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <CADvTj4oSsDgObzR=zRD_g0rHYn6AHEKQp7g0OY+qRi29wo=WNw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nzqpXpP9rRTxSfsNjMk+yqoR5zQ5Dzx1yueImi334Cg=;
 b=AWOPAYttAPXlxB+vWKVF3NA7kdQ1lM4DeRwqIDgiea3eI5ZabhOpXH25M6fHUMT5CC
 aCe/KQcpcjabr5D5SCUPGJkaG/jyGnhI6ccnytl4rOuZvtX3yqi7oYG5n0D7S5syc0bW
 7IIqZ21BqMfY2kbp9mv7YbVrEOZKgfqjMHv7LTmhg+Rj2/mapZVXgpuQLrywLWxY8rNC
 w2hQgk2XEdcJL/43kXJB+13rylz1uMZcx686Lcx4z/uBb9lbntETYm0BPvOREd5wCYZx
 Ve8O1kCb8K6SafyKTYECW3NixoqRd65YBkV7/r9GAcIcfkHV6p32yqcfDgJwL7lmd8/f
 QuNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AWOPAYtt
Subject: Re: [Buildroot] [PATCH for-next 08/11] package/gcc: add support for
 gcc 12
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMsCgpMZSAyNS8wNi8yMDIyIMOgIDA4OjQ1LCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IE9uIFN1biwgTWF5IDI5LCAyMDIyIGF0IDc6MjAgQU0gUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gaHR0cHM6Ly9nY2MuZ251Lm9yZy9n
Y2MtMTIvY2hhbmdlcy5odG1sCj4+IGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2NjLTEyL3BvcnRpbmdf
dG8uaHRtbAo+Pgo+PiBUZXN0ZWQgd2l0aCB0b29sY2hhaW4tYnVpbGRlcjoKPj4gaHR0cHM6Ly9n
aXRsYWIuY29tL2t1YnU5My90b29sY2hhaW5zLWJ1aWxkZXIvLS9waXBlbGluZXMvNTUwNDA0OTU3
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNv
bT4KPiBUZXN0ZWQtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
PgoKVGhhbmtzIGZvciB0ZXN0aW5nIGJ1dCBwcmV2aW91cyBwYXRjaGVzIGluIHRoaXMgc2VyaWVz
IHNlZW1zIHRvIGJlIGhvbGRpbmcgYmFjawptYWludGFpbmVycyBmcm9tIG1lcmdpbmcgZ2NjIDEy
LiBJZiB5b3UgaGF2ZSBzb21lIHRpbWUgaXQgd291bGQgYmUgbmljZSBpZiB5b3UKY2FuIHJldmll
dyB0aGVtLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4+IC0tLQo+PiAgcGFja2FnZS9nY2MvQ29u
ZmlnLmluLmhvc3QgfCAxNCArKysrKysrKysrKysrKwo+PiAgcGFja2FnZS9nY2MvZ2NjLmhhc2gg
ICAgICAgfCAgMiArKwo+PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspCj4+Cj4+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvZ2NjL0Nv
bmZpZy5pbi5ob3N0Cj4+IGluZGV4IDA2ZjgzZDhmODcuLmJjZjA3NDNiMjMgMTAwNjQ0Cj4+IC0t
LSBhL3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0Cj4+ICsrKyBiL3BhY2thZ2UvZ2NjL0NvbmZp
Zy5pbi5ob3N0Cj4+IEBAIC02Miw2ICs2MiwxOSBAQCBjb25maWcgQlIyX0dDQ19WRVJTSU9OXzEx
X1gKPj4gICAgICAgICBkZXBlbmRzIG9uICFCUjJfYXJjaHM0eF9yZWwzMQo+PiAgICAgICAgIHNl
bGVjdCBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMQo+Pgo+PiArY29uZmlnIEJSMl9HQ0Nf
VkVSU0lPTl8xMl9YCj4+ICsgICAgICAgYm9vbCAiZ2NjIDEyLngiCj4+ICsgICAgICAgIyBwb3dl
cnBjIHNwZSBzdXBwb3J0IGhhcyBiZWVuIGRlcHJlY2F0ZWQgc2luY2UgZ2NjIDgueC4KPj4gKyAg
ICAgICAjIGh0dHBzOi8vZ2NjLmdudS5vcmcvbWwvZ2NjLzIwMTgtMDQvbXNnMDAxMDIuaHRtbAo+
PiArICAgICAgIGRlcGVuZHMgb24gIUJSMl9wb3dlcnBjX1NQRQo+PiArICAgICAgICMgdUNsaWJj
LW5nIGJyb2tlbiBvbiBzcGFyYyBkdWUgdG8gcmVjZW50IGdjYyBjaGFuZ2VzCj4+ICsgICAgICAg
IyB0aGF0IG5lZWQgdG8gYmUgcmV2ZXJ0ZWQgc2luY2UgZ2NjIDguNCwgOS4zIGFuZCAxMC4xLgo+
PiArICAgICAgICMgaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9
OTg3ODQKPj4gKyAgICAgICBkZXBlbmRzIG9uICFCUjJfc3BhcmMKPj4gKyAgICAgICAjIEFSQyBI
UzQ4IHJlbCAzMSBvbmx5IHN1cHBvcnRlZCBieSBnY2MgYXJjIGZvcmsuCj4+ICsgICAgICAgZGVw
ZW5kcyBvbiAhQlIyX2FyY2hzNHhfcmVsMzEKPj4gKyAgICAgICBzZWxlY3QgQlIyX1RPT0xDSEFJ
Tl9HQ0NfQVRfTEVBU1RfMTIKPj4gKwo+PiAgZW5kY2hvaWNlCj4+Cj4+ICAjIGxpYmNpbGtydHMg
d2FzIGludHJvZHVjZWQgaW4gZ2NjIDQuOSBhbmQgcmVtb3ZlZCBpbiBnY2MgOC54Cj4+IEBAIC04
OCw2ICsxMDEsNyBAQCBjb25maWcgQlIyX0dDQ19WRVJTSU9OCj4+ICAgICAgICAgZGVmYXVsdCAi
OS40LjAiICAgICBpZiBCUjJfR0NDX1ZFUlNJT05fOV9YCj4+ICAgICAgICAgZGVmYXVsdCAiMTAu
My4wIiAgICBpZiBCUjJfR0NDX1ZFUlNJT05fMTBfWAo+PiAgICAgICAgIGRlZmF1bHQgIjExLjMu
MCIgICAgaWYgQlIyX0dDQ19WRVJTSU9OXzExX1gKPj4gKyAgICAgICBkZWZhdWx0ICIxMi4xLjAi
ICAgIGlmIEJSMl9HQ0NfVkVSU0lPTl8xMl9YCj4+ICAgICAgICAgZGVmYXVsdCAiYXJjLTIwMjAu
MDktcmVsZWFzZSIgaWYgQlIyX0dDQ19WRVJTSU9OX0FSQwo+Pgo+PiAgY29uZmlnIEJSMl9FWFRS
QV9HQ0NfQ09ORklHX09QVElPTlMKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2NjL2djYy5oYXNo
IGIvcGFja2FnZS9nY2MvZ2NjLmhhc2gKPj4gaW5kZXggZTM2NGJlMGEwNi4uZGMxOWMyODJjMiAx
MDA2NDQKPj4gLS0tIGEvcGFja2FnZS9nY2MvZ2NjLmhhc2gKPj4gKysrIGIvcGFja2FnZS9nY2Mv
Z2NjLmhhc2gKPj4gQEAgLTYsNiArNiw4IEBAIHNoYTUxMiAgZGZkMzUwMGJmMjE3ODRiODM1MWE1
MjJkNTM0NjNjZjM2MmVkZTY2YjBiYzMwMmVkZjM1MGJiNDRlOTQ0MTg0OTdhOGI0Yjc5Cj4+ICBz
aGE1MTIgIDJiMmRkNzQ1M2Q0OGEzOThjMjllYWViZDE0MjJiNzAzNDEwMDFiOGM5MGE2MmFlZTUx
ZTgzMzQ0ZTdmZGQ4YThlNDVmODJhNGE5MTY1YmQ3ZWRjNzZkYWRhOTEyYzkzMmY0YjY2MzJjNTYz
Njc2MGZlYzRjNWQ3ZTQwMmIzZjg2ICBnY2MtMTAuMy4wLnRhci54ego+PiAgIyBGcm9tIGh0dHBz
Oi8vZ2NjLmdudS5vcmcvcHViL2djYy9yZWxlYXNlcy9nY2MtMTEuMy4wL3NoYTUxMi5zdW0KPj4g
IHNoYTUxMiAgZjBiZTVhZDcwNWM3M2I4NDQ3NzEyOGE2OWMwNDdmNTdkZDQ3MDAyZjM3NWViNjBl
MWU4NDJlMDhjZjIwMDlhNTA5ZTkyMTUyYmNhMzQ1ODIzOTI2ZDU1MGI3Mzk1YWU2ZDRkZTdkYjUx
ZDFlZTM3MWMyZGMzNzMxMzg4MWZjYTcgIGdjYy0xMS4zLjAudGFyLnh6Cj4+ICsjIEZyb20gaHR0
cHM6Ly9nY2MuZ251Lm9yZy9wdWIvZ2NjL3JlbGVhc2VzL2djYy0xMi4xLjAvc2hhNTEyLnN1bQo+
PiArc2hhNTEyICAyMTIxZDI5NTI5MjgxNGE2NzYxZWRmMWZiYTA4YzVmNjMzZWJlMTZmNTJiODBl
N2I3M2E5MTA1MGU3MWUxZDJlZDk4YmYxN2VlYmFkMjYzZTE5MTg3OTU2MWMwMmI0ODkwNmM1M2Zh
YTRjNDY3MGM0ODZhMjZmYzc1ZGYyMzkwMCAgZ2NjLTEyLjEuMC50YXIueHoKPj4KPj4gICMgTG9j
YWxseSBjYWxjdWxhdGVkIChmZXRjaGVkIGZyb20gR2l0aHViKQo+PiAgc2hhNTEyICBiMDg1M2Uy
YjFjNTk5ODA0NDM5MjAyM2ZhNjUzZTM5OWU3NDExOGM0NmU2MTY1MDRhYzU5ZTFhMmNmMjc2MjBm
OTQ0MzQ3NjdjZTA2YjZjZjRjYTNkZmI1N2Y4MWQ2ZWRhOTI3NTJiZWZhZjA5NWVhNWU1NjRhOTE4
MWI0NjU5YyAgZ2NjLWFyYy0yMDIwLjA5LXJlbGVhc2UudGFyLmd6Cj4+IC0tCj4+IDIuMzUuMwo+
Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBi
dWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
