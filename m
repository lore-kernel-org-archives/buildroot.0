Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8531EC3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 20:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F19416DC;
	Fri, 12 Jul 2024 20:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXX_dodD1X6W; Fri, 12 Jul 2024 20:09:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6FBC4174F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6FBC4174F;
	Fri, 12 Jul 2024 20:09:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 341641BF420
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AE98811FE
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 20:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQ4H-MbSD1SR for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 20:09:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 02AE8811EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02AE8811EA
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02AE8811EA
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 20:09:25 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4279ca8af51so11200115e9.3
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 13:09:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720814964; x=1721419764;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vj0pVrpkcMRiYmdPUokUAEgiFWDk0a3ZW72Gld5Sm0w=;
 b=qfiZOR0g1meRIxflq6M1hZ2mcm7H6/y45D/XA15xcAq2VVC6JoETS5Awz+H9KPimZb
 5iPUI2lm0ZGB2K1vLFXKj1lZ0+JuAHbGMdM10dxKdOvAgpwFZvzYsey8LFfhLN84zjWT
 MIJQGgPfTy/fQVOmKDN8XSHuPtDSXap9z8qtC8885o5Y2bF1lS1mYc61BGvw40ipb06a
 gqrvYc6VFiOZlpwCkLsRX1SsPmFzn+DKC0xzgTh1WQrakmxy6O7y+1qvQrD+o8+nrliE
 hFNSvNE6vzBM8cwmaAE3U3M1GD0nzo9qNP7msbR08NHY2B8mdyAuMeRdA7KNMFVlfioo
 sKjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWliUfCO1fU/FWXdHmB74N4UFcS0qPNOKlHqfDHD1CY7ftWkiSdRuRdMQC1icpMzGchl8gcc0OqniX2pb4BCGAqFmCoRxipqA==
X-Gm-Message-State: AOJu0YzIWXCvwq21DgrJNLMqF95KTKQeMaO82sPf3iSOoPBP88hDyy59
 WCiTT6oNf5nkfA+zoaqyBRYXLWktJO1bOh0vchaoE8ZgsL0rcdplFzB/YYguecw=
X-Google-Smtp-Source: AGHT+IFqG/frm0Ni0jcxZqYWK5tYRbsb5VJpjTbgX7WfBevL7dILjHmwxU4WjSPpSpSDA2curquQqQ==
X-Received: by 2002:a05:600c:70a:b0:426:6320:226a with SMTP id
 5b1f17b1804b1-426707db6f3mr88020385e9.15.1720814963739; 
 Fri, 12 Jul 2024 13:09:23 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f23999csm33053455e9.8.2024.07.12.13.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 13:09:23 -0700 (PDT)
Message-ID: <e4d313ed-5a98-4acb-87d4-0267f618708c@smile.fr>
Date: Fri, 12 Jul 2024 22:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240707163329.306725-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20240707163329.306725-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720814964; x=1721419764; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vj0pVrpkcMRiYmdPUokUAEgiFWDk0a3ZW72Gld5Sm0w=;
 b=Lm9cSyPv+6JUw1FBOXQa+Qz3Fse/RU9kKbU2rkUKvv/02hkbWndC74TSHmzEV2/6f5
 JmcCrmVuvy2ca+PaZxsnUDsUNGuYC1ZqonuXX51FjVCTOWMJMsWqG9/XgyEmYaulI+6W
 tqWzYcxF1o2cJ7Vvqv2A1sLUJesmt6g7FWXFU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Lm9cSyPv
Subject: Re: [Buildroot] [PATCH 1/1]
 package/x11r7/xdriver_xf86-video-mach64: fix patch fuzz
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwNy8wNy8yMDI0IMOgIDE4OjMzLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IENvbW1pdCA4Zjg4YTY0NGVkN2Q2ICgic3VwcG9ydC9zY3JpcHRzL2FwcGx5LXBh
dGNoZXMuc2g6IHNldCB0aGUgbWF4aW11bQo+IGZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRo
ZSBmdXp6IGZhY3Rvci4KPiAKPiBEdWUgdG8gdGhpcyBjaGFuZ2UsIHhkcml2ZXJfeGY4Ni12aWRl
by1tYWNoNjQgZmFpbHMgdG8gYnVpbGQgd2l0aCBvdXRwdXQ6Cj4gCj4gICAgIEFwcGx5aW5nIDAw
MDEtY3Jvc3MtY29tcGlsZS5wYXRjaCB1c2luZyBwYXRjaDoKPiAgICAgcGF0Y2hpbmcgZmlsZSBj
b25maWd1cmUuYWMKPiAgICAgSHVuayAjMSBGQUlMRUQgYXQgODUuCj4gICAgIDEgb3V0IG9mIDEg
aHVuayBGQUlMRUQgLS0gc2F2aW5nIHJlamVjdHMgdG8gZmlsZSBjb25maWd1cmUuYWMucmVqCj4g
Cj4gVGhpcyBjb21taXQgcmVmcmVzaGVzIHRoZSBwYWNrYWdlIHBhdGNoIG9uIHRoZSBjdXJyZW50
IHBhY2thZ2UgdmVyc2lvbi4KCklmIHRoZSB1cHN0cmVhbSByZXBvIHVzZSBnaXQsIGl0IHdvdWxk
IGJlIGdyZWF0IHRvIGNvbnZlcnQgdG8gZ2l0IGZvcm1hdC1wYXRjaAppbnN0ZWFkIG9mIGRpZmYu
Cgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFy
dWxhc29sdXRpb25zLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2Fy
ZHMsClJvbWFpbgoKCj4gLS0tCj4gIC5jaGVja3BhY2thZ2VpZ25vcmUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQo+ICAuLi4veGRyaXZlcl94Zjg2LXZpZGVv
LW1hY2g2NC8wMDAxLWNyb3NzLWNvbXBpbGUucGF0Y2ggICAgICB8IDYgKysrKy0tCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS8uY2hlY2twYWNrYWdlaWdub3JlIGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+IGluZGV4IDBh
MWQyNjI3NDU1ZS4uNjMxNzQ1OTBkNDQ2IDEwMDY0NAo+IC0tLSBhLy5jaGVja3BhY2thZ2VpZ25v
cmUKPiArKysgYi8uY2hlY2twYWNrYWdlaWdub3JlCj4gQEAgLTE1NTgsNyArMTU1OCw3IEBAIHBh
Y2thZ2UveDExcjcveGRyaXZlcl94Zjg2LXZpZGVvLWlteC8wMDAzLXN1cHBvcnQtZ2xpYmMtMi4y
MC5wYXRjaCBsaWJfcGF0Y2guVXBzCj4gIHBhY2thZ2UveDExcjcveGRyaXZlcl94Zjg2LXZpZGVv
LWlteC8wMDA0LU1ha2UtdmlkZW8tQVBJLWZvcndhcmQtYW5kLWJhY2t3YXJkLWNvbXBhdGlibGUu
cGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gIHBhY2thZ2UveDExcjcveGRyaXZlcl94Zjg2LXZp
ZGVvLWlteC8wMDA1LXhmODYtdmlkZW8taW14ZmItZml4LW00LWhhcmRjb2RkZWQtcGF0aHMucGF0
Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4gIHBhY2thZ2UveDExcjcveGRyaXZlcl94Zjg2LXZpZGVv
LWlteC8wMDA2LXhzZXJ2ZXItMS4xNC1jb21wYXQucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCj4g
LXBhY2thZ2UveDExcjcveGRyaXZlcl94Zjg2LXZpZGVvLW1hY2g2NC8wMDAxLWNyb3NzLWNvbXBp
bGUucGF0Y2ggbGliX3BhdGNoLlNvYiBsaWJfcGF0Y2guVXBzdHJlYW0KPiArcGFja2FnZS94MTFy
Ny94ZHJpdmVyX3hmODYtdmlkZW8tbWFjaDY0LzAwMDEtY3Jvc3MtY29tcGlsZS5wYXRjaCBsaWJf
cGF0Y2guVXBzdHJlYW0KPiAgcGFja2FnZS94MTFyNy94ZHJpdmVyX3hmODYtdmlkZW8tbm91dmVh
dS8wMDAxLW5vdXZlYXUtZml4dXAtZHJpdmVyLWZvci1uZXctWC1zZXJ2ZXItQUJJLnBhdGNoIGxp
Yl9wYXRjaC5VcHN0cmVhbQo+ICBwYWNrYWdlL3gxMXI3L3hkcml2ZXJfeGY4Ni12aWRlby10ZGZ4
LzAwMDEtY3Jvc3MucGF0Y2ggbGliX3BhdGNoLlNvYiBsaWJfcGF0Y2guVXBzdHJlYW0KPiAgcGFj
a2FnZS94MTFyNy94c2VydmVyX3hvcmctc2VydmVyLzAwMDEtaW5jbHVkZS1taXNjLmgtZml4LXVD
bGliYy1idWlsZC5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS94MTFyNy94ZHJpdmVyX3hmODYtdmlkZW8tbWFjaDY0LzAwMDEtY3Jvc3MtY29tcGlsZS5wYXRj
aCBiL3BhY2thZ2UveDExcjcveGRyaXZlcl94Zjg2LXZpZGVvLW1hY2g2NC8wMDAxLWNyb3NzLWNv
bXBpbGUucGF0Y2gKPiBpbmRleCBkMjc2MTc2MDZlYWMuLjAyZDM0Y2U5ZmMzYiAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL3gxMXI3L3hkcml2ZXJfeGY4Ni12aWRlby1tYWNoNjQvMDAwMS1jcm9zcy1j
b21waWxlLnBhdGNoCj4gKysrIGIvcGFja2FnZS94MTFyNy94ZHJpdmVyX3hmODYtdmlkZW8tbWFj
aDY0LzAwMDEtY3Jvc3MtY29tcGlsZS5wYXRjaAo+IEBAIC0xLDcgKzEsOSBAQAo+ICtbRGFyaW86
IG1ha2UgdGhlIHBhdGNoIHRvIGJlIGFwcGxpZWQgd2l0aCBmdXp6IGZhY3RvciAwXQo+ICtTaWdu
ZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20+Cj4gIC0tLSBhL2NvbmZpZ3VyZS5hYwkyMDA4LTA2LTIzIDEwOjM5OjI4LjAwMDAwMDAw
MCAtMDQwMAo+ICArKysgYi9jb25maWd1cmUuYWMJMjAwOC0wNi0yMyAxMDo0MDo0Ni4wMDAwMDAw
MDAgLTA0MDAKPiAtQEAgLTg1LDE0ICs4NSwyMCBAQCBzZGtkaXI9JChwa2ctY29uZmlnIC0tdmFy
aWFibGU9c2RrZGlyIHhvCj4gLSBBQ19IRUFERVJfU1REQwo+ICtAQCAtODAsMTQgKzgwLDIwIEBA
Cj4gKyAjIENoZWNrcyBmb3IgbGlicmFyaWVzLgo+ICAgCj4gICBpZiB0ZXN0ICIkRFJJIiAhPSBu
bzsgdGhlbgo+ICAtCUFDX0NIRUNLX0ZJTEUoWyR7c2RrZGlyfS9kcmkuaF0sCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
