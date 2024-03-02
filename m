Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57F7C5478C
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 11:06:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5402D83443;
	Sat,  2 Mar 2024 11:06:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJrukWHIK7rT; Sat,  2 Mar 2024 11:06:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B38483640
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B38483640;
	Sat,  2 Mar 2024 11:06:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51A141BF5B3
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 11:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3CBD460819
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 11:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZqxnekUxppjh for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 11:06:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0012A6080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0012A6080B
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0012A6080B
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 11:06:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-412cbf58fdeso6464065e9.3
 for <buildroot@buildroot.org>; Sat, 02 Mar 2024 03:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709377602; x=1709982402;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RsFFcDBNPgFJEA8CHXrxDJBlnEe72jOzPRLBC/I0h7Q=;
 b=IU3k2ENVA7AF/kg84pHMUezbn6RqpTa6c1PdDEpJToSZr01cf1jtI+G9KkdUmOTcSD
 pk2zvOMgk2BNO+BwiEkO41mWxqx4EakcJPfilzzwf9kR8MqPPH8wHplmcriI9bceveVQ
 3C0K/99iTEAoIj1tTT/QEw3IuoeN+P6dmTp1+tTp7XPYeREQRNmhI1cl0LIh/Ji8S448
 Z0fZkZ8CjM5aZHNsfvqXHPWARn2SwtGQvEfJjvcRaBJ/GUIihZBWlCjWLTAtHYrxRUnc
 NK4iyHoa+pycJgNZNrlwfXYOsO715svgAk8RVxJd+s+50MVB0X6RlNqAVwirrylAE7Hl
 iGsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaNMefCH7Pk76CcpDX9nlpPuryzjuXqDcohuWgTypuH8812Q5GEa9MwCeabjbS3P5+m3L6wurYTCFDuqMJlgSwMDj84lZPAA==
X-Gm-Message-State: AOJu0YyHQJI3eBTP1VebrtBCUNjLswK2Uq9kC9Tok36n+5RQCa1ByosO
 /bVxO+2zCUVSlqfeMnTQOZrIkkB4LBDLYVSxZQv+ABEb/0kr/v6GxU2EXp1V2jQ=
X-Google-Smtp-Source: AGHT+IEvAc7lKwHFSjLG5NKFWM131YH70Na0QamhiF8D3yISwKwcufbZzhctT9UoDE2XR9Y8DVMdZg==
X-Received: by 2002:a05:600c:3d8c:b0:412:dad4:a1ec with SMTP id
 bi12-20020a05600c3d8c00b00412dad4a1ecmr282974wmb.28.1709377601637; 
 Sat, 02 Mar 2024 03:06:41 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 g8-20020a05600c310800b00412b0ef22basm8311672wmo.10.2024.03.02.03.06.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Mar 2024 03:06:41 -0800 (PST)
Message-ID: <056ae2bc-0380-4d86-b554-06a375a44bf5@smile.fr>
Date: Sat, 2 Mar 2024 12:06:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
 <20240301133620.3547430-21-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240301133620.3547430-21-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709377602; x=1709982402;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RsFFcDBNPgFJEA8CHXrxDJBlnEe72jOzPRLBC/I0h7Q=;
 b=NS9jD6FqvmyL+GnxvLMt91jgNfxCjAF6raMOmt9kofqxWqpzM/QXvz71TYVsDGsubZ
 w9a6zyTxF1hvELbrl5oKBzqQY4pVbLxmSvt+8RjJZ3dRlJc7TPIlEz+bPO/XpNZqf0nq
 YOEJoKHsOTHER/8yuEeN5ZHkst00sXkQ55lLaXQvuuZ6Bf5k4Gs47/Ise8j/z/5dVmy4
 AbroG2v3GgCCkTx2g7Sm3MAalrjBl7aOgImdaWFAzBVlbPtyqOI47tL01eFtP7JC+BYM
 4zh1xgQtDhwa94UQcCk9QG+vrGApsasNif429Yawni3Hzop092YBbScDUiPOz0HrtASv
 sZcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=NS9jD6Fq
Subject: Re: [Buildroot] [PATCH v8 20/23] package/ti-k3: fix
 BR2_PACKAGE_TI_K3_SOC setting for am64x SOC
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRGFyaW8sCgpMZSAwMS8wMy8yMDI0IMOgIDE0OjM2LCBEYXJpbyBCaW5hY2NoaSBhIMOpY3Jp
dMKgOgo+IEluIHRoZSBjYXNlIG9mIFNPQyBhbTY0eCwgdGktazMtcjUtbG9hZGVyIGNyZWF0ZXMg
dGhlIGZvbGxvd2luZwo+IHRpYm9vdDMuYmluIGZpbGVzOgo+IC0gR1AgICAgLT4gdGlib290M19h
bTY0eC1ncC1ldm0uYmluCj4gLSBIUyAgICAtPiB0aWJvb3QzX2FtNjR4X3NyMi1ocy1ldm0uYmlu
Cj4gLSBIU19GUyAtPiB0aWJvb3QzX2FtNjR4X3NyMi1ocy1mcy1ldm0uYmluCj4gCj4gVGhlIHBh
dGNoIGFsbG93cyB5b3UgdG8gaWRlbnRpZnkgdGhlIGNvcnJlY3QgZmlsZSBiYXNlZCBvbiB0aGUg
U0VDX1RZUEUKPiBvcHRpb24uCgpJdCBzZWVtcyB0aGlzIHBhdGNoIHNob3VsZCBiZSBtZXJnZWQg
d2l0aCB0aGUgQU02NHggdS1ib290IHZlcnNpb24gYnVtcCBzaW5jZQp0aS1rMy1yNSAoYWthIHUt
Ym9vdCkgbm93IHByb3ZpZGUgdGlib290My5iaW4uCgpBbHNvIG90aGVyIFRJIEszIFNvQyB2YXJp
YW50IGxpa2UgQU02NSBwcm92aWRlIGEgc3IyIGJpbmFyeToKCnRpYm9vdDMtYW02MmF4LWhzLWZz
LWV2bS5iaW4KdGlib290My1hbTYyYXgtZ3AtZXZtLmJpbgp0aWJvb3QzLWFtNjJheC1ocy1ldm0u
YmluCgp0aWJvb3QzLWFtNjJweC1ocy1mcy1ldm0uYmluCgp0aWJvb3QzLWFtNjJ4LWhzLWZzLWV2
bS5iaW4KdGlib290My1hbTYyeC1ncC1ldm0uYmluCnRpYm9vdDMtYW02MngtaHMtZXZtLmJpbgoK
dGlib290My1hbTY0eF9zcjItaHMtZnMtZXZtLmJpbgp0aWJvb3QzLWFtNjR4LWdwLWV2bS5iaW4K
dGlib290My1hbTY0eF9zcjItaHMtZXZtLmJpbgoKdGlib290My1hbTY1eF9zcjItZ3AtZXZtLmJp
bgp0aWJvb3QzLWFtNjV4X3NyMi1ocy1ldm0uYmluCgp0aWJvb3QzLWo3MjAwLWdwLWV2bS5iaW4K
dGlib290My1qNzIwMF9zcjItaHMtZnMtZXZtLmJpbgp0aWJvb3QzLWo3MjAwX3NyMi1ocy1ldm0u
YmluCgp0aWJvb3QzLWo3MjFlLWdwLWV2bS5iaW4KdGlib290My1qNzIxZV9zcjItaHMtZnMtZXZt
LmJpbgp0aWJvb3QzLWo3MjFlX3NyMV8xLWhzLWV2bS5iaW4KCnRpYm9vdDMtajcyMXMyLWdwLWV2
bS5iaW4KdGlib290My1qNzIxczItaHMtZnMtZXZtLmJpbgoKdGlib290My1qNzIycy1ocy1mcy1l
dm0uYmluCgp0aWJvb3QzLWo3ODRzNC1ncC1ldm0uYmluCnRpYm9vdDMtajc4NHM0LWhzLWZzLWV2
bS5iaW4KCk1heWJlIHdlIG5lZWQgdG8gaW50cm9kdWNlIFRJX0szX1I1X0xPQURFUl9TT0NfU1VG
RklYIHRvIGhhbmRsZSBzcjIsIHNyMV8xIG9yICIiID8KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVs
YXNvbHV0aW9ucy5jb20+Cj4gCj4gLS0tCj4gCj4gQWRkZWQgaW4gdjgKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+
Cj4gLS0tCj4gIHBhY2thZ2UvdGktazMvQ29uZmlnLmluIHwgMyArKy0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3RpLWszL0NvbmZpZy5pbiBiL3BhY2thZ2UvdGktazMvQ29uZmlnLmluCj4gaW5kZXggYjg1
NDViN2JjYTYyLi45YzYxZjg4ODBhMTUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS90aS1rMy9Db25m
aWcuaW4KPiArKysgYi9wYWNrYWdlL3RpLWszL0NvbmZpZy5pbgo+IEBAIC00Myw3ICs0Myw4IEBA
IGNvbmZpZyBCUjJfUEFDS0FHRV9USV9LM19TT0MKPiAgCXN0cmluZwo+ICAJZGVmYXVsdCAiYW02
MmF4IiBpZiBCUjJfUEFDS0FHRV9USV9LM19TT0NfQU02MkFYCj4gIAlkZWZhdWx0ICJhbTYyeCIg
IGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTYyWAo+IC0JZGVmYXVsdCAiYW02NHgiICBpZiBC
UjJfUEFDS0FHRV9USV9LM19TT0NfQU02NFgKPiArCWRlZmF1bHQgImFtNjR4IiAgaWYgQlIyX1BB
Q0tBR0VfVElfSzNfU09DX0FNNjRYICYmIEJSMl9QQUNLQUdFX1RJX0szX1NFQ1RZUEVfR1AKPiAr
CWRlZmF1bHQgImFtNjR4X3NyMiIgIGlmIEJSMl9QQUNLQUdFX1RJX0szX1NPQ19BTTY0WCAmJiAh
QlIyX1BBQ0tBR0VfVElfSzNfU0VDVFlQRV9HUAo+ICAJZGVmYXVsdCAiYW02NXgiICBpZiBCUjJf
UEFDS0FHRV9USV9LM19TT0NfQU02NVgKPiAgCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9USV9LM19T
RUNUWVBFCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
