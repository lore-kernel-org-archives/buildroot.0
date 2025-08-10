Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCE6C87FCA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 14:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 812388220A;
	Sun, 10 Aug 2025 14:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNl8dt_9xY3W; Sun, 10 Aug 2025 14:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE54882208
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE54882208;
	Sun, 10 Aug 2025 14:05:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6674831
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 584D860F25
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPSMy2WtKack for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 14:05:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D6B460F0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D6B460F0A
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D6B460F0A
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 14:05:50 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so2859126f8f.3
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 07:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754834748; x=1755439548;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qD940Nx1xaGIQkrfwv3xapy2yuI/pFMrwwW0ngPehMA=;
 b=HHtpCs02nDBNxZ3BxOUlJtVu5lISwFbKSWcwushIg6XAbfG3PgMiB624O4dlgZEMLk
 d51+zmnIyIYluOeab12fGUvip7T89Ca6Z2YonExQmX2JYK9tr8Ktcp0TvzLU6c0wjiYE
 BupLdbBM8gmIE2PTTaDTTArhUCDf3ptoD58wQPo73OAeoDrfCaQP9csZPxtwecncG8MA
 IXnr2FE0ACwyWcBsRZvqbhGH7EYa115xgYoaqdrLHZ0UQ7FuvVA9DadAv7ktVcaY0CMV
 o8yYk6CkpewX0glhHraLwlQCfF+em2uK7a8qr1e7rUK4EfHYg34HxdnJRejkT5OBBvB5
 RJ4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4zbigtM4qB4sQnRALJ3FNte0LmBpePkozpM80frjsJcxN5AJpoGGNyb+gxKSJGTc2B+Yu5N08d3o=@buildroot.org
X-Gm-Message-State: AOJu0Yxs3iZNL5uyBkGr//XQBjeaaLtixHaW6qZO1g8EbHmpM744wdMM
 8hDwM2HHJaL8zOPAXqvDUrCtqiXK2rJ18T0o1F8TtB4B8ZzeIxYMlr/ekSEwdkZ8oo4=
X-Gm-Gg: ASbGncuP22u7eQD68lR3Y5Q6XhHFFJxH/V+8/h++EXEcad3OCQFN22uftElZmtyVogC
 NZWzQjQgzgipjwkeAfo0hUQs+77AyUh1Pe1EQ0QWrPAlxdPEZY6xbJuw7NWFiULHqwBzTUKlwHR
 P3NYJ+/oshGCl1wY9948aGtMWiziAHL5+R3zjHulomQrKOeG1P/cICiKqHmlfbBCyW/KeiZVmi9
 FxKFgplNAj2/OXNvmVPFHFwqhXmscf1//vEkU+x5de2QP0Ep/UG/p3LF3RqGbp3L9xEVF9AxdI5
 XAmLqNqJ2CY9HK+0mLPp2Nn+NremdKTrZ3erA7xYQ5yXaIh83BgoSE6lkdgC9ZHsW81kwQ0wuYW
 Zd8T2PWyV48iZdxpyBLwpfT2+j1rpxQDCGrCjD+BrVYsEIh8fVJPtxpvsPsQXU5rrBHBNz3j7UZ
 /HISZRpMnRWuo880d9xcg7dHrpSrRXQI2B/0m5S01NeffjBBYJm/HG8jkZcpUsmY3u1ZiTMXY=
X-Google-Smtp-Source: AGHT+IHsLRYt//q02SljxES7HFc3G3/DpXnpxOvj0g7SklT/6vbchu6AKvuD1mPLLOumgx662jxVbw==
X-Received: by 2002:a05:6000:1445:b0:3b7:810f:6caf with SMTP id
 ffacd0b85a97d-3b900b736a7mr7166042f8f.32.1754834748090; 
 Sun, 10 Aug 2025 07:05:48 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8fc28a830sm13019241f8f.16.2025.08.10.07.05.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 07:05:47 -0700 (PDT)
Message-ID: <613915e1-b382-43d7-8a00-945941a80f8e@smile.fr>
Date: Sun, 10 Aug 2025 16:05:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
Content-Language: fr, en-US
In-Reply-To: <20250810124820.2116495-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754834748; x=1755439548; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qD940Nx1xaGIQkrfwv3xapy2yuI/pFMrwwW0ngPehMA=;
 b=xqIxmSPw77FQkpxz6k4NJpyIh6IhrXhMr0isQlhlbPIthKquTS1sRGnirlaWOpg1/L
 oYOduvFaJBZZF1g6HW3q2hcK5ypX61RwuLtOvlm85jqULqnw0kYEVutHufpWGQqnk+5P
 l0OgZD5qADlPxBdG+Wu3Y+76uuyq9fYd7lfiA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=xqIxmSPw
Subject: Re: [Buildroot] [PATCH 1/3] package/gcc: 2024.12 ARC gcc is in fact
 based on GCC 14.x
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAxMC8wOC8yMDI1IMOgIDE0OjQ4LCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBDb250cmFyeSB0byB3aGF0IHdhcyBkb25l
IGluCj4gOGVmMmJhMmVjM2NlZGFlOTJjNTg1MTM1ZDNhMWM1YWUzZTBmNjNkOCAoInBhY2thZ2Uv
e2djYywgYmludXRpbHMsCj4gZ2RifTogdXBkYXRlIEFSQyB2ZXJzaW9uIHRvIDIwMjQuMTIiKSwg
dGhlIEFSQyBnY2MgdmVyc2lvbiAyMDI0LjEyIGlzCj4gaW4gZmFjdCBiYXNlZCBvbiBHQ0MgMTQu
Mi4gVGhpcyBjYW4gYmUgdmVyaWZpZWQgYXQ6Cj4gCj4gICBodHRwczovL2dpdGh1Yi5jb20vZm9z
cy1mb3Itc3lub3BzeXMtZHdjLWFyYy1wcm9jZXNzb3JzL3Rvb2xjaGFpbi9yZWxlYXNlcy90YWcv
YXJjLTIwMjQuMTItcmVsZWFzZQo+IAo+IFdoaWNoIHN0YXRlcyAiR0NDIDE0LjIgd2l0aCBBUkMg
cGF0Y2hlcyIuCgpJbmRlZWQsCgpjYXQgb3V0cHV0L2hvc3QtZ2NjLWluaXRpYWwtYXJjLTIwMjQu
MTItcmVsZWFzZS9nY2MvQkFTRS1WRVIKMTQuMi4wCgpQYXRjaCAxLzMgYXBwbGllZCB0byBtYXN0
ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBGaXhlczogOGVmMmJhMmVj
M2NlZGFlOTJjNTg1MTM1ZDNhMWM1YWUzZTBmNjNkOCAoInBhY2thZ2Uve2djYywgYmludXRpbHMs
IGdkYn06IHVwZGF0ZSBBUkMgdmVyc2lvbiB0byAyMDI0LjEyIikKPiBTaWduZWQtb2ZmLWJ5OiBU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IC0tLQo+ICBw
YWNrYWdlL2djYy9Db25maWcuaW4uaG9zdCB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dj
Yy9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0Cj4gaW5kZXggMjE0
OTg0Njc2MS4uZGMwODY3ZmExNCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2djYy9Db25maWcuaW4u
aG9zdAo+ICsrKyBiL3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0Cj4gQEAgLTEwLDEwICsxMCwx
MCBAQCBjaG9pY2UKPiAgCSAgU2VsZWN0IHRoZSB2ZXJzaW9uIG9mIGdjYyB5b3Ugd2lzaCB0byB1
c2UuCj4gIAo+ICBjb25maWcgQlIyX0dDQ19WRVJTSU9OX0FSQwo+IC0JYm9vbCAiZ2NjIGFyYyAo
MTUuMSkiCj4gKwlib29sICJnY2MgYXJjICgxNC4yKSIKPiAgCSMgT25seSBzdXBwb3J0ZWQgYXJj
aGl0ZWN0dXJlCj4gIAlkZXBlbmRzIG9uIEJSMl9hcmMKPiAtCXNlbGVjdCBCUjJfVE9PTENIQUlO
X0dDQ19BVF9MRUFTVF8xNQo+ICsJc2VsZWN0IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzE0
Cj4gIAo+ICBjb25maWcgQlIyX0dDQ19WRVJTSU9OX1BPV0VSUENfU1BFCj4gIAlib29sICJnY2Mg
cG93ZXJwYyBzcGUiCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
