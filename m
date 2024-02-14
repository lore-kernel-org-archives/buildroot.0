Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E8AC48BC3
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 16:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D94968234E;
	Wed, 14 Feb 2024 16:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ummja_ichpfO; Wed, 14 Feb 2024 16:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C79A282353
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C79A282353;
	Wed, 14 Feb 2024 16:23:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E54E1BF315
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 16:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BAD160744
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 16:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqgiTTEbmED6 for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 16:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3729D605DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3729D605DF
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3729D605DF
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 16:23:03 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-411d715c401so10021995e9.1
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 08:23:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707927781; x=1708532581;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sr4+mNPRayBTGhtbRHC4jNb5Magr7Ce472huB/b/SuA=;
 b=YxW8lCoJIb/1RIqYVHtYHUhJETMnvEyWzOqIOq/HfH72yfIxc42uet/Z7oXLLk4RqX
 eEXATMGmG1K4kI/8+F2TNLQdbpXFFuoQr0V85eOXq4VRe9AhDkXLeaRy2S1b7d0G2QCf
 rDk/wrIgpq1eEswm1LMw3VjftJoMRU5cFJFEAHn2784/iQDzcMh5+sSXVqh3rEIkbMTI
 Reo6KfNR77Cr4fZo7L1IVv8Yq7yJWOW0C/Gwr+y+lae1PTcLFpU4kBp+cvV+Pen/oed0
 K4bXksf+9/USxx96m2OlFbvxkC0Zg9MhoFS0+iAnQFZ8cmksGioYEcjl2hyzZiKQObrQ
 bxQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtk92mL+O+10bkyL//xkUFYqzh6D8z9AxABA8wvKsMnHAzR/Rjii3cllO/McfMiDxjZZXPMnY6GLEASeZKvjOK28OyybCULg==
X-Gm-Message-State: AOJu0YzuIdI7kX1tnjnrGNdoFqN90nZv6WFzdTMgKGPc4m1Su37aQftF
 tpkm4sZtjiKmtrB1wmp6RI6CTWjcad+vb1KAzZtvSTvZOP50KwvMalzOY6YjqwC2ft30DG/2VvE
 f
X-Google-Smtp-Source: AGHT+IHnrxHHcxd+k6dKdU43efyvP3Yr+8Gx36NReabDyP3DgL3k+8tbiooeE6+Uj52v1Uuy+Ngi2g==
X-Received: by 2002:a5d:4d0e:0:b0:33b:7892:2eaf with SMTP id
 z14-20020a5d4d0e000000b0033b78922eafmr1892230wrt.44.1707927781181; 
 Wed, 14 Feb 2024 08:23:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXZnk0fgDxzrcV1KVQkJq+FP94fxov7n/RpBiihOMiMS1nhKEolBavWIBSB8xpdxrcoSJ+/DZ9p3odTXXqY2fHhb/LG9d56BQ==
Received: from [10.5.0.34] (202-122-190-109.dsl.ovh.fr. [109.190.122.202])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a5d6a04000000b0033cf4e47496sm501469wru.51.2024.02.14.08.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 08:23:00 -0800 (PST)
Message-ID: <d2a4dc21-1140-497d-91d6-2dde78e98cd0@smile.fr>
Date: Wed, 14 Feb 2024 17:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: David Picard <david.picard@clermont.in2p3.fr>, buildroot@buildroot.org
References: <c90e4512-405c-40fb-b597-1a04d7449afa@clermont.in2p3.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <c90e4512-405c-40fb-b597-1a04d7449afa@clermont.in2p3.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707927781; x=1708532581;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sr4+mNPRayBTGhtbRHC4jNb5Magr7Ce472huB/b/SuA=;
 b=mX08JWA7TFS6XC1iSERrYSwZEcfaEX2BUaVQ4dRA3J6gyz8WkJze1b6OLOmwWobhC1
 bMtcLbQPHR1EANrsmUQXtlNFRWmxhljf/dzOs0vHuVnjAuea4D+/B6ap8OSHyWg+T77V
 0ryk7PVHgK99STRhfZT4fLK783gVkgRvswhoMaGJQvgIDCeQ9iaQ2OzOIVDf+V1+jEik
 03kkq1NwjHd5l08TYIYECNIY2qDHa5dYQRN6dBQ1dcoZNIsnDkG21NySbKCfEgMTuigO
 vbW4f0IHx5RWVg3bw039roPkcwAS5cIigAeEqHFTWq1IxXPM8FRdMRVviu6AggDxGlC+
 SBEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=mX08JWA7
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-socfpga-hwlib: add new
 package
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

SGVsbG8gRGF2aWQsCgpMZSAxNC8wMi8yMDI0IMOgIDEwOjM0LCBEYXZpZCBQaWNhcmQgYSDDqWNy
aXTCoDoKPiBBZGQgYSBwYWNrYWdlIGZvciB0aGUgSW50ZWwvQWx0ZXJhIFNvQyBGUEdBIGhhcmR3
YXJlIGxpYnJhcnkuIEl0IGlzCj4gdXNlZCB0byBsZXQgdGhlIEhQUyBhbmQgdGhlIEZQR0EgZmFi
cmljIGNvbW11bmljYXRlIHdpdGggZWFjaCBvdGhlci4KCldlIHJlY2VpdmVkIDQgdGhpbWUgdGhl
IHNhbWUgcGF0Y2ggb24gdGhlIG1haWxpbmcgbGlzdDoKCmh0dHA6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDI0MDIxNDA4MTkyMS40NjYzLTEtZGF2aWQu
cGljYXJkQGNsZXJtb250LmluMnAzLmZyLwoKaHR0cDovL3BhdGNod29yay5vemxhYnMub3JnL3By
b2plY3QvYnVpbGRyb290L3BhdGNoLzI3NzBiMmFjLTRjZWMtNGQ1Ni04MWU5LTg5ZGZkMzNmNzg2
YUBjbGVybW9udC5pbjJwMy5mci8KCmh0dHA6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0
L2J1aWxkcm9vdC9wYXRjaC9hYmNkNDE1My00MWUyLTQ1Y2UtYTg5YS1lMTk4ZTg2YmEzMzdAY2xl
cm1vbnQuaW4ycDMuZnIvCgpodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvYzkwZTQ1MTItNDA1Yy00MGZiLWI1OTctMWEwNGQ3NDQ5YWZhQGNsZXJtb250
LmluMnAzLmZyLwoKV2hpY2ggb25lIHNob3VsZCB3ZSByZXZpZXc/CgpQbGVhc2UsIHNlbmQgcGF0
Y2ggdXNpbmcgZ2l0IHNlbmQtZW1haWwgdG9vbC4KCihodHRwczovL25pZ2h0bHkuYnVpbGRyb290
Lm9yZy9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMpCgpBbHNvLCB3aGVuIHlvdSByZXNl
bmQgYSBwYXRjaCwgYWRkIHRoZSBjaGFuZ2Vsb2cgaW5mby4KCmh0dHBzOi8vbmlnaHRseS5idWls
ZHJvb3Qub3JnL21hbnVhbC5odG1sI19wYXRjaF9yZXZpc2lvbl9jaGFuZ2Vsb2cKCgo+IAo+IFNp
Z25lZC1vZmYtYnk6IERhdmlkIFBpY2FyZCA8ZGF2aWQucGljYXJkQGNsZXJtb250LmluMnAzLmZy
Pgo+IC0tLQo+IHBhY2thZ2UvQ29uZmlnLmluIHwgMSArCj4gcGFja2FnZS9pbnRlbC1zb2NmcGdh
LWh3bGliL0NvbmZpZy5pbiB8IDEyICsrKysrKwo+IC4uLi9pbnRlbC1zb2NmcGdhLWh3bGliLmhh
c2ggfCAyICsKPiAuLi4vaW50ZWwtc29jZnBnYS1od2xpYi5tayB8IDM5ICsrKysrKysrKysrKysr
KysrKysKPiA0IGZpbGVzIGNoYW5nZWQsIDU0IGluc2VydGlvbnMoKykKPiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9pbnRlbC1zb2NmcGdhLWh3bGliL0NvbmZpZy5pbgo+IGNyZWF0ZSBtb2Rl
IDEwMDY0NCBwYWNrYWdlL2ludGVsLXNvY2ZwZ2EtaHdsaWIvaW50ZWwtc29jZnBnYS1od2xpYi5o
YXNoCj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaW50ZWwtc29jZnBnYS1od2xpYi9pbnRl
bC1zb2NmcGdhLWh3bGliLm1rCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluIGIv
cGFja2FnZS9Db25maWcuaW4KPiBpbmRleCBiZjBmZTA3OGI5Li5jZDZjNmJjYWJhIDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9Db25maWcuaW4KPiBAQCAt
MTczNiw2ICsxNzM2LDcgQEAgbWVudSAiSGFyZHdhcmUgaGFuZGxpbmciCj4gc291cmNlICJwYWNr
YWdlL2dudS1lZmkvQ29uZmlnLmluIgo+IHNvdXJjZSAicGFja2FnZS9oYWNrcmYvQ29uZmlnLmlu
Igo+IHNvdXJjZSAicGFja2FnZS9oaWRhcGkvQ29uZmlnLmluIgo+ICsgc291cmNlICJwYWNrYWdl
L2ludGVsLXNvY2ZwZ2EtaHdsaWIvQ29uZmlnLmluIgo+IHNvdXJjZSAicGFja2FnZS9qaXR0ZXJl
bnRyb3B5LWxpYnJhcnkvQ29uZmlnLmluIgo+IHNvdXJjZSAicGFja2FnZS9sY2RhcGkvQ29uZmln
LmluIgo+IHNvdXJjZSAicGFja2FnZS9sZXQtbWUtY3JlYXRlL0NvbmZpZy5pbiIKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9pbnRlbC1zb2NmcGdhLWh3bGliL0NvbmZpZy5pbgo+IGIvcGFja2FnZS9p
bnRlbC1zb2NmcGdhLWh3bGliL0NvbmZpZy5pbgo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uY2VkNjQ4M2E1OQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L2ludGVsLXNvY2ZwZ2EtaHdsaWIvQ29uZmlnLmluCj4gQEAgLTAsMCArMSwxMiBAQAo+ICtjb25m
aWcgQlIyX1BBQ0tBR0VfSU5URUxfU09DRlBHQV9IV0xJQgo+ICsgYm9vbCAiaW50ZWwtc29jZnBn
YS1od2xpYiIKPiArIGRlcGVuZHMgb24gQlIyX2FybQo+ICsgaGVscAo+ICsgVGhpcyBwYWNrYWdl
IHByb3ZpZGVzIHRoZSBJbnRlbCBTb0MgRlBHQSBIV0xJQiBmb3IKPiArIEludGVsL0FsdGVyYSBT
b0MgRlBHQSBjaGlwcy4KPiArIFRoaXMgbGlicmFyeSBhbGxvd3MgdG8gY29tbXVuaWNhdGUgd2l0
aCB0aGUgRlBHQSBmYWJyaWMgZnJvbQo+ICsgTGludXgsIHJ1bm5pbmcgb24gdGhlIEhQUyBkZXZp
Y2UuCj4gKyBUaGUgc291cmNlIGNvZGUgaXMgbm90IGNvbXBpbGVkLiBJbnN0ZWFkLCBhIHN5bWxp
bmsgaXMgYWRkZWQKPiArIHRvICQoU1RBR0lOR19ESVIpL2xpYi4KPiArCj4gKyBodHRwczovL2dp
dGh1Yi5jb20vYWx0ZXJhLW9wZW5zb3VyY2UvaW50ZWwtc29jZnBnYS1od2xpYgoKQ2hlY2sgdGhl
IGNvZGluZyBzdHlsZSB3aXRoIC4vdXRpbHMvY2hlY2stcGFja2FnZQoKPiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9pbnRlbC1zb2NmcGdhLWh3bGliL2ludGVsLXNvY2ZwZ2EtaHdsaWIuaGFzaAo+IGIv
cGFja2FnZS9pbnRlbC1zb2NmcGdhLWh3bGliL2ludGVsLXNvY2ZwZ2EtaHdsaWIuaGFzaAo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uNjBlZmU5MDEzZQo+IC0tLSAv
ZGV2L251bGwKPiArKysgYi9wYWNrYWdlL2ludGVsLXNvY2ZwZ2EtaHdsaWIvaW50ZWwtc29jZnBn
YS1od2xpYi5oYXNoCj4gQEAgLTAsMCArMSwyIEBACj4gK3NoYTI1NiBiYmYwNzY3ZmFjZmRmMThj
YTNkYmVhZDY2YjFlOTgwOTBjNGU5NzMxZTJiODdjZjM1YzNiZjEzZGIwYzMxNWU0Cj4gaW50ZWwt
c29jZnBnYS1od2xpYi0yMy4xMi4wMi50YXIuZ3oKPiArc2hhMjU2IDJlZDA0ZjljYzc3M2Y4OGM4
ZDUyYzA1YzA0YmIzZDI4ZjM3NmMwODJiZjk5YjZhM2NiNTU5MGIxNjI3YWQ0ODQKPiBMaWNlbnNl
LnR4dAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2ludGVsLXNvY2ZwZ2EtaHdsaWIvaW50ZWwtc29j
ZnBnYS1od2xpYi5tawo+IGIvcGFja2FnZS9pbnRlbC1zb2NmcGdhLWh3bGliL2ludGVsLXNvY2Zw
Z2EtaHdsaWIubWsKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmJm
MThjMjM1NjAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9pbnRlbC1zb2NmcGdhLWh3
bGliL2ludGVsLXNvY2ZwZ2EtaHdsaWIubWsKPiBAQCAtMCwwICsxLDM5IEBACj4gKyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBpbnRlbC1zb2NmcGdhLWh3bGliCj4gKyMKPiArIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0lOVEVMX1NPQ0ZQR0FfSFdMSUJfVkVSU0lPTiA9
IDIzLjEyLjAyCj4gK0lOVEVMX1NPQ0ZQR0FfSFdMSUJfU0lURSA9ICQoY2FsbAo+IGdpdGh1Yixh
bHRlcmEtb3BlbnNvdXJjZSxpbnRlbC1zb2NmcGdhLWh3bGliLHJlbF9tYXN0ZXJfJChJTlRFTF9T
T0NGUEdBX0hXTElCX1ZFUlNJT04pX3ByKQo+ICtJTlRFTF9TT0NGUEdBX0hXTElCX0xJQ0VOU0Ug
PSBQUk9QUklFVEFSWQoKSXQncyB1bmV4cGVjdGVkIHRvIGZpbmQgYSBQUk9QUklFVEFSWSB0b29s
IGluIGEgZ2l0YnViIGFjY291bmQgd2l0aCAib3BlbnNvdXJjZSIKaW4gdGhlaXIgbmFtZSA6KQoK
PiArSU5URUxfU09DRlBHQV9IV0xJQl9MSUNFTlNFX0ZJTEVTID0gTGljZW5zZS50eHQKCkl0IGxv
b2sgbGlrZSBhIEJTRC0zLUNsYXVzZSBsaWNlbnNlCgpodHRwczovL3NwZHgub3JnL2xpY2Vuc2Vz
L0JTRC0zLUNsYXVzZS5odG1sCgo+ICtJTlRFTF9TT0NGUEdBX0hXTElCX1JFRElTVFJJQlVURSA9
IFlFUwo+ICtJTlRFTF9TT0NGUEdBX0hXTElCX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ICsKPiAr
ZGVmaW5lIElOVEVMX1NPQ0ZQR0FfSFdMSUJfSU5TVEFMTF9TVEFHSU5HX0NNRFMKPiArIGxuIC1z
ICQoQlVJTERfRElSKS9pbnRlbC1zb2NmcGdhLWh3bGliLSQoSU5URUxfU09DRlBHQV9IV0xJQl9W
RVJTSU9OKQo+ICQoU1RBR0lOR19ESVIpL2xpYi9pbnRlbC1zb2NmcGdhLWh3bGliCj4gK2VuZGVm
CgpJIGRvbid0IHRoaW5rIHRoaXMgaXMgd2hhdCB5b3Ugd2FudCB0byBkby4KCj4gKwo+ICsjIGRl
ZmluZSBJTlRFTF9TT0NGUEdBX0hXTElCX0lOU1RBTExfSU1BR0VTX0NNRFMKPiArIyBta2RpciAt
cCAkKEJJTkFSSUVTX0RJUikvaW50ZWwtdWNvZGUKPiArIyAkKElOU1RBTEwpIC1tIDA2NDQgLXQg
JChCSU5BUklFU19ESVIpL2ludGVsLXVjb2RlIFwKPiArIyAkKEBEKS9pbnRlbC11Y29kZS8qCj4g
KyMgZW5kZWYKPiArIwo+ICsjIGlmZXEgKCQoQlIyX1BBQ0tBR0VfSU5URUxfU09DRlBHQV9IV0xJ
Ql9JTlNUQUxMX1RBUkdFVCkseSkKPiArIyBkZWZpbmUgSU5URUxfU09DRlBHQV9IV0xJQl9JTlNU
QUxMX1RBUkdFVF9DTURTCj4gKyMgbWtkaXIgLXAgJChUQVJHRVRfRElSKS9saWIvZmlybXdhcmUv
aW50ZWwtdWNvZGUKPiArIyAkKElOU1RBTEwpIC1tIDA2NDQgLXQgJChUQVJHRVRfRElSKS9saWIv
ZmlybXdhcmUvaW50ZWwtdWNvZGUgXAo+ICsjICQoQEQpL2ludGVsLXVjb2RlLyoKPiArIyBlbmRl
Zgo+ICsjIGVsc2UKPiArIyBJTlRFTF9TT0NGUEdBX0hXTElCX0lOU1RBTExfVEFSR0VUID0gTk8K
PiArIyBlbmRpZgo+ICsKPiArIyBkZWZpbmUgSU5URUxfU09DRlBHQV9IV0xJQl9MSU5VWF9DT05G
SUdfRklYVVBTCj4gKyMgJChjYWxsIEtDT05GSUdfRU5BQkxFX09QVCxDT05GSUdfTUlDUk9DT0RF
KQo+ICsjICQoY2FsbCBLQ09ORklHX0VOQUJMRV9PUFQsQ09ORklHX01JQ1JPQ09ERV9JTlRFTCkK
PiArIyBlbmRlZgoKUGxlYXNlLCBkb24ndCBhZGQgY29tbWVuZGVkIGNvZGUuCgpCZXN0IHJlZ2Fy
ZHMsClJvbWFpbgoKCj4gKwo+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
