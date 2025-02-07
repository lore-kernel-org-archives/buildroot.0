Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09A5C02196
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 10:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E1574297B;
	Fri,  7 Feb 2025 10:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggvs24NxTp5g; Fri,  7 Feb 2025 10:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B27A42980
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B27A42980;
	Fri,  7 Feb 2025 10:14:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6022EC0
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 10:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4FDCA608DA
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 10:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9ECauyOjsf0 for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 10:14:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=gael.portay+rtone@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C050608B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C050608B4
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C050608B4
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 10:14:38 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4363298fff2so983685e9.3
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 02:14:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738923277; x=1739528077;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:sender:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mJWdHwQXhda7DARelwRLNjZNn41kEwaIkeE4wrzsSsI=;
 b=fyt9fn8kEnpaupKZw9RcC6rN6VHVUNEMZAY0IqblnlN4W6xcoB2ApoLHCjVAjPvp4d
 luYbuMdBa0KKWxIZjoaysVbWY8YrEUcn9YwXlk2s9hPZnsx4zGRJFVR8zQmLNiS7TdyO
 zsKe4jgNseSC8dTgRXyudpT2CX3Sf3HDpAMvzkYePTlabBV8CHPQX8Am2TKI0CHSV/nk
 /JFu+JOGzaCEO4+I3G7NRwcObqrsV35wHywEtuoJBFhvZx0aehaNB5d7o91hpTNlForQ
 gqX4rlvBxqWPbUrrgfpmmlcXOi6sIR6BFsDnSLGPdvy2VVrN+p6EjqVfHAgOceWA9r7/
 OfHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvDOh9ESOCrXDkXU8h+GEbuw8P2L7MOex0bUs7SU568OtAH8ux3duAYSAEl7Y6SRSrr0XlCt3lzXo=@buildroot.org
X-Gm-Message-State: AOJu0Yw90HDnH0YptuVrNOtmXCf0Hq+bMjMa0Ky95+DTrYELtAn5/xF/
 AnUh8vfcTkEvi+kC8EixnkOS27zFtIiqRVy2h/y2An4WdV9ZnqMF
X-Gm-Gg: ASbGncuIefl6Ci/STUdjcAspIKC1K2dzGKCfVaaa0UkO/Whp3zor3c3rU/9c3uJnWwH
 yjqcgL5A3j/eyBWa24SSEXAyZwslVm995VWgIGFq9SKL065l6ama339TSEyassqy5a9V64b0dc4
 a6LL4HTtWExy8OA/F9Ami3eIaee3bVLAFoQmqQpV857qsvIo4LRjV//VkJQpIsg4bN35CQPmIOH
 5BKJD20w2cPae+CIaeWwbWxcaxshuFoqa8NpSvPbjLbpQDvhlwlDUODBAzxXieF+x+wWk52d/oW
 hr+lqdwnuYRlgjQQqPl0yOU=
X-Google-Smtp-Source: AGHT+IGAYrSj52+UJepupaSCGaviCVMhk/GM9cis+1glI6JC4+Ssvcuc+NorHvmu7Vrq1tbn60YMRA==
X-Received: by 2002:a05:600c:548b:b0:436:1ada:944d with SMTP id
 5b1f17b1804b1-43924b54b63mr8607395e9.4.1738923276718; 
 Fri, 07 Feb 2025 02:14:36 -0800 (PST)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbdd7f18bsm4125839f8f.60.2025.02.07.02.14.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 02:14:36 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 07 Feb 2025 11:14:35 +0100
Message-Id: <D7M4USL2KEM9.3MZ9W5ZLL5HOW@gmail.com>
Cc: =?utf-8?q?Jos=C3=A9_Mendes?= <jp.baltazar.mendes@gmail.com>, "Martin
 Bark" <martin@barkynet.com>, "Julien Grossholtz"
 <julien.grossholtz@openest.io>, "Yann E . MORIN" <yann.morin.1998@free.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
To: "Fiona Klute" <fiona.klute@gmx.de>, =?utf-8?q?Ga=C3=ABl_PORTAY?=
 <gael.portay@gmail.com>, <buildroot@buildroot.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20240831190126.366600-1-fiona.klute@gmx.de>
 <20240831190126.366600-4-fiona.klute@gmx.de>
 <D7JTJDZQ286V.32BNGSIJOMVCI@gmail.com>
 <ba8e5707-9c21-4303-a9ae-1b307bc27173@gmx.de>
In-Reply-To: <ba8e5707-9c21-4303-a9ae-1b307bc27173@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738923277; x=1739528077; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:sender:from:to:cc:subject
 :date:message-id:reply-to;
 bh=mJWdHwQXhda7DARelwRLNjZNn41kEwaIkeE4wrzsSsI=;
 b=SD4We0F1hNqCybkB8+GBxWQ+8q8X0wHMT9qWzdDMOkSX9aPf5NDrGLHnB74o6zPcyk
 DJWQAzIePBLezgX5kbgQoRqW/64L9isnobNPpNsWGAG7Ys7PWmag2WypSu8jKTUDF0mF
 zOrdXrDI29Gves7dFjrjhwLi/S7au3I3e+i74KH2vr//UKpHu33+lhJAtH1TusjTO6cB
 /KBxB2EyMO2M13kMEdijfP4o8Y5XI0wJSKMYaOpcPWaVJlIvwnh0EljqOmpoBjxUH9z3
 B1SRWq7JIhtuPN8Mpne4YlAOl1rv9h/u4YWvvpaZHUsW6He9K7fCJsPZvg5Oc2Tcm010
 O4VQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SD4We0F1
Subject: Re: [Buildroot] [PATCH next v2 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
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

T24gV2VkIEZlYiA1LCAyMDI1IGF0IDc6MDcgUE0gQ0VULCBGaW9uYSBLbHV0ZSB3cm90ZToKPj4+
IGRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9ib290LnNjci5pbiBiL2JvYXJkL3Jhc3Bi
ZXJyeXBpL2Jvb3Quc2NyLmluCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5kZXggMDAw
MDAwMDAwMC4uYTVjOTg2ZWY5OQo+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4gKysrIGIvYm9hcmQvcmFz
cGJlcnJ5cGkvYm9vdC5zY3IuaW4KPj4+IEBAIC0wLDAgKzEsOSBAQAo+Pj4gKyMgUGxlYXNlIG5v
dGUgdGhhdCB0aGlzIGlzIG9ubHkgYSBzYW1wbGUsIHdlIHJlY29tbWVuZCB5b3UgdG8gY2hhbmdl
Cj4+PiArIyBpdCB0byBmaXQgeW91ciBuZWVkcy4gWW91IHNob3VsZCBvdmVycmlkZSB0aGlzIGZp
bGUgdXNpbmcKPj4+ICsjIEJSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFNfQk9PVF9TQ1JJUFRf
U09VUkNFLgo+Pj4gKwo+Pj4gKyMgbG9hZCBrZXJuZWwgZnJvbSB0aGUgcm9vdCBwYXJ0aXRpb24K
Pj4+ICtsb2FkIG1tYyAwOjIgJHtrZXJuZWxfYWRkcl9yfSBib290L0ltYWdlCj4+PiArZW52IHNl
dCBib290YXJncyAicm9vdD0vZGV2L21tY2JsazBwMiByb290d2FpdCBjb25zb2xlPXR0eTEgY29u
c29sZT10dHlBTUEwLDExNTIwMCIKPj4+ICsjIGJvb3QgdXNpbmcgdGhlIEZEVCBwcm92aWRlZCBi
eSBmaXJtd2FyZQo+Pj4gK2Jvb3RpICR7a2VybmVsX2FkZHJfcn0gLSAke2ZkdF9hZGRyfQo+Pgo+
PiBUaGUgcmFzcGJlcnJ5cGk1IHVzZXMgYSBkaWZmZXJlbnQgY29uc29sZSAoaS5lLiBjb25zb2xl
PXR0eUFNQTEwLDExNTAwKQo+PiBhbmQgdGh1cyBpdCByZXF1aXJlcyBhIGRpZmZlcmVudCBmaWxl
LCByaWdodD8KPgo+IEVpdGhlciB0aGF0LCBvciBzb21lIGxvZ2ljIHRvIGRldGVjdCBkaWZmZXJl
bnQgYm9hcmRzIGFuZCBhZGp1c3QgdGhlCj4gY29tbWFuZCBsaW5lIChlLmcuICJmZHQgZ2V0IHZh
bHVlIiB0byByZWFkIHRoZSBjb21wYXRpYmxlIHN0cmluZyBhbmQKPiBjb21wYXJlLCBvciBqdXN0
IHRoZSBkZWZhdWx0IGJvYXJkX25hbWUgZW52aXJvbm1lbnQgdmFyaWFibGUpLiBOb3Qgc3VyZQo+
IHdoYXQncyBwcmVmZXJhYmxlLCBkbyB5b3UgaGF2ZSBhbiBvcGluaW9uPwo+CgpPaCBJIGdvdCBp
dC4uLgoKPj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgYWRkaW5nIGEgc3VmZml4IHNvIHdlIGNh
biBtYWtlIHRoZSBkaXN0aW5jdGlvbgo+PiBiZXR3ZWVuIHRoZSB3aG9sZSBSYXNwYmVycnkgUGkg
NCA2NGJpdCBmYW1pbGx5IGFuZCBhbiBoeXBvdGV0aWNhbAo+PiBSYXNwYmVycnkgUGkgNSBib290
LnNjciBmaWxlPwo+Pgo+PiBJIGFtIHRoaW5raW5nIGFib3V0IHJlbmFtaW5nIHRoZSBmaWxlIGJv
b3RfNF82NGJpdC5zY3IgKG9yIG1heWJlCj4+IGJvb3RfY200aW9fNjRiaXQuc2NyIGl0IHRoZSBm
aWxlIGlzIHNwZWNpZmljIHRvIHRoZSBDTTQtSU8gQm9hcmQpIGFuZAo+PiB1cGRhdGUgQlIyX1BB
Q0tBR0VfSE9TVF9VQk9PVF9UT09MU19CT09UX1NDUklQVF9TT1VSQ0UgYWNjb3JkaW5nbHkuCj4K
PiBJJ2QgZXhwZWN0IGl0IHRvIHdvcmsgd2l0aCBwcmV0dHkgbXVjaCBhbnkgNjQgYml0IFJQaSB2
YXJpYW50LCBtYXliZQo+IHdpdGggYWRqdXN0bWVudHMgdG8gdGhlIGJvb3RhcmdzIGFzIHlvdSBt
ZW50aW9uZWQuIEl0J3Mgbm90IGxpa2UgdGhlCj4gc2NyaXB0IGl0c2VsZiBoYXMgYW55dGhpbmcg
Ym9hcmQgc3BlY2lmaWMsIHRoZSB2YXJpYWJsZXMgYXJlIHByb3ZpZGVkIGJ5Cj4gVS1Cb290LiBJ
ZiB3ZSBnbyB3aXRoIHNlcGFyYXRlIHNjcmlwdHMsIHRoZSBzdWZmaXggaXMgZmluZSB3aXRoIG1l
Lgo+CgouLi4uIFlvdSBhcmUgcmlnaHQsIHNpbmNlIHRoaXMgaXMgYWxsIGFib3V0IHNjcmlwdGlu
ZywgdGhpcyBjYW4gYmUgZG9uZQphdCBydW50aW1lLiBUaHVzLCB3ZSBjYW4gaGF2ZSBhIHNpbmds
ZSBib290LnNjciBjb21wYXRpYmxlIHdpdGggZXZlcnkgcGkKKDEtNC0zMmJpdCwgcGkxLTQtNjRi
aXQsIGFuZCBwaTUpLCBhbmQgYXZvaWQgYW5vdGhlciBoYXNzbGUgb2YgZmlsZXMKd2l0aCBwcmVm
aXhlcy4KClNvLCBJSVVDLCBhZGRpbmcgdGhlIHJhc3BiZXJyeXBpNSBpcyBqdXN0IGFib3V0IHVw
ZGF0aW5nIGJvb3Quc2NyIHRoaXMKd2F5OgoKCSMgbG9hZCBrZXJuZWwgZnJvbSB0aGUgcm9vdCBw
YXJ0aXRpb24KCWxvYWQgbW1jIDA6MiAke2tlcm5lbF9hZGRyX3J9IGJvb3QvSW1hZ2UKCS1lbnYg
c2V0IGJvb3RhcmdzICJyb290PS9kZXYvbW1jYmxrMHAyIHJvb3R3YWl0IGNvbnNvbGU9dHR5MSBj
b25zb2xlPXR0eUFNQTAsMTE1MjAwIgoJK2lmIHRlc3QgIiRib2FyZF9uYW1lIiA9ICI1IE1vZGVs
IEIiOyB0aGVuCgkrICBlbnYgc2V0IGJvb3RhcmdzICJyb290PS9kZXYvbW1jYmxrMHAyIHJvb3R3
YWl0IGNvbnNvbGU9dHR5MSBjb25zb2xlPXR0eUFNQTEwLDExNTIwMCIKCStlbHNlCgkrIGVudiBz
ZXQgYm9vdGFyZ3MgInJvb3Q9L2Rldi9tbWNibGswcDIgcm9vdHdhaXQgY29uc29sZT10dHkxIGNv
bnNvbGU9dHR5QU1BMDAsMTE1MjAwIgoJK2ZpCgkjIGJvb3QgdXNpbmcgdGhlIEZEVCBwcm92aWRl
ZCBieSBmaXJtd2FyZQoJYm9vdGkgJHtrZXJuZWxfYWRkcl9yfSAtICR7ZmR0X2FkZHJ9CgpTbyBm
b3JnZXQgd2hhdCBJIHNhaWQgYWJvdXQgdGhlIHByZWZpeCwgYW5kIHN0aWNrIHRvIGJvb3Quc2Ny
LCB5b3UgZ290CnRoZSByaWdodCBhcHByb2FjaCA7KQoKSGVyZSBhbGwgdGhlIGVudmlyb25tZW50
IGZvciB0aGUgcGk1OgoKCVUtQm9vdD4gcHJpbnRlbnYKCWFyY2g9YXJtCgliYXVkcmF0ZT0xMTUy
MDAKCWJvYXJkPXJwaQoJYm9hcmRfbmFtZT01IE1vZGVsIEIKCWJvYXJkX3Jldj0weDE3Cglib2Fy
ZF9yZXZfc2NoZW1lPTEKCWJvYXJkX3JldmlzaW9uPTB4RDA0MTcwCglib290X3RhcmdldHM9bW1j
IHVzYiBweGUgZGhjcAoJYm9vdGNtZD1ib290ZmxvdyBzY2FuCglib290ZGVsYXk9MgoJY3B1PWFy
bXY4CglkaGNwdWJvb3Q9dXNiIHN0YXJ0OyBkaGNwIHUtYm9vdC51aW1nOyBib290bQoJZmR0X2Fk
ZHI9MmVmZWMxMDAKCWZkdF9hZGRyX3I9MHgwMjYwMDAwMAoJZmR0X2hpZ2g9ZmZmZmZmZmZmZmZm
ZmZmZgoJZmR0Y29udHJvbGFkZHI9M2Y3MjZmODAKCWZkdGZpbGU9YnJvYWRjb20vYmNtMjcxMi1y
cGktNS1iLmR0YgoJaW5pdHJkX2hpZ2g9ZmZmZmZmZmZmZmZmZmZmZgoJa2VybmVsX2FkZHJfcj0w
eDAwMDgwMDAwCglsb2FkYWRkcj0weDEwMDAwMDAKCXByZWJvb3Q9cGNpIGVudW07IHVzYiBzdGFy
dDsKCXB4ZWZpbGVfYWRkcl9yPTB4MDI1MDAwMDAKCXJhbWRpc2tfYWRkcl9yPTB4MDI3MDAwMDAK
CXNjcmlwdGFkZHI9MHgwMjQwMDAwMAoJc2VyaWFsIz14eHh4eHh4eHh4eHh4eHh4Cglzb2M9YmNt
MjgzeAoJc3RkZXJyPXNlcmlhbCx2aWRjb25zb2xlCglzdGRpbj1zZXJpYWwsdXNia2JkCglzdGRv
dXQ9c2VyaWFsLHZpZGNvbnNvbGUKCXVzYl9pZ25vcmVsaXN0PTB4MTA1MDoqLAoJdmVuZG9yPXJh
c3BiZXJyeXBpCgpBbmQgSSBzdXBwb3NlZCB0aGUgMzJiaXQgc3VwcG9ydCBjYW4gYmUgYWRkZWQg
YnkgdGVzdGluZyB0aGUgdmFyaWFibGUKJGNwdS4KClJlZ2FyZHMsCkdhw6tsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
