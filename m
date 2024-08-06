Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D7BC3DA4A
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 01:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2CD380B24;
	Tue,  6 Aug 2024 01:14:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSM9blIytgrt; Tue,  6 Aug 2024 01:14:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB5D880B2E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB5D880B2E;
	Tue,  6 Aug 2024 01:14:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A421F1BF339
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 01:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9193060786
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 01:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gl_To9ChfTDR for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 01:14:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6CB2E60712
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CB2E60712
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CB2E60712
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 01:14:53 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a7ac449a0e6so861080466b.1
 for <buildroot@buildroot.org>; Mon, 05 Aug 2024 18:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722906891; x=1723511691;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lE4ulNP8exAQtgiyuvw+XOdv6Y3JGMn1Ghtno25lIl8=;
 b=wMnJcVrQHdwBimwrHlHMysnuadrJAvJwdRPVJyj1laYT41MJnqu7OVmvg3jAVxw55u
 g+8xAbPl41F9WANmBbCSH5YsgbmT58kEb5D9/sRBGdwBVVoqtmJS9oGaa7g/TtyAgLwZ
 x5krD8lOQNua3j4kzJT89qLOw148XXhPp7Z8rCKXxcrFs1FoGrA0LnE+rlw56jDopjf2
 FrdR2rdgugemwp3nhGZT3K3MLY/JhFC7wznBfmnowyTc2EZZ4LEx1DsjqDGCeisE0fmt
 T78mILsVi0Jw9Fc+2XwBgQvbw19GqtAKZ90U7brEGabTaPTL75xR6K2b6DPzFr0tdJSO
 Bx0Q==
X-Gm-Message-State: AOJu0YwZyjnHlOEMyRXmfT87L56t3W8Ek/HrLJspGzRpI8a2flE9wpFz
 /nt9+cWfA/4xYvNMdcEs+PJyd8dLj1CCoB5SfyMKGhm41JMsjkSEUfBPOLAAuAm/42zcjQFD589
 N23KW2A==
X-Google-Smtp-Source: AGHT+IEBhLPVcsOnbsaHRLoI5YKxdUJ8wuYiMGF2sdxpPGI7Z5qmVCCFeC7Yg2DTIxbjFYQlMzuIQA==
X-Received: by 2002:a17:907:6e94:b0:a7a:a7b8:adb1 with SMTP id
 a640c23a62f3a-a7dc4ff0e66mr1041445866b.36.1722906890124; 
 Mon, 05 Aug 2024 18:14:50 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com.
 [209.85.208.41]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c0c7e0sm498489166b.75.2024.08.05.18.14.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Aug 2024 18:14:49 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5afa207b8bfso23716a12.0
 for <buildroot@buildroot.org>; Mon, 05 Aug 2024 18:14:49 -0700 (PDT)
X-Received: by 2002:a17:907:3f0c:b0:a77:eb34:3b4d with SMTP id
 a640c23a62f3a-a7dc4db8ba5mr1017437966b.13.1722906888726; Mon, 05 Aug 2024
 18:14:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240805163133.4126564-1-james.hilliard1@gmail.com>
 <20240805163133.4126564-2-james.hilliard1@gmail.com>
In-Reply-To: <20240805163133.4126564-2-james.hilliard1@gmail.com>
Date: Mon, 5 Aug 2024 18:14:37 -0700
X-Gmail-Original-Message-ID: <CA+h8R2pN8q8iF5JZy7BTkcVU0Qnn8-LV+OJbNa-WJ0-uGCxVKQ@mail.gmail.com>
Message-ID: <CA+h8R2pN8q8iF5JZy7BTkcVU0Qnn8-LV+OJbNa-WJ0-uGCxVKQ@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1722906891; x=1723511691; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lE4ulNP8exAQtgiyuvw+XOdv6Y3JGMn1Ghtno25lIl8=;
 b=bITq5USyXlmx7amJG2njGZv0+rP/u9ii+b5tyuzUm/Cb1ue/0enea9hN+WoReoZVsU
 gU3HXlW5Oel8UFU8SJtsQMyvdSMmW3OcgoLyksDgFsIpNWFEH/prYRmHeLUGUOQ8nvTJ
 Vi+LfyR1ZyK/IZRAu8JEgzGoVY++0QNETInDP2A8WqpemYKRLnF4YLI/7WtIXSsjwmob
 +EZW3MpWzaE3gO7ItR6UwyV09S/uR5gjWi1SZ4jTHwkGZsOU8Twel+8jUXrMqVu/OyHl
 8ho3YspLY4Rc0ZPQwLIAS1awKfpcTvFP50GKtdnRDZnBGDEnEMNvy3Wv64rbxPFPMgJc
 rpsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=bITq5USy
Subject: Re: [Buildroot] [PATCH v4 2/2] package/tailscale: new package
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Anisse Astier <anisse@astier.eu>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SmFtZXMsCgoKT24gTW9uLCBBdWcgNSwgMjAyNCBhdCA5OjMx4oCvQU0gSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFt
ZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyB2
MyAtPiB2NDoKPiAgIC0gcmVzdG9yZSBHT1BST1hZIG92ZXJyaWRlCj4gQ2hhbmdlcyB2MiAtPiB2
MzoKPiAgIC0gc2V0IHJlcXVpcmVkIENPTkZJR19UVU4ga2VybmVsIGNvbmZpZyBvcHRpb24KPiBD
aGFuZ2VzIHYxIC0+IHYyOgo+ICAgLSBkb24ndCBzZXQgR09QUk9YWQo+IC0tLQoKPiArVEFJTFND
QUxFX0RMX0dPUFJPWFkgPSBodHRwczovL3Byb3h5LmdvbGFuZy5vcmcKClRoZSBpc3N1ZSB3aXRo
IEdPUFJPWFk9ZGlyZWN0IGlzIGZpeGVkIGFzIG9mIHRhaWxzY2FsZSBtYWluIGJyYW5jaCBhdApj
b21taXQgMjI3NTA5NTQ3ZjBlNzE5ZWY2Y2UyZWMzMGQ5NTZmZGU1MThjMDM2NwoKSSByZXF1ZXN0
ZWQgdGhhdCB0aGV5IHNwaW4gYSBuZXcgcmVsZWFzZSBoZXJlOgoKaHR0cHM6Ly9naXRodWIuY29t
L3RhaWxzY2FsZS90YWlsc2NhbGUvaXNzdWVzLzEyODU5I2lzc3VlY29tbWVudC0yMjcwMTc3ODEx
CgpJbiB0aGUgbWVhbnRpbWUgd2UgY291bGQgbWVyZ2UgdGhpcyBwYWNrYWdlIHBpbm5lZCB0byB0
aGUgY29tbWl0IGhhc2gKSSBnYXZlIGFib3ZlLgoKVGhlIEdPUFJPWFkgdG9waWMgLSBJIG1lbnRp
b25lZCBpdCBoZXJlOgoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxk
cm9vdC9wYXRjaC8yMDI0MDgwNTE2MzEzMy40MTI2NTY0LTEtamFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbS8jMzM1NzQxNQoKSSB0aGluayB3ZSBzaG91bGQgYWRkIEhPU1RfR09fR09QUk9YWSB0byBh
bGxvdyB0aGUgdXNlciB0byBvdmVycmlkZQp0aGlzLCBhbmQgZGVmaW5pdGVseSBub3Qgb3ZlcnJp
ZGUgaXQgcGVyLXBhY2thZ2UuCgpCdXQgdGhpcyBtYXkgbm90IGJlIG5lY2Vzc2FyeSBub3cgdGhh
dCB0YWlsc2NhbGUgZml4ZWQgdGhlaXIgZGVwcy4KCkJlc3QgcmVnYXJkcywKQ2hyaXN0aWFuIFN0
ZXdhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
