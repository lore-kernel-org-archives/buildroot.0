Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428B3C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 13:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDC6660D58;
	Tue,  4 Feb 2025 13:17:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2kOoFnEb2j1a; Tue,  4 Feb 2025 13:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACF2D60C03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACF2D60C03;
	Tue,  4 Feb 2025 13:17:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ABDC185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:17:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AE65406C4
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:17:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGuDHm02yGGy for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 13:17:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 27A2140695
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27A2140695
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27A2140695
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 13:17:15 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436249df846so38203955e9.3
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 05:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738675034; x=1739279834;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hZAVojUI41duR/mDJzkcoLhNFpsEsznN5RL/3UWPHBM=;
 b=T7Ka+tIi8lgV6GJ13Z7hBH4E/SFzI89cqJokXG6MuWscIEdEZUAbGSo36dklBTi6j0
 5aINpRcajjuttVLjmi/Pp3jtr7GbqrwDSD6wP2dqZh6njP+RIqKacmrX5ZyQr0JGhxLD
 uwpYA56Aa3GDhYGMgOWwXcgbC+2U0CxRxSy1qr+9GUy8EeKxwx/97cJjCOYNJ5usFl+V
 QlOdu7+csp+9U2Ysd1i2hUDaTbLQweB8jEX6PV6obltgeWYKBr7IfM3rCBCZrqoAhdva
 JKb5TpasBpa3buGm7CmXfbE5IgOet3cQNZYVUShLvMUbkpv+bI3Hec2qeCcwJkYxt4D/
 PBjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1fUFySUiRkGW7qWL39igXGfhtrOEDROuYuTERvwt5OjCuJV4sWw/iw15eRjMDhbPlOvPv828amqg=@buildroot.org
X-Gm-Message-State: AOJu0YwZhV0UT/BiIM4weLEKOJ9+wbJYVUknq4E1hapori1mRVo1REFe
 2M0qPwkHuBMEz3TDHOica3AOTafEZtLNA0hVoyCZJHaxxOEr/B61sbxrofxedBo=
X-Gm-Gg: ASbGncv47H2vYL5vsV+XZbwwG5/fRtB6ODFb3Jqz1KtWD8ZJ9CqS90+D7K83S41v8Xv
 Vsezbf9gwPc0v23lyfo74laZBbaHNLYxEi/QqhSdaGS1eB22UMaR9fwPRpmuDi4anp1aq0UhTuZ
 YQrKN6aKbtBUDbTzp3v+oWXw4cuASTmweWXHEOyCnaYYhERveMqTEoh1GlP6MCKpGzBlmZ6FDGJ
 zLy6NcY+KcWlIyv1kSKAuVl1NszwflAR3PqVzOZlLJFfW1avrQYm7OBByNsAPWrDcrSH0PR7Q57
 pbSr5cfx9VmuElLPcm35oNaTkjcLe1QVX0xjGmI+t8Pa1J0=
X-Google-Smtp-Source: AGHT+IHEtPHIZNzIK6ZRsKu4+D6C/rof7U7zpnMJpA+wClsbs7UT0XZD8y0aKh2733Vczl+6nbLoEw==
X-Received: by 2002:a05:600c:1c89:b0:434:f82b:c5e6 with SMTP id
 5b1f17b1804b1-438dc3af78cmr187238435e9.1.1738675034022; 
 Tue, 04 Feb 2025 05:17:14 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b57b6sm15832573f8f.72.2025.02.04.05.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 05:17:13 -0800 (PST)
Message-ID: <513ab9a4-3fc9-47cd-9387-5d8b66895127@mind.be>
Date: Tue, 4 Feb 2025 14:17:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
 <287b51b1-5c1a-4048-99e5-42a53cd949cc@mind.be>
Content-Language: en-GB
In-Reply-To: <287b51b1-5c1a-4048-99e5-42a53cd949cc@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738675034; x=1739279834; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hZAVojUI41duR/mDJzkcoLhNFpsEsznN5RL/3UWPHBM=;
 b=G7T65YdlY17ZG0KA0rvSOlu8Fj4iFjhEsyAIoBjV36g5LsCX7IHxPT4aNCjLEFsJK+
 MB75p9LRmq13N0Xdy9KhGT6KMm2q4pjdXrbbRYfYvUqt7kgQDYxCoHLAwiXvIbgJ/Hpz
 EwyN5UoLLAT5H8WEZFJ1mKX6m0/UoomwH+3WsWHHum6qKikrIYkfhmaKlYojQuxep4Ak
 oRxzTi621Q6ONKKc4Lsk6I7gB/oU/J2rukcGLQ6gVysHWy+X7PKn26izaIUVvoM3b5L1
 837bUhtQpPS3eeXvfW5QaF8otO7YXP6WqS1qRKmT3q953BYaSl86rfxC4iYD+mNO1Wua
 X1bA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=G7T65Ydl
Subject: Re: [Buildroot] [PATCH 0/6] mender cleanup and intermittent update
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA0LzAyLzIwMjUgMTQ6MDIsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAxNC8xMC8yMDI0IDEyOjIxLCBBZGFtIER1c2tldHQgd3JvdGU6Cj4+IEluc3RlYWQgb2YgdXBk
YXRpbmcgbWVuZGVyIGRpcmVjdGx5IHRvIDQueCwgd2hpY2ggaXMgZmFyIHRvbyBsYXJnZQo+PiBv
ZiBhIGNoYW5nZSwgdXBkYXRlIGl0IHRvIDMuNS4zIHdoaWNoIGlzIHRoZSBsYXN0IG9mIHRoZSBH
TyB2ZXJzaW9uLgo+Pgo+PiBUaGlzIG5vdCBvbmx5IHByb3ZpZGVzIHNlY3VyaXR5IGFuZCBidWcg
Zml4ZXMsIGJ1dCBpdCBtYWtlcyB0aGUKPj4gdHJhbnNpdGlvbiB0byA0Lnggd2hlbiBzb21lb25l
IHBpY2tzIHRoYXQgdXAgbXVjaCBlYXNpZXIuIFRoaXMgaXMgYmFzZWQKPj4gb2ZmIG9mIHByZXZp
b3VzIHdvcmsgZm91bmQgaGVyZToKPj4KPj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIzMTIxOTE3MjQ0Ni40OTg0MDktNi1hZGFtLmR1c2tl
dHRAYW1hcnVsYXNvbHV0aW9ucy5jb20vIAo+Pgo+Pgo+PiBXaXRoIHRoZSBhZGRpdGlvbiBvZiBt
b3JlIHRlc3RzLCBjbGVhbmluZyB1cCBkb2N1bWVudGF0aW9uLCBhbmQgYWRkaW5nIHNvbWUKPj4g
aW5mb3JtYXRpb24gaW4gdGhlIG1pZ3JhdGluZy5hZG9jIGZpbGUuCj4+Cj4+IEFkYW0gRHVza2V0
dCAoNik6Cj4+IMKgwqAgYm9hcmQvbWVuZGVyL3g4Nl82NC9wb3N0LWltYWdlLWVmaS5zaDogcmUt
YXJyYW5nZSB3cml0ZSByb290ZnMtaW1hZ2UKPj4gwqDCoMKgwqAgYXJncwo+PiDCoMKgIHBhY2th
Z2UvbWVuZGVyOiByZW1vdmUgL3Zhci9saWIvbWVuZGVyIHN5bWxpbmtpbmcKPj4gwqDCoCBzdXBw
b3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X21lbmRlci5weTogQWRkIFJPIGZzIHRlc3QK
Pj4gwqDCoCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X21lbmRlci5weTogQWRk
IGEgc3lzdGVtZCB0ZXN0Cj4+IMKgwqAgcGFja2FnZS9tZW5kZXIvcmVhZG1lLnR4dDogdXBkYXRl
IHJlYWRtZQo+Cj4gwqBQYXRjaGVzIDEtNSBhcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLiBUaGVy
ZSB3YXMgYSBmbGFrZTggZXJyb3IgaW4gb25lIG9mIHRoZSAKPiBwYXRjaGVzLCBidXQgb3RoZXJ3
aXNlIGl0IGxvb2tlZCBncmVhdCEKPgo+IMKgVGhhbmtzIGZvciBjb250aW51aW5nIHRvIHdvcmsg
b24gbWVuZGVyIGludGVncmF0aW9uIGluIEJ1aWxkcm9vdCEgQW5kIGFzIAo+IHVzdWFsLCBzb3Jy
eSB0aGF0IGl0IHRha2VzIHNvIGxvbmcgYmVmb3JlIHRoaW5ncyBnZXQgYXBwbGllZC4KPgo+PiDC
oMKgIHBhY2thZ2UvbWVuZGVyOiBidW1wIHZlcnNpb24gdG8gMy41LjMKPgo+IMKgSSBoYXZlbid0
IGFwcGxpZWQgdGhpcyBvbmUgYmVjYXVzZSB5b3UgaGF2ZSBzZW50IHRoZSBidW1wIHRvIDQuMC4w
LgoKCiDCoE9vcHMsIEkgZ290IGNvbmZ1c2VkIGJldHdlZW4gbWVuZGVyIGFuZCBtZW5kZXItYXJ0
aWZhY3QuIEknbGwgYXBwbHkgdGhpcyBvbmUgCmFzIHdlbGwuCgoKIMKgUmVnYXJkcywKIMKgQXJu
b3V0CgoKPgo+IMKgUmVnYXJkcywKPiDCoEFybm91dAo+Cj4+Cj4+IMKgIGJvYXJkL21lbmRlci94
ODZfNjQvcG9zdC1idWlsZC5zaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEyICstLS0KPj4g
wqAgYm9hcmQvbWVuZGVyL3g4Nl82NC9wb3N0LWltYWdlLWVmaS5zaMKgwqDCoMKgwqDCoMKgwqAg
fCAyNSArKysrKysrLQo+PiDCoCBkb2NzL21hbnVhbC9taWdyYXRpbmcuYWRvY8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTUgKysrKysKPj4gwqAgcGFja2FnZS9tZW5k
ZXIvUzQybWVuZGVywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwg
MTYgLS0tLS0KPj4gwqAgcGFja2FnZS9tZW5kZXIvYXJ0aWZhY3RfaW5mb8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgLQo+PiDCoCBwYWNrYWdlL21lbmRlci9tZW5kZXIt
Y2xpZW50LnNlcnZpY2XCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMSAtLS0tCj4+IMKgIHBhY2thZ2Uv
bWVuZGVyL21lbmRlci5jb25mwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fMKgIDEgKwo+PiDCoCBwYWNrYWdlL21lbmRlci9tZW5kZXIuaGFzaMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTAgKy0tCj4+IMKgIHBhY2thZ2UvbWVuZGVyL21lbmRl
ci5ta8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEwICsrLQo+
PiDCoCBwYWNrYWdlL21lbmRlci9yZWFkbWUudHh0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDYwICsrKysrKy0tLS0tLS0tLS0tCj4+IMKgIHN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9wYWNrYWdlL3Rlc3RfbWVuZGVyLnB5wqAgfCA2NCArKysrKysrKysrKysrKystLS0t
Cj4+IMKgIC4uLi90ZXN0cy9wYWNrYWdlL3Rlc3RfbWVuZGVyL3Bvc3QtYnVpbGQuc2jCoMKgIHwg
MjUgKysrKysrKysKPj4gwqAgMTIgZmlsZXMgY2hhbmdlZCwgMTQ4IGluc2VydGlvbnMoKyksIDEw
MiBkZWxldGlvbnMoLSkKPj4gwqAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbWVuZGVyL2Fy
dGlmYWN0X2luZm8KPj4gwqAgY3JlYXRlIG1vZGUgMTAwNzU1IHN1cHBvcnQvdGVzdGluZy90ZXN0
cy9wYWNrYWdlL3Rlc3RfbWVuZGVyL3Bvc3QtYnVpbGQuc2gKPj4KPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
