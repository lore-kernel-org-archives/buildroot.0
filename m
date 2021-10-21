Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F4AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 19:14:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B0B60F0F
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 19:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2B0B60F0F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B57DF826FB;
	Thu, 21 Oct 2021 19:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tK18cYgQ4NW2; Thu, 21 Oct 2021 19:14:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 007F5828DD;
	Thu, 21 Oct 2021 19:14:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 372C91BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 19:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 247AD4020D
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 19:14:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rx_-FNYyhtan for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 19:14:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D002B40100
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 19:14:21 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id t16so4943120eds.9
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 12:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=1DrRrSLzka7HmTw6A1d+hfV6GLIOnVc0xemqp0J1YeQ=;
 b=LWf8ISMirNnYATqg/f/bwu+ZqqU6d6jR8eDQqrWsdeI45ajidVRyNY89Qbrmr6E0bF
 EClb4SqLEON/JZ9/+z8x7hEYMR8A3V8wqE+i2OT92n9oj/l+9b2/KQLWUWmObRqN+3Yz
 uHvlO+J5op+CE9jXs/Ay1XlwfG+KYKPgf2tEpTueISi+2DI8Pv2JbBvb6R5WM2ob22IX
 LkXHwVX2YTzZj1MZUjRJEKcS0WNrlmJlnIRLfow8udp8m1Tin6OvLjzwfOu1HQ7pt/ve
 iBZObjdlpRXriEqEaOr5Eb5qOqM5cmi+z3XdJZZ3Z28/1HCOCq9Lcg6jjpQf+M4BXPDP
 WLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:cc:organization:in-reply-to
 :content-transfer-encoding;
 bh=1DrRrSLzka7HmTw6A1d+hfV6GLIOnVc0xemqp0J1YeQ=;
 b=KuMAeRU2TaMW7Nvv29Wn09frazhE5mX2tdEkfHJdCbltaX4kCI3DQAzaE05+qsgPac
 bPEXP394Os32BAIRVcB9x9WX+9watn4DIXBBkW/kEN7ZEFVT4XYYOAtYaicudHJVdTvn
 yFJ2IeKIKrmVoWnUbIuTglwiV6XVLmoK/NKrDy9T6+uxNRGj8SmwaAfbcozWp+ERd1cK
 gl/trHBTw1JAW4tS5/hCwSl4VBYfygXZe51WXLAiLtWzWOramKe2oicWWm5TcCuwLvj/
 IwPQ0QAr22zYBd5x1AmPgx+yfx+dlnbsq32Y3JJGXjNXy2I5rQ44srqAlDlCa5jybM3E
 h6NQ==
X-Gm-Message-State: AOAM531umINLh6XfGRaMDcG6uC6a/W8paBMlpj0zfV4WsAf9EojkOJkK
 91uS44EoQ8MXs7bhz3jJ7dGMcA==
X-Google-Smtp-Source: ABdhPJz8Qv53NtQSJXAiWKNmzmXsGlYqNJPFRok0JuR0zfLz6JFW8y4JEZRoThiCXZSCpW4lR2OyxA==
X-Received: by 2002:a17:906:368e:: with SMTP id
 a14mr9043283ejc.60.1634843659955; 
 Thu, 21 Oct 2021 12:14:19 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e7sm3629231edk.3.2021.10.21.12.14.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Oct 2021 12:14:19 -0700 (PDT)
Message-ID: <5ea5ddc7-84fe-8636-1fc5-86b8d0242025@mind.be>
Date: Thu, 21 Oct 2021 21:14:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20211008212136.721533-1-thomas.petazzoni@bootlin.com>
 <20211008212136.721533-2-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211008212136.721533-2-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/pkg-stats: use the new
 'stable_versions' field of release-monitoring.org
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
Cc: Francois Perrad <fperrad@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8xMC8yMDIxIDIzOjIxLCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+IFRoZSBwa2ct
c3RhdHMgc2NyaXB0IHF1ZXJpZXMgcmVsZWFzZS1tb25pdG9yaW5nLm9yZyB0byBmaW5kIHRoZSBs
YXRlc3QKPiB1cHN0cmVhbSB2ZXJzaW9ucyBvZiBvdXIgcGFja2FnZXMuIEhvd2V2ZXIsIHVwIHVu
dGlsIHJlY2VudGx5LAo+IHJlbGVhc2UtbW9uaXRvcmluZy5vcmcgaGFkIG5vIG5vdGlvbiBvZiBz
dGFibGUKPiB2cy4gZGV2ZWxvcG1lbnQvcmVsZWFzZS1jYW5kaWRhdGUgdmVyc2lvbnMsIHNvIGZv
ciBzb21lIHBhY2thZ2VzIHRoZQo+ICJsYXRlc3QiIHZlcnNpb24gd2FzIGluIGZhY3QgYSBkZXZl
bG9wbWVudC9yZWxlYXNlLWNhbmRpZGF0ZSB2ZXJzaW9uCj4gdGhhdCB3ZSBkaWRuJ3Qgd2FudCB0
byBwYWNrYWdlIGluIEJ1aWxkcm9vdC4KPiAKPiBIb3dldmVyLCBpbiByZWNlbnQgdGltZSwgcmVs
ZWFzZS1tb25pdG9yaW5nLm9yZyBoYXMgZ2FpbmVkIHN1cHBvcnQgZm9yCj4gZGlmZmVyZW50aWF0
aW5nIHN0YWJsZSB2cy4gZGV2ZWxvcG1lbnQgcmVsZWFzZXMgb2YgdXBzdHJlYW0KPiBwcm9qZWN0
cy4gU2VlIGZvciBleGFtcGxlCj4gaHR0cHM6Ly9yZWxlYXNlLW1vbml0b3Jpbmcub3JnL3Byb2pl
Y3QvMTAwMjQvIGZvciB0aGUgZ2xpYiBsaWJyYXJ5LAo+IHdoaWNoIGhhcyBhIG51bWJlciBvZiB2
ZXJzaW9ucyBtYXJrZWQgIlByZS1yZWxlYXNlIi4KPiAKPiBUaGUgSlNPTiBibHVyYiByZXR1cm5l
ZCBieSByZWxlYXNlLW1vbml0b3Jpbmcub3JnIGhhcyAzIHJlbGV2YW50Cj4gZmllbGRzOgo+IAo+
ICAgLSAidmVyc2lvbiIsIHdoaWNoIHdlIGFyZSB1c2luZyBjdXJyZW50bHksIHdoaWNoIGlzIGEg
c3RyaW5nCj4gICAgIGNvbnRhaW5pbmcgdGhlIHJlZmVyZW5jZSBvZiB0aGUgbGF0ZXN0IHZlcnNp
b24sIGluY2x1ZGluZwo+ICAgICBwcmUtcmVsZWFzZS4KPiAKPiAgIC0gInZlcnNpb25zIiwgd2hp
Y2ggaXMgYW4gYXJyYXkgb2Ygc3RyaW5ncyBsaXN0aW5nIGFsbCB2ZXJzaW9ucywKPiAgICAgcHJl
LXJlbGVhc2Ugb3Igbm90Lgo+IAo+ICAgLSAic3RhYmxlX3ZlcnNpb25zIiwgd2hpY2ggaXMgYW4g
YXJyYXkgb2Ygc3RyaW5nIGxpc3Rpbmcgb25seQo+ICAgICBub24tcHJlLXJlbGVhc2UgdmVyc2lv
bnMuIEl0IGlzIG9yZGVyZWQgbmV3ZXN0IGZpcnN0IHRvIG9sZGVzdAo+ICAgICBsYXN0LgoKICBT
byB3ZSBjYW4gYmUgc3VyZSB0aGF0ICJzdGFibGVfdmVyc2lvbnMiIGlzIHByZXNlbnQ/IFlhbm4g
Y29tbWl0dGVkIGFuIGVhcmxpZXIgCnZlcnNpb24gYnkgRnJhbmPMp29pcyBkb2luZyB0aGUgc2Ft
ZSB0aGluZywgYnV0IGl0IGZhbGxzIGJhY2sgdG8gJ3ZlcnNpb24nIGlmIAonc3RhYmxlX3ZlcnNp
b25zJyBkb2Vzbid0IGV4aXN0LgoKPiBTbywgdGhpcyBjb21taXQgY2hhbmdlcyBmcm9tIHVzaW5n
ICd2ZXJzaW9uJyB0byB1c2luZwo+ICdzdGFibGVfdmVyc2lvbnNbMF0nLgo+IAo+IEFzIGFuIGV4
YW1wbGUsIGJlZm9yZSB0aGlzIGNoYW5nZSwgcGtnLXN0YXRzIHJlcG9ydHMgdGhhdCBuZnMtdXRp
bHMKPiBuZWVkcyB0byBiZSBidW1wZWQgdG8gMi41LjVyYzMsIHdoaWxlIGFmdGVyIHRoaXMgcGF0
Y2gsIGl0IHJlcG9ydHMKPiB0aGF0IG5mcy11dGlscyBpcyBhbHJlYWR5IGF0IDIuNS40LCBhbmQg
dGhhdCB0aGlzIGlzIHRoZSBsYXRlc3Qgc3RhYmxlCj4gdmVyc2lvbiAobW9kdWxvIGFuIGlzc3Vl
IHdoZXJlIEJ1aWxkcm9vdCBoYXMgMi41LjQgYW5kCj4gcmVsZWFzZS1tb25pdG9yaW5nLm9yZyBo
YXMgMi01LTQsIHRoaXMgd2lsbCBiZSBhZGRyZXNzZWQgc2VwYXJhdGVseSkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4K
PiAtLS0KPiBUaGlzIHNob3VsZCBiZSBiYWNrcG9ydGVkIHRvIHN0YWJsZSBicmFuY2hlcyBvZiBC
dWlsZHJvb3QsIHNvIHRoYXQgdGhlCj4gcGtnLXN0YXRzIHJlc3VsdHMgZ2VuZXJhdGVkIGZvciB0
aG9zZSBzdGFibGUgYnJhbmNoZXMgYWxzbyBiZW5lZml0Cj4gZnJvbSB0aGlzIGxvZ2ljLgo+IC0t
LQo+ICAgc3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cyB8IDYgKysrLS0tCj4gICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9z
dXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRzIGIvc3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cwo+IGlu
ZGV4IDBmMTUyMTg3M2YuLmY3YmMzMDA3NzAgMTAwNzU1Cj4gLS0tIGEvc3VwcG9ydC9zY3JpcHRz
L3BrZy1zdGF0cwo+ICsrKyBiL3N1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHMKPiBAQCAtNDg0LDcg
KzQ4NCw3IEBAIGFzeW5jIGRlZiBjaGVja19wYWNrYWdlX2dldF9sYXRlc3RfdmVyc2lvbl9ieV9k
aXN0cm8oc2Vzc2lvbiwgcGtnLCByZXRyeT1UcnVlKToKPiAgICAgICAgICAgICAgICAgICByZXR1
cm4gRmFsc2UKPiAgIAo+ICAgICAgICAgICAgICAgZGF0YSA9IGF3YWl0IHJlc3AuanNvbigpCj4g
LSAgICAgICAgICAgIHZlcnNpb24gPSBkYXRhWyd2ZXJzaW9uJ10gaWYgJ3ZlcnNpb24nIGluIGRh
dGEgZWxzZSBOb25lCj4gKyAgICAgICAgICAgIHZlcnNpb24gPSBkYXRhWydzdGFibGVfdmVyc2lv
bnMnXVswXSBpZiAnc3RhYmxlX3ZlcnNpb25zJyBpbiBkYXRhIGVsc2UgTm9uZQo+ICAgICAgICAg
ICAgICAgY2hlY2tfcGFja2FnZV9sYXRlc3RfdmVyc2lvbl9zZXRfc3RhdHVzKHBrZywKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSTV9BUElf
U1RBVFVTX0ZPVU5EX0JZX0RJU1RSTywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB2ZXJzaW9uLAo+IEBAIC01MDcsMTMgKzUwNywxMyBAQCBh
c3luYyBkZWYgY2hlY2tfcGFja2FnZV9nZXRfbGF0ZXN0X3ZlcnNpb25fYnlfZ3Vlc3Moc2Vzc2lv
biwgcGtnLCByZXRyeT1UcnVlKToKPiAgIAo+ICAgICAgICAgICAgICAgZGF0YSA9IGF3YWl0IHJl
c3AuanNvbigpCj4gICAgICAgICAgICAgICAjIGZpbHRlciBwcm9qZWN0cyB0aGF0IGhhdmUgdGhl
IHJpZ2h0IG5hbWUgYW5kIGEgdmVyc2lvbiBkZWZpbmVkCj4gLSAgICAgICAgICAgIHByb2plY3Rz
ID0gW3AgZm9yIHAgaW4gZGF0YVsncHJvamVjdHMnXSBpZiBwWyduYW1lJ10gPT0gcGtnLm5hbWUg
YW5kICd2ZXJzaW9uJyBpbiBwXQo+ICsgICAgICAgICAgICBwcm9qZWN0cyA9IFtwIGZvciBwIGlu
IGRhdGFbJ3Byb2plY3RzJ10gaWYgcFsnbmFtZSddID09IHBrZy5uYW1lIGFuZCAnc3RhYmxlX3Zl
cnNpb25zJyBpbiBwXQoKICBGcmFuY8ynb2lzJyBwYXRjaCBkb2Vzbid0IGhhdmUgdGhpcywgc28g
SSBhcHBsaWVkIHRoaXMgcGFydCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgQFBldGVyIGJvdGggRnJh
bmPMp29pcycgY29tbWl0IGFuZCB0aGlzIG9uZSBoYXZlIHRvIGJlIGFwcGxpZWQgdG8gc3RhYmxl
LgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAgICAgICAgICAgICAgIHByb2plY3RzLnNvcnQoa2V5
PWxhbWJkYSB4OiB4WydpZCddKQo+ICAgCj4gICAgICAgICAgICAgICBpZiBsZW4ocHJvamVjdHMp
ID4gMDoKPiAgICAgICAgICAgICAgICAgICBjaGVja19wYWNrYWdlX2xhdGVzdF92ZXJzaW9uX3Nl
dF9zdGF0dXMocGtnLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBSTV9BUElfU1RBVFVTX0ZPVU5EX0JZX1BBVFRFUk4sCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJvamVj
dHNbMF1bJ3ZlcnNpb24nXSwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwcm9qZWN0c1swXVsnc3RhYmxlX3ZlcnNpb25zJ11bMF0sCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHByb2plY3RzWzBdWydpZCddKQo+ICAgICAgICAgICAgICAgICAgIHJldHVybiBUcnVlCj4gICAK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
