Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A21C5B572
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 19:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3276040C7A;
	Thu, 13 Aug 2026 19:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qmd95BrPyz9n; Thu, 13 Aug 2026 19:17:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C0E140C75
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786648678;
	bh=UylUqZqoDmcWwm09ypkIvr8fwcbgf0vGfAmSW+pwG1U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jbwSrPB8J1gsTQ9rSlD0QFNTYaGDl7CLYG0yCbX/rk3/0LpyPGeBylC1RpYpqB7Zr
	 yieqjVzJPhDJOx0rHoo9Hw8X9iVSeew/u7a2HSCZKRZeliLHAqvIlksogQZxqGUrfv
	 s0Tgj26kxtoodfiqICV6nv1aPRuld+rWC8RbuoiA6kBO+LKgJUa5XoOdheiTyfeLPa
	 YqkLNenw/2SvIjVw/3IRIePZtKZbQbsAEDB9tWrm74IkfM3HLgEdvg61N8OUjsGEPt
	 csfZNmXADHQlM1XqgYXrusnx66DhN5SsxC0uawV/GGknqZtiHCxu6QgnWZj2MXZyIL
	 nsJ/4M5rfd6zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C0E140C75;
	Thu, 13 Aug 2026 19:17:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA9ED2B2
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 134AD40C75
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:17:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UwHGrKO6TgtG for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 19:17:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F20D740C6D
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F20D740C6D
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Ixd1gMZT
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F20D740C6D
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 19:17:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-476a130c138so181494f8f.0
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 12:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786648647; x=1787253447; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=haF26XcJwAgSOR1PXOd6ohdpYbFNSmzZF3rUoYUrtG0=;
 b=Ixd1gMZTbJsfNaAgQQIN14yuThS+IMq38G9htTBR2wivPobNtKTGb9bY37cZIuzcwI
 icakyvKEtQQRqIsG0m1OpvuL7kVi6Ohc2dtxeUZYpZp104T4ZBlm3/JAQfjBVHqJGlZq
 l0lb6WMYKWy2bGXWfTDBSqymqsY5DRjZV6k0AOyBQIfksurj0c3njNqeRSQkA7fFO670
 UuUWPBKAan9lpwwqMgcGqtpwbUymRCQF7wQ9glLUC6SiozpUpeH3Z1tC8082eRllKZ8i
 wXGWVLR3atbi2SllXKtvyaDV5Lvkzh0Jh8TjW7x2HUbvgxQJ0U9DW/6cO4eZP2Dlvn2+
 XPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786648647; x=1787253447;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=haF26XcJwAgSOR1PXOd6ohdpYbFNSmzZF3rUoYUrtG0=;
 b=VCgm1pox20FZ2h3f8SqlrMgTHiIwT2SLBoaP4mts7KnE9zHH/1Jyb0XGpYDtBkmYO/
 YLCPXGdLOB71niU/ES4m+T+OhHIla7j1ASie2QrkFiyengtfFju6NRp42xj4Tqps/cEZ
 w6QXRJ1D/naA31IT6WN3IhAb8G1/k4aDK/djkE7sgFjKeKq7kSJtbHFQTJzcISTWgwEr
 jzvDHdHuDygvOSv5GHeOj/U1q6bsV57SbUw/bfwE50Q/+kSIZ5MSq1fsNwiRDRYXn5k2
 SHviXUFFBFdkmGLtGRG3id4kdPOFp8oJnIs6EKqLjsSE4kMlrbilBKzmLEtXEOkSpmez
 H4gQ==
X-Gm-Message-State: AOJu0YxvKxYMAxAx54GzDQxnNR4iTPdh/SIaMxO9Y5iVBN8uutvTV2Iu
 EM9o7oVdI/UVkTqxbFEZISFk2bQot8r0wo9guLZUxrbhQVCwVe646ShqBditC1D0kzy/kSDYFPz
 LfZtM
X-Gm-Gg: AR+sD1119+fLwMq+DWh4xFVxriwEdWnu/hycCRmJGU1aRS6l3RbB/cmvi0lA4I+qw50
 WfAXh54RmJRQtV80YPztGud4KIPgauC+XZoG//mvYT6DbJ8MhZ3s8vGNvOlh4m5kjR13aBDI+Vf
 ZSOQc70r7I1kV7LEr9t88Ox3uWwomjfNzEpe6bKOZHZKKxPuWaT0ffPhay9mGO0VImABmUVIDkX
 oa5pLNBTin2vOFzQJdagRs/gr8vEbkcnSKkR+RJL4CSL8Wr6KLCFv2g9lMyOUo8rw947fXBilpt
 SZOIJww3dvmaNRrW9ZqUFJPk77+TWhDRh9emqETijgIC0u0mKl7lS23KBlgNSF5fYBAyucfJlw1
 wt9YtooyVPcknuQWCk1BMMSXk5k5l0gBaLlM1dBM1QRDd99jwdckyUcrisiTUqo0CHTWFb3BOK2
 k5rBUOod+Ys3m8LMoKYcf/xoOguYrze4LTDQEVUPZig2+VaRXqbwHAgEwYemsv
X-Received: by 2002:a05:6000:2913:b0:47f:9266:9bde with SMTP id
 ffacd0b85a97d-481606f5992mr634821f8f.4.1786648646706; 
 Thu, 13 Aug 2026 12:17:26 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1fb7sm1432315f8f.17.2026.08.13.12.17.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 12:17:26 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id EA52A5F83B;
 Thu, 13 Aug 2026 20:17:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 20:17:14 +0100
Message-ID: <20260813191715.3421187-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH] package/clang: force release
 CFLAGS/CXX_FLAGS
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGRlZmF1bHQgdG9vbGNoYWluLm1rIHNldHM6Cgogc2V0KENNQUtFX0NfRkxBR1MgIi1EX0xB
UkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFCiAgICAtRF9GSUxFX09GRlNFVF9C
SVRTPTY0IC1PZyAtZzIgLURfRk9SVElGWV9TT1VSQ0U9MSIgQ0FDSEUgU1RSSU5HCiAgICAiQnVp
bGRyb290IENGTEFHUyIpCgpkZXNwaXRlIHdoYXQgZXZlciBzZXR0aW5nIEJSMl9ERUJVRyBtYXkg
aGF2ZS4gSG93ZXZlciB3aGVuIGJ1aWxkaW5nCmxpYmNsYW5nIHRoaXMgaXMgZmFpcmx5IHBhdGhv
bG9naWNhbCBmb3IgdGhlIGJ1aWxkIHRpbWUgYXMgd2l0bmVzc2VkCmJ5IGhhbmdzIHdoaWxlIGJ1
aWxkaW5nLiBUbyBhdm9pZCB0aGlzIGV4cGxpY2l0bHkgc2V0CkNNQUtFX1tDfENYWF1fRkxBR1Mg
c28gd2UgZG9uJ3QgdGFrZSB0aGUgZGVmYXVsdC4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOp
ZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KLS0tCiBwYWNrYWdlL2xsdm0tcHJvamVjdC9jbGFu
Zy9jbGFuZy5tayB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsgYi9wYWNrYWdlL2xs
dm0tcHJvamVjdC9jbGFuZy9jbGFuZy5tawppbmRleCBiNjUwYjhhZmQ1Li4yOWE3MTBjNzM3IDEw
MDY0NAotLS0gYS9wYWNrYWdlL2xsdm0tcHJvamVjdC9jbGFuZy9jbGFuZy5taworKysgYi9wYWNr
YWdlL2xsdm0tcHJvamVjdC9jbGFuZy9jbGFuZy5tawpAQCAtNDEsNiArNDEsOSBAQCBDTEFOR19D
T05GX09QVFMgKz0gLURCVUlMRF9TSEFSRURfTElCUz1PRkYKIEhPU1RfQ0xBTkdfQ09ORl9PUFRT
ICs9IC1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlCiBDTEFOR19DT05GX09QVFMgKz0gLURDTUFL
RV9CVUlMRF9UWVBFPVJlbGVhc2UKIAorSE9TVF9DTEFOR19DT05GX09QVFMgKz0gLURDTUFLRV9D
X0ZMQUdTPSItTzIgLWcwIiAtRENNQUtFX0NYWF9GTEFHUz0iLU8yIC1nMCIKK0NMQU5HX0NPTkZf
T1BUUyArPSAtRENNQUtFX0NfRkxBR1M9Ii1PMiAtZzAiIC1EQ01BS0VfQ1hYX0ZMQUdTPSItTzIg
LWcwIgorCiBDTEFOR19DT05GX09QVFMgKz0gLURDTUFLRV9DUk9TU0NPTVBJTElORz0xCiAKICMg
V2UgbmVlZCB0byBidWlsZCB0b29scyBiZWNhdXNlIGxpYmNsYW5nIGlzIGEgdG9vbAotLSAKMi40
Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
