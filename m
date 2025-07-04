Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83E4C83030
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 06:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 793BA80CF2;
	Fri,  4 Jul 2025 06:47:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W6MxtvsnWD8J; Fri,  4 Jul 2025 06:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FE6380D44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FE6380D44;
	Fri,  4 Jul 2025 06:47:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B13A47AB
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A36834040D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8NK_y_DJl-pM for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 06:47:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B3E4240167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3E4240167
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B3E4240167
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 06:47:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so419253f8f.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 23:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751611663; x=1752216463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v0tv/Urw5xmBV5v/ACMQXc5sNX/2cpQxWk3UXOnNBAA=;
 b=lXkBSiQmzMpdmCmn1l/puNZp3+7Khr3KyguSdrBuprNhaaMiagTuPhEWgawCDQvBBT
 w9ufgKKyP4inh2Qbf6/S+ZOQ4vwBP8XT8FrZHvpcN9pmD6y6Px+M/lnXlwLckBAyvqEg
 SqpOA5g1RSkRJGw24h77fcLIIesf/6MAxdDl9/CutLHr/q95Ow4erxFCbd8XqXVNz7iW
 Cy4iD85zJHwlVgaT/R7lcHcUmtTTXSRr2/dPQ7bLR313XuovjIz4iXm6t1Etjplxu0lV
 uH7rCtkspvMvfFTqz3jMt7fvYDi1gDjg5SwiJMhxe35KjfzHyXuKVxe/rA780vPcRKDl
 NSDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJGVmaprp3V3N3cmT92+WfKtt2AcolDiFP69Au13I6WlNiMA8lSzip96TpOblrmNXkR+CdOgovtcw=@buildroot.org
X-Gm-Message-State: AOJu0YwlMQ0IZMiRO/7W2o7mIlQ00HPJz3ZujdhMWZ1h1ffCOWOPP8c9
 YJjvMoPTK0fyAMXs86QaD80Sdtvb/35iDsjK+fhj7YHEtlOZE5D/0QaIFVEDI+U5q92D3qKjCcY
 ugNe9
X-Gm-Gg: ASbGncsdds5WKPWPvxrNQcETlDHEXRhWxsxJw3E5z7W28P5UCCXVS9EkTbb34foZW79
 ATSLulOsePJDdaA+sDuWW99RKHd/fo3o8VvgusW51W5JDDxYEnHJzr34OHEu9WYBCTL3+Uyt2CH
 /rnOD/SayDycKC8cP9NpEt/bW66SZ3C7EX2Yc3HmDF44yoRa//nvLw+MAcWltPNwt85ZPdDq58z
 5MRyMM9kw24Z4I3AEPZcbwLtXnEkOSVphlcWf4KQ4czIFwvbTzQWvvFLyF+YExVaChbPieZXXy2
 ZT14fjzADRWyyUDqJOEKrLyEp+Nwnx/vuErrNVec4/riyCVKZqX+fwESVfL05rfArkZ1/sb0Y7D
 9ZYz95VUC8MmNe0kR4VZX
X-Google-Smtp-Source: AGHT+IG7LBgl8OIMxBt2iQMMzOFiGQ5uVnQdVXWXQMrKHxB10snHV0EmnZI4utYhGmd+X74RmjgbhA==
X-Received: by 2002:adf:ae51:0:b0:3a4:f9e7:2796 with SMTP id
 ffacd0b85a97d-3b4965ffd2bmr810682f8f.35.1751611663457; 
 Thu, 03 Jul 2025 23:47:43 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0aa0sm1695255f8f.34.2025.07.03.23.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 23:47:42 -0700 (PDT)
To: Bram Oosterhuis <dev@bybram.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Jul 2025 08:47:40 +0200
Message-ID: <20250704064741.4064919-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619102712.619955-1-dev@bybram.com>
References: <20250619102712.619955-1-dev@bybram.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751611663; x=1752216463; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v0tv/Urw5xmBV5v/ACMQXc5sNX/2cpQxWk3UXOnNBAA=;
 b=d2xuitNjZAkW5FNx7vkrN/iUq3en7Rf17cJPVJ46pRk83wDWVmaZVHyVZV2mPv2g8r
 ouxTwl9DjoGegposLee+YydZ9oM1cyeGWWgqNBuHbqVbCZzv2u88hKS74fZp2X7lZDYi
 kcYz05Z7WitkqJki4OhMPlvAqrQk0y6Ef51IRBRzfVOep6ZikmLF5Rm+/rN5P0FE1F5i
 oYylOJbE2QiqNY5tfBeVJO9NsIkGIydsELQkQN73cDkWGhGVM+iBPonWfxdCiVEvNdMt
 EuFsYin6/Rx+fN5ggJf2mEh3WcuT+u2VtpEQkJeokVh8y0ya+4xs54MN0O7A3FahfFMW
 0uSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=d2xuitNj
Subject: Re: [Buildroot] [PATCH 1/1] package/libgcrypt: bump to v1.11.1
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

SW4gcmVwbHkgb2Y6Cj4gVGhpcyBmaXhlcyAiZXJyb3I6IOKAmGFzbeKAmSBvcGVyYW5kIGhhcyBp
bXBvc3NpYmxlIGNvbnN0cmFpbnRzIG9yIHRoZXJlIGFyZSBub3QgZW5vdWdoIHJlZ2lzdGVycyIg
aWYgYnVpbGQgZm9yIGFybWhmIHdpdGggR0NDMTQuCj4gCj4gRGV0YWlsczogaHR0cHM6Ly9kZXYu
Z251cGcub3JnL1Q3MjI2Cj4gU2lnbmVkLW9mZi1ieTogQnJhbSBPb3N0ZXJodWlzIDxkZXZAYnli
cmFtLmNvbT4KCkFwcGxpZWQgdG8gMjAyNS4wNS54LiBUaGFua3MKCj4gLS0tCj4gQmFja3BvcnQg
dG86IDIwMjUuMDIueCwgMjAyNS4wNS54Cj4gIHBhY2thZ2UvbGliZ2NyeXB0L2xpYmdjcnlwdC5o
YXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvbGliZ2NyeXB0L2xpYmdjcnlwdC5tayAgIHwgMiArLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJnY3J5cHQvbGliZ2NyeXB0Lmhhc2ggYi9wYWNrYWdlL2xp
YmdjcnlwdC9saWJnY3J5cHQuaGFzaAo+IGluZGV4IGNlZDgwODdjYTkuLjQ4NmEyOWRmYzAgMTAw
NjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJnY3J5cHQvbGliZ2NyeXB0Lmhhc2gKPiArKysgYi9wYWNr
YWdlL2xpYmdjcnlwdC9saWJnY3J5cHQuaGFzaAo+IEBAIC0xLDUgKzEsNSBAQAo+ICAjIEZyb20g
aHR0cHM6Ly93d3cuZ251cGcub3JnL2Rvd25sb2FkL2ludGVncml0eV9jaGVjay5odG1sCj4gLXNo
YTEgIGRkMmM2OGUwNjg1YmI5OTI0OWVmZWViMDYwNDZmYWUxNWI1MjE0YmEgIGxpYmdjcnlwdC0x
LjExLjAudGFyLmJ6Mgo+IC1zaGEyNTYgIDA5MTIwYzk4NjdjZTdmMjA4MWQ2YWFhMTc3NTM4NmI5
OGMyZjJmMjQ2MTM1NzYxYWFlNDdkODFmNTg2ODViOWMgIGxpYmdjcnlwdC0xLjExLjAudGFyLmJ6
Mgo+ICtzaGExICBkMzNlYjI3MGNkNzRlOGMyM2UyNjNlYjVjZGI4ZjdkZTc0MGY3YjQ5ICBsaWJn
Y3J5cHQtMS4xMS4xLnRhci5iejIKPiArc2hhMjU2ICAyNGU5MWM5MTIzYTQ2YzU0ZTgzNzFmM2Ez
YTI1MDJmMTE5OGYyODkzZmJmYmY1OWFmOTViYzFjMjE0OTliMDBlICBsaWJnY3J5cHQtMS4xMS4x
LnRhci5iejIKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAgc2hhMjU2ICBkYzYyNjUyMGRjZDUz
YTIyZjcyN2FmM2VlNDJjNzcwZTU2Yzk3YTY0ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxICBDT1BZ
SU5HLkxJQgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmdjcnlwdC9saWJnY3J5cHQubWsgYi9w
YWNrYWdlL2xpYmdjcnlwdC9saWJnY3J5cHQubWsKPiBpbmRleCA1N2VjYTUwN2IzLi41ZjU2ZTQw
YWMyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGliZ2NyeXB0L2xpYmdjcnlwdC5tawo+ICsrKyBi
L3BhY2thZ2UvbGliZ2NyeXB0L2xpYmdjcnlwdC5tawo+IEBAIC00LDcgKzQsNyBAQAo+ICAjCj4g
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gIAo+IC1MSUJHQ1JZUFRfVkVSU0lPTiA9IDEuMTEu
MAo+ICtMSUJHQ1JZUFRfVkVSU0lPTiA9IDEuMTEuMQo+ICBMSUJHQ1JZUFRfU09VUkNFID0gbGli
Z2NyeXB0LSQoTElCR0NSWVBUX1ZFUlNJT04pLnRhci5iejIKPiAgTElCR0NSWVBUX0xJQ0VOU0Ug
PSBMR1BMLTIuMSsKPiAgTElCR0NSWVBUX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HLkxJQgo+IC0t
IAo+IDIuMzQuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
