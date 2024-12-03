Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0468E77166
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 23:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C89D84581;
	Tue,  3 Dec 2024 23:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcQZSneaW18H; Tue,  3 Dec 2024 23:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89CC3845A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89CC3845A1;
	Tue,  3 Dec 2024 23:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA828236E
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 23:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 84FD560BC2
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 23:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEh81F7tcjW3 for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 23:07:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4087660B91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4087660B91
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4087660B91
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 23:07:57 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-aa53ebdf3caso389219866b.2
 for <buildroot@buildroot.org>; Tue, 03 Dec 2024 15:07:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733267276; x=1733872076;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BaIrAPtD3KsgrBoFFgXcoMccGmmDsehNREv3roeR/Vs=;
 b=hNzqV6m2NeNuwUicL1pg3YLnPjwuQKdk1OfaNNvC7tPDP20OlfkeORSQMG8KT5eKc2
 O8tD3y+X3JAxD0AJ+8k8yXqicK6VzIqslPD+9fyL62srvRlaaFeCpUsvGrjh39ZXx6KP
 5KlKWXtWlk/BqvpJQpHD/ApDnBRrR0ogMy+v8Mgk5W4Dt+MeOUFG87+v9YLwp8NVCtJ/
 tTGQoaIbpJx8Mzj2YfQAK34mxL3OJ4ac9oXo98yB7F2ETQfD1n3lJKMNxaJvnZ70CIRS
 7A1QuPgy+qKECyGrK9LeCDSSDz91tE8Fec2rtnmPMPCRySrqYx4Cw39gFRCpc0ZToJBh
 PyxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqz8TVBCp14RmIf5JIg0AqliCmf7zLaYihDSz72c8QZ0Ai/tJFRpJ2xxJAC0ZJgGiQ6zeoh4/8dGM=@buildroot.org
X-Gm-Message-State: AOJu0YxqxdbWWlRR8oAPpdNhG7AwWB9LXg9/WpUuZ6FKESSRcAr3QgCk
 Ip7IB3Yq8DrVn/VAKbreZsglZIfx7/Plnqf1RUo6eb4W4CvQqjT60R8MUb2Ojpuo0MShbWuEX4Z
 5XCI=
X-Gm-Gg: ASbGncvn7BPFS/6NdqdT7i4vovPAsoubryJktXuLclZK1cxmIHiRg6UoLQlpPdub0JH
 t2ixTDceohiIFrStj3ZZzd+24bQmjitjr38tfLdj87k4TrJapnn3vBGMOxXvaWge+IPaE7zBdcF
 8ZGLm8Sct2KQV+tgxbv/54IjiAv2NBMvJoKthKeeCUPYo0I2q4dcvU7JwqWr3ebdfy6Qy8AxLue
 30INyLBzFnBBMmOMUvhS5SjxA/e61ZzZZk0RvLBAbRGvTKF
X-Google-Smtp-Source: AGHT+IGbI/tmtQqpyg9TnjtObQSzsJU0vBqkOT87oZ7tl9rEi5GixQmTv9Hwlvsxk9NyBcPJFrJ3Kg==
X-Received: by 2002:a17:906:9d1:b0:aa5:3874:c645 with SMTP id
 a640c23a62f3a-aa6017e974bmr246359566b.13.1733267275411; 
 Tue, 03 Dec 2024 15:07:55 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996c2c44sm672982866b.29.2024.12.03.15.07.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 15:07:54 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 971895F78C;
 Tue,  3 Dec 2024 23:07:52 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Olivain <ju.o@free.fr>
Cc: Bernd Kuhls <bernd@kuhls.net>,  buildroot@buildroot.org,  Eric Le Bihan
 <eric.le.bihan.dev@free.fr>,  Daniel Lang <dalang@gmx.at>,  Romain Naour
 <romain.naour@gmail.com>,  "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <c2be6e5c80cb8a212f3c60c7d7414dd1@free.fr> (Julien Olivain's
 message of "Tue, 03 Dec 2024 22:57:35 +0100")
References: <20241202190647.1211779-1-bernd@kuhls.net>
 <20241202190647.1211779-8-bernd@kuhls.net>
 <c2be6e5c80cb8a212f3c60c7d7414dd1@free.fr>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 03 Dec 2024 23:07:52 +0000
Message-ID: <87ldwwbc1j.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733267276; x=1733872076; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BaIrAPtD3KsgrBoFFgXcoMccGmmDsehNREv3roeR/Vs=;
 b=gN4jSFwNKfxrvrB+9pTb47hab+MHayyAx7Esxv5HmfmuAPiouoL5PUYqYHzPzrCT0b
 p4U8JnLif9Ij8a7AfNqNg+0fK7GzceyHHXbtv3MUkjbETvuHsQ+1vHygY/gPbFMoURps
 KP8u4xueTELrY29XCo0ibLAnB+KSVB8Ich4HJsQklRPuyaQ/FZPG9rhD0GQkupdx3by/
 6m/83kGr7Z0wHtlL8/gcJwAg+0C3sElIlyvpC024icr7EG/Aa2jcuE1buaJQe9PKmvhg
 8vCt98c/junsaDmOZcKLHYRyyzBiExWoKkuPYdhsreRfWrFEEmQKJ/DW9NY9Ed8pBogk
 sm2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=gN4jSFwN
Subject: Re: [Buildroot] [PATCH 8/8] package/vkmark: add vkmark benchmarking
 tool
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

SnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JpdGVzOgoKPiBIaSBCZXJuZCwgQWxleCwK
Pgo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLgo+Cj4gT24gMDIvMTIvMjAyNCAyMDowNiwgQmVybmQg
S3VobHMgd3JvdGU6Cj4+IEZyb206IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4KPj4gV2UgYnVpbGQgZnJvbSB0aGUgY3VycmVudCBtYXN0ZXIgYXMgd2UgbmVlZCBmYWlybHkg
dXB0byBkYXRlIGJpdHMKPj4gZm9yCj4+IGNyb3NzIGNvbXBpbGUgc3VwcG9ydC4KPj4gU2lnbmVk
LW9mZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+PiBTaWduZWQt
b2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0Pgo+Cj4gVGhpcyBwYXRjaCBnZW5l
cmF0ZXMgZmV3ICJtYWtlIGNoZWNrLXBhY2thZ2UiIGVycm9ycy4gUnVubmluZzoKPgo+ICAgICB1
dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2FnZQo+Cj4gU2hvd3M6Cj4KPiAgICAgcGFj
a2FnZS92a21hcmsvQ29uZmlnLmluOjc6IHNob3VsZCBiZSBpbmRlbnRlZCB3aXRoIG9uZSB0YWIK
PiAgICAgKGh0dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfY29uZmlnX2ZpbGVzKQo+ICAg
ICBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW46MTc6IHNob3VsZCBiZSBpbmRlbnRlZCB3aXRoIG9u
ZSB0YWIKPiAgICAgKGh0dHBzOi8vbmlnaHRseS5idWlsZHJvb3Qub3JnLyNfY29uZmlnX2ZpbGVz
KQo+ICAgICBwYWNrYWdlL3ZrbWFyay9Db25maWcuaW46MjY6IGF0dHJpYnV0ZXMgb3JkZXI6IHR5
cGUsIGRlZmF1bHQsCj4gICAgIGRlcGVuZHMgb24sIHNlbGVjdCwgaGVscAo+ICAgIChodHRwczov
L25pZ2h0bHkuYnVpbGRyb290Lm9yZy8jX2NvbmZpZ19maWxlcykKPiAgICAgcGFja2FnZS92a21h
cmsvQ29uZmlnLmluOjI2OiBzaG91bGQgYmUgaW5kZW50ZWQgd2l0aCBvbmUgdGFiCj4gICAgICho
dHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy8jX2NvbmZpZ19maWxlcykKPiAgICAgcGFja2Fn
ZS92a21hcmsvQ29uZmlnLmluOjI3OiBzaG91bGQgYmUgaW5kZW50ZWQgd2l0aCBvbmUgdGFiCj4g
ICAgIChodHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9yZy8jX2NvbmZpZ19maWxlcykKPiAgICAg
cGFja2FnZS92a21hcmsvQ29uZmlnLmluOjI5OiBhdHRyaWJ1dGVzIG9yZGVyOiB0eXBlLCBkZWZh
dWx0LAo+ICAgICBkZXBlbmRzIG9uLCBzZWxlY3QsIGhlbHAKPiAgICAoaHR0cHM6Ly9uaWdodGx5
LmJ1aWxkcm9vdC5vcmcvI19jb25maWdfZmlsZXMpCj4gICAgIHBhY2thZ2UvdmttYXJrL0NvbmZp
Zy5pbjoyOTogc2hvdWxkIGJlIGluZGVudGVkIHdpdGggb25lIHRhYgo+ICAgICAoaHR0cHM6Ly9u
aWdodGx5LmJ1aWxkcm9vdC5vcmcvI19jb25maWdfZmlsZXMpCj4gICAgIHBhY2thZ2UvdmttYXJr
L0NvbmZpZy5pbjozMDogc2hvdWxkIGJlIGluZGVudGVkIHdpdGggb25lIHRhYgo+ICAgICAoaHR0
cHM6Ly9uaWdodGx5LmJ1aWxkcm9vdC5vcmcvI19jb25maWdfZmlsZXMpCj4KPiBDb3VsZCB5b3Ug
Zml4IHRob3NlLCBwbGVhc2U/CgpUaGlzIHdhcyBhbHJlYWR5IGZpeGVkIGluOgoKICBTdWJqZWN0
OiBbUEFUQ0ggMC8yXSBFbmFibGUgdmVudXMgYW5kIGFkZCB2a21hcmsKICBEYXRlOiBNb24sICAy
IERlYyAyMDI0IDE4OjIwOjU5ICswMDAwCiAgTWVzc2FnZS1JZDogPDIwMjQxMjAyMTgyMTAxLjQx
MDMyMC0xLWFsZXguYmVubmVlQGxpbmFyby5vcmc+Cgo+Cj4gQmVzdCByZWdhcmRzLAo+Cj4gSnVs
aWVuLgoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBMaW5hcm8K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
