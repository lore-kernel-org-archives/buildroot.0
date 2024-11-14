Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33402D65C6C
	for <buildroot@archiver.kernel.org>; Thu, 14 Nov 2024 10:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D6BC0600CD;
	Thu, 14 Nov 2024 10:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qyGDkSQxOWlS; Thu, 14 Nov 2024 10:49:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D82D560A5E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D82D560A5E;
	Thu, 14 Nov 2024 10:49:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 48000972
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 10:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2840441C6F
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 10:49:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 86MV-gdHXDjo for <buildroot@buildroot.org>;
 Thu, 14 Nov 2024 10:49:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99B1E4000B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99B1E4000B
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99B1E4000B
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 10:49:28 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-539eb97f26aso431412e87.2
 for <buildroot@buildroot.org>; Thu, 14 Nov 2024 02:49:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731581367; x=1732186167;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/nj2sI4IrqQIFGfqle3R8sWh+/oPMsqquOyY0+ESx3Y=;
 b=mJ1i6o55swbzLDZNw04GPDVvUGPoR9eqMQmNT6l3DNJpVgOHJI1KIldi39xnPCsJxz
 b+/gZVTa8wzphKgyXpuH92ZJ5NYshLB9vnOYZ/idVYUJo1sp25AmRqSNVt6M/ub56VvE
 2cTJx70oAJGXEWyjhzAFoJZtJjMdUnuFlgyj3Tm2xHm1J5RspvCNMLEQKLWMxdBt2TcX
 06C7wSWyA2KplogtBypBlTpCHWnaN9hmvenaeEufahTVhRuSwuH3kTf+KBd6RtJXDsYF
 iwkEE44Z0qhl2qpIhEzW10pl1DwhJWTXE+ZF3ByrrcX1oeEtEoXw3+91G5tErD61hlJt
 p1EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVB95750OL5L6Spp4DDh/vfSbixiLLU9pFuzxgi4xvyeUZTcJqEG3gIayzazGGFhTWB+FM8g0o1E4U=@buildroot.org
X-Gm-Message-State: AOJu0Yy9mGqt4TK7vK/6ERwG/A0McQnVD3OZSZx4YmFVw4s6YcUo2KOf
 4lRoRjj0DH6sW7+PCRqn4yrO9Tk2cgjLPNrxizSwIMiuRJcSKZBEniaSPfHy4yk=
X-Google-Smtp-Source: AGHT+IHKHmFEHEXmln7guQo8aUyLuyvQqAJf8TTyR+DQjXm/4/yqpLFHu5J/Dgpr3Fu55Qbdis86fQ==
X-Received: by 2002:a05:6512:208c:b0:53d:a4d7:70ec with SMTP id
 2adb3069b0e04-53da4d771bbmr973164e87.9.1731581366660; 
 Thu, 14 Nov 2024 02:49:26 -0800 (PST)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae161b5sm1148114f8f.74.2024.11.14.02.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 02:49:26 -0800 (PST)
Message-ID: <dc544d97-8474-4b93-9c02-875d348bf2ca@mind.be>
Date: Thu, 14 Nov 2024 11:49:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 buildroot@buildroot.org
Cc: Bartosz Bilas <b.bilas@grinn-global.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marleen Vos <marleen.vos@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241017-master-v2-1-7cf8d42d5d81@gmail.com>
 <11cb561c-1f5b-4608-9726-3ffc48625d60@mind.be>
 <b87764f0-788b-4071-a5b9-a968f8711a88@gmail.com>
Content-Language: en-GB
In-Reply-To: <b87764f0-788b-4071-a5b9-a968f8711a88@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1731581367; x=1732186167; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/nj2sI4IrqQIFGfqle3R8sWh+/oPMsqquOyY0+ESx3Y=;
 b=ZqVEjcaZqxnlhQhzAo/3CyBynLBML4fXHihonZ2d4ftWHMHxsmEqPKn8ZGcfhmMvd0
 xEeT2hD4czq+mHDSUKJuMBmyu/9pWItiGB45x4+hBvAUXz9MXu4IqOutE98Heq45Mv6C
 R8QlttBgBANLFTKOkj5VeUbrGdwnTn7YI5Hd60Gg9DkuTnUyjyTVrjIyYudIlg5vkCWl
 1miT80kNAfBU21/AU07l++5baK0xMxMi8nQ8HTfjL76fMlYIpoNwKn413dA9nkZWphyt
 8AMs7JwewmPhMSv5g2sOeryU9ndQs964LfSg1UyyOGtadXA23baTsSoLdYXf5Nxvfw5/
 cQVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZqVEjcaZ
Subject: Re: [Buildroot] [PATCH v2] configs/stm32mp135f-dk: new defconfig
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNC8xMS8yMDI0IDExOjMyLCBSYXBoYcOrbCBHYWxsYWlzLVBvdSB3cm90ZToKPiAKPiAK
PiBMZSAwNi8xMS8yMDI0IMOgIDIzOjI0LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSBhIMOpY3JpdMKg
Ogo+PiDCoMKgSGkgUmFwaGFlbCwKPiBIaSBBcm5vdXQsCj4gCj4gVGhhbmsgeW91IGZvciB0YWtp
bmcgdGhlIHRpbWUgdG8gZG8gdGhpcyByZXZpZXcuCj4+Cj4+IMKgwqBBbHRob3VnaCB0aGlzIGlz
IGdvb2QgZW5vdWdoIHRvIG1lcmdlLCBJIGhhdmUgYSBmZXcgY29tbWVudHMgdGhhdCB5b3Ugc3Rp
bGwgCj4+IG1heSB3YW50IHRvIGluY2x1ZGUuIElmIHlvdSB0ZWxsIG1lIHlvdSBoYXZlIG5vIHRp
bWUgaXQgY2FuIGJlIG1lcmdlZCBhcyBpcy4KPiAKPiBJIHdvdWxkIHByZWZlciB0byBkbyBhIHYz
IG9mIHRoaXMgcGF0Y2gsIGFuZCB0YWtlIGludG8gYWNjb3VudCB5b3VyIHJldmlldyBmb3IgCj4g
YW5vdGhlciB2ZXJzaW9uLgo+Pgo+PiBPbiAxNy8xMC8yMDI0IDIzOjI4LCBSYXBoYWVsIEdhbGxh
aXMtUG91IHdyb3RlOgoKW3NuaXBdCj4+PiArQ09ORklHX0NPVU5URVI9bQo+Pj4gK0NPTkZJR19T
VE0zMl9MUFRJTUVSX0NOVD1tCj4+PiArQ09ORklHX1NUTTMyX1RJTUVSX0NOVD1tCj4+Cj4+IMKg
wqBBZ2Fpbiwgbm8gcmVhc29uIGZvciB0aGVzZSB0byBiZSBtb2R1bGVzLgo+IAo+IENPTkZJR19T
VE0zMl9MUFRJTUVSX0NOVCBhbmQgQ09ORklHX1NUTTMyX1RJTUVSX0NOVCBhcmUgc2V0IGFzIG1v
ZHVsZXMgaW4gdGhlIAo+IGdlbmVyaWMgbXVsdGlfdjcgZGVmY29uZmlnLiBJIGhhdmUgbm8gd2ls
bCBhZ2FpbnN0IG1ha2luZyB0aG9zZSBkcml2ZXJzIGJ1aWx0LSAKPiBpbiwgYnV0IHdvdWxkIGl0
IGJlIGJldHRlciB0byBoYXZlIGFsaWduZWQgb3B0aW9ucyB3aXRoIHRoZSB1cHN0cmVhbSBkZWZj
b25maWcgPyAKPiBXZSB3b3VsZCBnZXQgYSBzbWFsbGVyIGtlcm5lbCwgaW4gYSBjZXJ0YWluIHdh
eSAoSSdtIG5vdCBzdXJlIHR3byBidWlsdC1pbiAKPiBkcml2ZXJzIHdpbGwgbWFrZSBhIGRpZmZl
cmVuY2UgaW4gdGhlIGtlcm5lbCBzaXplKS4gSWYgaXQgaXMgbm90IHJlbGV2YW50IEkgd2lsbCAK
PiBnbGFkbHkgdGVzdCBhbmQgc2V0IGRyaXZlcnMgd2l0aCBidWlsdC1pbiBjb25maWd1cmF0aW9u
LgoKICBUaGUgaWRlYSBpcyB0aGF0IHdlIGhhdmUgdHdvIG9wdGlvbnMgZm9yIHRoZSBrZXJuZWwg
Y29uZmlnIGluIEJ1aWxkcm9vdDoKCi0gVXNlIGFuIHVwc3RyZWFtIGRlZmNvbmZpZyBmcm9tIHRo
ZSBrZXJuZWwgaXRzZWxmLiBUaGF0IGRlZmNvbmZpZyBzaG91bGQgYmUgYXMgCnNwZWNpZmljIGFz
IHBvc3NpYmxlLCBidXQgbm93YWRheXMgdGhlIG9ubHkgdXBzdHJlYW0gb3B0aW9uIGlzIG11bHRp
X3Y3IGZvciAKMzItYml0IGFuZCBhcm02NCBmb3IgNjQtYml0LgotIFVzZSBhIHNwZWNpZmljIGRl
ZmNvbmZpZyBpbiBCdWlsZHJvb3QsIHRvIHJlbW92ZSB0aGUgImZhdCIgYW5kIHRoZXJlZm9yZSBz
aXplIAphbmQgYnVpbGQgdGltZS4gSW4gdGhpcyBjYXNlLCB3ZSB3YW50IGV2ZXJ5dGhpbmcgdGhh
dCBpcyBhbHdheXMgdGhlcmUgYnVpbHQgaW4gCigiYWx3YXlzIHRoZXJlIiBtZWFucyB0aGF0IGl0
J3Mgbm90IGhvdC1wbHVnZ2FibGUsIGFuZCBlbmFibGVkIGluIGRldmljZSB0cmVlKSwgCmJlY2F1
c2UgdGhhdCBzdGlsbCByZWR1Y2VzIHRvdGFsIHNpemUgKGEgbW9kdWxlIGlzIGJpZ2dlciB0aGFu
IGlmIGl0J3MgbGlua2VkIGluIAp0aGUga2VybmVsKS4KCiAgSWYgdGhlc2UgdHdvIHBlcmlwaGVy
YWxzIGFyZSBlbmFibGVkIGluIGRldmljZSB0cmVlLCB0aGVuIHRoZWlyIG1vZHVsZXMgd2lsbCAK
YW55d2F5IGdldCBsb2FkZWQgKGlmIG1vZHVsZSBhdXRvbG9hZGluZyBpcyBlbmFibGVkKSwgc28g
cHV0dGluZyB0aGVtIGluIG1vZHVsZXMgCmRvZXNuJ3QgZGVjcmVhc2UgdGhlIHNpemUgaW4gYW55
IG1lYW5pbmdmdWwgd2F5LgoKICBSZWdhcmRzLAogIEFybm91dAoKW3NuaXBdCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
