Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A91C83F18
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 08:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E248161092;
	Thu, 10 Jul 2025 08:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wA8ravD6aEof; Thu, 10 Jul 2025 08:11:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 380DA61088
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 380DA61088;
	Thu, 10 Jul 2025 08:11:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42606114
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 08:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30107404BD
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 08:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPBrPly1gDuE for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 08:11:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B8D740520
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B8D740520
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B8D740520
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 08:11:03 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso513150f8f.1
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 01:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752135061; x=1752739861;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d3eXcFj1Jk8vtzKXtEQhjWcdw/rxg/Trs5d0xnlivBQ=;
 b=vtiFluPFg01+WF3bQYkrDhv35H0JCiyXKVDPk+auntqB6Z2VjE4DtXITiVQzmRp+Bj
 RIc0yznxNFwmOobghjadtfoao8d8pxPqgwgtXqsRP078B6BbwsJfhBsNq+DJebLlygI4
 QsICXmAor4de8jGgTMv7qsr/iRBSaoFLWtzrFqHMNME6hlqVPLwnE33XOjli90rPsl5R
 mCcJTeFpHHo8mo06MvVf2VpjOngjLfSpCUYz3mk1Fvu07JIhErJnq2+s2g3OQWrHKWw+
 L2143ECd2Fa1gktPyEa8YDmq+gOW7TFDvxvd40gIoSHY5b5OQSUTqRfc5waNXttssZtt
 ks+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL//iQB+WUba2HKdLXEgmcIhbOOYcAjdPxegOwook7HxrLm21TGXlxtGDsZ1DFgvZUrOE5ZC9TwDs=@buildroot.org
X-Gm-Message-State: AOJu0Yy5WnfT5ywmX60CRuaiqFi2PJ3DjSUe1GPvPRRUDKG5vezUAfcQ
 Tcsif0ShH/g9gIw2vI4/+j34eDTpBLtO6aYC2maQzNWkaha/BPlUDn5YAxS6YlD6GGhv//HC6b+
 e72bx
X-Gm-Gg: ASbGncvC23q90ZzYcdVEF+mV0QStp/FrH9vxTgLQQevSWA4jn66JzzsVFdyii77dlQ6
 YYdzEfCVCjuFi+u6pxuvvH2pcHnqhasOB3bJHH2TwT6gb1d73jUKkram490XDrkngDUauwDemN3
 /tj4iKWtnyprenAknJShBbYY++ZSM2ax5bQ7hSze1X4ciCGF3Y1s1ahl1EWkGzlUXNmda02evNK
 OAnzX/WwPHtonz4mWRY8DcLXqZcyVBzsWxvGGbzk+FsnzL+Q8SchyQZgB9/VlInAXlxzIG4N1fY
 oPH0amB9fQC3grvCm3D8soxQJD9yvcf7cFY/PDHmDXwL/a1qdlvzVQ==
X-Google-Smtp-Source: AGHT+IGEzGzHBEiVia9WCbNiUHq+WWqMNYR/ettMhdgsojQ5ExxjFRtc665HlLaQrRRfhEGFqkNUsQ==
X-Received: by 2002:a05:6000:40dd:b0:3a6:d967:380c with SMTP id
 ffacd0b85a97d-3b5e86aea4fmr1697130f8f.36.1752135060932; 
 Thu, 10 Jul 2025 01:11:00 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454d50fa9b4sm52479075e9.27.2025.07.10.01.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 01:11:00 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 10 Jul 2025 10:10:58 +0200
Message-ID: <20250710081059.482390-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250709211636.846101-1-thomas.petazzoni@bootlin.com>
References: <20250709211636.846101-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752135061; x=1752739861; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d3eXcFj1Jk8vtzKXtEQhjWcdw/rxg/Trs5d0xnlivBQ=;
 b=Y6Still8w+Y02JSSTpityQrvl96EMY6GW7wD5jQAkpjaRFISO0AoC6QGP40p5cla/3
 YMqFYqKwnW3V5W65IdydZkoNr4XFwC3BIldR78SbBQOFetQEe5kd7bb4dMHWyTcxBVu0
 T5hz71AGH+y4L5krabi6VPmQwhDIeYgQ08gNkqPVshIgiDUFeRFOvHpvD69FouOesa58
 LtWGCbLF/FMRJxxKsuBV/z7BySyonZpPo+FN8ktQwvhPjSuZ9VRKK2tkpRpQzjxM+vXZ
 EMgt79+N1Lk2k93yf6WWEf2I9Ub4z/i/z3LKXvKzngD9p8iS813EndhLBaM8OA4EUp9Y
 L8Yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y6Still8
Subject: Re: [Buildroot] [PATCH] package/bctoolbox: disable mbedtls support
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKSW4gcmVwbHkgb2Y6Cj4gU2luY2UgbWJlZHRscyB3YXMgYnVtcGVkIHRvIHZl
cnNpb24gMy42LjMuMSBpbiBjb21taXQKPiAzNDgxYTk2NDNmYzcyMjNlNDAwZWQ4NzdmMDhhZGUz
NGQ0NGU2Yjc4LCB0aGUgYnVpbGQgb2YgYmN0b29sYm94IGZhaWxzCj4gYXMgaXRzIG1iZWR0bHMg
c3VwcG9ydCBpcyBub3QgY29tcGF0aWJsZSB3aXRoIG1iZWR0bHMgMy54Lgo+IAo+IFRoaXMgaXNz
dWUgaXMga25vd24gdXBzdHJlYW06Cj4gCj4gICBodHRwczovL2dpdGh1Yi5jb20vQmVsbGVkb25u
ZUNvbW11bmljYXRpb25zL2JjdG9vbGJveC9pc3N1ZXMvMTkKPiAKPiBhbmQgaXMgbm90IGZpeGVk
LCBldmVuIGluIG5ld2VyIHZlcnNpb24gb2YgYmN0b29sYm94LiBTbyBmb3IgdGhlIHRpbWUKPiBi
ZWluZywgc2ltcGx5IGRpc2FibGUgbWJlZHRscyBzdXBwb3J0IGluIGJjdG9vbGJveC4KPiAKPiBG
aXhlczoKPiAKPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy83YWY3
ODRjYjYwYjBlYzVlNWJkMGUwOTE1Y2U2ODI3ZjY5ZjRiYjk3Lwo+IAo+IFNpZ25lZC1vZmYtYnk6
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgpUaGV5IGRp
ZCBhZGQgc3VwcG9ydCBmb3IgbWJlZHRscyAzLjYgaW4gY29tbWl0IFsxXS4gSSB3b3VsZCBwcmVm
ZXIgdG8gbm90CmRlcHJlY2F0ZSBpdCBvbiB0aGUgTFRTIGJyYW5jaCBzbyBJIHRyaWVkIHRvIGJ1
bXAgdG8gdGhlIGxhdGVzdCB2ZXJzaW9uIGJ1dCBJCmdldCB0aGUgZm9sbG93aW5nIGVycm9yIGxp
bmtlZCB0byBtYmVkdGxzOgoKY3J5cHRvL21iZWR0bHMuY2M6IEluIGNvbnN0cnVjdG9yIOKAmGJj
dG9vbGJveDo6e2Fub255bW91c306Om1iZWR0bHNTdGF0aWNDb250ZXh0czo6bWJlZHRsc1N0YXRp
Y0NvbnRleHRzKCnigJk6CmNyeXB0by9tYmVkdGxzLmNjOjgzOjE3OiBlcnJvcjog4oCYbWJlZHRs
c190aHJlYWRpbmdfc2V0X2FsdOKAmSB3YXMgbm90IGRlY2xhcmVkIGluIHRoaXMgc2NvcGU7IGRp
ZCB5b3UgbWVhbiDigJhtYmVkdGxzX3RocmVhZGluZ19tdXRleF904oCZPwogICA4MyB8ICAgICAg
ICAgICAgICAgICBtYmVkdGxzX3RocmVhZGluZ19zZXRfYWx0KHRocmVhZGluZ19tdXRleF9pbml0
X2NwcCwgdGhyZWFkaW5nX211dGV4X2ZyZWVfY3BwLCB0aHJlYWRpbmdfbXV0ZXhfbG9ja19jcHAs
CiAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KICAgICAg
fCAgICAgICAgICAgICAgICAgbWJlZHRsc190aHJlYWRpbmdfbXV0ZXhfdApjcnlwdG8vbWJlZHRs
cy5jYzogSW4gZGVzdHJ1Y3RvciDigJhiY3Rvb2xib3g6Onthbm9ueW1vdXN9OjptYmVkdGxzU3Rh
dGljQ29udGV4dHM6On5tYmVkdGxzU3RhdGljQ29udGV4dHMoKeKAmToKY3J5cHRvL21iZWR0bHMu
Y2M6OTU6MTc6IGVycm9yOiDigJhtYmVkdGxzX3RocmVhZGluZ19mcmVlX2FsdOKAmSB3YXMgbm90
IGRlY2xhcmVkIGluIHRoaXMgc2NvcGU7IGRpZCB5b3UgbWVhbiDigJhtYmVkdGxzX3RocmVhZGlu
Z19tdXRleF904oCZPwogICA5NSB8ICAgICAgICAgICAgICAgICBtYmVkdGxzX3RocmVhZGluZ19m
cmVlX2FsdCgpOwogICAgICB8ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgogICAgICB8ICAgICAgICAgICAgICAgICBtYmVkdGxzX3RocmVhZGluZ19tdXRleF90CgpJ
ZiBhbnlvbmUgY291bGQgbG9vayBpbnRvIHRoaXMsIEkgd291bGQgYXBwcmVjaWF0ZSBpdC4gSSB0
cmllZCB0byBjaGFuZ2UgdGhlCm1iZWR0bHNfY29uZmlnLmggdG8gZW5hYmxlIHRoZSBBTFQgdGhy
ZWFkaW5nIGZ1bmN0aW9uIGJ1dCB3aXRob3V0IHN1Y2Nlc3MuCgpUaGlzIHBhY2thZ2UgYW5kIG1v
bmdyZWwyIGFyZSB0aGUgbGFzdCBwYWNrYWdlcyB0aGF0IGRvZXNuJ3QgaGF2ZSBjb21wYXQgd2l0
aAptYmVkdGxzIDMuNi4KRm9yIG1vbmdyZWwyIHRob3VnaCB0aGUgcGFja2FnZSBpcyBub3QgbWFp
bnRhaW5lZCBhbnltb3JlIGFuZCB0aGVyZSBpc24ndCBhbnkKcG9ydCB1cHN0cmVhbS4KClsxXSBo
dHRwczovL2dpdGh1Yi5jb20vQmVsbGVkb25uZUNvbW11bmljYXRpb25zL2JjdG9vbGJveC9jb21t
aXQvZTBlZTA0YTIxZWIxNWQ2ZjRhMjJiMmRkMWE0NTk5Y2QzNDkyZTVkNwoKUmVnYXJkcywKVGhv
bWFzCgo+IC0tLQo+IE5vdGU6IHRoZSBiY3Rvb2xib3ggaGFzIG5vIG1haW50YWluZXIgaW4gdGhl
IERFVkVMT1BFUlMgZmlsZSwgYW5kCj4gaGFzbid0IGJlZW4gYnVtcGVkIHNpbmNlIE5vdmVtYmVy
IDIwMjAsIGRlc3BpdGUgdXBzdHJlYW0gaGF2aW5nCj4gcmVsZWFzZWQgbXVsdGlwbGUgdmVyc2lv
bnMuIENhbmRpZGF0ZSBmb3IgcmVtb3ZhbD8KPiAtLS0KPiAgcGFja2FnZS9iY3Rvb2xib3gvYmN0
b29sYm94Lm1rIHwgMTQgKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9iY3Rvb2xi
b3gvYmN0b29sYm94Lm1rIGIvcGFja2FnZS9iY3Rvb2xib3gvYmN0b29sYm94Lm1rCj4gaW5kZXgg
YWM5MzYxMDI2Zi4uZGI1NDUzMTFmZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2JjdG9vbGJveC9i
Y3Rvb2xib3gubWsKPiArKysgYi9wYWNrYWdlL2JjdG9vbGJveC9iY3Rvb2xib3gubWsKPiBAQCAt
MTIsMjUgKzEyLDIzIEBAIEJDVE9PTEJPWF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAgCj4gICMg
U2V0IENNQUtFX1NLSVBfUlBBVEggdG8gcHJldmVudCBiY3Rvb2xib3ggZnJvbSBhZGRpbmcgdGhl
IHJwYXRoIHRvCj4gICMgc2hhcmVkIGxpYnJhcnkuCj4gKwo+ICsjIFdlIGhhdmUgdG8gZGlzYWJs
ZSBtYmVkdGxzIHN1cHBvcnQgZXZlbiB0aG91Z2ggd2UgaGF2ZSBhIG1iZWR0bHMKPiArIyBwYWNr
YWdlIGJlY2F1c2UgYmN0b29sYm94IGlzIG5vdCBjb21wYXRpYmxlIHdpdGggbWJlZHRscyAzLngg
YXMgb2YKPiArIyB2ZXJzaW9uIDQuNC44Lgo+ICBCQ1RPT0xCT1hfQ09ORl9PUFRTID0gXAo+ICAJ
LURFTkFCTEVfUE9MQVJTU0w9T0ZGIFwKPiAgCS1ERU5BQkxFX1NUUklDVD1PRkYgXAo+ICAJLURF
TkFCTEVfVEVTVFNfQ09NUE9ORU5UPU9GRiBcCj4gIAktREVOQUJMRV9URVNUUz1PRkYgXAo+IC0J
LURDTUFLRV9TS0lQX1JQQVRIPU9OCj4gKwktRENNQUtFX1NLSVBfUlBBVEg9T04gXAo+ICsJLURF
TkFCTEVfTUJFRFRMUz1PRkYKPiAgCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0VfTElCSUNPTlYpLHkp
Cj4gIEJDVE9PTEJPWF9ERVBFTkRFTkNJRVMgKz0gbGliaWNvbnYKPiAgQkNUT09MQk9YX0NPTkZf
T1BUUyArPSAtRENNQUtFX0NYWF9GTEFHUz0iJChUQVJHRVRfQ1hYRkxBR1MpIC1saWNvbnYiCj4g
IGVuZGlmCj4gIAo+IC1pZmVxICgkKEJSMl9QQUNLQUdFX01CRURUTFMpLHkpCj4gLUJDVE9PTEJP
WF9ERVBFTkRFTkNJRVMgKz0gbWJlZHRscwo+IC1CQ1RPT0xCT1hfQ09ORl9PUFRTICs9IC1ERU5B
QkxFX01CRURUTFM9T04KPiAtZWxzZQo+IC1CQ1RPT0xCT1hfQ09ORl9PUFRTICs9IC1ERU5BQkxF
X01CRURUTFM9T0ZGCj4gLWVuZGlmCj4gLQo+ICBpZmVxICgkKEJSMl9TVEFUSUNfTElCUykseSkK
PiAgQkNUT09MQk9YX0NPTkZfT1BUUyArPSAtREVOQUJMRV9TSEFSRUQ9T0ZGIC1ERU5BQkxFX1NU
QVRJQz1PTgo+ICBlbHNlIGlmZXEgKCQoQlIyX1NIQVJFRF9TVEFUSUNfTElCUykseSkKPiAtLSAK
PiAyLjQ5LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
