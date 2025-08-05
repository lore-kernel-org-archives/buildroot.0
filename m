Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB03C87FD1
	for <buildroot@archiver.kernel.org>; Tue,  5 Aug 2025 16:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18F8F41B2F;
	Tue,  5 Aug 2025 16:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejcvVezU3e5r; Tue,  5 Aug 2025 16:34:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4876F40EDD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4876F40EDD;
	Tue,  5 Aug 2025 16:34:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ABEE1A2
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 16:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 20F9161AB0
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 16:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eop4w357JOqv for <buildroot@buildroot.org>;
 Tue,  5 Aug 2025 16:34:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A10B6146A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A10B6146A
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A10B6146A
 for <buildroot@buildroot.org>; Tue,  5 Aug 2025 16:34:47 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-459e1338565so10917915e9.2
 for <buildroot@buildroot.org>; Tue, 05 Aug 2025 09:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754411686; x=1755016486;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jYhBQpmd8QfGJSJXhxggF2T+2UKojOaCeh30X5lodyY=;
 b=GdudSXGFaqpkWcAUc9EcLB1VwpprM8eKRKvnGeWpcBtgQt2WLgRgIrL9OxnFkLkfZC
 d3jOYSDCgWgUcjN/Egp5eKVruoEPb2Ta0tzML2s8vgd+pk4+FFJZlip6Ty3C7bBxMybt
 k39UplSOkTGcSQ1orRqoFpWxix88VPopiZy8Zcuw1gIdrSNTYr1D6gZArCNN0llDDmxM
 wazNOK+08+awd/fzTK5UetescoJNAK3AtHE9HKpIJmtCUec1QjLSNhE7BAJeCLobvHp/
 3NPVI3irV3RdFhij9Teg2AetgIIe70yz0/Jn5hs3AMnSTc9xxBL5m9i1J7djGvv5G/dy
 6x0w==
X-Gm-Message-State: AOJu0YxKGLgVYoWf1/wHhEyVYaO8qoQaHYHExxFxqVUuOiuQBR3z9JPN
 E9GtRaKB6XnavCUocWSFGucW1UdVjCahgrBTXg/nKhc0DulWk2rj91+nCIyi/3F7Ag3ZpDmQRvb
 57EPo
X-Gm-Gg: ASbGnctIZ5TUqU+mYc6WKURRpZo4mYOdg+du9j/ErBTixxYe3cKA9bF0OdhFtWidrJt
 Ri01IFtWAfNY9/aHA3eR+yo0oTzVtknNOZU0tm/LJlM5Kd5aam26PJN9e6ix7EvUsxwcr/7XdLD
 e+5QLhgYFXVjAumhGlwALhIVNL/NRu6oJuYm53fd20muMWijeVq3+SVviJjaCClpLHW+LHLhkNy
 fwrNrRaIDrFXI/ksq6G9W1vMm1g8eyj9wo0Dn6QIhkwVigo+pYvbDXTU3DlXyqpxlw3i5H1QRqX
 t61cmvBbCkMxDQusDxZAb6IZBn4zkIpMudoNEaNCESX3qPGqSqZ2D+g429hPWTbhUz20JOEdCJB
 K3W1i1DM26ThbVeS+eG8XpMc=
X-Google-Smtp-Source: AGHT+IFQgb87a2tJlA05YDw/LXvcGv94B4zI1iOtrS5v+3TunEsoZN+1tusCS+XFS6Q3zq4c4noaNg==
X-Received: by 2002:a05:600c:1554:b0:456:1bca:7faf with SMTP id
 5b1f17b1804b1-458b6b330b0mr133019205e9.16.1754411685648; 
 Tue, 05 Aug 2025 09:34:45 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e58553f8sm11540375e9.14.2025.08.05.09.34.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 09:34:44 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id A42C25F7E9;
 Tue, 05 Aug 2025 17:34:43 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <huth@tuxfamily.org>
Cc: buildroot@buildroot.org,  Cyril Bur <cyrilbur@gmail.com>
In-Reply-To: <20250731112657.737ec447@tpx1> (Thomas Huth's message of "Thu, 31
 Jul 2025 11:26:57 +0200")
References: <20250721154812.787883-1-alex.bennee@linaro.org>
 <20250721154812.787883-6-alex.bennee@linaro.org>
 <20250731112657.737ec447@tpx1>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Tue, 05 Aug 2025 17:34:43 +0100
Message-ID: <87sei5zpzw.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754411686; x=1755016486; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jYhBQpmd8QfGJSJXhxggF2T+2UKojOaCeh30X5lodyY=;
 b=fbLut5cR6Sew8XS73nrrACcQhkuCLJ66ru5/5fmesUB5Dn4zfCgipjAjOW0sYaOeMr
 CTcAyiJ3ELTFWkVMeENlrwWBMiT3FR41RZe7Qp/nsPZTbaCY7zU7vUj1uB1uNTFBWbee
 hlmUh/anetaKLFcme5Z13IBx/XTmOkk2zH1+pXt4FJvTVeKX/scce4nNAUNXTZSuIKpE
 8jLsWTllpt2d519WHWIsyCtu3NX/shJMyBRHok/iOeRa4nqmUcJHP3SxizNKHMKUrmdQ
 Lrpt899wu1LPcRDLwaaioZydn1ZTydt/YWpi+MGsoHuZj58J8zk/pqQOjz8n3IQRgBtH
 BTXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fbLut5cR
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

VGhvbWFzIEh1dGggPGh1dGhAdHV4ZmFtaWx5Lm9yZz4gd3JpdGVzOgoKPiBBbSBNb24sIDIxIEp1
bCAyMDI1IDE2OjQ4OjA2ICswMTAwCj4gc2NocmllYiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVl
QGxpbmFyby5vcmc+Ogo+Cj4+IFVwZGF0ZSB0byB0aGUgY3VycmVudCB2ZXJzaW9uIG9mIEtWTSB1
bml0IHRlc3RzLiBUaGUgbWFpbiBjaGFuZ2VzCj4+IHNpbmNlIHRoZSBsYXN0IGNoZWNrIHBvaW50
Ogo+PiAKPj4gICAtIGRlZmF1bHQgcGFnZSBzaXplIHRvIDRrIChpbnN0ZWFkIG9mIDY0aykKPj4g
ICAtIHN1cHBvcnQgZm9yIGt2bXRvb2wgdG8gbGF1bmNoIHRlc3RzCj4+IAo+PiBTaWduZWQtb2Zm
LWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4+IAo+PiAtLS0KPj4g
djMKPj4gICAtIHJld29yZCBjb21taXQKPj4gICAtIG1vdmUgdG8gY3VycmVudCBtYXN0ZXIgc28g
d2UgY2FuIHVzZSBrdm10b29sIGFzIHdlbGwKPj4gICAtIGRpZG4ndCBhcHBseSB0aF9odXRoJ3Mg
ci1iIGFzIG1vdmVkIHRvIG1hc3Rlcgo+PiAtLS0KPj4gIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMv
a3ZtLXVuaXQtdGVzdHMuaGFzaCB8IDIgKy0KPj4gIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3Zt
LXVuaXQtdGVzdHMubWsgICB8IDUgKystLS0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uva3ZtLXVu
aXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMuaGFzaCBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3Zt
LXVuaXQtdGVzdHMuaGFzaAo+PiBpbmRleCBkNGRiOWYyYjc1Li42MmQ0NDY2N2IzIDEwMDY0NAo+
PiAtLS0gYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLmhhc2gKPj4gKysr
IGIvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoCj4+IEBAIC0xLDQg
KzEsNCBAQAo+PiAgIyBMb2NhbGx5IGNvbXB1dGVkCj4+IC1zaGEyNTYgIDg2MzY5OTRlMTAyNDA3
MDVmMTBhOTE1MGVmNjg4YWU2ODMyZDBlYTBkY2M4ODYwYzgyNmM2NDVlY2ZjMTE2OWYgIGt2bS11
bml0LXRlc3RzLXYyMDI0LTAxLTA4LnRhci5iejIKPj4gK3NoYTI1NiAgZWEyYWMzMzM3ODViMjA4
OTVlZjBjYTAzZmIwNjg4NjVkY2ZkNjJhMTQ5OGMyZjA4YTRiMzc5YzRjZjRkYTYzMSAga3ZtLXVu
aXQtdGVzdHMtZjA0NWVhNTYyN2EzYTJkOTgwMGQwMjg4MjY5ZWNkMDQ0ZmI0MjkxNC50YXIuZ3oK
Pgo+ICBIaSBBbGV4LAo+Cj4gdGhlIG90aGVyIHBhdGNoIHRvIHVwZGF0ZSB0byB2MjAyNS0wNi0w
NSBoYXMgYmVlbiBtZXJnZWQgZmlyc3QsIHNvIHlvdSBuZWVkCj4gdG8gcmVmcmVzaCB0aGlzIHBh
dGNoIG5vdy4gSSBhbHNvIGp1c3QgcHVzaGVkIGEgbmV3IHRhZyB2MjAyNS0wNy0zMSwgc28KPiBw
bGVhc2UgdXBkYXRlIHRvIHRoYXQgb25lIGluc3RlYWQgb2YganVzdCB1c2luZyBhIHJhbmRvbSBj
b21taXQuCgpUaGFua3MgZm9yIHRoYXQgLSBJJ3ZlIHVwZGF0ZWQgYW5kIHNlbnQgdjQgdG8gdGhl
IGxpc3QuCgo+Cj4gIFRoYW5rcywKPiAgIFRob21hcwoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFs
aXNhdGlvbiBUZWNoIExlYWQgQCBMaW5hcm8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
