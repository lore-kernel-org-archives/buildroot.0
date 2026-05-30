Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B49CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 20:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF106F5EB;
	Sat, 30 May 2026 20:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nz8A7FXe0WXR; Sat, 30 May 2026 20:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF3A617AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780174038;
	bh=b5wiF7cKOVo3d4SKeLx9zptD8aMl9yX+hqctDIiRo+Q=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=GtpEBn3buwZXU6ujL/FC4zg+8auGODccFwkBGlByXo1pO1OdL5Vw9TqJSZCMfRDjP
	 Gcu1MVZ+6mRxb5hvPfRv3curfvkRcEYJu9vXR2E8dZ4U0nTZNyjkSTiTWmyz2iFMcq
	 ctXgrQkInAUaEn2P3Qz20es7v0YwxIzfIzAEGhoOMHP1lRQMx79FcjcbEQpoE6S2Y/
	 P1LoCAkWTD/e8jZ4BFLARpY75nkR/uxY0ocq6LKZl/d8cVqYFeVVuts02mGC5snRWI
	 TLvdpliqHtXzUVjL41IqeLJcABRLRBxaZY0i3uS1js4fwRwxwqY6P13lcD+vmGII3X
	 0FjbcajODnJ3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF3A617AE;
	Sat, 30 May 2026 20:47:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E81812F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4487D61090
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXqHuuMFiNRc for <buildroot@buildroot.org>;
 Sat, 30 May 2026 20:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 541F0617AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 541F0617AE
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 541F0617AE
 for <buildroot@buildroot.org>; Sat, 30 May 2026 20:47:16 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45ef616daf6so1361486f8f.3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 13:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780174034; x=1780778834;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RI0290iOy8gep15YUXteTZx0H5SAnte8gN+Mvn75aH0=;
 b=CARCUtkDLYA9Tjshvu2nx5WMQchc6tgcPmgeMwJfQwmTyOSin5wA8WtLLXeH0gMghm
 WaJfshGckudD8xjFNET8bmrxmoGxUSqz++rUtPtfs9TbspQcNbeOi+XgRpBUGODQjj9S
 7HDm/CIFB5etdhNRT2Jx+8HdGzHIVAQZguegrZdYy/qLh4uC6aPzEL4rnJ1TSzsyFmr6
 /yqymAmuwXBjlIQM95VDVL+HdmOYdfgwVUv2OU0rmd0lnNLkH+OzRjMQd4cd0weZKjhW
 CJBJsAt/YFPm4N8xtQ1/+T9r/tuxm08jMsfnr+Sgo5fuqskSzUluvkca2W/je6i4cizw
 Xjzw==
X-Forwarded-Encrypted: i=1;
 AFNElJ836PCXshOEzxp8XHIoX05tsaa8jqT8Stm/4gH5eSs8ZnjbEL8tyzTlqIHKc8MfOPwqGkT9TF2lmLQ=@buildroot.org
X-Gm-Message-State: AOJu0YzRSrEm+gma+Cq/xqxEa0kmdBFwjxjDzvxBTLs8zqjYCh/hRevc
 GjunGaDOGDXzxZcL9nw45ckdfsb6S0mecVv0QnZ6OEX+8YQB0zpwHD/loZ2zsADeKaM=
X-Gm-Gg: Acq92OGNVe2XRf1XX5JiDWdi1ynPdPVuK7m534fNXjmQ6dNYXGlglllBeC7kvKUVu60
 NMkmYkjk5upfpN3qubTB072u2brGscix539EP93/85CM+s922LIPd8x0N27c3nb2IU4bsdfsCOB
 lHbwpbjfbRFNC2OKx3/emCnnAoZpGBjXOIbR8vdEZ/TsA4695rmV0tnEhkYPippymoyvuI04ylZ
 rgz9UEQOVtCl6Us+HFsTRFbsf7PifukCHk3aAlkjmTinBa3a7S0cXPb8To0l1tC0MwFTzH38XI4
 i2m+KR6v+STzCsZJrIhOBeEYuEUkmXu9QE7PlXSIajyUakxM2sU3ne7UwmjlHpED7xow/MN5jg7
 YsDQgCC4hYalEX1cgHapxph6Ur84YfQ8MBs7UNvif6UdaiQ24Et0gDzMWkze+iN+aAkHlYGP282
 bDX0qZ2a6DySFLOjL8RcsZ36go1HJgAp88DG/YDiAQg0PZswOLQGN3uTiZxYSX0G4qY/H8Q16Bt
 2eNTcnJlyMDzNETrxoCAs0HE08gZNPStoQaZkmZYSp0FTx5a0DqbXf5nbvmRwsk9KhrXDQnpokr
X-Received: by 2002:a5d:4583:0:b0:45e:651c:47bb with SMTP id
 ffacd0b85a97d-45ef6b7608bmr6126252f8f.28.1780174034148; 
 Sat, 30 May 2026 13:47:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a03f8sm13800674f8f.7.2026.05.30.13.47.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 May 2026 13:47:13 -0700 (PDT)
Message-ID: <b6d17dd9-848f-4414-9494-899ac5582761@smile.fr>
Date: Sat, 30 May 2026 22:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, buildroot@buildroot.org
References: <20260530203544.1383862-1-arnout@rnout.be>
Content-Language: fr
In-Reply-To: <20260530203544.1383862-1-arnout@rnout.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1780174034; x=1780778834; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RI0290iOy8gep15YUXteTZx0H5SAnte8gN+Mvn75aH0=;
 b=h74MQgwhhwimoGUPzvdobYkyzMgE51GtpFEL48uAt+fB3AMY+YQnIAv3cKKsNVECPg
 A86YPBXzarlvMPEqQUBcP3l1SVRMtOrkUwG8VV9r/jvayDaIz9WWYbEKhnQrrSGgmrZx
 AAo13sfKPe1crc3jSciBJ++vWiGaRnJmrqMGc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=h74MQgwh
Subject: Re: [Buildroot] [PATCH] support/scripts/generate-gitlab-ci-yml: use
 large runners for defconfigs
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

SGVsbG8gQXJub3V0LCBBbGwsCgpMZSAzMC8wNS8yMDI2IMOgIDIyOjM1LCBBcm5vdXQgVmFuZGVj
YXBwZWxsZSBhIMOpY3JpdMKgOgo+IGRlZmNvbmZpZ3MgYXJlIHZlcnkgdW5saWtlbHkgdG8gc3Vj
Y2Vzc2Z1bGx5IGJ1aWxkIG9uIGEgc21hbGwgcnVubmVyCj4gYmVjYXVzZSB0aGV5IGJ1aWxkIGEg
a2VybmVsIChhbmQgb2Z0ZW4gYSB0b29sY2hhaW4pLiBUaGV5J3JlIGFsc28gbGlrZWx5Cj4gdG8g
YmVuZWZpdCBhIGxvdCBmcm9tIHRoZSBhZGRpdGlvbmFsIHBhcmFsbGVsaXNtIG9uIGxhcmdlciBy
dW5uZXJzLgo+IAo+IEZvciBub3csIGFsd2F5cyBidWlsZCB0aGVtIG9uIGxhcmdlIHJ1bm5lcnMu
IFRoZXJlIG1heSBiZSBzb21lIGZvciB3aGljaAo+IGV2ZW4gdGhlIGxhcmdlIHJ1bm5lcnMgZG9u
J3QgaGF2ZSBzdWZmaWNpZW50IGRpc2sgc3BhY2Ugb3IgbWVtb3J5LCBidXQKPiB3ZSdsbCBzb2x2
ZSB0aGF0IHdoZW4gaXQgaGFwcGVucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBcm5vdXQgVmFuZGVj
YXBwZWxsZSA8YXJub3V0QHJub3V0LmJlPgo+IC0tLQo+ICBzdXBwb3J0L3NjcmlwdHMvZ2VuZXJh
dGUtZ2l0bGFiLWNpLXltbCB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3N1cHBvcnQvc2NyaXB0cy9nZW5lcmF0
ZS1naXRsYWItY2kteW1sIGIvc3VwcG9ydC9zY3JpcHRzL2dlbmVyYXRlLWdpdGxhYi1jaS15bWwK
PiBpbmRleCAyYThjOWJlNWY1Li4wMGNhODI2MjI4IDEwMDc1NQo+IC0tLSBhL3N1cHBvcnQvc2Ny
aXB0cy9nZW5lcmF0ZS1naXRsYWItY2kteW1sCj4gKysrIGIvc3VwcG9ydC9zY3JpcHRzL2dlbmVy
YXRlLWdpdGxhYi1jaS15bWwKPiBAQCAtMTIwLDcgKzEyMCw3IEBAIGdlbl90ZXN0cygpIHsKPiAg
Cj4gICAgICBpZiAke2RvX2Jhc2ljczotZmFsc2V9OyB0aGVuCj4gICAgICAgICAgZm9yIHRzdCBp
biAiJHtiYXNpY3NbQF19IjsgZG8KPiAtICAgICAgICAgICAgcHJpbnRmICdjaGVjay0lczogeyBl
eHRlbmRzOiAuY2hlY2stJXNfYmFzZSB9XG4nICIke3RzdH0iICIke3RzdH0iCj4gKyAgICAgICAg
ICAgIHByaW50ZiAnY2hlY2stJXM6IHsgZXh0ZW5kczogWyAuY2hlY2stJXNfYmFzZSwgLnJ1bm5l
ci1sYXJnZSBdIH1cbicgIiR7dHN0fSIgIiR7dHN0fSIKPiAgICAgICAgICBkb25lCj4gICAgICBm
aQo+ICAKCmRvX2Jhc2ljcyBhcmUgY2hlY2twYWNrYWdlIGZsYWtlOCBqb2JzIHJ1biBvbiBlYWNo
IGdpdCBwdXNoLgoKZGVmY29uZmlncyBqb2JzIGFyZSBnZW5lcmF0ZWQgYnkgdGhlIGRvX2RlZmNv
bmZpZ3MgcGFydDoKCiAgICBpZiBbIC1uICIke2RvX2RlZmNvbmZpZ3N9IiBdOyB0aGVuCiAgICAg
ICAgZm9yIGNmZyBpbiAiJHtkZWZjb25maWdzW0BdfSI7IGRvCiAgICAgICAgICAgIHByaW50ZiAn
JXMlczogeyBleHRlbmRzOiAuZGVmY29uZmlnXyVzIH1cbicgXAogICAgICAgICAgICAgICAgICAg
IiR7Y2ZnfSIgIiR7ZGVmY29uZmlnc19leHR9IiAiJHtkb19kZWZjb25maWdzfSIKICAgICAgICBk
b25lCiAgICBmaQoKQmVzdCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
