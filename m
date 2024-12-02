Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED71D7831C
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 18:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15F47605EE;
	Mon,  2 Dec 2024 18:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rmoOdrWe0zdA; Mon,  2 Dec 2024 18:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 358C960608
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 358C960608;
	Mon,  2 Dec 2024 18:03:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 535EC1ED7
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3345B60608
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 18:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7uLzpwHvBhG for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 18:03:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9DC5605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9DC5605EE
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9DC5605EE
 for <buildroot@uclibc.org>; Mon,  2 Dec 2024 18:03:22 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434b3e32e9dso39108345e9.2
 for <buildroot@uclibc.org>; Mon, 02 Dec 2024 10:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733162600; x=1733767400;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dZzQGofudzyReCHRYWAdGL0KlCJVnSp6VVaGA4yjKgs=;
 b=JSMqzAS9LNseWbXB617tIfQaTtwbar3Eu3lrfAZ8a7x2+i8ZHJQHjP0ESJ7B/ywjPG
 RVV4v8I6vRk8PhyThN6kPlnnoBNu18fX2LMPg/Epcc6IvQPYg+aFcVOBqIMae1b02Yqx
 R6pHjaNfJhkVvOG8yA6PUW3KAug+fEXxAT1X8voj/6hdjHrXoLfoZnGX7KRlUgGj+KFi
 Y9Bu29DPTeAZUbUxEYsHLBjz4jz5XvYUX7Fz5wlckwwUWeDwrmpu+3+nq9uMcduSM2Fy
 WTL8CkQOBUozEdW49Vu5cm40c7rduSNb4zfzGCz7jnE1oQ5YcRTQWTx+6ehfRm40Jhsf
 OMpA==
X-Gm-Message-State: AOJu0YzOUJLJ8dUodXbsjEymkylpwmSwaGw1L+h8LjpMB6n1esjsKWTb
 0/abEIp+GHH2Fyc69G5E/u8I1fglubhfrs/YBf+TVqgLmAt4woN9A8AQNUjFY10=
X-Gm-Gg: ASbGncvRdN3b1+A/9jLTkxqeLZadV3B7l60WBIuhMV1sy9cvm/A8+JRlPn3kUzoAO8e
 brJMn6li+hZ8IsWTRgjQfutWQJGthUpZb6P1/gdaFTngnvPq9yDYJyhx18We6+VCa3gnsR4tcXm
 373cAefr0CXP+pQX85fTzX8aEMu9A8OWZJpdN+QUx5p2xGzHenKjH3RrwQwTqQpk+T05XJ6pjCn
 +5zYzAPpmBNqiOf3zkAsQqXnjU1CqzE8LHqTiunb6LTdgZa
X-Google-Smtp-Source: AGHT+IFKn/yUMl4Fy71ISyhMm3nvndZzfqBhXmnp7ILs/L4/oD5xurwzFfCtwW32yxq2KPdLrlm0NA==
X-Received: by 2002:a05:600c:4510:b0:434:a4bc:5375 with SMTP id
 5b1f17b1804b1-434a9df67a1mr194106615e9.33.1733162598610; 
 Mon, 02 Dec 2024 10:03:18 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0f327casm163037285e9.27.2024.12.02.10.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 10:03:18 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 47CC55F767;
 Mon,  2 Dec 2024 18:03:17 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@uclibc.org
In-Reply-To: <pan$30ab5$cc5a9166$89866316$e1ba867c@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Mon, 02 Dec 2024 18:44:37 +0100")
References: <20240922193751.862053-1-bernd@kuhls.net>
 <20240922193751.862053-5-bernd@kuhls.net>
 <c80de03.7818.1921db53aa2.Coremail.andyshrk@163.com>
 <c655577.1b64.192853c1be6.Coremail.andyshrk@163.com>
 <87frn6dptr.fsf__47548.8251003966$1733156129$gmane$org@draig.linaro.org>
 <pan$30ab5$cc5a9166$89866316$e1ba867c@ID-313208.user.individual.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 02 Dec 2024 18:03:17 +0000
Message-ID: <874j3mdkt6.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733162600; x=1733767400; darn=uclibc.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dZzQGofudzyReCHRYWAdGL0KlCJVnSp6VVaGA4yjKgs=;
 b=ZxQPXMIwaXHcFceoIRj3/abYlhx0Wg7SuI4o30WwFonky8kSg3HXE5jtZdKl6bHlGa
 Wn5oLd3UZFvx+CQw9sMoWZZ15/PqrJpjzLFz2EtQHceJzjue/3iKuTL+OwawYVbgTBjd
 qhM5ccEv9iB8GgAdhHTICgS7MziooWY+Gyaa7fNPY7DBd+6MUJ9hCpfnMYWwe3YeGF30
 drCAwfCtIOjENS5M88NM3t6KcDmhFMfdGPJxvosX6aIljx2PeCpBuIrfwdKNQdjArh74
 kA8RQqL4FwUu73G+zA0/4JH6wHhbWKvrgIDVv7v2jWKnJ5x0AqUivuwkF2i78agnGLbd
 6Xng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZxQPXMIw
Subject: Re: [Buildroot] [PATCH v2 5/6] package/{mesa3d,
 mesa3d-headers}: bump version to 24.2.3
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

QmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4gd3JpdGVzOgoKPiBBbSBNb24sIDAyIERlYyAy
MDI0IDE2OjE0OjU2ICswMDAwIHNjaHJpZWIgQWxleCBCZW5uw6llOgo+Cj4+ICJBbmR5IFlhbiIg
PGFuZHlzaHJrQDE2My5jb20+IHdyaXRlczoKPj4gCj4+PiBIZWxsb++8jAo+Pj4gICAgQ2FuIHdl
IGdldCB0aGlzIHNlcmllcyBtZXJnZWTvvJ8KPj4gCj4+IEkndmUgZ290IGEgYnJhbmNoIHdpdGgg
QmVybmQncyBwYXRjaGVzICsgdGhlIGVuYWJsaW5nIG9mIFZpcnRJTyBWZW51cwo+PiBhbmQgYWRk
aW5nIHZrbWFyayB0byB0aGUgYnVpbGQuIElmIEJlcm5kJ3Mgb2sgd2l0aCBpdCBJIGNhbiBwb3N0
IGl0IHRvCj4+IHRoZSBsaXN0IHRvZGF5Lgo+Cj4gSGkgQW5keSwKPgo+IEkgc2VudCBhIG5ldyBw
YXRjaCBzZXJpZXMgYnVtcGluZyBtZXNhM2QgdG8gMjQuMy4wIGEgY291cGxlIG9mIG1pbnV0ZXMg
Cj4gYWdvOiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvYnVpbGRyb290L2xp
c3QvP3Nlcmllcz00MzQ5MzQKPgo+IFJ1bi10aW1lIHRlc3Qgd2l0aCBteSBJbnRlbC1iYXNlZCBz
eXN0ZW0gYW5kIGdibS9lZ2wgd29ya3MsIGRpZCBub3QgYnVpbGQtCj4gdGVzdCBpdCB3aXRoIHgx
MS93YXlsYW5kIGhvd2V2ZXIuIFBsZWFzZSBhZGQgeW91ciBwYXRjaGVzIHRvIHRoaXMgbW9zdCB1
cC0KPiB0by1kYXRlIHBhdGNoIHNlcmllcywgdGhhbmtzLgoKSSBoYXZlIHVwZGF0ZXMgdG8gdGhl
IFZpcnRJTyBwYXRjaGVzIGFuZCBlbmFibGluZyB2a21hcmsuIFNob3VsZCBJIHBvc3QKdGhvc2Ug
c2VwYXJhdGVseSBvciBjb21iaW5lIGFuZCByZS1wb3N0IHdpdGggeW91ciBsYXRlc3Qgc2VyaWVz
PwoKPgo+IFJlZ2FyZHMsIEJlcm5kCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBM
aW5hcm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
