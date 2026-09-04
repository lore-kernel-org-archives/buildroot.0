Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB988C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B28B060BCB;
	Fri,  4 Sep 2026 12:20:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfFW0JcUVPqS; Fri,  4 Sep 2026 12:20:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B631160C15
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524410;
	b=iEA+jdoewsIvCv8y8WXBinkDg5dYopqTpoI4BgsM33YbXIwKqJrXgdCNXdCkilh1W42U
	 vYrN0l08gYp7FmikrQZaRksEC1/80C5bbLapXJpHtPPmaYyKUidp6EkBZZ0nLh4aqFWxc
	 SysKc1IJuXs//BbhOG8lX1/VohAt+xOES6Q+E6NPtzi4LhnjbIG+GjQsaJsC6stQTHQvJ
	 hD75tU9Sh9sL+2crL3vuEOfL++buMO0amqNzY7B7Euac7rCWXX/1bts6laSXd7njf+rl4
	 QZJUH++7en1Iqo5tAVR4HhibUlVvUKc4K8aU+FMs0EC/2mqFw4rfXIzAHCaweZlBO+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524410;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZNIz9B5gHQJ4NtNoLJxQMVDE4H60OnuRJsCRwUD25MY=;
	b=pnkkr6/emJQVCWf4yxesJJosmQAmgBWV7SC2wmv9Ne4MjqwAQ+DYusp2g95oPQVwAgqH
	 WAj9Lw8MsgCmoNq2JiESoIDjl7Qn0NUEzHZOZGDCx+Uj4s8YUTIR81jJPV3DeBU5e3MvT
	 4sqX8VbHIEChzTVB1la4hfJlIMRzL+VDw8QyhxJ04uV887EHVhBS3B4SPYirQYnIno8wD
	 hP9CjirkvhmRzmtPCFlnO5gcJgzWVWoGyCzLRnh6af3O7WuHgEb9eRsEIAi/+lwX2PZNg
	 zXZRDRZgiT14LN6i2Pm2zVFeJ1LocyGSd+XLMcxUj1Mt+g0OPEj4htuKq+cc3grWhyA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524410;
	bh=ZNIz9B5gHQJ4NtNoLJxQMVDE4H60OnuRJsCRwUD25MY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iIVXqTwOqPIZpIypQfJQrIdNHbD9XLxJPo6oQGKRaE2LVywZ2jv/ve1Y3nrsDSRXK
	 /VD4aVAKUGHRPW3utHuDmUB3CaWlErgG8HAXFkI9FjpBeX/7cDg8pMKPrkz5iapvcA
	 dUFY6PU7cubjSQM7Axs9Rx5G6eHhQ0fQmWcKry5LAVlZeMfL3jrW7hl7LUXZFPGvlm
	 ytxsHn3V6ILkPXuej5ZpUnGQEJgTVKWOmDVFdk3pMNZgLWwqACvcGmwoq0H6gCJ9pt
	 zKHo4xGhhR6/rzfz7rY+mz8OCQ1CfkUxJUx/0zOXMM6USBXSsnahi+t31y8pFmfooA
	 ENlWhemm0gTUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B631160C15;
	Fri,  4 Sep 2026 12:20:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BAE8F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DC2181174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wm-t5sQcxd9p for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:20:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5A46781172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524408;
 b=OIc2FgnRlIRI9FnSEsJGJHB5ickyVC89FiFPTX4l+c0iPJp1KM3ANHpnu4YvXzPwCW21
 8W034HAonantGLfEVO/SYybr9taPyCz3i4ZLO6q9Nel0JwQ2XewQfy6ODfPMkkBeMIzt5
 kz5Yyu1Mj1WB8uDZbDBLCpVrBfRBHhoVdW4wW9AcBuVoJomzTo33AWUDmFvJkFD6WAfTN
 tsupkhvu7CsY19XkFHNbaCnrqPl88/Hz72DTWqoUpxUebXkhtIZyZd/uS8jvIzb/SmpA7
 iMfqZKaTRoi8rKZFi3URDZaK72BMw2fbQl8pIIHklI3KhMduJplW+jTb5dVcyaHdYQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524408;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=+aFeKDF9CnSBbkF79Ld1CLT4sW33WH/+iI18fIriKVc=;
 b=tTFWi++YFgUdhe7ffzQM7oCySYix7LGQpkfcVz7ONZP5RgccbQ2G7C7HObnY4ZF17q/G
 T/KYuhNOqbuUsNuuWFs6QhvCe7a/xqVJb/TSyOhHTeySTwQk3cMcqwYm4TanmvW3L2jQ4
 d9277gd13TQKgvhs6BGfpMoYQsOWe6SbYAz0+n6Vn/hm0QydVb1flHhD2XVnWyv58AYVL
 GcZp2zP1mfJGlA1JBww2SI/P3wVKK9FyJyO8+HJslyb2a6S+KuV5uKz8wjRoc0cKL5AGR
 4LXjOoDMbyuLw58Xt3w26IKEd62I5uJuSufLbKl9xuxkAL5jdHttbX6SR6pHFP/gpLg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GKkMoJ2S; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A46781172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:20:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4998b5a63e2so9917015e9.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:20:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524406; x=1789129206;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=+aFeKDF9CnSBbkF79Ld1CLT4sW33WH/+iI18fIriKVc=;
 b=h6zSqwOa2oogPeNDnGezF0n2/POWMDI5xGF1uXwc8f3gQ/JmmanvACEesfnkKCazsq
 BAGl9DV0E04zmdGZfZQkYKTDqD3Ccn55uJ5wO9H4EO5A2oGiWAejIKiK1E2NZNZJ0GeY
 v55CSY4wR5OzH+EmJSqiEkhpddKMKEByA9v5OCPkDAgE8XTl9dy15GLT6cm2KqJDEFJu
 xzlfs5nJ49HOMJXGBdxoGz98h1jaEQeUnvn8de2V7y9v7/2qVqS+9ykkx9O9/dqZA11F
 0UZLctEdN5VAvZqWDTFSec0sYDVlq+Q7+71BYOJ759mF2N8MvFCHHDrNzkFRFIvDgt2g
 mDmw==
X-Forwarded-Encrypted: i=1;
 AKwUvBxAzsG7P5pClhfEjoR00A7nxkATiIxf4yERQPgdjGEoJgqKstzkclng4dTd4s92RcSCGkH+46JbNFI=@buildroot.org
X-Gm-Message-State: AFuF++m+TiYCKousYgU7FSJofH1PpMSm5eOHDS3CXsyWLtZzKDqTcppl
 6QcKyo2zlFG+RoZzkyOs6yDuImEfORuaamg3zp5qw4o4vMiauo4VEDYVqQcP1clssUU=
X-Gm-Gg: AYBFou0xs4RQIwVCfdJ6LS6ZR0svdQy+N9Zn4aPhOieNXCUeVeelgocN7BiO8AwKM9d
 4G8cWrjHNaDlEVk+Q1AAjDEr7CaNVF4iWOkeH6EVc6PIq1um68vub+UJHK8TjlZ3s+UTM4x9koy
 hdmsfBCFXh1nsNJlfZLc4X/6ujkhSzdIdBG2FdUBnmX+bOQRn2g5wSg5k57wOGuCB1SeTfu5b70
 Pr8joTn9RbTWhC3Mg/jvQpZ2/kSUMvJSpRudqH+dPHd7+8b3SlnvE44bX63UccomHqCGvT8Q7r6
 pj7dQcH9ZpjUMtst/JXO6Q25rpJQkK4AXo6j5BxcwX6g7z+YeriwJvnwQkoaUDldkAWdlmF3CW4
 0DWc509+9nBsvEnHI61fxUe+WN0MLGR7+S6tYAfuPdOsPD8uqh4+KVqWHjlOIinVD+uQwFokLJ8
 yy8Gid8Evz0/dbRLotsjhlgRUeKwmC8xlKORw4vyhZv9TJhyQQEkqiKg==
X-Received: by 2002:a05:600c:4e0e:b0:49c:fc6c:be0d with SMTP id
 5b1f17b1804b1-49cfc6cc137mr29667665e9.19.1788524405593; 
 Fri, 04 Sep 2026 05:20:05 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9a56sm5047768f8f.15.2026.09.04.05.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:20:05 -0700 (PDT)
To: Stefan Mueller <stemu86@gmx.ch>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 =?UTF-8?q?Stefan=20M=C3=BCller?= <stefan.mueller@rey-technology.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Fri,  4 Sep 2026 14:20:01 +0200
Message-ID: <20260904122004.407122-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904090032.3492954-1-stemu86@gmx.ch>
References: <20260904090032.3492954-1-stemu86@gmx.ch>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1] package/dnsmasq: bump to
 version 2.93
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU3RlZmFuLAoKSW4gcmVwbHkgb2Y6Cj4gQmFja3BvcnQgdGhlIGRuc21hc3EgMi45MyB2ZXJz
aW9uIGJ1bXAgdG8gdGhlIDIwMjUuMDIueCBtYWludGVuYW5jZQo+IGJyYW5jaC4gSXQgaXMgYWxy
ZWFkeSBwcmVzZW50IGluIG1hc3Rlci4KPiAKPiBUaGlzIGZpeGVzIENWRS0yMDI2LTEyNzI1LCBh
IGhlYXAgYnVmZmVyIG92ZXJmbG93IGluIGxvZ19xdWVyeSgpLAo+IGFuZCBDVkUtMjAyNi0xMjk2
OSwgYW4gb3V0LW9mLWJvdW5kcyByZWFkIGluIGZpbmRfc29hKCkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogU3RlZmFuIE3DvGxsZXIgPHN0ZWZhbi5tdWVsbGVyQHJleS10ZWNobm9sb2d5LmNvbT4KClRo
YW5rcyBmb3IgdGhlIG5vdGljZS4gSSBhcHBsaWVkIHlvdXIgcGF0Y2ggd2l0aCB0aGUgYWRkaXRp
b24gb2YgdGhlIGNoYW5nZWxvZwphbmQgdGhlIG1hc3RlciBicmFuY2ggY29tbWl0LgoKUEVSQUxF
IFRob21hcwoKPiAtLS0KPiAgcGFja2FnZS9kbnNtYXNxL2Ruc21hc3EuaGFzaCB8IDQgKystLQo+
ICBwYWNrYWdlL2Ruc21hc3EvZG5zbWFzcS5tayAgIHwgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9kbnNtYXNxL2Ruc21hc3EuaGFzaCBiL3BhY2thZ2UvZG5zbWFzcS9kbnNtYXNxLmhhc2gKPiBp
bmRleCA3NGVlNWM0MTViLi4xNzZlNzM4OTllIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZG5zbWFz
cS9kbnNtYXNxLmhhc2gKPiArKysgYi9wYWNrYWdlL2Ruc21hc3EvZG5zbWFzcS5oYXNoCj4gQEAg
LTEsNiArMSw2IEBACj4gICMgTG9jYWxseSBjYWxjdWxhdGVkIGFmdGVyIGNoZWNraW5nIHBncCBz
aWduYXR1cmUKPiAtIyBodHRwczovL3RoZWtlbGxleXMub3JnLnVrL2Ruc21hc3EvZG5zbWFzcS0y
LjkycmVsMi50YXIueHouYXNjCj4gLXNoYTI1NiAgNDNkNzJiOGMxMjliZGYzM2QxN2JhZmVkYzk4
ODIzZjYzZTQ2YjUwMDUxMjgwNjZiZjBkMmE0NzJhMzJjZTA2YSAgZG5zbWFzcS0yLjkycmVsMi50
YXIueHoKPiArIyBodHRwczovL3RoZWtlbGxleXMub3JnLnVrL2Ruc21hc3EvZG5zbWFzcS0yLjkz
LnRhci54ei5hc2MKPiArc2hhMjU2ICAwYzAwZDRlNWM5N2M4MzA2ZTVmYjkzMmIzNDhiMzQyNjlj
OWMyOWEwZTdkZjBlOGU4Mjk1OGI0MDcwOTJiYzE5ICBkbnNtYXNxLTIuOTMudGFyLnh6Cj4gICMg
TG9jYWxseSBjYWxjdWxhdGVkCj4gIHNoYTI1NiAgODE3N2Y5NzUxMzIxMzUyNmRmMmNmNjE4NGQ4
ZmY5ODZjNjc1YWZiNTE0ZDRlNjhhNDA0MDEwNTIxYjg4MDY0MyAgQ09QWUlORwo+ICBzaGEyNTYg
IDhjZWI0YjllZTVhZGVkZGU0N2IzMWU5NzVjMWQ5MGM3M2FkMjdiNmIxNjVhMWRjZDgwYzdjNTQ1
ZWI2NWI5MDMgIENPUFlJTkctdjMKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9kbnNtYXNxL2Ruc21h
c3EubWsgYi9wYWNrYWdlL2Ruc21hc3EvZG5zbWFzcS5tawo+IGluZGV4IGQ3YWU4YTMzMTIuLmI5
YTc2ZmQ1Y2MgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9kbnNtYXNxL2Ruc21hc3EubWsKPiArKysg
Yi9wYWNrYWdlL2Ruc21hc3EvZG5zbWFzcS5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4gICMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1ETlNNQVNRX1ZFUlNJT04gPSAyLjkycmVsMgo+
ICtETlNNQVNRX1ZFUlNJT04gPSAyLjkzCj4gIEROU01BU1FfU09VUkNFID0gZG5zbWFzcS0kKERO
U01BU1FfVkVSU0lPTikudGFyLnh6Cj4gIEROU01BU1FfU0lURSA9IGh0dHBzOi8vdGhla2VsbGV5
cy5vcmcudWsvZG5zbWFzcQo+ICBETlNNQVNRX01BS0VfRU5WID0gJChUQVJHRVRfTUFLRV9FTlYp
IENDPSIkKFRBUkdFVF9DQykiCj4gLS0gCj4gMi4yNS4xCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
