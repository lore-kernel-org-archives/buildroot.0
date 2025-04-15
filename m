Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19746C369BD
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 15:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADB338145B;
	Tue, 15 Apr 2025 15:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vy8o024ZSVOg; Tue, 15 Apr 2025 15:31:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A9F83870
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1A9F83870;
	Tue, 15 Apr 2025 15:31:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EA76445
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74B4A60BB3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKtMxN32L2l0 for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 15:31:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 393B060715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 393B060715
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 393B060715
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 15:31:37 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3912622c9c0so416845f8f.3
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 08:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744731095; x=1745335895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k6DRtKQfnrxX9g7I5+Kpx5XpcOj/sanmo6t8rjkoLi0=;
 b=cglU2V+Q4xAnzDRnoKJcaYDNxm/P+zV402DTIb1Qo1jMC9AfS+SoZveFSeQg7MDsra
 /gl5Xwd7KzeidkAiEbMg0+6V966JmxFEA0156FEu/ORTpyrSOsE6tO3b2Qu89tWtwj+u
 oFwDT9MG4hCSfIfAfcwC0vhAgsas2cLHLgCnnXAJM64xgB8FxAiN7u+ZnWJIgyNq7Wxo
 YuBjP80WarDS4LAEMC7BzcSu1bF+ZU9Rst4QHlS2qSbRjMhwC1BW3zl92kwfpFRCTyt3
 M8pwkQCqJJduQXgW4riZ+EyO1soEloTIVAMtFN5Rc5Vjrk+c4P/1/yoldBteUit7166u
 H9mg==
X-Gm-Message-State: AOJu0YzO5kXWXXu28iVMhD3mcuSwUQAzDwrIrDIQtzQIiLQepuXmqgrD
 Jk8bYJMySepACHRONmQd9RbO7shUlNxAiPcQQFIWUM2LkyPtiDhp3x/ln8Df
X-Gm-Gg: ASbGncsJh2y3822x9ndKT0XUNilYH4MaAmSwzU0KxDpXw2QnHo7mpY2/PaufsDY8dnE
 TzB50F5QEOErLREQ0H89QIrEUiYRDK2rwTNOiyObJO66rfEtrSavsHtPXX+IFa9fslepdo3ZUAy
 3jAICtdltuoeee6Tga0pqf4K9tvP0cRnPgDdZf/cFpM/0Dv2h2k10CEjsGBF3trb3s8Rh/K3tAb
 yvciFd2jjppJZpUnPuLLm6bzBzIHKRw7ppHiKzHRMXi6pMObVYiR3CwrIongxQZUxuEVwQQSdWA
 CIuZ5N+nByFxtUC4++zHR2QuoQ2mWYoODfQOKm75XdmEtxOaag4=
X-Google-Smtp-Source: AGHT+IFTYsAXHepuQD1Tecibppi4LQowZsu8tQ4osGOrm9BUiGHQjCcBYqYek7b5T/pC1wm39ZFF9Q==
X-Received: by 2002:a5d:6da8:0:b0:38f:27d3:1b44 with SMTP id
 ffacd0b85a97d-39ea51eff74mr4352558f8f.2.1744731094734; 
 Tue, 15 Apr 2025 08:31:34 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae963fccsm14458950f8f.3.2025.04.15.08.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 08:31:34 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Date: Tue, 15 Apr 2025 17:31:23 +0200
Message-ID: <20250415153127.1868025-2-gael.portay+rtone@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
References: <20250415153127.1868025-1-gael.portay+rtone@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744731095; x=1745335895; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k6DRtKQfnrxX9g7I5+Kpx5XpcOj/sanmo6t8rjkoLi0=;
 b=eX+Num2BqTz/2arUbo7CGAW5PENeFFIX5Qtj8CrVGaVYsIjDj4MJ/CXX9ZaJburh20
 0vwkvoA/CHV4vnmX8vGpBSwPp0rvXIZW0HoJhgK1MnssUW5zY2k7rOylk3PSwVYMcQli
 0XUUD5tQJcARh92vz4jRYgSnYG5xpPSVoRL/hfBwqBYFmnGLxycFV+DK6TjjZi7dUirL
 3AcVDchyC9U+NYHenZMjNxty5gGJGDIihUXGgo8wJVcUabhGBM/NnQT+CBEUrBEAlrZH
 nPL/Xv1ZrpY6lEeYQf0H1rwpIl575WNcY/MZND4MBBj8ybcWsRyB3QDo4zznTdhWDPZi
 F+MA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=eX+Num2B
Subject: [Buildroot] [PATCH 2/6] board/raspberrypi/readme.txt: reword
 overlays note
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

QW55IFJhc3BiZXJyeSBQaSBtYXkgdXNlIGRldmljZS10cmVlIG92ZXJsYXlzOyBpdCBpcyBub3Qg
cmVzdHJpY3RlZCB0bwpSYXNwYmVycnkgUGkgMyBhbmQgNC4KClRoZSBkZWZjb25maWdzIGZvciB0
aGUgUmFzcGJlcnJ5IFBpIDMsIDQsIDQwMCwgWmVybyBXLCBaZXJvIDIgVywgQ29tcHV0ZQpNb2R1
bGUgNCBhbmQgNHMgdXNlIHRoZSBtaW5pdWFydC1idCBkdG92ZXJsYXkgdG8gc3dpdGNoIHRoZSBC
bHVldG9vdGggdG8KdGhlIG1pbmktVUFSVCAodHR5UzApIGFuZCByZXN0b3JlIFVBUlQwICh0dHlB
TUEwKSBvdmVyIEdQSU9zIDE0IGFuZCAxNQp0byBlbmFibGUgdGhlIHNlcmlhbCBjb25zb2xlIChs
aWtlIHRoZSBSYXNwYmVycnkgUGkgMSBhbmQgMiB0aGF0IGhhdmUgbm8KQmx1ZXRvb3RoKVsxXVsy
XS4KCkFzIGEgY29uc2VxdWVuY2UsIHRoZSBSYXNwYmVycnkgUGkgWmVybyBXLCBaZXJvIDIgVywg
NDAwLCBDb21wdXRlIE1vZHVsZQo0IGFuZCA0cyBpbnN0YWxsIHRoZSBkZXZpY2UtdHJlZSBvdmVy
bGF5cyBhcyB3ZWxsLgoKVGhpcyByZXdvcmRzIHRoZSBub3RlIGJ5IGFkZGluZyB0aGUgdGhyZWUg
bWlzc2luZyBoYXJkd2FyZXMgaW5zdGFsbGluZwp0aGUgaW1hZ2VzL3JwaS1maXJtd2FyZS9vdmVy
bGF5cyBkaXJlY3RvcnkuIEl0IHJld29yZHMgdGhlIG1pbml1YXJ0IG5vdGUKYXQgdGhlIHNhbWUg
dGltZS4KClsxXTogaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2RvY3VtZW50YXRpb24vY29t
cHV0ZXJzL2NvbmZpZ3VyYXRpb24uaHRtbCN1YXJ0cy1hbmQtZGV2aWNlLXRyZWUKWzJdOiBodHRw
czovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvYmxvYi9ycGktNi42LnkvYXJjaC9hcm0v
Ym9vdC9kdHMvb3ZlcmxheXMvbWluaXVhcnQtYnQtb3ZlcmxheS5kdHMjTDQtTDYKClNpZ25lZC1v
ZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXkrcnRvbmVAZ21haWwuY29tPgotLS0KIGJv
YXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNw
YmVycnlwaS9yZWFkbWUudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAppbmRleCA1
ZjZiMWMzZTdkLi4wZjNlYzlkOGJiIDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFk
bWUudHh0CisrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKQEAgLTEzMSwxMCArMTMx
LDExIEBAIEFmdGVyIGJ1aWxkaW5nLCB5b3Ugc2hvdWxkIG9idGFpbiB0aGlzIHRyZWU6CiAgICAg
UGkgNCwgNDAwLCA1IGFuZCB0aGUgQ29tcHV0ZSBNb2R1bGUgNCwgNHMgYW5kIDUgbG9hZCB0aGUg
c2Vjb25kIHN0YWdlCiAgICAgYm9vdGxvYWRlciBmcm9tIGEgU1BJIGZsYXNoIEVFUFJPTS4KIAot
WzNdIE9ubHkgZm9yIHRoZSBSYXNwYmVycnkgUGkgMy80IE1vZGVscyAob3ZlcmxheSBtaW5pdWFy
dC1idCBpcyBuZWVkZWQKLSAgICB0byBlbmFibGUgdGhlIFJQaTMgc2VyaWFsIGNvbnNvbGUgb3Ro
ZXJ3aXNlIG9jY3VwaWVkIGJ5IHRoZSBibHVldG9vdGgKLSAgICBjaGlwKS4gQWx0ZXJuYXRpdmUg
d291bGQgYmUgdG8gZGlzYWJsZSB0aGUgc2VyaWFsIGNvbnNvbGUgaW4gY21kbGluZS50eHQKLSAg
ICBhbmQgL2V0Yy9pbml0dGFiLgorWzNdIE9ubHkgZm9yIHRoZSBSYXNwYmVycnkgUGkgaW5zdGFs
bGluZyBkZXZpY2UtdHJlZSBvdmVybGF5cy4gVGhlIFJhc3BiZXJyeSBQaQorICAgIHdpdGggQmx1
ZXRvb3RoIGNvbm5lY3Rpdml0eSAoWmVybyBXLCBaZXJvIDIgVywgMywgNCwgNDAwLCBDb21wdXRl
IE1vZHVsZSA0CisgICAgYW5kIDRzKSB1c2UgdGhlIG1pbml1YXJ0LWJ0IG92ZXJsYXkgdG8gZW5h
YmxlIFVBUlQwIGZvciB0aGUgc2VyaWFsIGNvbnNvbGU7CisgICAgdGhlIEJsdWV0b290aCB1c2Vz
IHRoZSBtaW5pLVVBUlQgaW5zdGVhZC4gQWx0ZXJuYXRpdmUgd291bGQgYmUgdG8gZGlzYWJsZQor
ICAgIHRoZSBzZXJpYWwgY29uc29sZSBpbiBjbWRsaW5lLnR4dCBhbmQgL2V0Yy9pbml0dGFiLgog
CiBIb3cgdG8gd3JpdGUgdGhlIFNEIGNhcmQKID09PT09PT09PT09PT09PT09PT09PT09PQotLSAK
Mi40OS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
