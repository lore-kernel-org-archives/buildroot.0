Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F93C64990
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 14:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34F498378C;
	Thu, 25 Aug 2022 14:14:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F498378C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZ65Kk_MVa63; Thu, 25 Aug 2022 14:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DD36817A4;
	Thu, 25 Aug 2022 14:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DD36817A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 929CF1BF4E2
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 14:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A89E812ED
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 14:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A89E812ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9amHuVDLeAL for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 14:14:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 093CC80C5E
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 093CC80C5E
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 14:13:56 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id y3so13444554ejc.1
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 07:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Uc2ea/PjHQaA8UmsC97kxDHcjucSZadIHt/jq6cuLxQ=;
 b=erstBNtvH/9h4Z9mojoUw1SkaZ/UvBFm+tgqenzPrqViuozA+HrbEeily6VphbCZcN
 TTkr3Izr3DBO9U7bDmVcIj5rJKv+wuC0FrJmesvSstdUbEoQ73xCntaWp5EXbcFub8w0
 aWhgKqL8VY2CgPsIeJ2w9WFXnaC3uLX1tWzpuSxKr4jpcyJ1Smydmvau7a4v6u0RPVma
 26YsnvBHVsHFToEhMEbwnGJoCieumJED16jgAv1MxL2CwF2fW5Pi28aavLHDS8CnXhbA
 o9snaK6YTNz2X3SLkVaK73FSv1tS+9Oa58Rb17BJ9DWUZoIMFkCJL+IYsGXtpvjnnmIf
 NE8A==
X-Gm-Message-State: ACgBeo2tq6b0/9EK7CCLtet3kcBOLhUl8mat6WMKte+zZjIgfs0DPVLI
 QEzJhB7+7Lq0+iAMXTLl4wzkLYTg2+pJTg==
X-Google-Smtp-Source: AA6agR6Llm5QSe04ylMP09GI/PF3dQD7Ir3CroagYtFA4wgd5o8A/kUyb306M2EKBSt02Sk/sOhOvA==
X-Received: by 2002:a17:907:7283:b0:731:60a5:5fc9 with SMTP id
 dt3-20020a170907728300b0073160a55fc9mr2623050ejc.51.1661436835317; 
 Thu, 25 Aug 2022 07:13:55 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 q35-20020a05640224a300b00445f9faf13csm4960945eda.72.2022.08.25.07.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 07:13:54 -0700 (PDT)
Message-ID: <4faa43f0-d49d-8ff8-c6be-bf393903a42f@mind.be>
Date: Thu, 25 Aug 2022 16:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>,
 Petr Vorel <pevik@seznam.cz>, buildroot@buildroot.org
References: <20220822193515.704278-1-pevik@seznam.cz>
 <cd82967a-fb72-05ce-34cc-a98835c70ae2@green-communications.fr>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <cd82967a-fb72-05ce-34cc-a98835c70ae2@green-communications.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=Uc2ea/PjHQaA8UmsC97kxDHcjucSZadIHt/jq6cuLxQ=;
 b=eQYtp4rTC18RmoY69Qf5TKR6hf+qehcmVEAlHMCgNVE9UrN7bmcLxrRhOaUHle20eL
 Nx2lo6zag1yIPH3CVhPDegQIKFk1bmTLnzBzj926baSH45mN6lC4YbOrkNd1x6ILiWOw
 PQsf4Wrmw6A2gD9+wrGTFpLHR4r+gQOSCJ6Atrj++6yfaiFdLOMQFEHBJCiDr49diJNc
 pNEBOsTW/6J/VtYosbI8mI9gF1B1LJq0ygZwmPTZ+QD0LH4aeO3c9B9bqvDObrrYZBPq
 QIMqc6RPPQCZRCrDKKG0ok6m0XTzBXJ4bu0vUUxjhwjvLaoJUllKifjoOUncBME6uBoT
 rPZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eQYtp4rT
Subject: Re: [Buildroot] [WIP][DO NOT MERGE][PATCH 1/1] package/iproute2:
 bump version to 5.19.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNS8wOC8yMDIyIDA5OjM2LCBOaWNvbGFzIENhdmFsbGFyaSB3cm90ZToKPiBPbiAyMi8w
OC8yMDIyIDIxOjM1LCBQZXRyIFZvcmVsIHdyb3RlOgo+PiBGcm9tOiBQZXRyIFZvcmVsIDxwZXRy
LnZvcmVsQGdtYWlsLmNvbT4KPj4KPj4gUmVtb3ZlIHBhdGNoIGZyb20gdGhpcyByZWxlYXNlLCBi
YWNrcG9ydCAzIHBhdGNoZXMgZml4aW5nIGJ1aWxkIGZyb20KPj4gdXBzdHJlYW0uCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHBldHIudm9yZWxAZ21haWwuY29tPgo+PiAtLS0KPj4g
SGkgYWxsLAo+Pgo+PiB2NS4xOS4wIGRvZXMgbm90IGNvbXBpbGUgb24gdWNsaWJjLgo+Pgo+Pgo+
PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gaXBzdGF0cy5jOjE1Ogo+PiAuLi9pbmNsdWRlL3V0aWxz
Lmg6MjcwOjIzOiBlcnJvcjogZXhwZWN0ZWQgZGVjbGFyYXRpb24gc3BlY2lmaWVycyBvciDigJgu
Li7igJkgCj4+IGJlZm9yZSDigJgo4oCZIHRva2VuCj4+IMKgwqAgMjcwIHwgI2RlZmluZSBBUlJB
WV9TSVpFKHgpIChzaXplb2YoeCkgLyBzaXplb2YoKHgpWzBdKSkKPj4gwqDCoMKgwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeCj4+IGlwc3RhdHMu
Yzo3NjoxNTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEFSUkFZX1NJWkXigJkKPj4g
wqDCoMKgIDc2IHwgc3RhdGljX2Fzc2VydChBUlJBWV9TSVpFKGlwc3RhdHNfc3RhdF9pZmxhX21h
eCkgPT0gSUZMQV9TVEFUU19NQVggKyAxLAo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fgo+PiBpcHN0YXRzLmM6Nzc6ODogZXJyb3I6IGV4cGVj
dGVkIGRlY2xhcmF0aW9uIHNwZWNpZmllcnMgb3Ig4oCYLi4u4oCZIGJlZm9yZSBzdHJpbmcgCj4+
IGNvbnN0YW50Cj4+IMKgwqDCoCA3NyB8wqDCoMKgwqDCoMKgwqAgIkFuIElGTEFfU1RBVFMgYXR0
cmlidXRlIGlzIG1pc3NpbmcgZnJvbSB0aGUgaWZsYV9tYXggdGFibGUiKTsKPj4gwqDCoMKgwqDC
oMKgIHzCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGlwc3RhdHMu
YzoxNToKPj4gLi4vaW5jbHVkZS91dGlscy5oOjI3MDoyMzogZXJyb3I6IGV4cGVjdGVkIGRlY2xh
cmF0aW9uIHNwZWNpZmllcnMgb3Ig4oCYLi4u4oCZIAo+PiBiZWZvcmUg4oCYKOKAmSB0b2tlbgo+
PiDCoMKgIDI3MCB8ICNkZWZpbmUgQVJSQVlfU0laRSh4KSAoc2l6ZW9mKHgpIC8gc2l6ZW9mKCh4
KVswXSkpCj4+IMKgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXgo+PiBpcHN0YXRzLmM6Mjc5OjE1OiBub3RlOiBpbiBleHBhbnNpb24gb2Yg
bWFjcm8g4oCYQVJSQVlfU0laReKAmQo+PiDCoMKgIDI3OSB8IHN0YXRpY19hc3NlcnQoQVJSQVlf
U0laRShpcHN0YXRzX2h3X3NfaW5mb19uYW1lKSA9PQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+fgo+PiBpcHN0YXRzLmM6MjgxOjg6IGVycm9y
OiBleHBlY3RlZCBkZWNsYXJhdGlvbiBzcGVjaWZpZXJzIG9yIOKAmC4uLuKAmSBiZWZvcmUgc3Ry
aW5nIAo+PiBjb25zdGFudAo+PiDCoMKgIDI4MSB8wqDCoMKgwqDCoMKgwqAgIm1pc21hdGNoOiBl
bnVtIGlwc3RhdHNfaHdfc19pbmZvX2lkeCB4IGlwc3RhdHNfaHdfc19pbmZvX25hbWUiKTsKPj4g
wqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoCBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPj4gbWFrZVsxXTogKioqIFsuLi9j
b25maWcubWs6MzM6IGlwc3RhdHMub10gRXJyb3IgMQo+PiBtYWtlOiAqKiogW01ha2VmaWxlOjc3
OiBhbGxdIEVycm9yIDIKPj4KPj4KPj4gSSdtIG5vdCBzdXJlIHdoYXQgaXQgaXMuIEFsbCB1Y2xp
YmMgdG9vbGNoYWlucyBhcmUgcXVpdGUgb2xkOgo+PiBMSU5VWF9WRVJTSU9OX0NPREUgMjY0NzAz
ID0+IDQuOS4yNTUKPj4KPj4gSSdtIG5vdCBzdXJlIGlmIGl0J3MgZHVlIG1pc3NpbmcgSUZMQV9T
VEFUU19BRl9TUEVDIG1lbWJlciBpbgo+PiBJRkxBX1NUQVRTX0xJTktfKiBlbnVtIHdoaWNoIHdh
cyBhZGRlZCBpbiB2NC4xMS1yYzEgaW4gYWVmYjRkNGFkODNiCj4+ICgibmV0OiBBRi1zcGVjaWZp
YyBSVE1fR0VUU1RBVFMgYXR0cmlidXRlcyIpLiBMaWtlbHkgbm90Lgo+PiBJdCdzIG1vcmUgbGlr
ZWx5IHNvbWUgcHJvYmxlbSB3aXRoIHN0YXRpY19hc3NlcnQoKSwgYmVjYXVzZSB1c2luZwo+PiBj
b3JyZWN0IG9yIGV2ZW4gYW55IGludCB2YWx1ZSBpbiBzdGF0aWNfYXNzZXJ0KCkgY2F1c2VzIHNp
bWlsYXIgZXJyb3IuCj4+IEJ1dCBjb21tZW50aW5nIG91dCBzdGF0aWNfYXNzZXJ0KCkgYWxsb3dz
IGNvbXBpbGF0aW9uLgo+Pgo+PiBzdGF0aWNfYXNzZXJ0KCkgd2FzIHN0YW5kYXJkaXplZCBpbiBD
MTEsIHdoaWNoIHNob3VsZCBiZSBzdXBwb3J0ZWQgaW4KPj4gZ2NjIDQuNyBbMV0uIGJvb3RsaW4t
YXJtdjUtdWNsaWJjIGhhcyBnY2MgMTAuMy4wOgo+Pgo+PiBici10ZXN0LXBrZy9ib290bGluLWFy
bXY1LXVjbGliYy9ob3N0L2Jpbi9hcm0tbGludXgtZ2NjIC0tdmVyc2lvbgo+PiBhcm0tbGludXgt
Z2NjLmJyX3JlYWwgKEJ1aWxkcm9vdCB0b29sY2hhaW5zLmJvb3RsaW4uY29tLTIwMjEuMTEtMSkg
MTAuMy4wCj4gCj4gc3RhdGljX2Fzc2VydCBpcyBzdXBwb3NlZCB0byBiZSBhIG1hY3JvIGRlZmlu
ZWQgaW4gYXNzZXJ0LmgsIGJ1dCB1Y2xpYmMtbmcgaGFzIAo+IGl0IG9ubHkgc2luY2UgMS4wLjQy
LCB3aGljaCBpcyB0d28gd2Vla3Mgb2xkLiBUaGUgbWFqb3JpdHkgb2YgcHJlLWJ1aWx0IAo+IHRv
b2xjaGFpbnMgYXJlIG1vcmUgdGhhbiB0d28gd2Vla3Mgb2xkLgo+IAo+IEEgd29ya2Fyb3VuZCBp
cyB0byBhZGQgYSBwYXRjaCB0aGF0IGRvZXMgcy9zdGF0aWNfYXNzZXJ0L19TdGF0aWNfYXNzZXJ0
LywKPiBvciB0byBhZGQgc29tZSAjZGVmaW5lIHN0YXRpY19hc3NlcnQgX1N0YXRpY19hc3NlcnQu
CgogIFRoaXMgY2FuIGJlIGRvbmUgdGhyb3VnaCBDRkxBR1Mgd2l0aCAtRHN0YXRpY19hc3NlcnQ9
X1N0YXRpY19hc3NlcnQKCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gCj4+Cj4+IGNvbXBpbGluZyBp
cHJvdXRlMiB3aXRoIGV4cG9ydCBDRkxBR1M9Ii1zdGQ9YzExIiBjYXVzZXMgb3RoZXIgZXJyb3Jz
Ogo+Pgo+PiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gbGxfbWFwLmM6MjQ6Cj4+IGxsX21hcC5jOiBJ
biBmdW5jdGlvbiDigJhsbF9nZXRfYnlfaW5kZXjigJk6Cj4+IC4uL2luY2x1ZGUvbGlzdC5oOjk6
MTY6IGVycm9yOiBleHBlY3RlZCBkZWNsYXJhdGlvbiBzcGVjaWZpZXJzIG9yIOKAmC4uLuKAmSBi
ZWZvcmUgCj4+IOKAmCjigJkgdG9rZW4KPj4gwqDCoMKgwqAgOSB8wqAgY29uc3QgdHlwZW9mKCAo
KHR5cGUgKikwKS0+bWVtYmVyICkgKl9fbXB0ciA9IChwdHIpOyBcCj4+IMKgwqDCoMKgwqDCoCB8
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4KPj4gbGxfbWFwLmM6NDg6Njogbm90ZTog
aW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGNvbnRhaW5lcl9vZuKAmQo+PiDCoMKgwqAgNDggfMKg
wqDCoCA9IGNvbnRhaW5lcl9vZihuLCBzdHJ1Y3QgbGxfY2FjaGUsIGlkeF9oYXNoKTsKPj4gwqDC
oMKgwqDCoMKgIHzCoMKgwqDCoMKgIF5+fn5+fn5+fn5+fgo+PiAuLi9pbmNsdWRlL2xpc3QuaDox
MDoyMDogZXJyb3I6IOKAmF9fbXB0cuKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBm
dW5jdGlvbikKPj4gwqDCoMKgIDEwIHzCoCAodHlwZSAqKSggKGNoYXIgKilfX21wdHIgLSBvZmZz
ZXRvZih0eXBlLG1lbWJlcikgKTt9KQo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fgo+PiBsbF9tYXAuYzo0ODo2OiBub3RlOiBpbiBl
eHBhbnNpb24gb2YgbWFjcm8g4oCYY29udGFpbmVyX29m4oCZCj4+IMKgwqDCoCA0OCB8wqDCoMKg
ID0gY29udGFpbmVyX29mKG4sIHN0cnVjdCBsbF9jYWNoZSwgaWR4X2hhc2gpOwo+PiDCoMKgwqDC
oMKgwqAgfMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+Cj4+IC4uL2luY2x1ZGUvbGlzdC5oOjEwOjIw
OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IAo+PiBv
bmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVhcnMgaW4KPj4gwqDCoMKgIDEwIHzCoCAodHlw
ZSAqKSggKGNoYXIgKilfX21wdHIgLSBvZmZzZXRvZih0eXBlLG1lbWJlcikgKTt9KQo+PiDCoMKg
wqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+fgo+
PiBsbF9tYXAuYzo0ODo2OiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYY29udGFpbmVy
X29m4oCZCj4+IMKgwqDCoCA0OCB8wqDCoMKgID0gY29udGFpbmVyX29mKG4sIHN0cnVjdCBsbF9j
YWNoZSwgaWR4X2hhc2gpOwo+PiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqAgXn5+fn5+fn5+fn5+
Cj4+IGxsX21hcC5jOiBJbiBmdW5jdGlvbiDigJhsbF9nZXRfYnlfbmFtZeKAmToKPj4gLi4vaW5j
bHVkZS9saXN0Lmg6OToxNjogZXJyb3I6IGV4cGVjdGVkIGRlY2xhcmF0aW9uIHNwZWNpZmllcnMg
b3Ig4oCYLi4u4oCZIGJlZm9yZSAKPj4g4oCYKOKAmSB0b2tlbgo+PiDCoMKgwqDCoCA5IHzCoCBj
b25zdCB0eXBlb2YoICgodHlwZSAqKTApLT5tZW1iZXIgKSAqX19tcHRyID0gKHB0cik7IFwKPj4K
Pj4gLi4uCj4+Cj4+IFdoYXQgY291bGQgYmUgd3Jvbmc/Cj4gCj4gdHlwZW9mIGlzIGEgZ2NjIGV4
dGVuc2lvbiwgc28gdGhhdCBzaG91bGQgcHJvYmFibHkgbmVlZCAtc3RkPWdudTExIGluc3RlYWQg
b2YgCj4gLXN0ZD1jMTEuIEJ1dCBnY2MgMTAgcHJvYmFibHkgYWxyZWFkeSBkZWZhdWx0cyB0byBn
bnUxMS4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
