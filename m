Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBE2EC1E9D
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 11:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7703C60DA2;
	Thu,  5 Feb 2026 11:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkJWDuIRbbEp; Thu,  5 Feb 2026 11:16:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59C1460C2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770290203;
	bh=KwCqPt2gqWxiQHhd+fUOKatE6P1CmCvOSg6ev22DXyc=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GlyRIxV2fIIzY3QMVM91iRqScT0loIbm9pzDXE6pI0CGC0WD8Sq4AHgekStzYPhJs
	 b95vDSgA6fC7E4JFaCw0+IKtCS/G5y5CTa5sVQ0HlFMGTFIPI6LjyPiF4viv3FYImY
	 reHKbQ7JnM1+HboO3be/+R08LVFVhkyQZWkNPq5XDq32Ki+L7xkzIfNYiI7YaLL+Rz
	 oml8Ebm/s/xlpI7mkvoYHfdjPhFA7or69FkMAAdYPNmOpI3w08kZxo1OkV+QWsdT9W
	 LpK9PQGt7IsIvK6ompd0UEiGzMT2JqAEoNS0yl5mqwUo3+2i2lvIcn0RQg+KiI5keq
	 qN3b2Qi8xQm+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59C1460C2E;
	Thu,  5 Feb 2026 11:16:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8642E17A
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 11:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72F7360C2E
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 11:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cnyj9w9ykEXV for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 11:16:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=laurentiumihalcea111@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BB7D60B15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BB7D60B15
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BB7D60B15
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 11:16:41 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4806bf03573so4131925e9.2
 for <buildroot@buildroot.org>; Thu, 05 Feb 2026 03:16:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770290199; x=1770894999;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CPaDDdTJ3bX4SGMmAc1B5p5hh1ihq4vC6RdllL9WYks=;
 b=aWEeAe6mVAESkQA4wLqkMSh6T4f+I7J+LKmlK/hW7b2CyyalJtATr1izsb9X+FnhaP
 5jouGT4w7uOk+ivrkUun61ez/s8fMld/4QWSji47FftzKOzPqBvqZxK6AKrdzkuwbZcU
 0tI6+HSzQR3qP2uq+xzHTmkAx27UFiodMYi7IWMBVa/xoSUA5w6aOMYORyVoASHnTVEB
 Gz0ayxP6Qla0Dwy1qxPZ9gY6GUQZJJfZCVLQy6t7oJ8WodkBX0Zo0CT7LWpQch87taLa
 SUgjvXo3btftHfWpGn2l/LFA20+vP7JqZEblq2HW80eimA1ZgFF3eX/+IzEENMcqo3QS
 TwKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhPF3U3GuiCS8z7FVI1nyRG1H3ymmGmjpHQN/T+wNL0nY7hcHEg+fRhpfBBYR9yy85azno37abkow=@buildroot.org
X-Gm-Message-State: AOJu0YyUWqsbmeL+pZsM8Gmx/x/jjhuO4XnlFixlOAe37mN/Rhj1z6tX
 scJECt+Ihs5LiVpiX9vUAD4ozvEkRCnTmNWkpi+10u6soCH3sjuPz0Mc
X-Gm-Gg: AZuq6aIRoJGdyt4cY3Ku+mLrXw9ILKKv14piDS3WU7+FGmFPQprSzzCsKuECTYd0aGk
 tzXZDfE+884ixHEPfbXwqiGWpP/y1iqVychWKpoCEW6Ca6kIyIn5gcARp5NRFwms2pgBX6rC6jC
 wjnuzmsNr/TR2GFFMAkdv0OJLh1nan0kTJVR7+iulJNAKNmDvmv6BbKHWPs9wYO+WhBqUW3TQhr
 PGSV5TPcqIImbmkCpIe2A1l1vGE8sFqbhU1DkF/9ssmzIwE6zcwElR49ECn1LQPl17OM7WJsKEz
 xgB8DqY7QDrw+C5OqMMebxNaFVnVhubdfJhAwZjDQBdquzwORsoJCge3OX3YOLRHt2A4K0TZb+V
 BoQ1oeVvhmPf55RLoO0gnZfy3Sq9EuxL0yKR9Q3hnmNo+waxl0bIiVgUG/hzpObInA8Ujp7K1jc
 nvnEVW1xzqe5DrwQDw8PbpVgkvbidFQm5wNk5y3w2vnm23
X-Received: by 2002:a05:600c:820a:b0:46e:4586:57e4 with SMTP id
 5b1f17b1804b1-4830e987d12mr92656175e9.24.1770290198974; 
 Thu, 05 Feb 2026 03:16:38 -0800 (PST)
Received: from [10.25.211.197] ([128.77.115.157])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d345c2sm67004795e9.6.2026.02.05.03.16.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Feb 2026 03:16:38 -0800 (PST)
Message-ID: <6760ff18-a5c5-460d-bab7-e732c923d316@gmail.com>
Date: Thu, 5 Feb 2026 03:16:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>,
 buildroot@buildroot.org
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
References: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
 <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-9-548f3fc77a59@armadeus.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-9-548f3fc77a59@armadeus.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770290199; x=1770894999; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CPaDDdTJ3bX4SGMmAc1B5p5hh1ihq4vC6RdllL9WYks=;
 b=QLGBpV47HR6NDUcdUdPxKy4gcexycoWVCp8PSA6mcEG8Ttynw0Yil8jjGbrVKjFbZ5
 sZ0atRAVeVEGyNtTrMcW4tDjTdeBZSLXFZs5pdtye0RAzY6YfvC5fvm9CtagGodqzIeS
 /5Ro3z8iSI7xw/2Tpu2GSJ3b8U9hfgNGhCdQDjs7hYwpwiWoo6+ZXAs94TuhPlvvBS87
 OpeulyI1X2nFiAsZmIxE33Rc3LN3YtHyEws/8OqXJkuqLdlNmNQFUxUsqy4QaA3h3Qlg
 YKDRVMndHhh5y1U2rxcFBXebWCwBjogmbkf/R+/Ok3+x24pL4gXcLeWTe2arUMpcnwou
 5PKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QLGBpV47
Subject: Re: [Buildroot] [PATCH 9/9] package/imx-mkimage: bump to version
 lf-6.12.49-2.2.0
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

CgpPbiAyLzMvMjAyNiA2OjM4IEFNLCBTw6liYXN0aWVuIFN6eW1hbnNraSB3cm90ZToKPiBUaGlz
IHZlcnNpb24gaXMgYWxpZ25lZCB3aXRoIE5YUCBMaW51eCBCU1AgdmVyc2lvbiAiTEY2LjEyLjQ5
XzIuMi4wIi4KPiAKPiBGb3IgY2hhbmdlIGxvZywgc2VlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9u
eHAtaW14L2lteC1ta2ltYWdlL2NvbXBhcmUvbGYtNi42LjIzLTIuMC4wLi4ubGYtNi4xMi40OS0y
LjIuMAo+IAo+IFNpZ25lZC1vZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4u
c3p5bWFuc2tpQGFybWFkZXVzLmNvbT4KPiAtLS0KPiAgcGFja2FnZS9pbXgtbWtpbWFnZS9pbXgt
bWtpbWFnZS5oYXNoIHwgMiArLQo+ICBwYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLm1r
ICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLmhh
c2ggYi9wYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLmhhc2gKPiBpbmRleCAwMjIwNWRl
ZjFlYmMuLjQ4MjhjMjVlYWY1MiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2lteC1ta2ltYWdlL2lt
eC1ta2ltYWdlLmhhc2gKPiArKysgYi9wYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLmhh
c2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNhbGN1bGF0ZWQKPiAtc2hhMjU2ICAw
YTU2NTQyMjljMDYzZTRlODdiNWQ2OWY0N2E0YTkxM2VjZWU1MWY4YTgxN2FlMjM0NmEyYTQwN2U3
NjVlZDNiICBpbXgtbWtpbWFnZS1sZi02LjYuMjMtMi4wLjAudGFyLmd6Cj4gK3NoYTI1NiAgMmIw
YWM1NjE3OThiMTI2OTU5MTY3ZWZkNzY3YTdiZWQ3ZTJjY2EzOTY2NWEzMjAxYjM0MGI3N2M5MWRk
NWM2ZCAgaW14LW1raW1hZ2UtbGYtNi4xMi40OS0yLjIuMC50YXIuZ3oKPiAgc2hhMjU2ICAyMzFm
N2VkY2M3MzUyZDc3MzRhOTZlZWYwYjgwMzBmNzc5ODI2NzhjNTE2ODc2ZmNiODFlMjViMzJkNjg1
NjRjICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1h
Z2UubWsgYi9wYWNrYWdlL2lteC1ta2ltYWdlL2lteC1ta2ltYWdlLm1rCj4gaW5kZXggZjczOTZi
YTFiMjM0Li5hYzY0YjM2ZWE3OTAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9pbXgtbWtpbWFnZS9p
bXgtbWtpbWFnZS5tawo+ICsrKyBiL3BhY2thZ2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UubWsK
PiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICAKPiAt
SU1YX01LSU1BR0VfVkVSU0lPTiA9IGxmLTYuNi4yMy0yLjAuMAo+ICtJTVhfTUtJTUFHRV9WRVJT
SU9OID0gbGYtNi4xMi40OS0yLjIuMAo+ICBJTVhfTUtJTUFHRV9TSVRFID0gJChjYWxsIGdpdGh1
YixueHAtaW14LGlteC1ta2ltYWdlLCQoSU1YX01LSU1BR0VfVkVSU0lPTikpCj4gIElNWF9NS0lN
QUdFX0xJQ0VOU0UgPSBHUEwtMi4wKwo+ICBJTVhfTUtJTUFHRV9MSUNFTlNFX0ZJTEVTID0gTElD
RU5TRQo+IAoKVGhhbmtzISBUZXN0ZWQgaW4gdGhlIGNvbnRleHQgb2YgaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYnVpbGRyb290LzIwMjYwMjAzMTUzNjE3LjgwMDEyLTEtbGF1cmVudGl1bWloYWxj
ZWExMTFAZ21haWwuY29tLwoKUmV2aWV3ZWQtYnk6IExhdXJlbnRpdSBNaWhhbGNlYSA8bGF1cmVu
dGl1Lm1paGFsY2VhQG54cC5jb20+ClRlc3RlZC1ieTogTGF1cmVudGl1IE1paGFsY2VhIDxsYXVy
ZW50aXUubWloYWxjZWFAbnhwLmNvbT4gIyBNWDk1LTE1eDE1LUZSRE0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
