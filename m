Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBA1EC1E8B
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 10:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A17AB40C70;
	Thu,  5 Feb 2026 10:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgvq0w0DQzjY; Thu,  5 Feb 2026 10:17:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5766540759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770286620;
	bh=TdhvwIIWaYFL+XPA8GOMYNSEwps3dA0s7VheMPJSNN0=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IpiT2cmZZQrvMlUZlXanTymOfbFwQcvD7wq15iboPqb86scYcyuYFN/eXT/oTPa5B
	 ZYF58hPM6T8GcHqyWRU95waxoQatkiPv4xDLOuM9122EXzOHcvXTc9VQqVCCKtfTKL
	 9xrfKAUBCZ9Iltg3kdTlP8X3EeK5ZAyo9lpF/l8HvnLn+xZ9RSuM9wf+8pfWfDy1nY
	 QFg67pDUT/YVVl1wF9aQbtwGu9+2O8HuYN4EuIbrGJhyI8bSyPgf2MX57J6NdtgeRT
	 HuwKeH6yZUxMOP04Wf7XcAsp3tUbR9lWRF5h3L32hWcPLmoy9eP7/xwpV4JXlhu7fr
	 ZTWoCO0JpD6Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5766540759;
	Thu,  5 Feb 2026 10:17:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D22173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABE4840759
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:16:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RuWmuMqEhwog for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 10:16:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7719440754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7719440754
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7719440754
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 10:16:57 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-4362197d174so383078f8f.3
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 02:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770286615; x=1770891415;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B5iTevGGRH39d/FKnsluYzTj0FYt9QiMC5XHiExs7pI=;
 b=PVAOtOiieBlo0K2a5/wPcG3c2++sYk0CB5ZAxC4Kx/7vqI4MN+HbcyPOfF8l/QUroM
 NQs+NRsnXT4hRj9Ov3rXc6YtEf9JUd7C5HsQvG+tWhSveLS7FrQyiYB/lMQ8wHEQfuxK
 M2bLNzBdxq30JOdg1y4dfWYNgiOg/JybbCfrqw2hSsj4rdhGCck6F5DFdgbtZQuOWA40
 1oSf1yt7Tn9UNv0g0uuh7Ki/IXDhbMNjPaRa4fFiFNp5YAQOBVkWB9O0wu5cqXKRKAa4
 xXYnsKiQDEgQuCac3aSBt2VkIME6m79TbsQtuwFNliZVseqiL7cMx01HDblUszSN7+0W
 QEJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgV6ScZnzCrmQ5nabGvTYe+Kj9QY8kLlK269/5tvHBA4lNPXKdBJADPlRA40ItXF3xiYCrzORi5dw=@buildroot.org
X-Gm-Message-State: AOJu0YyDHUB4L7JoubPcOgY37jdTcQfHOZ929Vgd654iBclzfWVqIH5a
 kE0AMKr4szs/IezHnSYleTq4EiTKkTEPkYYv6dktD6Ip7rej0roL0ee0
X-Gm-Gg: AZuq6aJLEnD67/ZzJ50Omwabd+Er7Mr356rSuUX7X2SGAofjFYA6GeX40PzLy7EgbA7
 +M3E7sY6ygRqvWTAcJKwIWiz0wwIOc3nycbeaaosW3RHWQKF9WNnsdRoKIJKzDFSy2vFjwoQ8a4
 b8t60via+sc+WG5yprh3Wj7PNgBl2A+Iq/Df9lKF34w3sgS1c3nGyurS60elOATwyIPJsORrDuJ
 04Tl+UA4/31x2475suJWkkSI8qyfJoVJWx4YDFFQzrOVnKMsSa1udrIgQNCtxjuJPjqHTkmPenb
 TlSNQVMHHXwj4KHh0U3b+Q6xKXIenIawm4x5BiMaRG5HLMBO64goPksCdeadYKmhmaDEtbX06TY
 lhmdFFIvK+UEYEgP5rr4qCd78EdigaicPpi0aONWH3Nh3aqp5gotg9q26zlOoIrVbHF2vuy665V
 xFnwMbY2z1ORYOVwgtu7uKQxKpc9k8SmIFNju3EssLLLRB
X-Received: by 2002:a05:6000:3104:b0:430:c76b:fadd with SMTP id
 ffacd0b85a97d-4361803097bmr8768031f8f.28.1770286614919; 
 Thu, 05 Feb 2026 02:16:54 -0800 (PST)
Received: from [10.25.211.197] ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e40b49sm12614785f8f.19.2026.02.05.02.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 02:16:54 -0800 (PST)
Message-ID: <097f6997-63f7-4501-951f-aa95aa8894aa@gmail.com>
Date: Thu, 5 Feb 2026 02:16:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
 <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-1-548f3fc77a59@armadeus.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-1-548f3fc77a59@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770286615; x=1770891415; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B5iTevGGRH39d/FKnsluYzTj0FYt9QiMC5XHiExs7pI=;
 b=jynnaXQIyy/2Jdtrw57dgZ6SKq1PrY4wmXeKXAiVH/+9nWx/jkFIHrr7a+e7oWI7KL
 4fKTtEVJ0yI0uoEjAOtjakmMN7Y8m4pK44kQUUURME17hgqAEhaFa33RFYozFFF+2ay5
 LBdfCrJL5ZnrIdFutlz4LcDAgnF63dDi6pZ0xCA3kDmuSmjSS8fYZBeYK14XXdy6WDwX
 kLbhwFkM46X7Heo4Pda+J1ZAIuiRKI45ypZ75dD7paiNpoRNlJP5Upv4+BwPZXBJh8OX
 KRdVUv/mMzGEbbymCjBvIVD16vEnnEWfDcVhySQd5QgfSpz991/8uTEBTffbVzB26a4G
 YrNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jynnaXQI
Subject: Re: [Buildroot] [PATCH 1/9] package/freescale-imx/firmware-ele-imx:
 bump to version 2.0.4
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

Ck9uIDIvMy8yMDI2IDY6MzggQU0sIFPDqWJhc3RpZW4gU3p5bWFuc2tpIHdyb3RlOgo+IFRoaXMg
dmVyc2lvbiBpcyBhbGlnbmVkIHdpdGggTlhQIExpbnV4IEJTUCB2ZXJzaW9uICJMRjYuMTIuNDlf
Mi4yLjAiLgo+Cj4gTGljZW5zZSBoYXNoZXMgY2hhbmdlZCBiZWNhdXNlIHRoZSBMQV9PUFRfTlhQ
X1NvZnR3YXJlX0xpY2Vuc2UgY2hhbmdlZAo+IGZyb20gInY1OCBOb3ZlbWJlciAyMDI0IiB0byAi
djYzIE1heSAyMDI1Ii4KPgo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxz
ZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9mcmVlc2Nh
bGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlteC5oYXNoIHwgNiArKystLS0K
PiAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxlLWlt
eC5tayAgIHwgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2Fy
ZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXguaGFzaCBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9m
aXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXguaGFzaAo+IGluZGV4IDU1ZTE4NjRlMzFl
Ni4uZjA2NGVmMTgzMDQwIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJt
d2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXguaGFzaAo+ICsrKyBiL3BhY2thZ2UvZnJlZXNj
YWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJlLWVsZS1pbXguaGFzaAo+IEBAIC0xLDUg
KzEsNSBAQAo+ICAjIExvY2FsbHkgY2FsY3VsYXRlZAo+IC1zaGEyNTYgIGEyZjE2ZTQzZThhZmY5
Y2YwMThkMDk2MmI3MDMxMzk0MGY3NzA3OWIzMTQzMzFhYjM5ODBjNGM1ZjQ0MjQ5Y2IgIGZpcm13
YXJlLWVsZS1pbXgtMi4wLjEtMGE2NmMzNC5iaW4KPiAtc2hhMjU2ICAzZjRhMTJjODJhODRiZDFj
MzU3OGM5Yzk4NmQ2MzcxYTYxZDMzOTk1MjVlNzYyODhlY2JiYWUwMWRhZjBhZTI2ICBDT1BZSU5H
Cj4gLXNoYTI1NiAgMzhmMTQwOGQ2ZTkzNWM1NjRlZmQ5MTE5YzMxMzI2OWU2NDNjMWE4NWNhYjFk
OTMwYzNjNWJkNzBiYzI2MTc2OSAgRVVMQQo+ICtzaGEyNTYgIGMzYWU0YTFlMWE0MWRhNDQxYmQ2
MTQ4M2VmMDExYWMyNGJmNjI0YWE2YmFkMzZmODc5YjVkZmE0MzU2NDdiNGMgIGZpcm13YXJlLWVs
ZS1pbXgtMi4wLjQtOTM0OTJlMC5iaW4KPiArc2hhMjU2ICAzMDAxY2Y4NDAxOGM1Y2IxMGQxODNh
Njc4ZjZlYzhhOTI4Yzc5NzYxNmJhMDZiMzk4ZDdjYTkzYzA3NzlhYWEyICBDT1BZSU5HCj4gK3No
YTI1NiAgYTgyOWIxMDlhMGE0MDZhNmEyZmVjMTk5NzVhMzMyZmVjYTIyNTA5OGNlNjZiZmFiMjIy
MGM2NjA4ZGI4ZmNlNSAgRVVMQQo+ICBzaGEyNTYgIDg3MjFhNjE3YTVkNGM3ZjM2NmFhZjg1N2Vi
ZGEyMWViNGM5ZmM5MTc1ZGM5MmI3MGY2MjdjNjExZDQwM2VjOGUgIFNDUi50eHQKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmlybXdhcmUtZWxl
LWlteC5tayBiL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9maXJtd2FyZS1lbGUtaW14L2Zpcm13YXJl
LWVsZS1pbXgubWsKPiBpbmRleCA4ZjI1ZjRiNWI1MzcuLmE4NDRjYTBkOTRjOSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9maXJtd2FyZS1lbGUt
aW14Lm1rCj4gKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWVsZS1pbXgvZmly
bXdhcmUtZWxlLWlteC5tawo+IEBAIC00LDggKzQsOCBAQAo+ICAjCj4gICMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjCj4gIAo+IC1GSVJNV0FSRV9FTEVfSU1YX1ZFUlNJT04gPSAyLjAuMQo+IC1GSVJN
V0FSRV9FTEVfSU1YX1JFVklTSU9OID0gMGE2NmMzNAo+ICtGSVJNV0FSRV9FTEVfSU1YX1ZFUlNJ
T04gPSAyLjAuNAo+ICtGSVJNV0FSRV9FTEVfSU1YX1JFVklTSU9OID0gOTM0OTJlMAo+ICBGSVJN
V0FSRV9FTEVfSU1YX1NJVEUgPSAkKEZSRUVTQ0FMRV9JTVhfU0lURSkKPiAgRklSTVdBUkVfRUxF
X0lNWF9TT1VSQ0UgPSBmaXJtd2FyZS1lbGUtaW14LSQoRklSTVdBUkVfRUxFX0lNWF9WRVJTSU9O
KS0kKEZJUk1XQVJFX0VMRV9JTVhfUkVWSVNJT04pLmJpbgo+ICAKCgpUaGFua3MhIFRlc3RlZCBp
biB0aGUgY29udGV4dCBvZsKgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjYw
MjAzMTUzNjE3LjgwMDEyLTEtbGF1cmVudGl1bWloYWxjZWExMTFAZ21haWwuY29tLyA8aHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjYwMjAzMTUzNjE3LjgwMDEyLTEtbGF1cmVu
dGl1bWloYWxjZWExMTFAZ21haWwuY29tLz4KCgpSZXZpZXdlZC1ieTogTGF1cmVudGl1IE1paGFs
Y2VhIDxsYXVyZW50aXUubWloYWxjZWFAbnhwLmNvbT4KClRlc3RlZC1ieTrCoExhdXJlbnRpdSBN
aWhhbGNlYSA8bGF1cmVudGl1Lm1paGFsY2VhQG54cC5jb20+wqAjIE1YOTUtMTV4MTUtRlJETQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
