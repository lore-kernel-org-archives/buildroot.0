Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C9CEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 21:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16D47403EC;
	Tue, 18 Jul 2023 21:57:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D47403EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8L3iMOOJCcz; Tue, 18 Jul 2023 21:57:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C62C3415F6;
	Tue, 18 Jul 2023 21:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C62C3415F6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CFC6B1BF8C7
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A860841497
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 21:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A860841497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q4LqXfoLL8O3 for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 21:57:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B183405B3
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2B183405B3
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 21:57:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fbc12181b6so64426365e9.2
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 14:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689717443; x=1692309443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4CzujBpRFky5DykxgaoIApU3Z+n7+PnFa4aeaawmCDk=;
 b=hXnfeLxNbpc2Ggup7dNLsc65C/sIIE53g4F28KghgW7f4mveY+1djfjcHXf1mghKsh
 jGdtfkXA6dbhot5iwYY4a2PV3F+yUIZctrBB+mmjuuaw8xWZniRhwGCWX/uAW0k5oHAW
 EFqgYDt7muwCI7Q6TLWVqz7PpcbcmHnv0ir4pUqd8uG4tQ4s+uW1dThO1VhxVl6pQ3qQ
 w3kIaI2hmIPVzQtdRmztjBarAqNazLvzGi8knCDsXelVb7N0ep1ierw4oFpmn9NEeghw
 DugGAn8nwbJGyjnPvraChvyvtrYFu+Swt1RGyIpYHD8g7ft6hhHoNpXfAptTHRCu4v2P
 Zi7g==
X-Gm-Message-State: ABy/qLbUtIzYa+8kCNXYpczGuCoQpTc4XuIyfj8oYYdctzzAVvS14vBU
 1MQ/W6Y5o8ovBeKWc0Mhk/8YhGyT6RtpvuN83GU=
X-Google-Smtp-Source: APBJJlE8ddq6gVwadeDXWGmZRBeUVZ8h6JmLJSO4myGq41rRCGlCOUDkok7ojegSdaPT5xhCcCSdww==
X-Received: by 2002:a05:600c:24e:b0:3f8:f4f3:82ec with SMTP id
 14-20020a05600c024e00b003f8f4f382ecmr3105422wmj.8.1689717443064; 
 Tue, 18 Jul 2023 14:57:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 w8-20020adfde88000000b00314329f7d8asm3446639wrl.29.2023.07.18.14.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 14:57:22 -0700 (PDT)
Message-ID: <5bc01545-1fda-3cc0-1b56-922d29b55996@smile.fr>
Date: Tue, 18 Jul 2023 23:57:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org,
 Dick Olsson <hi@senzilla.io>
References: <20230530200728.12239-1-ju.o@free.fr> <ZHicLZXBbEKasztN@debian>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <ZHicLZXBbEKasztN@debian>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1689717443; x=1692309443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4CzujBpRFky5DykxgaoIApU3Z+n7+PnFa4aeaawmCDk=;
 b=H7w4T8nStArnM65ZcuUEU7U0z1nrp0jBD31YWpnMSlr7wEdGntkOioGyFo9TeK+FYy
 0NOzDMyuB1jqorx4XaJeqrEcINQYOWaCSLIe49ZrIho2ckzD+h0oVlC/eZWdTuJNO5i6
 3lhxws6SWqE8E3QLKoNWYE0gyyq7VL1TBJ7vj95AzguGLQr1qFH1WDQoXvCr/7IeXqYH
 W7rNgB30gj40/kRmStkf8K1+cXEpZkNPk1feTKKsgOy1n1zndGkWlTfGMnPeprlBvZ2k
 PLwLk+CLqLEUQUC+ab44tN8HZmyV9w+MDFsLFQoZAKz4RZjUPe/Igx1au6MYuz2tknEi
 9LVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=H7w4T8nS
Subject: Re: [Buildroot] [PATCH 1/3] boot/edk2: bump to version
 edk2-stable202305
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

SGVsbG8gSnVsaWVuLCBWaW5jZW50LCBBbGwsCgpMZSAwMS8wNi8yMDIzIMOgIDE1OjI1LCBWaW5j
ZW50IFN0ZWhsw6kgYSDDqWNyaXTCoDoKPiBPbiBUdWUsIE1heSAzMCwgMjAyMyBhdCAxMDowNzoy
NlBNICswMjAwLCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPj4gRm9yIGNoYW5nZSBsb2cgc2luY2Ug
dmVyc2lvbiBlZGsyLXN0YWJsZTIwMjIwOCwgc2VlOgo+PiAtIGh0dHBzOi8vZ2l0aHViLmNvbS90
aWFub2NvcmUvZWRrMi9yZWxlYXNlcy90YWcvZWRrMi1zdGFibGUyMDIyMTEKPj4gLSBodHRwczov
L2dpdGh1Yi5jb20vdGlhbm9jb3JlL2VkazIvcmVsZWFzZXMvdGFnL2VkazItc3RhYmxlMjAyMzAy
Cj4+IC0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyL3JlbGVhc2VzL3RhZy9lZGsy
LXN0YWJsZTIwMjMwNQo+Pgo+PiBUaGUgbWFpbiBtb3RpdmF0aW9uIG9mIHRoaXMgYnVtcCBpcyB0
aGUgUklTQy1WIFFFTVUgVmlydCBzdXBwb3J0Cj4+IGludHJvZHVjZWQgaW4gZWRrMi1zdGFibGUy
MDIzMDIgKG5vdCB5ZXQgc3VwcG9ydGVkIGluIEJ1aWxkcm9vdCkuCj4+Cj4+IENjOiBEaWNrIE9s
c3NvbiA8aGlAc2VuemlsbGEuaW8+Cj4+IENjOiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3Rl
aGxlQGFybS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUu
ZnI+Cj4+IC0tLQo+PiBQYXRjaCBzZXJpZXMgdGVzdGVkIG9uIGJyYW5jaCBtYXN0ZXIgYXQgY29t
bWl0IGM3NjVhYzkgd2l0aCBjb21tYW5kczoKPj4KPj4gICAgIHV0aWxzL2RvY2tlci1ydW4gbWFr
ZSBjaGVjay1wYWNrYWdlCj4+ICAgICAuLi4KPj4gICAgIDAgd2FybmluZ3MgZ2VuZXJhdGVkCj4+
Cj4+ICAgICBzdXBwb3J0L3Rlc3RpbmcvcnVuLXRlc3RzIFwKPj4gICAgICAgICAtZCBkbCAtbyBv
dXRwdXRfZm9sZGVyIFwKPj4gICAgICAgICB0ZXN0cy5ib290LnRlc3RfZWRrMgo+PiAgICAgLi4u
Cj4+ICAgICBPSwo+Pgo+PiAgICAgbWFrZSBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcKPj4g
ICAgIG1ha2UKPj4gICAgIC4uLgo+PiAgICAgb3V0cHV0L2ltYWdlcy9zdGFydC1xZW11LnNoCj4+
ICAgICAuLi4KPj4gICAgIGJ1aWxkcm9vdCBsb2dpbjoKPiAKPiBIaSBKdWxpZW4sCj4gCj4gVGhh
bmtzIGZvciB0aG9zZSBwYXRjaGVzIQo+IAo+IEkgZGlkIHRlc3QgdGhlIGZvbGxvd2luZyBvbiBt
eSBzaWRlIHdpdGhvdXQgaXNzdWU6Cj4gCj4gICBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcK
PiAgIHRlc3RzLmJvb3QudGVzdF9lZGsyLlRlc3RFZGsyCj4gICB0ZXN0cy5ib290LnRlc3RfZ3J1
Yi5UZXN0R3J1YkFBcmNoNjRFRkkKPiAgIHRlc3RzLmJvb3QudGVzdF9ncnViLlRlc3RHcnViWDg2
NjRFRkkKPiAgIHRlc3RzLmJvb3QudGVzdF9ncnViLlRlc3RHcnViaTM4NkVGSQo+ICAgdGVzdHMu
ZnMudGVzdF9pc285NjYwLlRlc3RJc285NjYwR3J1YjJFRkkKPiAgIHRlc3RzLmZzLnRlc3RfaXNv
OTY2MC5UZXN0SXNvOTY2MEdydWIySHlicmlkCgpUaGFua3MgZm9yIHRlc3RpbmcgYnV0IHNvbWUg
dGVzdCBpbiBnaXRsYWItY2kgZG9lc24ndCBib290IHNpbmNlIHRoaXMgcGF0Y2ggaGFzCmJlZW4g
YXBwbGllZDoKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pv
YnMvNDY2NDg0NTg2NQpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3Qv
LS9qb2JzLzQ2NjQ4NDU4NjEKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vam9icy80NjY0ODQ1Nzc3Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2pvYnMvNDY2NDg0NTc3MwoKIlN5c3RlbUVycm9yOiBTeXN0ZW0gZG9lcyBub3Qg
Ym9vdCIKCkkgcmVwcm9kdWNlZCBsb2NhbGx5IHdpdGggInRlc3RzLmJvb3QudGVzdF9ncnViLlRl
c3RHcnViWDg2NjRFRkkiIHRoZW4gSQpyZXZlcnRlZCB0aGlzIGNvbW1pdCB0byBib290IGNvcnJl
Y3RseS4KClRoZXJlIGlzIG5vIHVzZWZ1bCBsb2csIHRoZSBpbWFnZSBqdXN0IGhhbmcuCgpDYW4g
eW91IGhhdmUgYSBsb29rPwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEZlZWwgZnJlZSB0
byBhZGQgKG9yIG5vdCk6Cj4gCj4gICBUZXN0ZWQtYnk6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2Vu
dC5zdGVobGVAYXJtLmNvbT4KCgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gVmluY2VudC4KPiAKPj4g
LS0tCj4+ICBib290L2VkazIvZWRrMi5oYXNoIHwgMiArLQo+PiAgYm9vdC9lZGsyL2VkazIubWsg
ICB8IDIgKy0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYm9vdC9lZGsyL2VkazIuaGFzaCBiL2Jvb3QvZWRrMi9l
ZGsyLmhhc2gKPj4gaW5kZXggOTRlZTIyZGRjNC4uMzRkNGIxMGUyOSAxMDA2NDQKPj4gLS0tIGEv
Ym9vdC9lZGsyL2VkazIuaGFzaAo+PiArKysgYi9ib290L2VkazIvZWRrMi5oYXNoCj4+IEBAIC0x
LDMgKzEsMyBAQAo+PiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPj4gLXNoYTI1NiAgYzEwNTIwZjI2
OTU1N2Q1NjZlMzVmZTgxMDQxNDFhYTI4NjVmOTA4NWFkMmIzYTMwYWFlOGE3ZTc4YTNjYTVhYSAg
ZWRrMi1lZGsyLXN0YWJsZTIwMjIwOC1icjEudGFyLmd6Cj4+ICtzaGEyNTYgIGNhNTUzNTE5MTNl
NjI1OGViZDhjMDgxMDZmMzY5YWM3MTA3M2Q5Y2ZhYTgwNDI3ZmM1ZjEzMWIwNmQ4MDg5NDAgIGVk
azItZWRrMi1zdGFibGUyMDIzMDUtYnIxLnRhci5nego+PiAgc2hhMjU2ICA1MGNlMjBjOWNmZGIw
ZTE5ZWUzNGZlMGE1MWZjMGFmZTk2MWY3NDM2OTdiMDY4MzU5YWIyZjg2MmI0OTRkZjgwICBMaWNl
bnNlLnR4dAo+PiBkaWZmIC0tZ2l0IGEvYm9vdC9lZGsyL2VkazIubWsgYi9ib290L2VkazIvZWRr
Mi5tawo+PiBpbmRleCBmYjZiOWEzMjgwLi4zOTliZDM0NmVmIDEwMDY0NAo+PiAtLS0gYS9ib290
L2VkazIvZWRrMi5tawo+PiArKysgYi9ib290L2VkazIvZWRrMi5tawo+PiBAQCAtNCw3ICs0LDcg
QEAKPj4gICMKPj4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4+ICAKPj4gLUVESzJfVkVSU0lP
TiA9IGVkazItc3RhYmxlMjAyMjA4Cj4+ICtFREsyX1ZFUlNJT04gPSBlZGsyLXN0YWJsZTIwMjMw
NQo+PiAgRURLMl9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3RpYW5vY29yZS9lZGsyCj4+ICBF
REsyX1NJVEVfTUVUSE9EID0gZ2l0Cj4+ICBFREsyX0xJQ0VOU0UgPSBCU0QtMi1DbGF1c2UtUGF0
ZW50Cj4+IC0tIAo+PiAyLjQwLjEKPj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
