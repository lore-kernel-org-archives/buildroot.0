Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776F8C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D82E5606BB;
	Fri, 25 Sep 2026 14:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VCXQhz5rZIRg; Fri, 25 Sep 2026 14:43:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F402A60D7A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347382;
	b=n8LWBSy93LbhqGQMCS4xlRa9pC/Ff5GDFI9kcovOhSxSUr1awolHpEd3VtO6M4OTnqxb
	 YkUckz8hnQ8CbcngukcimyJHv35sBfy/H9XDM4SKYOx59467eC2hDXPQzHAzIG8+FjyKC
	 TartQPylexm3g3t6witZ/PHkC4L+uW3IIayT51T+ibm129rCZ2ymzljF9+LZhpAE/YIwK
	 PNO9HIzr5Qkn3SDkJZu+a7kMAYQ4DOSlMZSIiqHKQyDZwqtltYgDIQsL7O0oR4Q11f/63
	 G3wxIOmeEOrMIQ2uf9M3/VFOkkWd061zSlzau8L7C22iC5AQ1/COkRbElx2b5RcQ1Iw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347382;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jjhQ0A9zX9pWkNZDkJclF0m13fjwC6yacE99b3GlNZY=;
	b=rUIDzPT2ztnU/S/gw+5PoEinJfcTrVr6UuRi1pNDFG1sMKIdP+oZdK4732ASqMjJwLXN
	 tdNd0Io8cyuLNyxT5spN5CzAxVQNkObTYBjGzAMFnH8ITMdYbkjVc+oLDX9VJSwTBbdkZ
	 VPW7jEb/lwR3xySLlQRayV3T9UkRGi8NYzANZ2Tx8wkq7mPMYM9QEGSRKR+STT3fq9W9I
	 +xEZJUrMqJ1uYB2aMlyBMcGETIsLS+KG7ulr97yKZQIffnWCZqquVOuPyorikyTN3prUO
	 eCTkSpqQ8FbYqrbMDooUWObWR89Qr8kkziftPBnyEqE1weSGWPraswqbs656Pj72rtA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347382;
	bh=jjhQ0A9zX9pWkNZDkJclF0m13fjwC6yacE99b3GlNZY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fJSwLkXHew/eEewxgUbey8XqwtRXsVwUWKrUjNAhA5ThVK1HaPhmMDHjLf8TLGPsF
	 9/Kvg09HtphA7G7KGjPvfCWLwg6QU0i5TG6URZQT7Xd/kFi/IZywOGTJjkX9Vxlrtk
	 jU8D7wQSC/VwLc85SdKDyWH7VFj0ijDcwPDWZTLgKeQV375NTG6MEx/Z3KPA/haKKE
	 BkR07JvCZcknQ9CX2MFCMNyLsPu8N/bijmhnk+E0FXKDse+5RRqCLXxnsEeac0fq3/
	 cCDrvuyw/xP0C/UV+XCH/qRlRAQmjTR9QxTdAYXQvZDZ2yPdG2Rp5qF1kSvJ9mdFxM
	 vNnR9WBDt38Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F402A60D7A;
	Fri, 25 Sep 2026 14:43:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33D8A332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 192DA810C5
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGbL8q0KI5Hu for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:42:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 710F1810C0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347378;
 b=M/RW102ghN2zf4yzAaR7xDLjDUqmO2fXtVWXy8KduRV+P1ZrdqLE32cMvMSewnb/N0AE
 evwn/ap77WHneg5EhX707lThO9E7tF05+Y3m6295U0tvMYEzmrdngHDSEJI4SwQIv6R+Z
 DaP9d5LaS4mRwNrIu1umVftSaAAmGdf7xg58xf9XEfEk9MjBPEw2/pZjD4mjbvRgzKIss
 TfbRAwA1MCREzojXPFNPeQxanh7Xj8eFSE3z38gDeGkwscVb2kSpj9cyme4fXR8Amn4Rh
 P2K52C19ShbX/ZxQHlJdXLOCIc5J5+tVGSeUciV7RK5f3u9tmyb2hmGhHB8La97eURA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347378;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=u6NCxZwztbI0xHJy6pUbETBmM/TqPNmhgrKgWYCzE9Y=;
 b=szn58i9cdJBfFvaE2EgCsi3wOeTH9/+tBu74bT9QzhPdMG3kfLbGAWASFxzMxTFA6Hpc
 q2zaLRE1s1PlEpgNB4M3eJ+S6hSQ28IYwGUOGwOxZrE1pGmpR+CqObDDB9AYRauEMStlz
 GcebS6cXQX4VR9DwwvnM3xlm7n2hmlOWxEJTGhI79VW1bNntYiOjWF3B8DyPGa9hP8JeN
 Nn2l2usegQzZBWNLd81oRHMkb0u5FibVzKEWLqz2m3EMrG/27yjFBUEOnL/m3VGt1K2MU
 EMKT1UkAGTIkVl9hp/KN8XSuSvbJb3YSGcMy7p20Bphd1HOLPZSe0goVDbtGMhOVXzw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TwKKGqXl; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 710F1810C0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:42:57 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-4887840c529so337661f8f.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347375; x=1790952175;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=u6NCxZwztbI0xHJy6pUbETBmM/TqPNmhgrKgWYCzE9Y=;
 b=W4LtuAA+07M0peR16x/bsqSG+6GDTYfvua9Evn2vwQr+pC3CwS189ZnyJ1/PMwOXfo
 ESx9m0qGM3BlYAdXjvA3hylDA/qT3TonooJMywP5c6fdd/NbGBN4QnQrs6kWG5A8Zo9j
 cwDdZmyXBxMnTEFENUqKbybWoqA9S7k/1ssRrZnRTBhWC6vyEQZ2neLMHbrvRN8ggAIN
 Fd25UIiCsZsRvRnR3XMpQuT7/GXDhoNukthyapdQMNqu4JPoWe8HfSCgBR6wr+ZAaHYQ
 6P/oL/XCzsyG1E6qf+u8Tcn0WKPZxW8nWVuK6glCRllZOy8reSgeaAo9/sNtInpPDWAW
 ajYA==
X-Gm-Message-State: AFuF++lcizGHR7NIXoHabBND/tvHtbyI1+aPsUDyuQoxo3C1SSCkPsEM
 rYXugbxvynTbRim3U6p0I6z8Ii8/h7/U0RyxfigQep0Yh4iNL9qV1yCGx10BtYyenkVbpJneHhG
 PCIF6l4nmjw==
X-Gm-Gg: AYBFou3UdLWa/Zhi1962I+15RUAlh4CyClWZpAadiWiWYNRjoWIiUJ6eW4xVKFUbpwK
 B3fGM3fmKtNvXgitFinqwa5d1fpI5YVHwIblvz6SupqOp+GZ+5vlcaxyw2vuYLcagYYo3TKOEWO
 lZx6ZvbEz9NxMpjVd4ZGSITRacvLqHp+1KR8RxQjPIipnm0N5GLmtZwHwi0PXr2YKdyTmWxVniY
 01YBZAmRywpWOLSO502bUXkf02uKAoAd7ASQcYibi2Bww5pvu2PjBut1J33UHKTnNJmbTNIOhVB
 mTf3KpmQlKvYIpIhiFLe3wQqbIEDVuDNx5+LkpS31cpkZNcmOtq659Y/4MsVECLyEK5aT0RFr50
 gNQUTwHPydIW7/MsMqUItFhiEAOP1NNERRJILAi9SfK4hSjvMI9Bk/+9k3MqK5i1Ka+kPStvQ5P
 bb0lCHxX2u4g39QKYqDWCbhy1dX6Xld3i0OP5eKda8w4ikCbIAq/6z15ZlERzPQoFY8wBwxPY5W
 kMjTMlOkODjB1Zqr02mLXfINDaAk5Uoe6owcrVMuQ==
X-Received: by 2002:a05:600c:609b:b0:49f:ddbd:1f51 with SMTP id
 5b1f17b1804b1-49fe66fa2c9mr109124815e9.15.1790347375283; 
 Fri, 25 Sep 2026 07:42:55 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff069ceebsm75077725e9.3.2026.09.25.07.42.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:42:54 -0700 (PDT)
To: buildroot@buildroot.org,
	Laszlo Ersek <laszlo.ersek@arm.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:41:14 +0200
Message-ID: <20260925144117.4092106-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260730180627.1224385-1-laszlo.ersek@arm.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] linux/linux.mk: forcibly (re)enable Make
 jobserver
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQ29tbWl0IDBiOWVmYzk5MWY4YSAowqtsaW51eDogdXNlIEJSMl9NQUtF
wrssIDIwMjMtMDQtMTApIHJlcGxhY2VkICQoTUFLRSkKPiB3aXRoICQoQlIyX01BS0UpIGluIGEg
bnVtYmVyIG9mIHJlY2lwZXMuIEFzIGEgY29uc2VxdWVuY2UsIHRoZSBjaGlsZCBtYWtlCj4gaXMg
dW5hYmxlIHRvIGRpc2NvdmVyIHRoZSBqb2Igc2VydmVyLCBhbmQgd2UgZ2V0IGEgd2FybmluZyBz
dWNoIGFzCj4gCj4gPiB3YXJuaW5nOiBqb2JzZXJ2ZXIgdW5hdmFpbGFibGU6IHVzaW5nIC1qMS4g
QWRkIGArJyB0byBwYXJlbnQgbWFrZSBydWxlLgo+IAo+IGh0dHBzOi8vd3d3LmdudS5vcmcvc29m
dHdhcmUvbWFrZS9tYW51YWwvaHRtbF9ub2RlL0Vycm9yLU1lc3NhZ2VzLmh0bWwKPiBodHRwczov
L3d3dy5nbnUub3JnL3NvZnR3YXJlL21ha2UvbWFudWFsL2h0bWxfbm9kZS9NQUtFLVZhcmlhYmxl
Lmh0bWwKPiAKPiBJbmZvcm0gdGhlIHBhcmVudCBNYWtlLCBieSBwcmVmaXhpbmcgdGhlIHJlY2lw
ZSB3aXRoICIrIiwgdGhhdCAkKEJSMl9NQUtFKQo+IGNhbiBkZWFsIHdpdGggdGhlIGpvYiBzZXJ2
ZXIuCj4gCj4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4KPiBDYzog
T2xlZyBMeW92aW4gPG92bGV2aW5Ac2JlcmRldmljZXMucnU+Cj4gQ2M6IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4gU2lnbmVkLW9mZi1ieTogTGFzemxvIEVyc2VrIDxsYXN6bG8uZXJzZWtAYXJt
LmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54LCAyMDI2LjA4LnguIFRoYW5rcwoKPiAtLS0KPiAK
PiBOb3RlczoKPiAgICAgQ29tbWl0IDBiOWVmYzk5MWY4YSByZXBsYWNlcyBtdWx0aXBsZSBpbnN0
YW5jZXMgb2YgJChNQUtFKSB3aXRoCj4gICAgICQoQlIyX01BS0UpOyBJJ20gb25seSBwcmVmaXhp
bmcgdGhlIG9uZSByZWNpcGUgd2l0aCAiKyIgdGhhdCBzZWVtcyB0bwo+ICAgICBjYXVzZSB0aGUg
bW9zdCBub3RpY2VhYmxlIHNsb3dkb3duIGZvciBtZSAoYnkgbWlzc2luZyBvdXQgb24gYSBwYXJh
bGxlbAo+ICAgICBrZXJuZWwgYnVpbGQpLgo+IAo+ICBsaW51eC9saW51eC5tayB8IDIgKy0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKPiBpbmRleCBlNzkwZGFmZjY2
MDguLjgwNTgxMDgxYTdlYiAxMDA2NDQKPiAtLS0gYS9saW51eC9saW51eC5tawo+ICsrKyBiL2xp
bnV4L2xpbnV4Lm1rCj4gQEAgLTY5Niw3ICs2OTYsNyBAQCBsaW51eC1yZWJ1aWxkLXdpdGgtaW5p
dHJhbWZzOiByb290ZnMtY3Bpbwo+ICBsaW51eC1yZWJ1aWxkLXdpdGgtaW5pdHJhbWZzOgo+ICAJ
QCQoY2FsbCBNRVNTQUdFLCJSZWJ1aWxkaW5nIGtlcm5lbCB3aXRoIGluaXRyYW1mcyIpCj4gIAkj
IEJ1aWxkIHRoZSBrZXJuZWwuCj4gLQkkKExJTlVYX01BS0VfRU5WKSAkKEJSMl9NQUtFKSAkKExJ
TlVYX01BS0VfRkxBR1MpIC1DICQoTElOVVhfRElSKSAkKExJTlVYX1RBUkdFVF9OQU1FKQo+ICsJ
KyQoTElOVVhfTUFLRV9FTlYpICQoQlIyX01BS0UpICQoTElOVVhfTUFLRV9GTEFHUykgLUMgJChM
SU5VWF9ESVIpICQoTElOVVhfVEFSR0VUX05BTUUpCj4gIAkkKExJTlVYX0FQUEVORF9EVEIpCj4g
IAkjIENvcHkgdGhlIGtlcm5lbCBpbWFnZShzKSB0byBpdHModGhlaXIpIGZpbmFsIGRlc3RpbmF0
aW9uCj4gIAkkKGNhbGwgTElOVVhfSU5TVEFMTF9JTUFHRSwkKEJJTkFSSUVTX0RJUikpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
