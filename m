Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60530C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Oct 2022 07:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE298409D5;
	Mon, 10 Oct 2022 07:35:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE298409D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TwF5B8LNpwsl; Mon, 10 Oct 2022 07:35:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18A07404B2;
	Mon, 10 Oct 2022 07:35:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18A07404B2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CF1C1BF318
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 07:34:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 285148191E
 for <buildroot@lists.busybox.net>; Mon, 10 Oct 2022 07:34:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 285148191E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpSs1Dq-MyGO for <buildroot@lists.busybox.net>;
 Mon, 10 Oct 2022 07:34:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D540818E6
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D540818E6
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 07:34:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id t4so6298068wmj.5
 for <buildroot@buildroot.org>; Mon, 10 Oct 2022 00:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YUPBsdgjlWAoKPrP3nqk5CIbND0cm6icClAUkCddI8Q=;
 b=dMid/Wt/Wfuwwj0/ZMc4jP+k/uKl7M1CP0n3dK7tX12QArxwAWfUNWQbmP6j/WbA7b
 Fkr1SDaiXR3jnrt7mL4J8j48ks1yDZcgI01kJ3olTYdhnXlAbrezgxCzLXqrby3APIUl
 E7jk3BgLSzBEVd70DeoWm42BgrgBnhylhrWxhoa/bgV6aVTnBG7/eLzwXQpUxCeXpTj0
 K0oeN/FxRXPw0pl9Iff7O5oRJdT4034e8tbiE5tR5sXYANeX2/1Z33sqKelZ8hK7cnSj
 kQwhl8lCPQtIU9QWfOVp6NdusEInIOfFYIzchLjrTWTAYTLeFf4t6r1JW6N0p6ePfsmP
 whMA==
X-Gm-Message-State: ACrzQf3mrZYBe4f+DuZDO+gElKIO9xQB7hFylqQngZatt5Acx5gEsL50
 Hbc880zNnJ/L2+Q6BM4zw7mFBg==
X-Google-Smtp-Source: AMsMyM7+CCflUY/zitFP6LukFT5W1FhTusl3oFpmw6jU0jht/y29bG0XDFXd/ubJ2QqziG1PMvvgPw==
X-Received: by 2002:a05:600c:a4b:b0:3b9:859d:7ed6 with SMTP id
 c11-20020a05600c0a4b00b003b9859d7ed6mr19077193wmq.169.1665387294106; 
 Mon, 10 Oct 2022 00:34:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a056000108b00b0022e3538d305sm9955136wrw.117.2022.10.10.00.34.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Oct 2022 00:34:53 -0700 (PDT)
Message-ID: <00204ef4-6f42-ff56-1f50-0fc6cc260976@smile.fr>
Date: Mon, 10 Oct 2022 09:34:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20221009153521.12444-1-romain.naour@gmail.com>
 <CADvTj4rNt5UFLkYpSvSPTiZHKgD0DB9LFp0yo-f_635mZrYE+Q@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CADvTj4rNt5UFLkYpSvSPTiZHKgD0DB9LFp0yo-f_635mZrYE+Q@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YUPBsdgjlWAoKPrP3nqk5CIbND0cm6icClAUkCddI8Q=;
 b=X7h5V1TsOT835rHBCgOrYQir4Rc43Xn29YGLqMzje8hOsDHGh3PU6kjRnDwAc8ZN47
 rxoLh5aC/K6O6On1GimB7B9AUjwqeHaCO2MUtOpgn9IBYl9QqP/M1OyR1jMxOeu4vflf
 bvxy0+0TVEfPdxw1CzbucN7AWWQOc5pxitIPLQnVKEnyoIjM3wFy0n/m7x3PZInnkr6d
 AUxvKhtLn1d/QRoK+MSjDRV7fTZCnRmQ2gyNc8954JNbqDBhoFagHhgPRrUIZ5Qm8ur6
 UuM6JTHVmzVoAAaOk7Uw20+2jFYi+UCTdnYZztLFGBR0IrlKR2wpsct7ZAAc6lYmPUJt
 APmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=X7h5V1Ts
Subject: Re: [Buildroot] [PATCH] package/glibc: Fix x86_64 builds with -Os
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

SGVsbG8gSmFtZXMsCgpMZSAxMC8xMC8yMDIyIMOgIDAxOjM3LCBKYW1lcyBIaWxsaWFyZCBhIMOp
Y3JpdMKgOgo+IE9uIFN1biwgT2N0IDksIDIwMjIgYXQgMTE6MzUgQU0gUm9tYWluIE5hb3VyIDxy
b21haW4ubmFvdXJAZ21haWwuY29tPiB3cm90ZToKPj4KPj4gQmFja3BvcnQgdXBzdHJlYW0gY29t
bWl0IGZvciB4ODZfNjQgYnVpbGRzIHdpdGggLU9zIHJlcG9ydGVkIGJ5IFsxXS4KPj4KPj4gWzFd
IGh0dHBzOi8vc291cmNld2FyZS5vcmcvYnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTI5NTc2Cj4+
Cj4+IEZpeGVzOgo+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9qb2JzLzMxMzQyMjk5MDIKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVp
bGRyb290Ly0vam9icy8zMTM0MjI5OTU2Cj4gCj4gSSB0aGluayB0aGlzIGFsc28gZml4ZXMgYW4g
aXNzdWUgaW4gYXV0b2J1aWxkZXJzLCBzZWU6Cj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDkyNzAzMTcwMi4yOTE4NDE0LTEtamFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbS8KClNvcnJ5IEkgbWlzc2VkIGl0IGluIHRoZSBwYXRjaHdvcmsg
aXQgd2FzIG9uIHRoZSBzZWNvbmQgcGFnZSBhbHJlYWR5Li4uCgo+IAo+IGh0dHA6Ly9hdXRvYnVp
bGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzViNC81YjQ0MmY5NTU4N2RkYzY1YTk5NWJiZDllMzEw
Yzg4YTY2YzU1YjFmCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQGdtYWlsLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gCj4+IC0tLQo+PiAgLi4uLzAwMDIteDg2LUZpeC1Pcy1i
dWlsZC1CWi0yOTU3Ni5wYXRjaCAgICAgIHwgNDggKysrKysrKysrKysrKysrKysrKwo+PiAgMSBm
aWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2dsaWJjLzAwMDIteDg2LUZpeC1Pcy1idWlsZC1CWi0yOTU3Ni5wYXRjaAo+Pgo+PiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9nbGliYy8wMDAyLXg4Ni1GaXgtT3MtYnVpbGQtQlotMjk1NzYucGF0
Y2ggYi9wYWNrYWdlL2dsaWJjLzAwMDIteDg2LUZpeC1Pcy1idWlsZC1CWi0yOTU3Ni5wYXRjaAo+
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwLi40NDcwMzI0ZjFjCj4+
IC0tLSAvZGV2L251bGwKPj4gKysrIGIvcGFja2FnZS9nbGliYy8wMDAyLXg4Ni1GaXgtT3MtYnVp
bGQtQlotMjk1NzYucGF0Y2gKPj4gQEAgLTAsMCArMSw0OCBAQAo+PiArRnJvbSAzOTM1YjU0M2Fk
Y2I5YTQ2YWI3OWY4OTMxYmM0ODkwNjhiMDQ5Mzc4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+
PiArRnJvbTogQWRoZW1lcnZhbCBaYW5lbGxhIE5ldHRvIDxhZGhlbWVydmFsLnphbmVsbGFAbGlu
YXJvLm9yZz4KPj4gK0RhdGU6IFdlZCwgMjEgU2VwIDIwMjIgMTA6NTE6MDggLTAzMDAKPj4gK1N1
YmplY3Q6IFtQQVRDSF0geDg2OiBGaXggLU9zIGJ1aWxkIChCWiAjMjk1NzYpCj4+ICsKPj4gK1Ro
ZSBjb21waWxlciBtaWdodCB0cmFuc2Zvcm0gX19zdHBjcHkgY2FsbHMgKHdoaWNoIGFyZSByb3V0
ZWQgdG8KPj4gK19fYnVpbHRpbl9zdHBjcHkgYXMgYW4gb3B0aW1pemF0aW9uKSB0byBzdHJjcHkg
YW5kIHg4Nl82NCBzdHJjcHkKPj4gK211bHRpYXJjaCBpbXBsZW1lbnRhdGlvbiBkb2VzIG5vdCBi
dWlsZCBhbnkgd29ya2luZyBzeW1ib2wgZHVlCj4+ICtJU0FfU0hPVUxEX0JVSUxEIG5vdCBiZWlu
ZyBldmFsdWF0ZWQgZm9yIElTX0lOKHJ0bGQpLgo+PiArCj4+ICtDaGVja2VkIG9uIHg4Nl82NC1s
aW51eC1nbnUuCj4+ICtSZXZpZXdlZC1ieTogQ2FybG9zIE8nRG9uZWxsIDxjYXJsb3NAcmVkaGF0
LmNvbT4KPj4gK1Rlc3RlZC1ieTogQ2FybG9zIE8nRG9uZWxsIDxjYXJsb3NAcmVkaGF0LmNvbT4K
Pj4gKwo+PiArKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgOWRjNGUyOWY2MzBjNmVmODI5OTEy
MGIyNzVlNTAzMzIxZGMwYzhjNykKPiAKPiBUaGlzIGlzIHByb2JhYmx5IGJldHRlciB0aGFuIG1p
bmUgc2luY2UgSSBoYWQgYXBwbGllZCBmcm9tIHBhdGNod29yayBiZWZvcmUKPiBpdCB3YXMgYXBw
bGllZCB1cHN0cmVhbS4KClllcyBtYXliZS4uLiBldmVuIGl0IGRvZXNuJ3QgY29tZSBmcm9tIHRo
ZSAyLjM2IHN0YWJsZSBicmFuY2guCkkgcmVwbGllZCBvbiB0aGUgYnVnIHJlcG9ydCwgc28gdGhl
IGNvbW1pdCBtYXkgYmUgYmFja3BvcnRlZCBzb29uLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4g
Cj4+ICtTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+
Cj4+ICstLS0KPj4gKyBzeXNkZXBzL3g4Nl82NC9tdWx0aWFyY2gvcnRsZC1zdHJjcHkuUyB8IDE4
ICsrKysrKysrKysrKysrKysrKwo+PiArIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
Cj4+ICsgY3JlYXRlIG1vZGUgMTAwNjQ0IHN5c2RlcHMveDg2XzY0L211bHRpYXJjaC9ydGxkLXN0
cmNweS5TCj4+ICsKPj4gK2RpZmYgLS1naXQgYS9zeXNkZXBzL3g4Nl82NC9tdWx0aWFyY2gvcnRs
ZC1zdHJjcHkuUyBiL3N5c2RlcHMveDg2XzY0L211bHRpYXJjaC9ydGxkLXN0cmNweS5TCj4+ICtu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiAraW5kZXggMDAwMDAwMDAwMC4uMTk0MzljNTUzZAo+PiAr
LS0tIC9kZXYvbnVsbAo+PiArKysrIGIvc3lzZGVwcy94ODZfNjQvbXVsdGlhcmNoL3J0bGQtc3Ry
Y3B5LlMKPj4gK0BAIC0wLDAgKzEsMTggQEAKPj4gKysvKiBDb3B5cmlnaHQgKEMpIDIwMjIgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCj4+ICsrICAgVGhpcyBmaWxlIGlzIHBhcnQgb2Yg
dGhlIEdOVSBDIExpYnJhcnkuCj4+ICsrCj4+ICsrICAgVGhlIEdOVSBDIExpYnJhcnkgaXMgZnJl
ZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yCj4+ICsrICAgbW9kaWZ5
IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYwo+PiAr
KyAgIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247
IGVpdGhlcgo+PiArKyAgIHZlcnNpb24gMi4xIG9mIHRoZSBMaWNlbnNlLCBvciAoYXQgeW91ciBv
cHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLgo+PiArKwo+PiArKyAgIFRoZSBHTlUgQyBMaWJyYXJ5
IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsCj4+ICsr
ICAgYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2Fy
cmFudHkgb2YKPj4gKysgICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQo+PiArKyAgIExlc3NlciBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4+ICsrCj4+ICsrICAgWW91IHNob3VsZCBoYXZlIHJl
Y2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYwo+PiArKyAgIExp
Y2Vuc2UgYWxvbmcgd2l0aCB0aGUgR05VIEMgTGlicmFyeTsgaWYgbm90LCBzZWUKPj4gKysgICA8
aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LiAgKi8KPj4gKysKPj4gKysjaW5jbHVkZSAi
Li4vc3RyY3B5LlMiCj4+ICstLQo+PiArMi4zNC4zCj4+ICsKPj4gLS0KPj4gMi4zNC4zCj4+Cj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4gaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
