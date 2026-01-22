Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA1FD3EE9C
	for <buildroot@archiver.kernel.org>; Thu, 22 Jan 2026 17:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD7726065D;
	Thu, 22 Jan 2026 17:21:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UWmQ_pmW3Wjg; Thu, 22 Jan 2026 17:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5FB560649
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769102479;
	bh=VYHH06tzfTHzGidXqNb9MD47jvv7xEPXcP+eoreJogA=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHkIuIoK4ztgKTtcMi57EuShI61iqEgrZDvhr0yt1cBgzT+kYRKKqR8JM2k+kUPhA
	 BSfUmGHPRSUhwm+ODnboj14tPpEe69qHvK3LY+VsTkUMstkissN8zvLm5AV1zrnPN3
	 mVb5xwn+NOV5KkEDvivozViTdGUxwZA8NnYyWMnhBQ6YzAACL/U84lfCKJNdmQScvN
	 rGRLCPcHBPtdzu7pcZ0CCa1K8PoerTRism6pjvVofuJYs8/KKHJGttOjKTCa0JjrLk
	 XlVAJulsQqkotSeNK68co+0VEkhnMlgnig/DHJEeOx1NVHMaZCjOgsoKJKLWKPKhCU
	 4inPTp98C/jOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5FB560649;
	Thu, 22 Jan 2026 17:21:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EBB34DF
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 17:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E89F260649
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 17:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id trZqhStiftIl for <buildroot@buildroot.org>;
 Thu, 22 Jan 2026 17:21:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EBC9B60655
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBC9B60655
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EBC9B60655
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 17:21:17 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-81f4c0e2b42so732694b3a.1
 for <buildroot@buildroot.org>; Thu, 22 Jan 2026 09:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769102477; cv=none;
 d=google.com; s=arc-20240605;
 b=dWmKVl8lLqsiF652aRnC5iF6GH9c8mIR92AWo90ZAwAgzJ+BTa2uxCt24fsoV53D+I
 s/P/w5e1QI2jymrBknR4J66dfxSJRhs6KjqhRXkQmUDmbzLkKy7Hh6eDvev+F6zXeOYj
 0Cs5pWtkcVW++AwA/i18URwQjnbP2ADZsxBx19+HlGsqNmj8AAcSl/IOARo4Max8/xWG
 GdxVJkK0f58P527qrWvqnZrG6sTVXl26KKrxZ4gQqoDSXBO4vVBpvghTQ0Pde/aiQGUd
 rKu4r52Yi1AeVDsqupqiIKr/VW4Y8MGoz1gbXPEj+Lv1oElDqvVIhZyRhxmUO/29+52M
 PuzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=sDZoNLxYNslGgeGPFfOSKEUH7a16JND/ZcGF11xxZCg=;
 fh=siEEGlK4OxgQsxxDJxK74FwhxxtTUd9xjx4ss01wdDI=;
 b=CUmKW6AdDrtWZSTstbPx1dd2zdI81z2x4C/cqfWSNN7mK2hXY7sYbV2Udlqk8wW2Ar
 wyxDcJ3uB1En6sU2rAosT6Y69aj0my65DQ385W06LwX807srFzY4GAnXso8XNS8Urk8A
 ukRfmijUBFGficOAstZS7w16XmbN1heiB/HgsCUQG+KNUaOt5H6loehROfZ4H6B4uLKl
 GIVEk3bODEGkIEFcDY03mPc3JaMUqw1W02n5XUTR2oi8XqA2R1gHqieBYX0WFWkyzU0f
 GOk4WQUTdXZiGIpO3OCFpeZDWf/DKApVmT+A2utsJj7fc2JzF+NJvs1qxOc5o6dMfxFF
 P+QA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769102477; x=1769707277;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sDZoNLxYNslGgeGPFfOSKEUH7a16JND/ZcGF11xxZCg=;
 b=iWwnH/mfEa6Qaw/WtuZuE34LtbxjD59iq4mNZLA1zZuwB2boUwwxuwLwFqhcG/yCNv
 qdBftVnnBX9YePd1TS5Pa92ZP871hfMe/aDhcQY8fqS3ieW4/Avsd4CHEM/nP9Aeuge9
 0Lsjs96VIYtNFBTvGYY1bfEJ40HDamTYEhEyt9DSRAWcR6kvehW/stoVWyWH81UVIypQ
 63ReBqSeADP/zEMXoPkd7y+02T+RLNwPhfXv4d0euoFfvBu2321fs45MxkqzS7wV/2fH
 ZQV+qzvcntd1Bmo/JHK9OP/VBF3B0CBJytKCfYB9fa5WkPrsQ/eVDnqleo+cBiQ30p1/
 NP/A==
X-Gm-Message-State: AOJu0YxIi3KEFiPHk9WiyegfxE1LYpxP2gOi33+2kZgPk61LD0CoIwQX
 g3lONS045ihwHfu3dX8WoWPOsyXPjPdesu5gK9rYMYrbHRjWdKZPmFDmGM1YkbbRLW+Ew1iMo/Y
 w0AURtgIaqZKrfy6Zy7aFWDSJgdGfbIU=
X-Gm-Gg: AZuq6aI3NRw6vbpCjGy/r9Z+uA7BNmqWCvvdK2XpNhw8vtU25JjAiuAXK4cj5dlkgLO
 LbACN2TksOs/JXIkr2+TS/5gFsrgC5Zqf62OmjDF1vRCWHzdO/OA0+T2f6ZcsgQsDPtfmNwOw5z
 rTsPmzOwaWV8hdUcPABzTukN/ki1bHrIXy7ayyaLIjVMkIGYt/VO48jwigZkDMw1SxJVkoWS8w4
 V7hoIiHRjOfpm9bLNj/4vMgOkZjalbrfhk+IrXbzMv39Slk5cVwiHDIef36Wq4s6beVQ1BtaK7M
 Y5PzUYVpCpOZwzlIiuPOsBK+Lm3kAg==
X-Received: by 2002:a05:6a00:4c8a:b0:7b9:ef46:ec61 with SMTP id
 d2e1a72fcca58-82317d1e386mr52583b3a.26.1769102476952; Thu, 22 Jan 2026
 09:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20260117103109.12198-1-ju.o@free.fr>
In-Reply-To: <20260117103109.12198-1-ju.o@free.fr>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 22 Jan 2026 13:21:05 -0400
X-Gm-Features: AZwV_QgrjKjdGWcuNFY6fphNPXl5HK_snZxEKAn0fRBl6aNLtoflIdPUV0_Q520
Message-ID: <CAKcgs2y4jSDFw-b9-LrdUK3MAcM9unxSd+br7TNz8urkQedXRw@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769102477; x=1769707277; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDZoNLxYNslGgeGPFfOSKEUH7a16JND/ZcGF11xxZCg=;
 b=Y9p4UOpJkuVHv+t62JhrwWhrg3eG0dzAqVDMGvcZ5YDZjM2HTW2GY1mGcDq9Ah0X8N
 wI6lelquhrJl0o5WvjIPS267kfHUuetHb3WGm+3NyFZxuGCYqbPxvJ8pUdsxs5boDdhc
 yNMa9v1QoY/AG9j/CoeMSJr7LGYyMwnCGF2IWji2pqGymrgHmUFD7o2LNpkgDkDD1bC0
 MdHEGzfklCSxsTZzStYxAeebgf//ZsVsM0tsYxfXrhuGvM85utf8452WdFxnHgMt7en1
 HmRXgKMB46qzzNud7pHnqadsjrN6rJoIz3qBHZvt4cA+Na9ZuU5MqBYbVBT18etCOERf
 l96Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Y9p4UOpJ
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cmake.mk: add
 Platform/Buildroot-Initialize.cmake
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLCBhbGwsCgpMZSBzYW0uIDE3IGphbnYuIDIwMjYgw6AgMDY6MzIsIEp1bGllbiBP
bGl2YWluIDxqdS5vQGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IFNpbmNlIGNvbW1pdCBbMV0gKGNv
cmUvcGtnLWNtYWtlOiBwcm92aWRlIG91ciBvd24gcGxhdGZvcm0KPiBkZXNjcmlwdGlvbiksIEJ1
aWxkcm9vdCBpcyBzZXR0aW5nIGl0cyBvd24gQ01ha2UgcGxhdGZvcm0KPiBkZXNjcmlwdGlvbi4g
VGhpcyBkZXNjcmlwdGlvbiBhcHBsaWVzIG1pbm9yIGNoYW5nZXMgb24gdG9wIG9mCj4gdGhlIENN
YWtlIExpbnV4IHBsYXRmb3JtLCBzZWUgWzJdIGFuZCBbM10uIFRoZSBDTWFrZSBzeXN0ZW0gc3Bl
Y2lmaWMKPiBzY3JpcHQgdHJpZXMgdG8gaW5jbHVkZSBhbiBpbml0aWFsaXphdGlvbiBzY3JpcHQs
IGlmIHByZXNlbnQuCj4gU2VlIFs0XS4KPgo+IFNpbmNlIGluIGNvbW1pdCBbMV0gd2Ugc2V0IHRo
ZSBDTUFLRV9TWVNURU1fTkFNRSB0byAiQnVpbGRyb290Igo+IChyYXRoZXIgdGhhbiAiTGludXgi
KSwgQ01ha2Ugd2lsbCBzZWFyY2ggZm9yIGEKPiAiUGxhdGZvcm0vQnVpbGRyb290LUluaXRpYWxp
emUuY21ha2UiIHdoaWNoIGRvZXMgbm90IGV4aXN0LCBhbmQKPiBjb250aW51ZSBub3JtYWxseSwg
c2luY2UgdGhlIGluY2x1ZGUgaXMgb3B0aW9uYWwuCj4KPiBUaGUgIlBsYXRmb3JtL0xpbnV4LUlu
aXRpYWxpemUuY21ha2UiIGZpbGUgaXMgdGhlIG9uZSBzZXR0aW5nIHRoZQo+IExJTlVYIFs2XSBh
bmQgVU5JWCBbN10gdmFyaWFibGVzLCB3aGljaCBhcmUgZXhwZWN0ZWQgdG8gYmUgdHJ1ZSBvbgo+
IGEgbGludXggY29tcGF0aWJsZSBzeXN0ZW0uIEluIEJ1aWxkcm9vdCwgaXQgaXMgY3VycmVudGx5
IG5vdAo+IGluY2x1ZGVkLCBzbyB0aG9zZSB2YXJpYWJsZXMgYXJlIHVuc2V0Lgo+Cj4gSWYgYSBD
TWFrZSBwYWNrYWdlIGluIEJ1aWxkcm9vdCBoYXMgYSBjb25zdHJ1Y3Qgc3VjaCBhczoKPgo+ICAg
ICBpZihMSU5VWCkKPiAgICAgICAgICMgLi4uZG8gdGhpbmdzLi4uCj4gICAgIGVsc2UoKQo+ICAg
ICAgICAgbWVzc2FnZShGQVRBTF9FUlJPUiAiU3lzdGVtIG5vdCBzdXBwb3J0ZWQiKQo+ICAgICBl
bmRpZigpCj4KPiBJdCB3aWxsIGZhaWwgYXQgY29uZmlndXJhdGlvbiB0aW1lLgo+Cj4gVGhpcyBz
aXR1YXRpb24gaGFwcGVuZWQgd2hlbiB0cnlpbmcgdG8gYWRkIHRoZSBidG9wKysgcGFja2FnZQo+
IGluIEJ1aWxkcm9vdC4gU2VlIFs4XS4KPgo+IFNpbmNlIHRoZSBpbml0aWFsIGludGVudCBvZiBj
b21taXQgWzFdIHdhcyB0byBtYWtlIHRoZSBCdWlsZHJvb3QKPiBDTWFrZSBzeXN0ZW0gaW5oZXJp
dCBmcm9tIExpbnV4IHBsdXMgc29tZSBmaXh1cHMsIHRoaXMgY29tbWl0IHNpbXBseQo+IGFkZHMg
YSBCdWlsZHJvb3QtSW5pdGlhbGl6ZS5jbWFrZSBmaWxlIHRoYXQgaW5jbHVkZXMgdGhlCj4gTGlu
dXgtSW5pdGlhbGl6ZS5jbWFrZSBvbmUgZnJvbSBDTWFrZS4gVGhpcyB3aWxsIGhhdmUgdGhlIGVm
ZmVjdAo+IHRvIHByb3Blcmx5IGRlZmluZSB0aGUgTElOVVggYW5kIFVOSVggdmFyaWFibGVzLgo+
Cj4gWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1p
dC9jNjliMTRmZTJmNzJkODEzNDA1N2IxMTU4ODRjMDRhMmJmMjdkNDEwCj4gWzJdIGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNS4xMS9zdXBwb3J0
L21pc2MvQnVpbGRyb290LmNtYWtlI0wxLTQKPiBbM10gaHR0cHM6Ly9jbWFrZS5vcmcvY21ha2Uv
aGVscC92NC4yL3ZhcmlhYmxlL0NNQUtFX1NZU1RFTV9OQU1FLmh0bWwKPiBbNF0gaHR0cHM6Ly9n
aXRsYWIua2l0d2FyZS5jb20vY21ha2UvY21ha2UvLS9ibG9iL3Y0LjIuMS9Nb2R1bGVzL0NNYWtl
U3lzdGVtU3BlY2lmaWNJbml0aWFsaXplLmNtYWtlI0wzNQo+IFs1XSBodHRwczovL2dpdGxhYi5r
aXR3YXJlLmNvbS9jbWFrZS9jbWFrZS8tL2Jsb2IvdjQuMi4xL01vZHVsZXMvUGxhdGZvcm0vTGlu
dXgtSW5pdGlhbGl6ZS5jbWFrZQo+IFs2XSBodHRwczovL2NtYWtlLm9yZy9jbWFrZS9oZWxwL3Y0
LjIvdmFyaWFibGUvTElOVVguaHRtbAo+IFs3XSBodHRwczovL2NtYWtlLm9yZy9jbWFrZS9oZWxw
L3Y0LjIvdmFyaWFibGUvVU5JWC5odG1sCj4gWzhdIGh0dHBzOi8vZ2l0aHViLmNvbS9hcmlzdG9j
cmF0b3MvYnRvcC9ibG9iL3YxLjQuNi9DTWFrZUxpc3RzLnR4dCNMNzYKPgo+IFJlcG9ydGVkLWJ5
OiBHaWxsZXMgVGFsaXMgPGdpbGxlcy50YWxpc0BnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
SnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPiAtLS0KPiAgcGFja2FnZS9wa2ctY21ha2Uu
bWsgICAgICAgICAgICAgICAgICAgIHwgMiArKwo+ICBzdXBwb3J0L21pc2MvQnVpbGRyb290LUlu
aXRpYWxpemUuY21ha2UgfCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvbWlzYy9CdWlsZHJvb3QtSW5pdGlhbGl6ZS5j
bWFrZQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGtnLWNtYWtlLm1rIGIvcGFja2FnZS9wa2ct
Y21ha2UubWsKPiBpbmRleCBiYTI4N2QyNDRhLi5mNTcyYmRlYmIzIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvcGtnLWNtYWtlLm1rCj4gKysrIGIvcGFja2FnZS9wa2ctY21ha2UubWsKPiBAQCAtMjg3
LDYgKzI4Nyw4IEBAIGRlZmluZSBUT09MQ0hBSU5fQ01BS0VfSU5TVEFMTF9GSUxFUwo+ICAgICAg
ICAgICAgICAgICA+ICQoSE9TVF9ESVIpL3NoYXJlL2J1aWxkcm9vdC90b29sY2hhaW5maWxlLmNt
YWtlCj4gICAgICAgICAkKFEpJChJTlNUQUxMKSAtRCAtbSAwNjQ0IHN1cHBvcnQvbWlzYy9CdWls
ZHJvb3QuY21ha2UgXAo+ICAgICAgICAgICAgICAgICAkKEhPU1RfRElSKS9zaGFyZS9idWlsZHJv
b3QvUGxhdGZvcm0vQnVpbGRyb290LmNtYWtlCj4gKyAgICAgICAkKFEpJChJTlNUQUxMKSAtRCAt
bSAwNjQ0IHN1cHBvcnQvbWlzYy9CdWlsZHJvb3QtSW5pdGlhbGl6ZS5jbWFrZSBcCj4gKyAgICAg
ICAgICAgICAgICQoSE9TVF9ESVIpL3NoYXJlL2J1aWxkcm9vdC9QbGF0Zm9ybS9CdWlsZHJvb3Qt
SW5pdGlhbGl6ZS5jbWFrZQo+ICBlbmRlZgo+Cj4gIFRPT0xDSEFJTl9QT1NUX0lOU1RBTExfU1RB
R0lOR19IT09LUyArPSBUT09MQ0hBSU5fQ01BS0VfSU5TVEFMTF9GSUxFUwo+IGRpZmYgLS1naXQg
YS9zdXBwb3J0L21pc2MvQnVpbGRyb290LUluaXRpYWxpemUuY21ha2UgYi9zdXBwb3J0L21pc2Mv
QnVpbGRyb290LUluaXRpYWxpemUuY21ha2UKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4
IDAwMDAwMDAwMDAuLjM0NTE1NjJmMDgKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3VwcG9ydC9t
aXNjL0J1aWxkcm9vdC1Jbml0aWFsaXplLmNtYWtlCj4gQEAgLTAsMCArMSBAQAo+ICtpbmNsdWRl
KFBsYXRmb3JtL0xpbnV4LUluaXRpYWxpemUpCj4gLS0KPiAyLjUyLjAKPgpUaGFua3MgZm9yIHRo
ZSBwYXRjaC4KSSBjb3VsZCBzdWNjZXNzZnVsbHkgYnVpbGQgYnRvcCsrIGFmdGVyIEkgYXBwbGll
ZCBpdC4gU286CgpUZXN0ZWQtYnk6IEdpbGxlcyBUYWxpcyA8Z2lsbGVzLnRhbGlzQGdtYWlsLmNv
bT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
