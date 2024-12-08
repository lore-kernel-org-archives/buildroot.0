Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD963E7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 03:06:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1ED4F4057B;
	Sun,  8 Dec 2024 03:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id juFXbgRYfoan; Sun,  8 Dec 2024 03:06:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE5AB4057C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE5AB4057C;
	Sun,  8 Dec 2024 03:06:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B331979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 03:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9BA76078A
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 03:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajhRLT116RnC for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 03:06:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 48C3A60784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48C3A60784
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48C3A60784
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 03:06:24 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-7252fba4de1so3689097b3a.0
 for <buildroot@buildroot.org>; Sat, 07 Dec 2024 19:06:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733627183; x=1734231983;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8RwmyvinTfCxkQ8L03bVnn2txetHI1BrdhuNACHsikQ=;
 b=ipxHw6EZhSMg4oZpJ21QhfrWbtLwwnKxKxCISdrzuzjs15CmzKKOpZSINs75SSygpJ
 yLd2ZPXWj7O+u6Spq61kNPj6OzfL2kTrVTAMtA+HW22Uzfe3ro8EGvtZuv2loeLcohDQ
 f6ITtNHaY2AIbJliRRJrNtYV25WmcEdnmjHK00oGY1bez1KODr4kTwLGyjxFELf2JpOE
 oZrgyMSuEUJr9h51+6zoZT5kobL2fOSc6BHM0swYOzZvvXM0iAf5Pw4W79y9F/O7oFgO
 t8KyZIt88BlGZ2px5ipT8MC+Rtdw1uPyqEijRDjBKyjQRNavNY0CpRKPfybNvxRGNi6r
 5e6A==
X-Gm-Message-State: AOJu0YyyMYBTXw/aiG1YRJZmM8mU5XsE5HcjxBavnHKWZ486AM1Dc1IV
 /5+fooIGg1PzwdxlApPJZRYnjj76yrXORBcfEU73grvsWXhaOGg6
X-Gm-Gg: ASbGncvar3ovNW2XMd3o1lEVWG+PeTpiNMK7YBL0v5jGiBxn33zZbCatoGnj3FHNUVY
 hgjAUewu66OBVdhHLmYkTzBpW7dSN0DL4OmbeqemhUxi5T/NbjqUs67m2XFFRaAYL91GNOhq0ZS
 dR/Uw27oYpJsMj8bQVzb0/lliaYLXTUOMPmQAwGmm1l0C7wraGBx+FfDLkZERrH6U0Xu7EV/uYo
 bSoKypsieRYbg6zcxnrgv00KzPsj9JDWUFt6B14aGzOlVeIld2LEtUXvQFpkAka+rEmwQ==
X-Google-Smtp-Source: AGHT+IEk0zRETMnPpp/REWlAE60ZCA/13SUk2t0CNv3dPQK2JdORYiRrwn229UhkioBHZmHYKX3LjQ==
X-Received: by 2002:a05:6a00:189a:b0:725:b1df:2daa with SMTP id
 d2e1a72fcca58-725b81a7373mr15163657b3a.20.1733627183202; 
 Sat, 07 Dec 2024 19:06:23 -0800 (PST)
Received: from [192.168.10.205] ([199.119.84.5])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7fd3b48171csm1405044a12.13.2024.12.07.19.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Dec 2024 19:06:22 -0800 (PST)
Message-ID: <f5c71fd0-1eb9-4e33-959c-928e31f0949c@gmail.com>
Date: Sat, 7 Dec 2024 20:06:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
References: <20241107134342.4306-1-tianyuanhao3@163.com>
 <20241107134342.4306-2-tianyuanhao3@163.com>
 <544b4ef9-04bd-43e5-8655-23556a740f7b@mind.be>
 <6e2e67e6.2701.193949deeb9.Coremail.tianyuanhao3@163.com>
 <7b139544-134b-4775-9070-ffd0dbd66438@gmail.com>
 <87frn04css.fsf@dell.be.48ers.dk>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <87frn04css.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733627183; x=1734231983; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8RwmyvinTfCxkQ8L03bVnn2txetHI1BrdhuNACHsikQ=;
 b=HCNzAkRSBOF0k7JWGEdAsYBMUMbJhgOd61qMv4LLqdI8vb6818SV+QTeRhk/uTcu6r
 UxEnEsI6O9jsquRTp+NZ2JWgqgw6xLD+UKBJvzHE4xVj3Hofi6Y5Buwenxtqv8SYO4kv
 37wzKvS9qqpv5gHv7gK9wnW9hSc4t3hVhZrZueEb/tt7Wx5C5hachAiC64vlLHXqg8n8
 IQlaAc6LTlJrLR/fFic4a0vPH0WcSkvBiPBBpbmgeax+WZWOE2Gb9f7bOMcTBL5LCmdw
 aKYPtrBNa2XEnOVJ8an7niPT+A/xcLP4L4u2AuzHSBr1cZOo7BU2SOzqOiH0jEfpX4S5
 FmKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HCNzAkRS
Subject: Re: [Buildroot] [PATCH v2 2/2] package/gnutls: fix configure options
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tcGlsZXMgZ29vZCBub3cuCgp0aGFua3MhCgpPbiAxMi82LzIwMjQgNDoyMiBQTSwgUGV0ZXIg
S29yc2dhYXJkIHdyb3RlOgo+Pj4+Pj4gIkxhbmNlIiA9PSBMYW5jZSBGcmVkcmlja3NvbiA8bGFu
Y2V0aGVwYW50c0BnbWFpbC5jb20+IHdyaXRlczoKPiAgID4gSW4gMjAyNC4xMS1yYzMgSSBhbSBu
b3cgZ2V0dGluZyB0aGlzIGVycm9yIHRoYXQgd2FzIG5vdCBwcmVzZW50IGluCj4gICA+IDIwMjQu
MTEtcmMyLgo+Cj4gICA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkbHdyYXAvYnJvdGxpZW5jLmM6
MTI6Cj4gICA+IGRsd3JhcC9icm90bGllbmMuaDoxMToxMDogZmF0YWwgZXJyb3I6IGJyb3RsaS9l
bmNvZGUuaDogTm8gc3VjaCBmaWxlCj4gICA+IG9yIGRpcmVjdG9yeQo+ICAgPiDCoMKgIDExIHwg
I2luY2x1ZGUgPGJyb3RsaS9lbmNvZGUuaD4KPiAgID4gwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKg
wqDCoMKgIF5+fn5+fn5+fn5+fn5+fn5+Cj4gICA+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCj4g
ICA+IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkbHdyYXAvYnJvdGxpZGVjLmM6MTI6Cj4gICA+IGRs
d3JhcC9icm90bGlkZWMuaDoxMToxMDogZmF0YWwgZXJyb3I6IGJyb3RsaS9kZWNvZGUuaDogTm8g
c3VjaCBmaWxlCj4gICA+IG9yIGRpcmVjdG9yeQo+ICAgPiDCoMKgIDExIHwgI2luY2x1ZGUgPGJy
b3RsaS9kZWNvZGUuaD4KPiAgID4gwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+
fn5+fn5+fn5+fn5+Cj4gICA+IGNvbXBpbGF0aW9uIHRlcm1pbmF0ZWQuCj4KPiAgID4gTG9va3Mg
ZnJvbSBkaXNjdXNzaW9uIHRoYXQgYSBkaWZmZXJlbnQgcGF0Y2ggaXMgbmVlZGVkIG9yIHBhdGNo
IDIvMgo+ICAgPiBuZWVkcyByZXZlcnRlZCBzaW5jZSAxLzIgaXMgc2xhdGVkIGZvciBuZXh0Lgo+
Cj4gSSBoYXZlIGFwcGxpZWQgdGhlIGJ1bXAgdG8gMy44LjgsIHdoaWNoIGZpeGVzIHRoZSBidWls
ZCBoZXJlLiBDYW4geW91Cj4gdHJ5IGN1cnJlbnQgbWFzdGVyIGFzIHdlbGw/Cj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
