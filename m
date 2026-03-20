Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1751098797
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A6441CF4;
	Fri, 20 Mar 2026 15:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yHZ_vT6rjFKQ; Fri, 20 Mar 2026 15:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E680D41CDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022080;
	bh=9cvDFfaDyVBlc/FxzkJ28DEeUdUC/sJ8Ihn06Gk7EUo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oMUXefDqZPl73WBEl98CW1+Nk3InuYFU5/mycE48wlJ/digsuPQyGR/GLdL8lNRsY
	 Z8T3t9HJyIwn0MXe/2Es+M/vKfzLZPj6O91tQZq5N6+5QHE7aUlqSX9MqH3yYGYJAW
	 z8yOJF62ogOjPxvu/vJSnOew6oDqRjZ0+8OEqDaSRPVECq6YY2UH+Ht6NE/arJLp2p
	 J1QScRjtIwzuLGSs5z2Y89dCC+sJ2tdS6cm7vVF9Oce2s9PRmcj7qnZDw6CCWt5XvT
	 3CdZy6CjFP86uwRFUXdk8L4+qL8+dfS1BLNQqjovjk2g+l4TgTjyR8MNRcsM134o34
	 FoIsL3JeTxX6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E680D41CDC;
	Fri, 20 Mar 2026 15:54:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EB81D1B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD0A661B6C
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qkt37bfQkzC3 for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2071561B73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2071561B73
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2071561B73
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:54:36 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso15956445e9.2
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:54:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022074; x=1774626874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AYQv9sV5JBYE542lzKTM6obPB/iPuB47v037YeOKs9k=;
 b=QhkVGr+4uadxymi62b036GZfg4rGjmZ5L/kj4b1tllHpvwr8a/ZxY7CjTrG3qjHRYJ
 UqihZvFQxr/a+4l3NOVbLw9DM/ukymORI+V1qYYfUg2zBtd7ePgcr6T0i+WkKLz7OjB0
 qEu86F9SaHxA96rhskb6lUjeNVsr70wObEUxXRJtQloD6Gf2Hu93XL6CY/8LOAxWeHv0
 Gc4vUWTlOIQdxIKz9Ev+53fw+Y6jlVho14ZZJlwZyKLal34ZQ4HEJWle/nlonRpZJAwM
 cJzUfot3y253KigmrNXnCj+cZFGqRKMqJIqoBKwEnJCF3OLAmWWKE9Cw8G4Rrwaic3Vb
 KPAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVP91uSlQR/iKPm+DY01cMEGoL8jYgq/evuThaUaF8+ugVR0ywqk0WyGxO7ArMLxHNPBIqPkfDyA8k=@buildroot.org
X-Gm-Message-State: AOJu0YzXXw8Nrui9sYJuhaOo7vypA9vRAGwvY5u7K+yuyKTF8FHPgWZf
 EIBl9ulYHz/ef1hIvIPd7igQXBLGirAKBQXIfMRWgedhgHv2ixogv0QEbVJv3HaPzI0=
X-Gm-Gg: ATEYQzwTFm5aLtvE9ATyceLkjcxqjaf2gATBIPVJ0aZirswAW4lCEUf8lQP1X4P2ihb
 27BCfJw9rYyfILGSL/vpRwij7zjCbg66kIAipFFaRlSi61uhJC7Ne/2Av5HHMjUGIWDxVoM1ZPo
 MmsbaOmHRDccP5Ksti0jXhuudNLlfq1+vmRAnrcd8jYmcZgA7cAq2G8V4eEY3E23tWY2VKVd/k5
 9DzrmTp7GFs3sGKPdsa2wTr0MIrExdwefYdg5cKCbRfSlMuheaYoVm+u+ZlBZ1qLKvHPRtAKYPM
 rnuc7wg+zPOlcUzwBAu2YYA7su5Cx5JEggASem5quCxgpmmdiQH1rM9J7G3hRKjpF6CJ/kJUvDE
 4hxK25HIUW6KSRrbBlXOi5D36wVmBzRNszub0qpMaYeOZBpyECWaNkmGlSXx6wC8maEQfVZsygI
 KKipXM6lJY5L/tJRG2
X-Received: by 2002:a05:600c:8b18:b0:485:40fd:8390 with SMTP id
 5b1f17b1804b1-486ff01b49emr48737855e9.26.1774022074032; 
 Fri, 20 Mar 2026 08:54:34 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48700658441sm78084025e9.4.2026.03.20.08.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:54:33 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:54:30 +0100
Message-ID: <20260320155432.175682-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250912212302.1057923-2-giulio.benetti@benettiengineering.com>
References: <20250912212302.1057923-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022074; x=1774626874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AYQv9sV5JBYE542lzKTM6obPB/iPuB47v037YeOKs9k=;
 b=Y1OCRlALb995RH9bWFUQA55obB2xeNY+f7f6tsNObRxYZIez6XkC/fzs9UDkOynY97
 ZjhAnHi6tgVMZNsqtyuGYuBMWRdsbBfVUVlgvVcqtxA1XaPDGL87P1zKK4i2HRpbfjc8
 orUbdGVaC9cCmaYxLBLDPASVBCePPrAs4y/ZNg+xb22kLT9yZf9RlHhu+Dc4ObSEew9o
 VUqZVI/145rAys8YHlRN9QdqJg2o1ECQRHfuY2s6Y+XUBR3d5nHMxU8rDfSPIyXdkIk6
 OD++d9zzY3ykOkEw0CXsaGm7VmxqacRPFkJQ91hA0NXNok6wKA/ud/FEwyOQdUA3UGrX
 macQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Y1OCRlAL
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.4
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

SW4gcmVwbHkgb2Y6Cj4gUmVsZWFzZSBhbm5vdW5jZToKPiBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1uZnMvNmYyNzFjMDEtY2Q0Yi00NTZiLTgwYWMtNzdhOTZiOTlhMWZlQHJlZGhhdC5j
b20vCj4gCj4gU2lnbmVkLW9mZi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJl
bmV0dGllbmdpbmVlcmluZy5jb20+CgpBcHBsaWVkIHRvIDIwMjUuMDIueC4gVGhhbmtzCgo+IC0t
LQo+ICAuLi4vMDAwMS1GaXgtYnVpbGQtd2l0aC1nbGliYy0yLjQyLnBhdGNoICAgICAgfCA1OSAt
LS0tLS0tLS0tLS0tLS0tLS0tCj4gIHBhY2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5oYXNoICAg
ICAgICAgICAgICB8ICA0ICstCj4gIHBhY2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5tayAgICAg
ICAgICAgICAgICB8ICAyICstCj4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2
MiBkZWxldGlvbnMoLSkKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbmZzLXV0aWxzLzAw
MDEtRml4LWJ1aWxkLXdpdGgtZ2xpYmMtMi40Mi5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL25mcy11dGlscy8wMDAxLUZpeC1idWlsZC13aXRoLWdsaWJjLTIuNDIucGF0Y2ggYi9wYWNr
YWdlL25mcy11dGlscy8wMDAxLUZpeC1idWlsZC13aXRoLWdsaWJjLTIuNDIucGF0Y2gKPiBkZWxl
dGVkIGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCA2YmYzNjIyNTg2Li4wMDAwMDAwMDAwCj4gLS0t
IGEvcGFja2FnZS9uZnMtdXRpbHMvMDAwMS1GaXgtYnVpbGQtd2l0aC1nbGliYy0yLjQyLnBhdGNo
Cj4gKysrIC9kZXYvbnVsbAo+IEBAIC0xLDU5ICswLDAgQEAKPiAtRnJvbSA5Zjk3NDA0NmMzN2I3
YzI4NzA1ZDU1NTgzMjg3NTlmZmY3MDhiMWNiIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IC1G
cm9tOiBZYWFrb3YgU2Vsa293aXR6IDx5c2Vsa293aUByZWRoYXQuY29tPgo+IC1EYXRlOiBGcmks
IDI3IEp1biAyMDI1IDA0OjU0OjA4IC0wNTAwCj4gLVN1YmplY3Q6IEZpeCBidWlsZCB3aXRoIGds
aWJjLTIuNDIKPiAtTUlNRS1WZXJzaW9uOiAxLjAKPiAtQ29udGVudC1UeXBlOiB0ZXh0L3BsYWlu
OyBjaGFyc2V0PVVURi04Cj4gLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiAtCj4g
LWV4cG9ydGZzLmM6IEluIGZ1bmN0aW9uIOKAmHJlbGVhc2VfbG9ja2ZpbGXigJk6Cj4gLWV4cG9y
dGZzLmM6ODM6MTc6IGVycm9yOiBpZ25vcmluZyByZXR1cm4gdmFsdWUgb2Yg4oCYbG9ja2bigJkg
ZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUg4oCYd2Fybl91bnVzZWRfcmVzdWx04oCZIFstV2Vycm9y
PXVudXNlZC1yZXN1bHRdCj4gLSAgIDgzIHwgICAgICAgICAgICAgICAgIGxvY2tmKF9sb2NrZmQs
IEZfVUxPQ0ssIDApOwo+IC0gICAgICB8ICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fgo+IC1leHBvcnRmcy5jOiBJbiBmdW5jdGlvbiDigJhncmFiX2xvY2tmaWxl4oCZ
Ogo+IC1leHBvcnRmcy5jOjc3OjE3OiBlcnJvcjogaWdub3JpbmcgcmV0dXJuIHZhbHVlIG9mIOKA
mGxvY2tm4oCZIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIOKAmHdhcm5fdW51c2VkX3Jlc3VsdOKA
mSBbLVdlcnJvcj11bnVzZWQtcmVzdWx0XQo+IC0gICA3NyB8ICAgICAgICAgICAgICAgICBsb2Nr
ZihfbG9ja2ZkLCBGX0xPQ0ssIDApOwo+IC0gICAgICB8ICAgICAgICAgICAgICAgICBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+Cj4gLQo+IC1sb2NrZiBpcyBub3cgbWFya2VkIHdpdGggYXR0cmli
dXRlIHdhcm5fdW51c2VkX3Jlc3VsdDoKPiAtCj4gLWh0dHBzOi8vc291cmNld2FyZS5vcmcvZ2l0
Lz9wPWdsaWJjLmdpdDthPWNvbW1pdGRpZmY7aD1mM2M4MmZjMWI0MTI2MWY1ODJmNWY5ZmExMmY3
NGFmOWJjYmM4OGY5Cj4gLQo+IC1TaWduZWQtb2ZmLWJ5OiBTdGV2ZSBEaWNrc29uIDxzdGV2ZWRA
cmVkaGF0LmNvbT4KPiAtCj4gLVVwc3RyZWFtOiBodHRwczovL2dpdC5saW51eC1uZnMub3JnLz9w
PXN0ZXZlZC9uZnMtdXRpbHMuZ2l0O2E9Y29tbWl0O2g9OWY5NzQwNDZjMzdiN2MyODcwNWQ1NTU4
MzI4NzU5ZmZmNzA4YjFjYgo+IC0KPiAtU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5k
QGt1aGxzLm5ldD4KPiAtLS0tCj4gLSB1dGlscy9leHBvcnRmcy9leHBvcnRmcy5jIHwgMTAgKysr
KysrKystLQo+IC0gMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAtCj4gLWRpZmYgLS1naXQgYS91dGlscy9leHBvcnRmcy9leHBvcnRmcy5jIGIvdXRpbHMv
ZXhwb3J0ZnMvZXhwb3J0ZnMuYwo+IC1pbmRleCBiMDNhMDQ3Yi4uNzQ4YzM4ZTMgMTAwNjQ0Cj4g
LS0tLSBhL3V0aWxzL2V4cG9ydGZzL2V4cG9ydGZzLmMKPiAtKysrIGIvdXRpbHMvZXhwb3J0ZnMv
ZXhwb3J0ZnMuYwo+IC1AQCAtNzQsMTMgKzc0LDE5IEBAIGdyYWJfbG9ja2ZpbGUodm9pZCkKPiAt
IHsKPiAtIAlfbG9ja2ZkID0gb3Blbihsb2NrZmlsZSwgT19DUkVBVHxPX1JEV1IsIDA2NjYpOwo+
IC0gCWlmIChfbG9ja2ZkICE9IC0xKQo+IC0tCQlsb2NrZihfbG9ja2ZkLCBGX0xPQ0ssIDApOwo+
IC0rCQlpZiAobG9ja2YoX2xvY2tmZCwgRl9MT0NLLCAwKSAhPSAwKSB7Cj4gLSsJCQl4bG9nX3dh
cm4oIiVzOiBsb2NrZigpIGZhaWxlZDogZXJybm8gJWQgKCVzKSIsCj4gLSsJCQlfX2Z1bmNfXywg
ZXJybm8sIHN0cmVycm9yKGVycm5vKSk7Cj4gLSsJCX0KPiAtIH0KPiAtIHN0YXRpYyB2b2lkCj4g
LSByZWxlYXNlX2xvY2tmaWxlKHZvaWQpCj4gLSB7Cj4gLSAJaWYgKF9sb2NrZmQgIT0gLTEpIHsK
PiAtLQkJbG9ja2YoX2xvY2tmZCwgRl9VTE9DSywgMCk7Cj4gLSsJCWlmIChsb2NrZihfbG9ja2Zk
LCBGX1VMT0NLLCAwKSAhPSAwKSB7Cj4gLSsJCQl4bG9nX3dhcm4oIiVzOiBsb2NrZigpIGZhaWxl
ZDogZXJybm8gJWQgKCVzKSIsCj4gLSsJCQlfX2Z1bmNfXywgZXJybm8sIHN0cmVycm9yKGVycm5v
KSk7Cj4gLSsJCX0KPiAtIAkJY2xvc2UoX2xvY2tmZCk7Cj4gLSAJCV9sb2NrZmQgPSAtMTsKPiAt
IAl9Cj4gLS0tIAo+IC1jZ2l0IHYxLjIuMwo+IC0KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9uZnMt
dXRpbHMvbmZzLXV0aWxzLmhhc2ggYi9wYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMuaGFzaAo+
IGluZGV4IGFmNWZjOGJkNzMuLmZiNWMwM2Q5MTcgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9uZnMt
dXRpbHMvbmZzLXV0aWxzLmhhc2gKPiArKysgYi9wYWNrYWdlL25mcy11dGlscy9uZnMtdXRpbHMu
aGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+IC0jIEZyb20gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9w
dWIvbGludXgvdXRpbHMvbmZzLXV0aWxzLzIuOC4zL3NoYTI1NnN1bXMuYXNjCj4gLXNoYTI1NiAg
MTFlN2M1ODQ3YTg0MjNhNzI5MzFjODY1YmQ5Mjk2ZTdmZDU2ZmYyNzBhNzk1YTg0OTE4MzkwMDk2
MTcxMTcyNSAgbmZzLXV0aWxzLTIuOC4zLnRhci54ego+ICsjIEZyb20gaHR0cHM6Ly93d3cua2Vy
bmVsLm9yZy9wdWIvbGludXgvdXRpbHMvbmZzLXV0aWxzLzIuOC40L3NoYTI1NnN1bXMuYXNjCj4g
K3NoYTI1NiAgMTFjNGNjNTk4YTQzNGQ3ZDM0MGJhZDNlMDcyYTM3M2JhMWRjYzJjNDlmODU1ZDQ0
YjIwMjIyMmI3OGVjZGJmNSAgbmZzLXV0aWxzLTIuOC40LnRhci54ego+ICAjIExvY2FsbHkgY29t
cHV0ZWQKPiAgc2hhMjU2ICA1NzY1NDBhYmY1ZTk1MDI5YWQ0YWQ5MGUzMjA3MTM4NWE1ZTk1YjJj
MzA3MDhjNzA2MTE2ZjNlYjg3YjlhM2RlICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bmZzLXV0aWxzL25mcy11dGlscy5tayBiL3BhY2thZ2UvbmZzLXV0aWxzL25mcy11dGlscy5tawo+
IGluZGV4IDBhZjAyNTRkM2YuLmU3ZDgyYjEwYmEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9uZnMt
dXRpbHMvbmZzLXV0aWxzLm1rCj4gKysrIGIvcGFja2FnZS9uZnMtdXRpbHMvbmZzLXV0aWxzLm1r
Cj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4g
LU5GU19VVElMU19WRVJTSU9OID0gMi44LjMKPiArTkZTX1VUSUxTX1ZFUlNJT04gPSAyLjguNAo+
ICBORlNfVVRJTFNfU09VUkNFID0gbmZzLXV0aWxzLSQoTkZTX1VUSUxTX1ZFUlNJT04pLnRhci54
ego+ICBORlNfVVRJTFNfU0lURSA9IGh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L3V0
aWxzL25mcy11dGlscy8kKE5GU19VVElMU19WRVJTSU9OKQo+ICBORlNfVVRJTFNfTElDRU5TRSA9
IEdQTC0yLjArCj4gLS0gCj4gMi40My4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
