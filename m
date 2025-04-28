Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C73C36005
	for <buildroot@archiver.kernel.org>; Mon, 28 Apr 2025 09:25:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB0780AFD;
	Mon, 28 Apr 2025 09:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ze8xMn5cLod; Mon, 28 Apr 2025 09:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23F9280B9E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23F9280B9E;
	Mon, 28 Apr 2025 09:25:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2B44C5
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 09:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9863C8128B
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 09:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8l117ZdYvb6A for <buildroot@buildroot.org>;
 Mon, 28 Apr 2025 09:25:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 33F2480AFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33F2480AFD
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33F2480AFD
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 09:25:24 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so8256576a12.0
 for <buildroot@buildroot.org>; Mon, 28 Apr 2025 02:25:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745832322; x=1746437122;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mzAsXsFVILUfrUOlJ/GBbVyz0SMkYLLzutPwO+jgp34=;
 b=Sz2p/cKh0leQRVJPYZRQPOLH635bA97UoacCVnYjOkfRrMZW4OO1DCVQxrFk2EqFpw
 WfwA6c7ednx+YCQitVqiVjFIRmO1oVVOTxCBxfBnvva/vB7DEgTKRQlzlfdxNIljh1yb
 Usu+QJpev6SfrIVpn9h4RHnnekM26fDSTS7OiJ3xjr4T4B74YIzpyXb5oG0Hg9SISt+k
 Q4Qhbm21DYEReh8PZSkv4iG0+mPpdex3PpClmvM/fAucRBS9uRcG06O2dnJ5COiHnts7
 oVMc8PA3xvM5tsRpOdHxmJpfnKeM4PUbv64naPoAf2MeLCODf2Thz2NGWE2T2uGqpV97
 lPMw==
X-Gm-Message-State: AOJu0YyK6KIoehMe/qgmzavxk8fHc3QeQysBMwErRUjkXyKTH9oMX92r
 PsBOkLyLVAqaoyS3N4EjBT5Ajc69DuRspuStNx+FWJ018n4mvQgf6RJtLZnpY9c=
X-Gm-Gg: ASbGncu7Ff9Tiggouy9+hnoqIYyflCILztktP5w1ttMEw0qgoNGNUHfmDmzTWrqxk/F
 EGVlsyroIsdfZlFPJvEyDGkpGNT+CeJ7bd1hCphZrg7rIlSyDJVHhAfb4JrPaeJwpG8gf3vNQcv
 nUTt8/78lyG4P1HjX9ECYjmWCz3e+/rQ+VWir1+WJvrUzMG6PvwMGv4c89V0KjIHTfXpOpj86Jq
 GrCGEOYl/KJslbQbOfy/Vsis9i6tygb4bxguONN3THiSDr5iAHUPlcnh5SqmPfPgffzWG3yFnPP
 +XIUROc2BTh6CDK83EhN25/baNg+fgx3QYq060m/qBAKoVdnUdPe4g==
X-Google-Smtp-Source: AGHT+IGMxlRZ6gUfr2vUd5KDoZtk/DPiVi2oHhJSrs/UEXebAAm1AW4ClDCY1ZYR0utoWk9xRD7hMA==
X-Received: by 2002:a17:907:7e95:b0:aca:a1d8:981f with SMTP id
 a640c23a62f3a-ace848c02e9mr690860066b.12.1745832321892; 
 Mon, 28 Apr 2025 02:25:21 -0700 (PDT)
Received: from draig.lan ([185.126.160.109]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed6aed0sm592397566b.135.2025.04.28.02.25.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 02:25:21 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 72A0F5F877;
 Mon, 28 Apr 2025 10:25:20 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Adam Duskett
 <adam.duskett@amarulasolutions.com>,  Daniel Lang <dalang@gmx.at>,  Eric
 Le Bihan <eric.le.bihan.dev@free.fr>,  Julien Olivain <ju.o@free.fr>,
 Romain Naour <romain.naour@gmail.com>,  Valentin Korenblit
 <valentinkorenblit@gmail.com>
In-Reply-To: <20250306203405.3348934-5-bernd@kuhls.net> (Bernd Kuhls's message
 of "Thu, 6 Mar 2025 21:34:05 +0100")
References: <20250306203405.3348934-1-bernd@kuhls.net>
 <20250306203405.3348934-5-bernd@kuhls.net>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 28 Apr 2025 10:25:20 +0100
Message-ID: <87ikmo63jz.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745832322; x=1746437122; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mzAsXsFVILUfrUOlJ/GBbVyz0SMkYLLzutPwO+jgp34=;
 b=vYqTQ1roj2VBjXm+YL2Ok/cdezQUycEUzBAD1Bu2JJlvuEM5BcVmEej12mG5n3RUBV
 JbGJTwVVyK8l5dN+WMu1M2YJQe7OYMEt1I14JvwQxHECEx3ti+BL0GfV3fDynXVon4oW
 xj3MQBbaBf/vXAzZW0jpRbScrikDvCPVa13AuB41quqyOcsH9CdcdiT4gh82fDGj74ia
 5/O/Hac3RC8wrIOdrCx1OHMA2f6sOpOL++Hn20a64BJl7e9+4M8x3Ev+2BUPgZvS2Yoh
 F6B/G4CtJbDQe6G6m7hWGNya24s9/vhCGSzeZCwTd2SAkZGx6YHawhCqTQGraVgfk5hg
 7ZuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vYqTQ1ro
Subject: Re: [Buildroot] [PATCH/next v9 5/5] package/{mesa3d,
 mesa3d-headers}: bump version to 25.0.1
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

QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JpdGVzOgoKPiBSZWxlYXNlIG5vdGVzOgo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAy
NC1NYXkvMDAwNzYyLmh0bWwKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZl
cy9tZXNhLWFubm91bmNlLzIwMjQtSnVuZS8wMDA3NjMuaHRtbAo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNC1KdW5lLzAwMDc2NS5odG1s
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvbWVzYS1hbm5vdW5jZS8y
MDI0LUp1bHkvMDAwNzY2Lmh0bWwKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNo
aXZlcy9tZXNhLWFubm91bmNlLzIwMjQtSnVseS8wMDA3NjcuaHRtbAo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNC1KdWx5LzAwMDc3MS5o
dG1sCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvbWVzYS1hbm5vdW5j
ZS8yMDI0LUF1Z3VzdC8wMDA3NzMuaHRtbAo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNC1BdWd1c3QvMDAwNzc2Lmh0bWwKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9tZXNhLWFubm91bmNlLzIwMjQtU2VwdGVt
YmVyLzAwMDc3OC5odG1sCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMv
bWVzYS1hbm5vdW5jZS8yMDI0LVNlcHRlbWJlci8wMDA3NzkuaHRtbAo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNC1PY3RvYmVyLzAwMDc4
MC5odG1sCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvbWVzYS1hbm5v
dW5jZS8yMDI0LU9jdG9iZXIvMDAwNzgxLmh0bWwKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9hcmNoaXZlcy9tZXNhLWFubm91bmNlLzIwMjQtT2N0b2Jlci8wMDA3ODIuaHRtbAo+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNC1O
b3ZlbWJlci8wMDA3ODQuaHRtbAo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hp
dmVzL21lc2EtYW5ub3VuY2UvMjAyNC1Ob3ZlbWJlci8wMDA3ODYuaHRtbAo+IGh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNC1EZWNlbWJlci8w
MDA3ODguaHRtbAo+IGh0dHBzOi8vZG9jcy5tZXNhM2Qub3JnL3JlbG5vdGVzLzI0LjMuMi5odG1s
Cj4gaHR0cHM6Ly9kb2NzLm1lc2EzZC5vcmcvcmVsbm90ZXMvMjQuMy4zLmh0bWwKPiBodHRwczov
L2RvY3MubWVzYTNkLm9yZy9yZWxub3Rlcy8yNC4zLjQuaHRtbAo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNS1GZWJydWFyeS8wMDA3OTMu
aHRtbAo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3Vu
Y2UvMjAyNS1NYXJjaC8wMDA3OTQuaHRtbAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IENoYW5nZXMgbmVl
ZGVkIGZvciB0aGUgYnVtcCB0byAyNC4xLng6Cj4KPiBBZGRlZCBkZXBlbmRlbmN5IHRvIGxsdm0g
JiBDby4gZm9yIGlyaXMgZHJpdmVyIGR1ZSB0byB1cHN0cmVhbSBjb21taXQ6Cj4gaHR0cHM6Ly9j
Z2l0LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvY29tbWl0L21lc29uLmJ1aWxkP2g9MjQuMSZp
ZD1hNTEyYzJhOGI1NzJjNWRhMzYwODczMzIwZGJiZDM0M2M2MjIzY2Q2Cj4KPiBBZGRlZCBob3N0
IHZlcnNpb24gb2YgbWVzYSB0b29sIGludGVsX2NsYyBuZWVkZWQgZm9yIHRhcmdldCBidWlsZCBv
ZiB0aGUKPiBpcmlzIGRyaXZlci4KPgo+IEFkZGVkIGRlcGVuZGVuY3kgdG8gaG9zdC1weXRob24t
cHljcGFyc2VyIGZvciBldG5hdml2IGRyaXZlciBkdWUgdG8KPiB1cHN0cmVhbSBjb21taXQ6Cj4g
aHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvY29tbWl0L3NyYy9ldG5hdml2
L2h3ZGIvbWVzb24uYnVpbGQ/aD0yNC4xJmlkPTIxOTJlNjIwYmIwYzY4Yjc1ZmY0NTE2NWQwYjEx
N2M3ZWNiNzcyNjgKPgo+IEFkZGVkIGRlcGVuZGVuY3kgdG8gaG9zdC1weXRob24tcGx5IGZvciBp
bnRlbCB2dWxrYW4gZHJpdmVyIGR1ZSB0bwo+IHVwc3RyZWFtIGNvbW1pdDoKPiBodHRwczovL2Nn
aXQuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS9jb21taXQvc3JjL2ludGVsL3Z1bGthbi9ncmwv
bWVzb24uYnVpbGQ/aD0yNC4xJmlkPWRjMWFlZGVmMmJkMDU0ODg0Njg1YWQ5NzFhM2VmNWJlMDdl
Y2QxMDEKPgo+IEFsdGhvdWdoIHRoaXMgZGVwZW5kZW5jeSBleGlzdHMgc2luY2UgbWVzYTNkIDIy
LjMgaXQgaXMgb25seSBuZWVkZWQgd2hlbgo+IGludGVsLWNsYyBpcyBlbmFibGVkLCB0aGlzIGRl
cGVuZGVuY3kgaXMgYWRkZWQgd2l0aCB0aGlzIHBhdGNoIHNvIG5vIG5lZWQKPiB0byBiYWNrcG9y
dCB0aGlzIGRlcGVuZGVuY3kgdG8gb2xkZXIgYnVpbGRyb290IHRyZWVzLgo+Cj4gVXBkYXRlIGNv
bmZpZ3VyZSBwYXJhbWV0ZXIgb2YgZ2x2bmQgb3B0aW9uIGR1ZSB0byB1cHN0cmVhbSBjb21taXQ6
Cj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvY29tbWl0L21lc29uLmJ1
aWxkP2g9MjQuMSZpZD00ZjI1Yjg0YjI0NjA1MjRkMzc1NDI0YTgxYjQyZmFhNGQ5OWM4ZTYwCj4g
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4gQ2hhbmdlcyBuZWVkZWQgZm9yIHRoZSBidW1wIHRvIDI0LjIueDoK
Pgo+IEFkZGVkIGRlcGVuZGVuY3kgdG8gaG9zdC1weXRob24tcHl5YW1sIHRvIGhvc3QgYW5kIHRh
cmdldCBidWlsZCwgbmVlZGVkCj4gZHVlIHRvIHVwc3RyZWFtIGNvbW1pdAo+IGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9jb21taXQvYTM4MTMzMjc1NzVlODg3NWM4
YzNlZDI0YjVmNDVhMGI3YmE2NDQ0Ngo+Cj4gUmViYXNlZCBwYXRjaCAwMDAyIGR1ZSB0byB1cHN0
cmVhbSBjb21taXQ6Cj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvY29t
bWl0L3NyYy9nYWxsaXVtL2RyaXZlcnMvdmM0L21lc29uLmJ1aWxkP2g9MjQuMiZpZD1kYTcwODI3
NjU2NzU3Y2QwNzBmYWFjN2FmZjVjYTA1N2YxZTdmYjhhCj4KPiBSZW5hbWVkIEJSMl9QQUNLQUdF
X01FU0EzRF9HQUxMSVVNX0RSSVZFUl9TV1JBU1QgdG8KPiBCUjJfUEFDS0FHRV9NRVNBM0RfR0FM
TElVTV9EUklWRVJfU09GVFBJUEUgKGFsc28gdXBkYXRlZCB0ZXN0cykgYW5kCj4gYWRkZWQgbmV3
IG9wdGlvbiBCUjJfUEFDS0FHRV9NRVNBM0RfR0FMTElVTV9EUklWRVJfTExWTVBJUEUgZHVlIHRv
Cj4gdXBzdHJlYW0gY29tbWl0Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Ev
bWVzYS8tL2NvbW1pdC8wMTBiMmY5NDk3YWIyNTZkOWU4MDQxMjA3OTAyOTQ4MzMxYWY1YjRiCj4g
ImdhbGxpdW0vbWVzb246IERlY29uZmxhdGUgc3dyYXN0L3NvZnRwaXBlL2xsdm1waXBlIgo+IC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IENoYW5nZXMgbmVlZGVkIGZvciB0aGUgYnVtcCB0byAyNC4zLng6Cj4K
PiBSZWJhc2VkIHBhdGNoIDAwMDIgYWdhaW4gZHVlIHRvIHVwc3RyZWFtIGNvbW1pdDoKPiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vY29tbWl0LzI1YmE5MGZkODg4
Y2VmNDMxYzIwOThjOGFmZGIwYTJiYmQzNGIzMDMKPgo+IFJlbW92ZWQgZHJpMyBjb25maWd1cmUg
b3B0aW9uOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9jb21t
aXQvOGY2ZmNhODlhYTE4MTJiMDNkYTZkOWY3ZmFjMzk2Njk1NWFiYzQxZQo+Cj4gUmVtb3ZlZCBn
YWxsaXVtLW9teCBjb25maWd1cmUgb3B0aW9uOgo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9w
Lm9yZy9tZXNhL21lc2EvLS9jb21taXQvOWI2YzI3YTMyMGFiNGIwZmNmMWZiMTYyMjBhZTdjM2Qz
ZjA2ZjdkZgo+Cj4gUmVtb3ZlZCBnYWxsaXVtIGttc3JvIGNvbmZpZ3VyZSBvcHRpb246Cj4gaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC84OTg2M2EwNTBi
ZWE0MjlkOTU3NGEzMDdiYzI4OTUzYmI2MGFjY2FmCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1pdC83MDgxM2MxYzEzYjk5Y2IwMjljOGZhMzUzNzE2MzY1
MGJkZDE3YjZkCj4gTm8gbGVnYWN5IG9wdGlvbiBuZWVkZWQgZHVlIHRvIGF1dG9tYXRpYyBoYW5k
bGluZyBieSB0aGUgbWVzYSBidWlsZAo+IHN5c3RlbTogIkF1dG9tYXRpY2FsbHkgaW5jbHVkZSBp
dCBpZiB3ZSdyZSBidWlsZGluZyB3aXRoIGEgZHJpdmVyIHRoYXQKPiBkZXBlbmRzIG9uIGl0LCBh
bmQgZG9uJ3QgaW5jbHVkZSBpdCBpZiB3ZSdyZSBub3QuIgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IENo
YW5nZXMgbmVlZGVkIGZvciB0aGUgYnVtcCB0byAyNS4wLng6Cj4KPiBSZWJhc2VkIHBhdGNoIDAw
MDEsIGFkZGVkIGxpY2Vuc2UgZmlsZXMgYW5kIHVwZGF0ZWQgbGljZW5zZSBoYXNoCj4gZHVlIHRv
IHVwc3RyZWFtIGNvbW1pdHMgd2hpY2ggcmVzdHJ1Y3R1cmVkIHRoZSBsaWNlbnNlIGZpbGVzOgo+
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL21lc2EvLS9jb21taXQvNjk4NDli
YzRkMWRkM2NiOWU5ZGQ1ZDgzYjJmZjYzYjhiNGVkY2U5YiNlNjcyMjA4MzQwYjMwZjk3M2NkYWIx
MTQyMWYxYzkxYjM5ZDVjMDJlCj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2Ev
bWVzYS8tL2NvbW1pdC9jMjJkNjQwZmU5NGY2MzkwMDY4Zjc5NDc1ZmI2YjJjNDViYjI1NTdiCj4K
PiBSZW1vdmVkIGNvbmZpZ3VyZSBvcHRpb24gb3BlbmNsLXNwaXJ2IGR1ZSB0byB1cHN0cmVhbSBj
b21taXQ6Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVzYS8tL2NvbW1p
dC84MGM0ZmZiNjFhOTFlZDI1MmQ0NWUzOGE5NmU4OTNjZWMwNzcxOTQwCj4KPiBVcGRhdGVkIGNv
bmZpZ3VyZSBvcHRpb25zIGZvciBob3N0LWJ1aWxkIGNsYyB3aGljaCB3YXMgYWxzbyByZW5hbWVk
IGZyb20KPiBpbnRlbF9jbGMgdG8gbWVzYV9jbGMsIGFkZGVkIGhvc3QgdmVyc2lvbiBvZiB2dG5f
YmluZGdlbjoKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vbWVy
Z2VfcmVxdWVzdHMvMzI3MTkKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9t
ZXNhLy0vY29tbWl0LzEzZmU1YTU5N2JiOGVkZWRhYTdjMWM4M2YzYjY0YzRlOTAzMTU2MTgKPiBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0vY29tbWl0LzVkZGVlYTlh
NjJmNzIwZTlmZDNhNmU1Yzc2Zjc0ZWY2ZThiMWZkZjgKPgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5k
IEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+CgpUaGlzIGlzIG1pc3NpbmcgdGhlIHItYiBhbmQgdC1i
IHRhZ3MgZnJvbSB0aGUgbGFzdCB2ZXJzaW9uLiBJcyB0aGF0CmJlY2F1c2UgeW91IGV4cGVjdCBh
IGZ1bGwgcmUtcmV2aWV3IGZvciB0aGUgbWlub3IgdmVyc2lvbiBidW1wPwoKSSdtIHRyeWluZyB0
byB3b3JrIG91dCB3aGF0IEkgY2FuIGRvIHRvIGhlbHAgZ2V0IHRoaXMgdXBzdHJlYW1lZCBzbyBJ
CmNhbiBnZXQgdGhlIHZrbWFyayBzdHVmZiB1cHN0cmVhbWVkLgoKLS0gCkFsZXggQmVubsOpZQpW
aXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBMaW5hcm8KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
