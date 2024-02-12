Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CB4C4829E
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 21:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A03D660A49;
	Mon, 12 Feb 2024 21:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NrPJS7zMZG6k; Mon, 12 Feb 2024 21:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 987E460A53
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 987E460A53;
	Mon, 12 Feb 2024 21:46:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F4F71BF853
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE7F4404BC
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 21:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZ13I1XSz9xN for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 21:46:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F845408E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F845408E8
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F845408E8
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 21:46:47 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-410e820a4feso6407475e9.1
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 13:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707774405; x=1708379205;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dRHLxtlpZQSx6QVujmrpUKmnxNEIm/qtSoAbCnItnc4=;
 b=ViM3eoi+KzHpEItE8bHmdHdM1VHrG2ZcPTlI+6ztaVySDScH/6k1Lwv7guBJHrW4/D
 s9/2t7faROUbL1MfcF7GLkYVdqRXLPOSznFNB+kSKd6RPPC//ziUmBi/5pKWZ5xanDW8
 4ZZCpUFg6vyxlAvP/VkXm2gPQgg350WFThnqBmzWxjR9tBm+Z4qZaaumxl3nRElMnbWN
 bBfftlbJ0SMrNrgrn12peBSeD1cn9dIPAuEvHgku2i3VSF0oLG4R3ZijFXtu0FP/1oTb
 UtvCqgUzpkhcBsex5jDHRfQIA6SqK8wsr1NGTqAi+4p/wR3aJ8knFBOPV7jvpf0veKeV
 1cxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQAEoOSJlQT79ChxXVn/poN/5DMoLU3nXeP5k8ToMQvOQsfkWI8NuckqfQrBFmr8qvMZbwzr25RKqTkptoiLl/dqKBng8GQQ==
X-Gm-Message-State: AOJu0YyCwYOh+9x8IkBlO7WQZaNTmY+avZCXeLXvbNnG3FuYSAydhgiH
 DdFk+M4K+xegFJSMq5slWbaNI0xt+8sC2ExD9/9clPBWL3Y6xa+JZ+DsqiozED4=
X-Google-Smtp-Source: AGHT+IEft5acUbPRsAsmDoF/JUtjl16I8F7oRdrp+GAyuXHuIkiVcfJDuHQjzRflDjKrUCxIFS5f8g==
X-Received: by 2002:a05:600c:354f:b0:40e:45c0:ad64 with SMTP id
 i15-20020a05600c354f00b0040e45c0ad64mr546801wmq.14.1707774405437; 
 Mon, 12 Feb 2024 13:46:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUFMn+hRDFXMMZG3+UhlT3V5XexF4goNoApMRXDwcZ1GDUwndOCJkXNk35JaEEhfEglgTyJe/UxLHw0AYGYvIyza7Uaal0jrSt6rYIve3nB7wLWaXarvfHXz3Fr4mVMZ1JeMjqcg/F/LG1MO7BQ7+vW3v4JLzlhkjyze/nLjvoylCI3Yr4dFimY2n/zQyynqNgqrrDC1eqyia0Eo9AVriwFrPUqjO3s90Aecpf48UzaDXgj
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c1d1500b00410e638357asm3003511wms.10.2024.02.12.13.46.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 13:46:44 -0800 (PST)
Message-ID: <e74681f4-f93e-4f89-be00-78f5f461c824@mind.be>
Date: Mon, 12 Feb 2024 22:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
References: <20240115-imx93-support-v5-0-c2c950104c58@armadeus.com>
 <20240115-imx93-support-v5-2-c2c950104c58@armadeus.com>
In-Reply-To: <20240115-imx93-support-v5-2-c2c950104c58@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707774405; x=1708379205; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dRHLxtlpZQSx6QVujmrpUKmnxNEIm/qtSoAbCnItnc4=;
 b=CmRLio28DtIh4ZcMjSRhBz2weur6/sHyz0oxtwnClma6CR7CHW99LEjdjR1VXfgE1v
 2aZ+BtRrbBt6E27KEWK+6khxR2INdJP7NaXKY/pAOVCJvB+vM2F2Tsk+Nno3ptOGEjas
 w2ZnQzhBdxvQlmpwiQgEAGz2QCZq8ivrXaN89D8xrMejuHfW5lv0Q+KA8I9LJaeT+X5a
 3G84M8B8cDRad85S2j3c7llQpYgn5jg4FhfgPQBVqy2vJ3nbR4mASCnNaz12Z7TNxMtI
 fbfhZA7pXCn7qKJCeVjU9OeVaVEP0kCuzKE1vwaM3c6FRHO5XfTRxXhrm5uuCe1fOzlL
 EHkQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CmRLio28
Subject: Re: [Buildroot] [PATCH v5 2/3]
 package/freescale-imx/firmware-ele-imx: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Refik Tuzakli <tuzakli.refik@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gary Bisson <bisson.gary@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8wMi8yMDI0IDEzOjU0LCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBUaGlz
IHBhY2thZ2UgcHJvdmlkZXMgZmlybXdhcmUgYmxvYnMgZm9yIHRoZSBFZGdlbG9jayBTZWN1cmUK
PiBFbmNsYXZlIChFTEUpIFsxXSBwcmVzZW50IG9uIGkuTVg4VUxQIGFuZCBpLk1YOSBTb2NzLgo+
IFRoaXMgdmVyc2lvbiBjb21lcyBmcm9tIHRoZSA2LjEuNTUtMi4yLjAgcmVsZWFzZS4KPiAKPiBb
MV0gaHR0cHM6Ly93d3cubnhwLmNvbS9wcm9kdWN0cy9ueHAtcHJvZHVjdC1pbmZvcm1hdGlvbi9u
eHAtcHJvZHVjdC1wcm9ncmFtcy9lZGdlbG9jay1zZWN1cmUtZW5jbGF2ZTpFREdFTE9DSy1TRUNV
UkUtRU5DTEFWRQo+IAo+IFJldmlld2VkLWJ5OiBHYXJ5IEJpc3NvbiA8Ymlzc29uLmdhcnlAZ21h
aWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KCiAgQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcywgd2l0
aCBzb21lIGNoYW5nZXM6CgogICAgICAtIEludHJvZHVjZSBCUjJfUEFDS0FHRV9GUkVFU0NBTEVf
SU1YX0hBU19FTEUgaW5zdGVhZCBvZiBzcGVjaWZpYwogICAgICAgIGRlcGVuZGVuY2llcy4KICAg
ICAgLSBEcm9wIEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTFBMSwgdXNl
CiAgICAgICAgQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9QTEFURk9STV9JTVg5MSBpbnN0ZWFk
LgogICAgICAtIERvbid0IHVzZSBTQ1IudHh0IGFzIGxpY2Vuc2UgZmlsZSAoaXQncyBqdXN0IGFu
IGluZGV4IGZpbGUpOyBpbnN0ZWFkLAogICAgICAgIHVzZSBFVUxBLgoKICBSZWdhcmRzLAogIEFy
bm91dAoKPiAtLS0KPiBDaGFuZ2VzIGZvciB2NToKPiAgIC0gbm9uZQo+IAo+IENoYW5nZXMgZm9y
IHY0Ogo+ICAgLSBtb3ZlIGkuTVggU2lsaWNvbiBSZXZpc2lvbiBjaGFuZ2VzIGludG8gZmlyc3Qg
cGF0Y2ggKEdhcnkgQmlzc29uKQo+IAo+IENoYW5nZXMgZm9yIHYzOgo+ICAgLSByZW5hbWUgcGFj
a2FnZSBmcm9tIGZpcm13YXJlLXNlbnRpbmVsIHRvIHBhY2thZ2UgZmlybXdhcmUtZWxlLWlteAo+
IAo+IENoYW5nZXMgZm9yIHYyOgo+ICAgLSBub25lCj4gLS0tCj4gICBwYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgIHBhY2thZ2UvZnJl
ZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L0NvbmZpZy5pbiAgIHwgMjEgKysrKysrKysrKysr
KysrKysKPiAgIC4uLi9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXguaGFzaCAgICAg
ICAgIHwgIDQgKysrKwo+ICAgLi4uL2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5t
ayAgICAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrCj4gICA0IGZpbGVzIGNoYW5n
ZWQsIDUzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUt
aW14L0NvbmZpZy5pbiBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9Db25maWcuaW4KPiBpbmRleCBi
YTE2OWVhZDE4Y2IuLmYxMmFjYzNiZDAyNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2ZyZWVzY2Fs
ZS1pbXgvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L0NvbmZpZy5pbgo+
IEBAIC0xNTQsNiArMTU0LDcgQEAgc291cmNlICJwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXV1
Yy9Db25maWcuaW4iCj4gICBzb3VyY2UgInBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1L0Nv
bmZpZy5pbiIKPiAgIHNvdXJjZSAicGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJv
L0NvbmZpZy5pbiIKPiAgIHNvdXJjZSAicGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHV3cmFw
L0NvbmZpZy5pbiIKPiArc291cmNlICJwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxl
LWlteC9Db25maWcuaW4iCj4gICBzb3VyY2UgInBhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2Fy
ZS1pbXgvQ29uZmlnLmluIgo+ICAgc291cmNlICJwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXNj
LWZpcm13YXJlL0NvbmZpZy5pbiIKPiAgIHNvdXJjZSAicGFja2FnZS9mcmVlc2NhbGUtaW14L2lt
eC1zZWNvL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zp
cm13YXJlLWVsZS1pbXgvQ29uZmlnLmluIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJl
LWVsZS1pbXgvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwMDAuLjc4NjdjMzcxMmM5Ywo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2ZyZWVz
Y2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9Db25maWcuaW4KPiBAQCAtMCwwICsxLDIxIEBACj4g
K2NvbmZpZyBCUjJfUEFDS0FHRV9GSVJNV0FSRV9FTEVfSU1YCj4gKwlib29sICJmaXJtd2FyZS1l
bGUtaW14Igo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JN
X0lNWDkxIHx8IFwKPiArCQlCUjJfUEFDS0FHRV9GUkVFU0NBTEVfSU1YX1BMQVRGT1JNX0lNWDkz
Cj4gKwloZWxwCj4gKwkgIEZpcm13YXJlIGJsb2JzIGZvciB0aGUgRWRnZWxvY2sgU2VjdXJlIEVu
Y2xhdmUgKEVMRSkKPiArCSAgcHJlc2VudCBvbiBpLk1YOFVMUCBhbmQgaS5NWDkgU29Dcy4KPiAr
Cj4gKwkgIFRoaXMgbGlicmFyeSBpcyBwcm92aWRlZCBieSBOWFAgYXMtaXMgYW5kIGRvZXNuJ3Qg
aGF2ZSBhbgo+ICsJICB1cHN0cmVhbS4KPiArCj4gK2lmIEJSMl9QQUNLQUdFX0ZJUk1XQVJFX0VM
RV9JTVgKPiArCj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9GSVJNV0FSRV9FTEVfSU1YX0FIQUJfQ09O
VEFJTkVSX0lNQUdFCj4gKwlzdHJpbmcKPiArCWRlZmF1bHQgIm14OTNhMC1haGFiLWNvbnRhaW5l
ci5pbWciIGlmIEJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTNBMAo+ICsJ
ZGVmYXVsdCAibXg5M2ExLWFoYWItY29udGFpbmVyLmltZyIgaWYgXAo+ICsJCUJSMl9QQUNLQUdF
X0ZSRUVTQ0FMRV9JTVhfUExBVEZPUk1fSU1YOTFBMSB8fCBcCj4gKwkJQlIyX1BBQ0tBR0VfRlJF
RVNDQUxFX0lNWF9QTEFURk9STV9JTVg5M0ExCj4gKwo+ICtlbmRpZiAjIEJSMl9QQUNLQUdFX0ZJ
Uk1XQVJFX0VMRV9JTVgKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13
YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5oYXNoIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14
L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5oYXNoCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU4NTY1Y2VmNDNlOQo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9maXJtd2FyZS1l
bGUtaW14Lmhhc2gKPiBAQCAtMCwwICsxLDQgQEAKPiArIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAr
c2hhMjU2ICA0YTA0NDAxNjhkOGRmYjk1OTg5YTE3YmU4ZmFmYjE0OTU4OWUxMTBlN2Q0NTE4ZTVl
OGEzMzQ2M2RmYjVlNWNhICBmaXJtd2FyZS1lbGUtaW14LTAuMS4wLmJpbgo+ICtzaGEyNTYgIDI0
ZDdjYjNhN2U1MTAxMTQ2NmExNDliZDk5YWNmODkzODdiODMyYmUyZDA4OTBjZTJlMTgzZGZiYzlk
N2NiODQgIENPUFlJTkcKPiArc2hhMjU2ICBjODAwYWFjYTNhN2U5ZjQ3MGQ5OWQ3Y2RlMGE0OGM5
NTk4MmVkNjAxZDRjMzA2ZjdiOGY0M2YzNzEwMDU0ZjI4ICBTQ1IudHh0Cj4gZGlmZiAtLWdpdCBh
L3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgu
bWsgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9maXJtd2FyZS1lbGUt
aW14Lm1rCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjYwMGI1
MGM1YjQ1Ngo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmly
bXdhcmUtZWxlLWlteC9maXJtd2FyZS1lbGUtaW14Lm1rCj4gQEAgLTAsMCArMSwyNyBAQAo+ICsj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgZmlybXdhcmUtZWxlLWlteAo+ICsjCj4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKwo+ICtGSVJNV0FSRV9FTEVfSU1YX1ZFUlNJT04g
PSAwLjEuMAo+ICtGSVJNV0FSRV9FTEVfSU1YX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkK
PiArRklSTVdBUkVfRUxFX0lNWF9TT1VSQ0UgPSBmaXJtd2FyZS1lbGUtaW14LSQoRklSTVdBUkVf
RUxFX0lNWF9WRVJTSU9OKS5iaW4KPiArCj4gK0ZJUk1XQVJFX0VMRV9JTVhfTElDRU5TRSA9IE5Y
UCBTZW1pY29uZHVjdG9yIFNvZnR3YXJlIExpY2Vuc2UgQWdyZWVtZW50Cj4gK0ZJUk1XQVJFX0VM
RV9JTVhfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgU0NSLnR4dAo+ICtGSVJNV0FSRV9FTEVfSU1Y
X1JFRElTVFJJQlVURSA9IE5PCj4gKwo+ICtGSVJNV0FSRV9FTEVfSU1YX0lOU1RBTExfSU1BR0VT
ID0gWUVTCj4gKwo+ICtkZWZpbmUgRklSTVdBUkVfRUxFX0lNWF9FWFRSQUNUX0NNRFMKPiArCSQo
Y2FsbCBOWFBfRVhUUkFDVF9IRUxQRVIsJChGSVJNV0FSRV9FTEVfSU1YX0RMX0RJUikvJChGSVJN
V0FSRV9FTEVfSU1YX1NPVVJDRSkpCj4gK2VuZGVmCj4gKwo+ICtGSVJNV0FSRV9FTEVfSU1YX0FI
QUJfQ09OVEFJTkVSX0lNQUdFID0gJChjYWxsIHFzdHJpcCwkKEJSMl9QQUNLQUdFX0ZJUk1XQVJF
X0VMRV9JTVhfQUhBQl9DT05UQUlORVJfSU1BR0UpKQo+ICsKPiArZGVmaW5lIEZJUk1XQVJFX0VM
RV9JTVhfSU5TVEFMTF9JTUFHRVNfQ01EUwo+ICsJY3AgJChARCkvJChGSVJNV0FSRV9FTEVfSU1Y
X0FIQUJfQ09OVEFJTkVSX0lNQUdFKSAkKEJJTkFSSUVTX0RJUikvYWhhYi1jb250YWluZXIuaW1n
Cj4gK2VuZGVmCj4gKwo+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
