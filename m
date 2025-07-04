Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F629C83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:48:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55889820A1;
	Fri,  4 Jul 2025 06:48:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_SFNCHb6wi2; Fri,  4 Jul 2025 06:48:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 707D580EBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 707D580EBF;
	Fri,  4 Jul 2025 06:48:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD0147AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2E0282098
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5t5osptLWWX for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:48:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C75B5820A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C75B5820A1
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C75B5820A1
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:48:11 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso5740995e9.3
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611690; x=1752216490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6crcP9aCuPiMatGyDVYDht5ngRISYmkaYcEeXQaKks=;
 b=Sx1fwskMddG4V8E2sb2iwHdCT3yQSnpVL1oj8kgKgY+mI2N/YFXZRpzuJycXinG87n
 u9EondaSeWxIQnCi65hRczCJDgAnK8XVkGiezvHDscbTZff8YSg2MHnmqw4UM5XrmnE7
 wig6MERfpuufiQDfQCPO5zrMNynigWlo+WciTQBZjtc6uiF1SpUVqk55a0UO/CweNzYU
 8IGZJsdMJqfvwx/hjUeEuEz+nx8icFj9wEcEOI1RxRql7+4RAZN3luCkdS5IFe9VST71
 2TI9nK6fHrg/p1hqsHfPVvJH1dSg+VOqFm6J4FVkaRBpKkvG6JKl0Vdbea6pDORUkXfA
 rYnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuoIKdvOxB6d/unuubIztD/HMK1vrrqEXUfo1r6m9m87l14/s99dUdTDhe5h4HmgSrlTMuimS4YNg=@buildroot.org
X-Gm-Message-State: AOJu0Yxk4xk3XnvGupt2y8fFgorUELbLneNMsUs1vJAFlgHJzuqfDVnZ
 rz2nzRqHODsbolCDkmn6QR9B24BXM9ILZB7YsGZP6A9vBzGQW9jI2NoTDFv/Trh8gwObALzaoM0
 6KTIb
X-Gm-Gg: ASbGncsOALU+VPlhlbAJtl24mxD4g6qSSc0UI8rmObrMPaU8j8Eibx9+O9E/pUrQpBH
 jTOEQNoYKrYOJIUBAOoByeicx1YSLVRVLbhqBLZgXOY4pO0xaq2ukBfpUNRQkXNEBywawBXrnHU
 e9l3CtZ2kiDYq2oZsC6Es/K2f0s0HpYrOpVqSHtucyWq7ECo3q94jqcJ0QbHzLzPS7RZ6L3+9si
 jYgJBGppTsl/Vw7G6qrSohsLePWt2mJJnkBNFMVZtrK+v1BfjXCy8JQmOvpNieaGVUzibt8CNor
 feDpwIUSq3nIM87qK+OMxWXR/fPkR3/zKTH2f/rlHDJlLKe6v4kDI0XCPuBCjIa9AGRHqP8pg4T
 D2VXRhxiDzw==
X-Google-Smtp-Source: AGHT+IFaIuYcqva/YjWGJAZCXZfuOijU3NP9NnlL9ZRiorslsT7vs3lTQzUpIi3F3ztUbxGHdM0lLQ==
X-Received: by 2002:a05:600c:3ba5:b0:43d:4686:5cfb with SMTP id
 5b1f17b1804b1-454b3b8a45emr9265635e9.27.1751611689867; 
 Thu, 03 Jul 2025 23:48:09 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bcececsm46504755e9.23.2025.07.03.23.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:48:09 -0700 (PDT)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:48:04 +0200
Message-ID: <20250704064808.4065468-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624122048.946492-1-raphael.melotte@mind.be>
References: <20250624122048.946492-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611690; x=1752216490; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w6crcP9aCuPiMatGyDVYDht5ngRISYmkaYcEeXQaKks=;
 b=PUmJjIF919yUfHMuKi5qugzyEbUq9zg9TRmCStWlDzW7WNlNInmgFNbJ9dGiHa2D0V
 Z4RthrYI++Pxm/c8KUGMbPDrATyg8cl/etEpAPnmY0bmpct97nYHG2w6DU2FhMO3Nias
 6aaNdRIYy168ceZNBC0WQVH7DmSmGqsmVtQfnHyrRzD/P/o4vYgDNLr8gWi/EG24h8oY
 JpJuvYZQfZAY96JIRt99N/4T+zM7trA+CAA+WaoIR65pKcVej6KlsFF8zpH6Wm1dh09k
 KGqVJ9/hkPY6WWhYn0ugJ3rW6gZWkCJmyqah+IUImQfG2ZpYc9sXq2PLRHe/nAHSmOxh
 iOUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=PUmJjIF9
Subject: Re: [Buildroot] [PATCH 1/2] package/nginx-modsecurity: update
 upstream URLs
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

SW4gcmVwbHkgb2Y6Cj4gJ2h0dHBzOi8vZ2l0aHViLmNvbS9TcGlkZXJMYWJzL01vZFNlY3VyaXR5
LW5naW54JyBub3cgcmVkaXJlY3RzIHRvCj4gJ2h0dHBzOi8vZ2l0aHViLmNvbS9vd2FzcC1tb2Rz
ZWN1cml0eS9Nb2RTZWN1cml0eS1uZ2lueCcsIHNvIHVwZGF0ZSBvdXIKPiBVUkxzIGFjY29yZGlu
Z2x5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90
dGVAbWluZC5iZT4KCkFwcGxpZWQgdG8gMjAyNS4wNS54LiBUaGFua3MKCj4gLS0tCj4gIHBhY2th
Z2UvbmdpbngtbW9kc2VjdXJpdHkvQ29uZmlnLmluICAgICAgICAgICAgICB8IDIgKy0KPiAgcGFj
a2FnZS9uZ2lueC1tb2RzZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5oYXNoIHwgMiArLQo+ICBw
YWNrYWdlL25naW54LW1vZHNlY3VyaXR5L25naW54LW1vZHNlY3VyaXR5Lm1rICAgfCAyICstCj4g
IDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL25naW54LW1vZHNlY3VyaXR5L0NvbmZpZy5pbiBiL3BhY2thZ2Uv
bmdpbngtbW9kc2VjdXJpdHkvQ29uZmlnLmluCj4gaW5kZXggMGJiZjA1ZmFkOS4uOTRmMGZmMGE0
NSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL25naW54LW1vZHNlY3VyaXR5L0NvbmZpZy5pbgo+ICsr
KyBiL3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvQ29uZmlnLmluCj4gQEAgLTEwLDcgKzEwLDcg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX05HSU5YX01PRFNFQ1VSSVRZCj4gIAkgIHBvaW50IGJldHdl
ZW4gbmdpbnggYW5kIGxpYm1vZHNlY3VyaXR5Cj4gIAkgIChNb2RTZWN1cml0eSB2MykuCj4gIAo+
IC0JICBodHRwczovL2dpdGh1Yi5jb20vU3BpZGVyTGFicy9Nb2RTZWN1cml0eS1uZ2lueAo+ICsJ
ICBodHRwczovL2dpdGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJpdHktbmdpbngK
PiAgCj4gIGNvbW1lbnQgIm5naW54LW1vZHNlY3VyaXR5IG5lZWRzIGEgdG9vbGNoYWluIHcvIEMr
KywgdGhyZWFkcywgZHluYW1pYyBsaWJyYXJ5Igo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9O
R0lOWF9IVFRQCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvbmdpbngt
bW9kc2VjdXJpdHkuaGFzaCBiL3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvbmdpbngtbW9kc2Vj
dXJpdHkuaGFzaAo+IGluZGV4IDY5OGRiYzdkYTYuLjM0ZTdiODdmNDEgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9uZ2lueC1tb2RzZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5oYXNoCj4gKysrIGIv
cGFja2FnZS9uZ2lueC1tb2RzZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5oYXNoCj4gQEAgLTEs
NCArMSw0IEBACj4gLSMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vU3BpZGVyTGFicy9Nb2RTZWN1
cml0eS1uZ2lueC9yZWxlYXNlcy9kb3dubG9hZC92MS4wLjMvbW9kc2VjdXJpdHktbmdpbngtdjEu
MC4zLnRhci5nei5zaGEyNTYKPiArIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9vd2FzcC1tb2Rz
ZWN1cml0eS9Nb2RTZWN1cml0eS1uZ2lueC9yZWxlYXNlcy9kb3dubG9hZC92MS4wLjMvbW9kc2Vj
dXJpdHktbmdpbngtdjEuMC4zLnRhci5nei5zaGEyNTYKPiAgc2hhMjU2ICBhZTgxMWM3MjA4YWMw
MjljYjdhOTlkNmY2M2UwM2QzOTcxNzk3NjA3NTE3MTg3ZjQ3NjIwZGYzOWMxZjc4YWRkICBtb2Rz
ZWN1cml0eS1uZ2lueC12MS4wLjMudGFyLmd6Cj4gICMgTG9jYWxseSBjYWxjdWxhdGVkCj4gIHNo
YTI1NiAgYzcxZDIzOWRmOTE3MjZmYzUxOWM2ZWI3MmQzMThlYzY1ODIwNjI3MjMyYjJmNzk2MjE5
ZTg3ZGNmMzVkMGFiNCAgTElDRU5TRQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25naW54LW1vZHNl
Y3VyaXR5L25naW54LW1vZHNlY3VyaXR5Lm1rIGIvcGFja2FnZS9uZ2lueC1tb2RzZWN1cml0eS9u
Z2lueC1tb2RzZWN1cml0eS5tawo+IGluZGV4IGEwMGMyMDA0NjkuLjQyYTUwY2EzOWYgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9uZ2lueC1tb2RzZWN1cml0eS9uZ2lueC1tb2RzZWN1cml0eS5tawo+
ICsrKyBiL3BhY2thZ2UvbmdpbngtbW9kc2VjdXJpdHkvbmdpbngtbW9kc2VjdXJpdHkubWsKPiBA
QCAtNiw3ICs2LDcgQEAKPiAgCj4gIE5HSU5YX01PRFNFQ1VSSVRZX1ZFUlNJT04gPSAxLjAuMwo+
ICBOR0lOWF9NT0RTRUNVUklUWV9TT1VSQ0UgPSBtb2RzZWN1cml0eS1uZ2lueC12JChOR0lOWF9N
T0RTRUNVUklUWV9WRVJTSU9OKS50YXIuZ3oKPiAtTkdJTlhfTU9EU0VDVVJJVFlfU0lURSA9IGh0
dHBzOi8vZ2l0aHViLmNvbS9TcGlkZXJMYWJzL01vZFNlY3VyaXR5LW5naW54L3JlbGVhc2VzL2Rv
d25sb2FkL3YkKE5HSU5YX01PRFNFQ1VSSVRZX1ZFUlNJT04pCj4gK05HSU5YX01PRFNFQ1VSSVRZ
X1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vb3dhc3AtbW9kc2VjdXJpdHkvTW9kU2VjdXJpdHkt
bmdpbngvcmVsZWFzZXMvZG93bmxvYWQvdiQoTkdJTlhfTU9EU0VDVVJJVFlfVkVSU0lPTikKPiAg
TkdJTlhfTU9EU0VDVVJJVFlfTElDRU5TRSA9IEFwYWNoZS0yLjAKPiAgTkdJTlhfTU9EU0VDVVJJ
VFlfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAgTkdJTlhfTU9EU0VDVVJJVFlfREVQRU5ERU5D
SUVTID0gbGlibW9kc2VjdXJpdHkKPiAtLSAKPiAyLjQ5LjAKPiAKPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
