Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE71EC83F05
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3E3F83B07;
	Fri,  4 Jul 2025 06:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qjLtQsKCuIb; Fri,  4 Jul 2025 06:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D36FE83DA1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D36FE83DA1;
	Fri,  4 Jul 2025 06:46:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBE1A1EB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D195660B89
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmJNfNkLeTVw for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62c; helo=mail-ej1-x62c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E8F5360AF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8F5360AF5
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E8F5360AF5
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:46:54 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ae3be3eabd8so128319866b.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611613; x=1752216413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3vQLHCHuZ5UPU1VxPxAI0FwZjqjQ6v16bTXzQlOoQN0=;
 b=vxUYxvtC0mP+JCk0/iT3y5eBuMpu+KMxfmIkK9QvLqjVVrapxJHx9A0KHt1zVrfhN6
 VBrxvCJLMbQ24JMeGLDxFGkWw+dhah8QWuoAGAEklkhw819atR1Sqdooq8OUVQUkRXRJ
 u2OKM02WwMKfXCm7MzNbuG4SoUywZ7gVaw+a00FC5nGezw6TmzRBdSQx63Zxm3UIxs/0
 zikizW5p8mzTVIbpvsK6xtjZfPNff3MLWallKytRvbHFEZPX//qwOeh2cHylZHpCoKDT
 AkCO5AMV1cZQ1jIAfvB1RcqHaZmQUQaGhI+CTxY49ufmhESVzLU5qXA9Olin1dsSb5M3
 YRGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Yg+aoCJJxySroKtAWtOUX3CFoHJ8caLyR0c9PxgUe+vbwoHFXW6IFCOybJ1+HDNq4Q+9zipBC3M=@buildroot.org
X-Gm-Message-State: AOJu0YzQ6BT4IcESIDwUw/OAFvtbN/C8/eHeroGrsVi9XkJcnhm2yTqD
 z9SLWLvO2EB0OyVLb2YUvHvVCVZvQMjownD8Kkuz3j8OgTlPsirQUkR+qeKeYn2cAxs=
X-Gm-Gg: ASbGncsTj4hGK4ES+v4uEnvTd3NNdODa+/r3+fhCPPqZrQhnG2Qw3/0UblsFQ+YXu2m
 y2QZ2zbi+o5i6aCK/iMHLSufN78BAHo5g46adajM73hDpN9Vz7akXuRUj8E/JiNEhOxkGyraoVz
 0/Dkf+kKJXD0vlKP+aKSFoVKIBLVNRj4HAu2xY8LZlJNYm5X/9phps5TzYDt22NaLTWrvJKYpQt
 0TL6zKAgoi6m4OWGVVSlHsvtJShFHX3aoJvqZnSreLuLtMVDZG27P9QCEkc1hrddZLtP3yI/pM+
 e/aMunDlSW2WkrHUWeYTOuwWV25wyP5KL77ASzk9UjgX8meohxoYG2jQZu2WNFemuB0dPx+GrPD
 pfquco7WcSlZHGu82IbuD
X-Google-Smtp-Source: AGHT+IHvt/e2U0U9qssLNGIfBkkwApgfD5FzLlMOMbuosTuCX+9SFNhwTquqz4FJvd165cSGN1wDZA==
X-Received: by 2002:a17:907:1c8e:b0:ae0:a245:2ff4 with SMTP id
 a640c23a62f3a-ae3f9963351mr185173866b.0.1751611613008; 
 Thu, 03 Jul 2025 23:46:53 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b6a5f0sm111323866b.169.2025.07.03.23.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:46:52 -0700 (PDT)
To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:46:50 +0200
Message-ID: <20250704064651.4064184-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624122048.946492-1-raphael.melotte@mind.be>
References: <20250624122048.946492-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611613; x=1752216413; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3vQLHCHuZ5UPU1VxPxAI0FwZjqjQ6v16bTXzQlOoQN0=;
 b=eAvgmzvdlcrKDHLQ0KlCPTNE3kqKL31koVFKHQVV/lIC4bPzy3JII3+tnHLbAb6D9H
 W57d/gYL0rQcVgkddITSGHHAFfgOz4DoMmtjJowrt4+w+k1Zy/7PhjD87Cene9i90BHR
 /7ZY9XylhZpoiNDzJXrYtP96dMAfsZWVDAG6lcquC3V3yg8w4CMbDgeFmjFcO6Zz5Oqv
 1PCXPT23I7jna6St1ULqtVblgYMtmFP++HZh9CBLWLSTgOPdgelg8zLQe9qxrElGZxMV
 oERPkUFHxxMYge2AtjbplpEzfjiFYxHYCjFiFVQPV/R1YJq1qBJqa1CNfN9TWOBy24Dw
 lTCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eAvgmzvd
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
dGVAbWluZC5iZT4KCkFwcGxpZWQgdG8gMjAyNS4wMi54LiBUaGFua3MKCj4gLS0tCj4gIHBhY2th
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
