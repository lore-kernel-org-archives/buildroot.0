Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F71E8B36B
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B48040B6C;
	Tue,  3 Feb 2026 22:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UnbKdZK4kgo9; Tue,  3 Feb 2026 22:05:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACC8840B79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770156347;
	bh=vMYykczl40sm0fm3xMwNE4ifJd1DHANToR8SuhWAEQA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kKbRu+rxXND0jKdZcVv2CDqnejVYE4sgfQTyV4IdKSnOjkN3Fe05LlP+lOMqVS1Re
	 JHTrPsF/tIhy/BSiKRU5gOz+v6/EFD4etr9yySYmB3LNrmn/qiHTyMS2lT3i07Fit4
	 MwtEo1klSyuZaMGWQhSDwMmKF5emxggCvdU3/DOQeOPSmFNOFrEngs7aIyXBA/cAZG
	 M3foRaig5mskyexBL4mju6usK4EDAMv2YwOHxxZSNiwfzzJZdiDyDnSjbYR4VLq69u
	 iHI6+mf9zZ79OUKI5u25hpbSqSMmTSGMmI2Ct6j95dpoDu0LvyQWzifbBxYlzI+Acp
	 PKsE3tqhYTYAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACC8840B79;
	Tue,  3 Feb 2026 22:05:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EF87613D
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D972383C04
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:05:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5zbZFuvPt34G for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:05:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FA0683C69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FA0683C69
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FA0683C69
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:05:43 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806cc07ce7so61275475e9.1
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 14:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770156341; x=1770761141;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33fI5yrVRhSmKrxFrrKdytTOkXH+4L26FWInFGHBxDg=;
 b=KQY4vq2wcXzQIlrc9M2Wno8qxhzU9boPNl8m16s/3YYhveYe40khkMAgFGgX1sYbg5
 /2cjpWGbdJPtMo4E7xfsvZDb5HKanp6TjQlBo+KaTjznLAcT435G7j/30ANMPRwR8NN1
 J7JytXnnMCq2+3RaaGDZD7FSQPLsLlvbMrleYDP5TMKQmrN2Q4A6A8BZhopceadWQ8gb
 kttcj1V6Dz2TdHwI7rEx3kpauGaOOCHuSLCqgV1hhIoZyyL98ma1GNy5afTA5JHDDIvO
 TSMh22dZI7enCNE00CuQzjT5pP94RXxPFOXKEopRcNbTj8W4fZMMuWIGDVWVdAoUv0mL
 Wxsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFGBlahYK1dfLomrLuH5HPJn/ooWTAuYBq6pO0lHNrh5GiCwiRKY2YoMqsXjKbZOcGcRyQgbrly6Q=@buildroot.org
X-Gm-Message-State: AOJu0Yxh3oEfSIq3TuY7MDBv+pMDSGXeY2KeFU6jSNfiNOh+dzvfGkKm
 8mSBXXRDuEDJLUqZaF1oofEGY3h0XpoPmm36v6tLyYiPQekexDgUhvcZ37Gh/Dd87Sw=
X-Gm-Gg: AZuq6aIbl87XhKVRtAOi70Phr/F+xfARKv5T7Zzro73/7hR2kC4B67ffDgI/uvAX4RH
 FrKfHuW5ueWFWNsnGPNZndStCfFRT+qaIXPFx6VYzkjDJg7CTdnednT7deGFtAHWo7xVqXxD7Ul
 3Se5X43khDq6MXpckkB7vcG2m374SqI9D5hmFuh5xQMLS2dYKPHah1zNfUo2g8rIKc1oMOOaHrw
 L2dkO7TRcAQbG98jHUEKs10okR7ceeW9hjh+r5eVwReaK1D+wJ1uL644HwBjgCl0QrIe48z97Bn
 +Chek0iNqCRqae9eJSyD025vkitUY3efEIfya+fuvr2fmLLqf9OosXMywPDUaTB3OhxiqRjlVu9
 3Q+XlIeu3FtfiCh/3Ue/rU4pmLdp03phfOAWrpbgn3QezwLoIHQDOtBxQz4vOsb/GfE4lF3d/gP
 wkTlPsHPQDKInMrYIs9+yVrVe8mApPCU1WESW7HBmo94M=
X-Received: by 2002:a05:600c:3542:b0:47a:935f:61a0 with SMTP id
 5b1f17b1804b1-4830e8d0d8fmr16372855e9.0.1770156340921; 
 Tue, 03 Feb 2026 14:05:40 -0800 (PST)
Received: from [192.168.24.75] (124.127.92.92.rev.sfr.net. [92.92.127.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43618058473sm1497621f8f.22.2026.02.03.14.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Feb 2026 14:05:40 -0800 (PST)
Message-ID: <27b1964b-ad7a-4a9b-9eba-b3293af79f1b@smile.fr>
Date: Tue, 3 Feb 2026 23:05:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>, "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20260203145620.806729-1-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20260203145620.806729-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770156341; x=1770761141; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=33fI5yrVRhSmKrxFrrKdytTOkXH+4L26FWInFGHBxDg=;
 b=hN7Kowc0KjxzMG9LEEt0H/8zpNSEqBCVnIRYSR0n09xL7zaIQDE/eHs0gMU/fZEsGs
 AElPVELiCwVm68zDUnQqRR9gsljfS+1baXmTRrNPIY5GmHXfvrnchFGNftL8/N5JL6Dw
 9Qo/WyjF7BNMWE5imSORkbnc8QqR8Aha/PZ4Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=hN7Kowc0
Subject: Re: [Buildroot] [PATCH 1/1] package/pico{tool,
 -sdk}: install sdk files to $(HOST_DIR)/share
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBZYW5uLCBBbGwsCgpMZSAwMy8wMi8yMDI2IMOgIDE1OjU2LCBKdWxpZW4g
T2xpdmFpbiB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gQ29tbWl0cyBbMV0gYW5kIFsyXSBh
cmUgaW5zdGFsbGluZyBob3N0IFNESyBmaWxlcwo+ICIkKEhPU1RfRElSKS91c3Ivc2hhcmUiLgo+
IAo+IGNoZWNrLXBhY2thZ2UgKHNlZSBbM10pIHJlcG9ydHMgdGhlIGVycm9yOgo+IAo+ICAgICBw
YWNrYWdlL3BpY28tc2RrL3BpY28tc2RrLm1rOjIzOiBpbnN0YWxsIGZpbGVzIHRvICQoSE9TVF9E
SVIpLyBpbnN0ZWFkIG9mICQoSE9TVF9ESVIpL3Vzci8KPiAgICAgcGFja2FnZS9waWNvLXNkay9w
aWNvLXNkay5tazoyNDogaW5zdGFsbCBmaWxlcyB0byAkKEhPU1RfRElSKS8gaW5zdGVhZCBvZiAk
KEhPU1RfRElSKS91c3IvCj4gICAgIHBhY2thZ2UvcGljb3Rvb2wvcGljb3Rvb2wubWs6MTU6IGlu
c3RhbGwgZmlsZXMgdG8gJChIT1NUX0RJUikvIGluc3RlYWQgb2YgJChIT1NUX0RJUikvdXNyLwo+
IAo+IFRoaXMgY29tbWl0IGluc3RhbGxzIHRoZSBob3N0IFNESyBmaWxlcyB0byAiJChIT1NUX0RJ
Uikvc2hhcmUiIHRvIGZpeAo+IHRoaXMgZXJyb3IuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRs
YWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy8xMjk3MDM0MTQ5OQo+IAo+IFsx
XSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvY2Vi
ODAwZDNjNjNmZTkxNjI4ZjQyY2U3NDljMjExZWJlZjI3ODYyOAo+IFsyXSBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvOTI2MzgxZDM2MDA4MmU5MjZj
YjZiZTI4Y2IxZTk3NjM5ZDI2ZWEwZgo+IFszXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290
Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMjlhMGRkNGEzMDA2YzA2ZDRiOGQ4MjgyMWJkNzRiOGI5
ZjI2NzE1YQoKSSBtaXNzZWQgeW91ciBwYXRjaCwgSSB3YXMgbm90aWZpZWQgdGhhdCB0aGUgY2hl
Y2stcGFja2FnZSBqb2Igd2FzIGZhaWxpbmcgb24KZ2l0bGFiIGFuZCB0aGF0IHdhcyBzb21ldGhp
bmcgbmV3LgoKSSdsbCByZXZlcnQgbXkgY29tbWl0IGFuZCBhcHBseSB0aGlzIG9uZS4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gT2xpdmFpbiA8anUu
b0BmcmVlLmZyPgo+IC0tLQo+ICBwYWNrYWdlL3BpY28tc2RrL3BpY28tc2RrLm1rIHwgNCArKy0t
Cj4gIHBhY2thZ2UvcGljb3Rvb2wvcGljb3Rvb2wubWsgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3BpY28tc2RrL3BpY28tc2RrLm1rIGIvcGFja2FnZS9waWNvLXNkay9waWNvLXNkay5tawo+
IGluZGV4IDViY2Y3MTY1MGQuLmRmYjI5ZDIzMjAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9waWNv
LXNkay9waWNvLXNkay5tawo+ICsrKyBiL3BhY2thZ2UvcGljby1zZGsvcGljby1zZGsubWsKPiBA
QCAtMjAsOCArMjAsOCBAQCBkZWZpbmUgUElDT19TREtfSU5TVEFMTF9TVEFHSU5HX0NNRFMKPiAg
ZW5kZWYKPiAgCj4gIGRlZmluZSBIT1NUX1BJQ09fU0RLX0lOU1RBTExfQ01EUwo+IC0JbWtkaXIg
LXAgJChIT1NUX0RJUikvdXNyL3NoYXJlL3BpY28tc2RrCj4gLQljcCAtciAkKEBEKS8qICQoSE9T
VF9ESVIpL3Vzci9zaGFyZS9waWNvLXNkawo+ICsJbWtkaXIgLXAgJChIT1NUX0RJUikvc2hhcmUv
cGljby1zZGsKPiArCWNwIC1yICQoQEQpLyogJChIT1NUX0RJUikvc2hhcmUvcGljby1zZGsKPiAg
ZW5kZWYKPiAgCj4gICQoZXZhbCAkKGdlbmVyaWMtcGFja2FnZSkpCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcGljb3Rvb2wvcGljb3Rvb2wubWsgYi9wYWNrYWdlL3BpY290b29sL3BpY290b29sLm1r
Cj4gaW5kZXggYmNhOTQ4OTY2NS4uY2Y4ZTI5NDgzNSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3Bp
Y290b29sL3BpY290b29sLm1rCj4gKysrIGIvcGFja2FnZS9waWNvdG9vbC9waWNvdG9vbC5tawo+
IEBAIC0xMiw3ICsxMiw3IEBAIFBJQ09UT09MX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLlRYVAo+
ICBQSUNPVE9PTF9DT05GX09QVFMgPSAtRFBJQ09fU0RLX1BBVEg9JChTVEFHSU5HX0RJUikvdXNy
L3NoYXJlL3BpY28tc2RrCj4gIFBJQ09UT09MX0RFUEVOREVOQ0lFUyA9IGxpYnVzYiBwaWNvLXNk
awo+ICAKPiAtSE9TVF9QSUNPVE9PTF9DT05GX09QVFMgPSAtRFBJQ09fU0RLX1BBVEg9JChIT1NU
X0RJUikvdXNyL3NoYXJlL3BpY28tc2RrCj4gK0hPU1RfUElDT1RPT0xfQ09ORl9PUFRTID0gLURQ
SUNPX1NES19QQVRIPSQoSE9TVF9ESVIpL3NoYXJlL3BpY28tc2RrCj4gIEhPU1RfUElDT1RPT0xf
REVQRU5ERU5DSUVTID0gaG9zdC1saWJ1c2IgaG9zdC1waWNvLXNkawo+ICAKPiAgJChldmFsICQo
Y21ha2UtcGFja2FnZSkpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
