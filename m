Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6391C87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 09:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D52661AE4;
	Thu, 31 Jul 2025 09:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xW7jBLHbhwsN; Thu, 31 Jul 2025 09:27:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82CAA61ADD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82CAA61ADD;
	Thu, 31 Jul 2025 09:27:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E89D13D
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 09:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4066F613EA
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 09:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNa93F-68BbW for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 09:27:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.48;
 helo=mail-ej1-f48.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5F65F608CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F65F608CD
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F65F608CD
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 09:27:01 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-ae0df6f5758so126692566b.0
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 02:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753954019; x=1754558819;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GCD9WYP4iISqUNDigaHRSQlT3wa8vdZfQvNwCnPC840=;
 b=b27F/Lon5KjIRs0aDBvUV8074mACV/hz0XlnVTrEag5eRIVsq28x+iPEFuLbnz70AX
 xGAPRhzR41ST+fWNXAaXYAK6ZZe600XvH1S1DhEtYialg5DZTcunISyo2o8i/opMHpGZ
 3SZ37nzi3LJnZgWoHpwnB7d9qxkSVjfcxNYNqAxHByh5i8qp4yMOS83medjS4l36y3sC
 3iG3ogwSsrL6I4/SzcpPSg66BnR1PmMX0cRJqzia6M2BBN8TceWxDooZhxeRafnGsw6s
 y3JAkgbh6ntdLs1u0VzkKIYiHItCKwdlJgdhwQ2ybZEW+ckSDSI65Mf2fXgAtkHGv8DT
 CMgg==
X-Gm-Message-State: AOJu0Yx21gkOLKATr5XjTv+idlmZspviPIW5zZ2IDMrOLgo1JA9SH2WN
 pAk2Flc2qcohOh6NIFzThRm+7Io0iHeHBUg63dtL3V3/490OR9ywNvGd
X-Gm-Gg: ASbGnctSVUOSpaoylZu7jfT7Cv8Td6W2RrcOzCFQPvS3HSh2l/BpapYYfFqS8AvzfAh
 VdUOwVG6m9CtEUQSNIy2c8GPHzu9rp6FZGxZ6ZE0Pa+vASVIMxE8rxnZjGwDvQG3PkunLuFOYJi
 l9VG2UiRAGwfIL1sSWITJlJsUMQk0aZzUkQ0KUaMLWJc1EfzP0JyOSd70hHTGpfW9yWKhC76mo2
 8bl+9SY3LvEgB5kwbV/Vuy/rZyNpeK8W7A0Y/Kltu53JM/Qg2RzJMkqDIQyR2Bk8vj7jFP7AMQe
 ciPRDq1zncwfMuq3shn2AluGk6Ytb3QJeSyhGA+LpilwyK1tC9FdQRhxdv0N9CQ7pzawzNtqwod
 YC/ChwkDSOaovjhem90Yx2IyzPc0zAq3+y5i3ydCxCVcRGEJePOKF2Bd34VY/Yw==
X-Google-Smtp-Source: AGHT+IE9E3f+oVNNItGQjGc88QBTdUxbPZDlGxeDiCelTJaS7Vn8H0rA87Nw8J+Nyn3nsgY4cmmZdg==
X-Received: by 2002:a17:907:3d46:b0:ad8:9997:aa76 with SMTP id
 a640c23a62f3a-af8fd91a325mr776007466b.37.1753954019035; 
 Thu, 31 Jul 2025 02:26:59 -0700 (PDT)
Received: from tpx1 (ltea-047-064-112-006.pools.arcor-ip.net. [47.64.112.6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a07643asm81075066b.15.2025.07.31.02.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Jul 2025 02:26:58 -0700 (PDT)
Date: Thu, 31 Jul 2025 11:26:57 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20250731112657.737ec447@tpx1>
In-Reply-To: <20250721154812.787883-6-alex.bennee@linaro.org>
References: <20250721154812.787883-1-alex.bennee@linaro.org>
 <20250721154812.787883-6-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [PATCH v3 5/9] package/kvm-unit-tests: bump to
 current master
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

QW0gTW9uLCAyMSBKdWwgMjAyNSAxNjo0ODowNiArMDEwMApzY2hyaWViIEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz46Cgo+IFVwZGF0ZSB0byB0aGUgY3VycmVudCB2ZXJzaW9u
IG9mIEtWTSB1bml0IHRlc3RzLiBUaGUgbWFpbiBjaGFuZ2VzCj4gc2luY2UgdGhlIGxhc3QgY2hl
Y2sgcG9pbnQ6Cj4gCj4gICAtIGRlZmF1bHQgcGFnZSBzaXplIHRvIDRrIChpbnN0ZWFkIG9mIDY0
aykKPiAgIC0gc3VwcG9ydCBmb3Iga3ZtdG9vbCB0byBsYXVuY2ggdGVzdHMKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4gCj4gLS0tCj4g
djMKPiAgIC0gcmV3b3JkIGNvbW1pdAo+ICAgLSBtb3ZlIHRvIGN1cnJlbnQgbWFzdGVyIHNvIHdl
IGNhbiB1c2Uga3ZtdG9vbCBhcyB3ZWxsCj4gICAtIGRpZG4ndCBhcHBseSB0aF9odXRoJ3Mgci1i
IGFzIG1vdmVkIHRvIG1hc3Rlcgo+IC0tLQo+ICBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11
bml0LXRlc3RzLmhhc2ggfCAyICstCj4gIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQt
dGVzdHMubWsgICB8IDUgKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMv
a3ZtLXVuaXQtdGVzdHMuaGFzaCBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVz
dHMuaGFzaAo+IGluZGV4IGQ0ZGI5ZjJiNzUuLjYyZDQ0NjY3YjMgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoCj4gKysrIGIvcGFja2FnZS9r
dm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoCj4gQEAgLTEsNCArMSw0IEBACj4gICMg
TG9jYWxseSBjb21wdXRlZAo+IC1zaGEyNTYgIDg2MzY5OTRlMTAyNDA3MDVmMTBhOTE1MGVmNjg4
YWU2ODMyZDBlYTBkY2M4ODYwYzgyNmM2NDVlY2ZjMTE2OWYgIGt2bS11bml0LXRlc3RzLXYyMDI0
LTAxLTA4LnRhci5iejIKPiArc2hhMjU2ICBlYTJhYzMzMzc4NWIyMDg5NWVmMGNhMDNmYjA2ODg2
NWRjZmQ2MmExNDk4YzJmMDhhNGIzNzljNGNmNGRhNjMxICBrdm0tdW5pdC10ZXN0cy1mMDQ1ZWE1
NjI3YTNhMmQ5ODAwZDAyODgyNjllY2QwNDRmYjQyOTE0LnRhci5negoKIEhpIEFsZXgsCgp0aGUg
b3RoZXIgcGF0Y2ggdG8gdXBkYXRlIHRvIHYyMDI1LTA2LTA1IGhhcyBiZWVuIG1lcmdlZCBmaXJz
dCwgc28geW91IG5lZWQKdG8gcmVmcmVzaCB0aGlzIHBhdGNoIG5vdy4gSSBhbHNvIGp1c3QgcHVz
aGVkIGEgbmV3IHRhZyB2MjAyNS0wNy0zMSwgc28KcGxlYXNlIHVwZGF0ZSB0byB0aGF0IG9uZSBp
bnN0ZWFkIG9mIGp1c3QgdXNpbmcgYSByYW5kb20gY29tbWl0LgoKIFRoYW5rcywKICBUaG9tYXMK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
