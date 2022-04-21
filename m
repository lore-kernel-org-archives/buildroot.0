Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1ECC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 17:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22E0C60FB1;
	Thu, 21 Apr 2022 17:56:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gv9gKRYvLZXe; Thu, 21 Apr 2022 17:56:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A9860FAC;
	Thu, 21 Apr 2022 17:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E0AB1BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95E4583E27
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 17:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57RO0lnh6bFc for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 17:56:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8493F82ACD
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 17:56:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k22so7763789wrd.2
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 10:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=02F6eq+TYUUXqsbnbcZv4gkRyK89zAbrpsyEEZFU5nI=;
 b=IwzPSfRt/Ef5J40eohyvVNOF3MnPC/no2p1Ybi2xGvetE1PQU4P1WQD/6OZ5xTpGez
 MdnEXRL0AGH9ejyQ0AfMtUAJnCHKe++FZrW/y9bmWENY+c8HqmvYH85+V7EFrEedC6/w
 CaTJ4k20JCs/r6LlP8qBdQk25h1sDHV9HnqjIvH3xse2VAs4ZmkOdPgnQeqM+ZQA3kQZ
 BOlkBLbJtGoFwbi7B/ArBBrq2+ARnZRnLWucqKN5kKYcB3hWNTSIr9cLAVh7poTadBCe
 SSgxvyRCwCVXyZpDAVxYH4/drVwmX0mrXTCOBB62L4uLEnjbhC7l7RFFOJzQ6QJjUHWm
 Gp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=02F6eq+TYUUXqsbnbcZv4gkRyK89zAbrpsyEEZFU5nI=;
 b=hEMHyVWCzFEI1Xo3/labq33AQlsIkBDfzBmrFkj6JpsvoFUAfrMZtlekgFSN5TJEr0
 ojyqXSwT/5+T5rtAzPe1MbbKFH7NGp89l6E5MX1ATg9DG2fCgffpTYsrjWeIp3g+KInA
 +ikgaU1MyGlrJMkWZQjlE9FoK/gFlja/cR7DrLBe0ILEpvxqpZ+5B8okllFHLPeEdyoK
 /MqoKkcxnk8jW9AMOwM6vD6ytf3m0iABK6iUU+lR6UJvB7UckaZ1w8SMo7BzsnB53OLM
 ltWoGjboO1uvDAFXHdWm3ZYI8x33fjhR8T35CKg4r0ovbUEMmZzSIRRG/6U9gbuQ+hn/
 Ik6g==
X-Gm-Message-State: AOAM532uUZKuSnFCsgVNNOWygSJVDvhd7r+/CH9/t/uXLle9c/suZQ2r
 qjexgz9IHLOBntLnIet7JlBdFg==
X-Google-Smtp-Source: ABdhPJyQZdjZsGzNIGiS4uXU2jphbojTtYCQdVHqEp41FhypZNNE/piwDSNjQAQNEyoIah2574tDcA==
X-Received: by 2002:a5d:5953:0:b0:206:b5c:dfe8 with SMTP id
 e19-20020a5d5953000000b002060b5cdfe8mr664192wri.35.1650563762788; 
 Thu, 21 Apr 2022 10:56:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a05600c148300b0038ebc8ad740sm2971410wmh.1.2022.04.21.10.56.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 10:56:02 -0700 (PDT)
Message-ID: <2fbd9546-2b4c-f1f1-a71b-1880166d6096@mind.be>
Date: Thu, 21 Apr 2022 19:56:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220411215002.518739-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220411215002.518739-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/tvheadend: fix FTBFS
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxMS8wNC8yMDIyIDIzOjUwLCBGYWJyaWNlIEZvbnRhaW5lIHdyb3RlOgo+IEZpeCB0aGUg
Zm9sbG9pbmcgYnVpbGQgZmFpbHVyZSByYWlzZWQgc2luY2UgY29tbWl0Cj4gMDQxNjRiODFlNzZl
MjlmYjk0ODIyNDVlODA4YjQ2YWYyYWE2N2JjNjoKPiAKPiBzcmMvdXRpbHMuYzogSW4gZnVuY3Rp
b24gJ3NoYTUxMnN1bTI1Nic6Cj4gc3JjL3V0aWxzLmM6NjE5OjQ1OiBlcnJvcjogdG9rZW4gIiAi
IGlzIG5vdCB2YWxpZCBpbiBwcmVwcm9jZXNzb3IgZXhwcmVzc2lvbnMKPiAgICA2MTkgfCAjaWYg
T1BFTlNTTF9WRVJTSU9OX05VTUJFUiA+PSAweDEwMTAxMDFmTCAmJiAhZGVmaW5lZChMSUJSRVNT
TF9WRVJTSU9OX05VTUJFUikKPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIF4KPiAKPiBGaXhlczoKPiAgIC0gaHR0cDovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvY2FmMGY1ZTRjNmFkMGYyNzY0ZjA3ZDMzZjU5NGI2MTIxY2VhODdi
Ywo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VA
Z21haWwuY29tPgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFy
bm91dAoKPiAtLS0KPiAgIC4uLi90dmhlYWRlbmQvMDAwMy1GaXgtRlRCRlMtaW4tdXRpbHMtYy5w
YXRjaCB8IDI4ICsrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyOCBpbnNl
cnRpb25zKCspCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS90dmhlYWRlbmQvMDAwMy1G
aXgtRlRCRlMtaW4tdXRpbHMtYy5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3R2aGVh
ZGVuZC8wMDAzLUZpeC1GVEJGUy1pbi11dGlscy1jLnBhdGNoIGIvcGFja2FnZS90dmhlYWRlbmQv
MDAwMy1GaXgtRlRCRlMtaW4tdXRpbHMtYy5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMC4uMmNhYTI4MTQ5MAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNr
YWdlL3R2aGVhZGVuZC8wMDAzLUZpeC1GVEJGUy1pbi11dGlscy1jLnBhdGNoCj4gQEAgLTAsMCAr
MSwyOCBAQAo+ICtGcm9tIGZkMDE3MzcyNzBkOThjMjg0NjVjODZhNjg4YmQ3ZDFjNjQwNDg2YzUg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IE1pY2hhZWwgTWFybGV5IDxtaWNoYWVs
QG1pY2hhZWxtYXJsZXkuY29tPgo+ICtEYXRlOiBXZWQsIDYgQXByIDIwMjIgMjE6NDc6NDkgLTA0
MDAKPiArU3ViamVjdDogW1BBVENIXSBGaXggRlRCRlMgaW4gdXRpbHMuYwo+ICsKPiArVSswMDIw
IFNQQUNFIGFuZCBVKzAwQTAgTk8tQlJFQUsgU1BBQ0UgbG9vayB0aGUgc2FtZSwgYnV0IHRoZXkK
PiArYXJlbid0IHRoZSBzYW1lLgo+ICsKPiArW1JldHJpZXZlZCBmcm9tOgo+ICtodHRwczovL2dp
dGh1Yi5jb20vdHZoZWFkZW5kL3R2aGVhZGVuZC9jb21taXQvZmQwMTczNzI3MGQ5OGMyODQ2NWM4
NmE2ODhiZDdkMWM2NDA0ODZjNV0KPiArU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8
Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gKy0tLQo+ICsgc3JjL3V0aWxzLmMgfCAyICst
Cj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiArCj4g
K2RpZmYgLS1naXQgYS9zcmMvdXRpbHMuYyBiL3NyYy91dGlscy5jCj4gK2luZGV4IGVlY2IxMGUx
MTYuLmJjNjQwMWQyMmYgMTAwNjQ0Cj4gKy0tLSBhL3NyYy91dGlscy5jCj4gKysrKyBiL3NyYy91
dGlscy5jCj4gK0BAIC02MTYsNyArNjE2LDcgQEAgc2hhMjU2c3VtICggY29uc3QgY2hhciAqc3Ry
LCBpbnQgbG93ZXJjYXNlICkKPiArIGNoYXIgKgo+ICsgc2hhNTEyc3VtMjU2ICggY29uc3QgY2hh
ciAqc3RyLCBpbnQgbG93ZXJjYXNlICkKPiArIHsKPiArLSNpZiBPUEVOU1NMX1ZFUlNJT05fTlVN
QkVSID49IDB4MTAxMDEwMWZMICYmwqAhZGVmaW5lZChMSUJSRVNTTF9WRVJTSU9OX05VTUJFUikK
PiArKyNpZiBPUEVOU1NMX1ZFUlNJT05fTlVNQkVSID49IDB4MTAxMDEwMWZMICYmICFkZWZpbmVk
KExJQlJFU1NMX1ZFUlNJT05fTlVNQkVSKQo+ICsgICByZXR1cm4gb3BlbnNzbF9oYXNoX2hleHN0
cihzdHIsIGxvd2VyY2FzZSwgRVZQX3NoYTUxMl8yNTYoKSwgMzIpOwo+ICsgI2Vsc2UKPiArICAg
cmV0dXJuIE5VTEw7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
