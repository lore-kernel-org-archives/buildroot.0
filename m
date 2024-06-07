Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864A0C27C5F
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 16:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47B6C4054E;
	Fri,  7 Jun 2024 16:44:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d6FIV-FrREqq; Fri,  7 Jun 2024 16:44:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2C04059D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D2C04059D;
	Fri,  7 Jun 2024 16:44:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C07911BF47A
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 16:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9EED40550
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 16:44:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eLignv5SxgZ0 for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 16:44:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E9844059D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E9844059D
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E9844059D
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 16:44:19 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-35b6467754cso1432804f8f.3
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 09:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717778657; x=1718383457;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kCqEYchqBUPsvW/On4j0IOcbpOzLQnOkzqrdpcn+bF0=;
 b=shHsldNWtbD5yCWWrVETeRvoufQStogt6CWiV6d6KJSE1gRzpO33EbUDWEc2to0eQO
 VSc3SvPqc6Ynqvkh3mSxFWcJjaJIc0c/uhtBZv6/+yT1myGx2WrpPThCwhdVu7SKlO9W
 hXhAnNxlD2l62Szxti3kAz9AohUwYdpPr0EE3apWljCnwKiIYMcXYwFCMBQgkwXuDIqR
 B4UvnW4NLAKrk10lC//gPyF7iXtebCycDusmfeAIwHZStX3O7aIHX/SITel1KMqq9pOz
 LS9QrKHHq9BvXuVWe4qOQwNRrEXyXI3iOtxwUE9V56bNIOf2c/SWeHBAJ8D98EC7VC3R
 xIhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIHbhrhNY6l9EL0bcRwWoVhaj3W+4nFHcIQmHfo6edURnjDPcVoZcEwqYl2BqrNHuilOeALCjzkn0MHqDPE0+nGbL/s7spXw==
X-Gm-Message-State: AOJu0Yy3d+Rgcc9/UJePFotWN3JBe/Lpc9YHlgAkNDf8FSmDI0lm30je
 otu/Cu2VAcHI0yi7mzBvlL7/67SGeD4QswjoT9gWI2ZXTelOzkgRZcvjENeuBBU=
X-Google-Smtp-Source: AGHT+IG3HJRR2xSTa9DVVVjhHj2T9eyg/kvZ4hVD8f/Ig+tKcNwtD312vz90tsWQtPaHF745zgpElg==
X-Received: by 2002:a5d:6742:0:b0:354:f38f:6e68 with SMTP id
 ffacd0b85a97d-35efed08c84mr2155471f8f.13.1717778657396; 
 Fri, 07 Jun 2024 09:44:17 -0700 (PDT)
Received: from [192.168.178.20] (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35f0dbc6919sm672450f8f.82.2024.06.07.09.44.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 09:44:16 -0700 (PDT)
Message-ID: <8dc06d57-66a1-4e13-a8b6-8299a2aca3e6@mind.be>
Date: Fri, 7 Jun 2024 18:44:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240216211344.1807353-1-raphael.melotte@mind.be>
 <20240216211344.1807353-4-raphael.melotte@mind.be>
 <ffe31d50-5eae-4838-89fb-4f142d74071e@mind.be>
Content-Language: en-US
In-Reply-To: <ffe31d50-5eae-4838-89fb-4f142d74071e@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717778657; x=1718383457; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kCqEYchqBUPsvW/On4j0IOcbpOzLQnOkzqrdpcn+bF0=;
 b=FEcJThO5TK9361bHX5iNbdOUSmJXGy8JcqtFjAgjdLWzX4ccb0awWBvOVCUfzj6Y9S
 3PZnwmgYMZJPyjkf0wMBJAAqovQtBOFNXb8EUB5cROY4FFemX3itb4TfTVEC9LXftWzm
 g6wIEc/eV0reWIEkSwJMxsZUc2QLQaawNZyjllDkJpXiYBtFaQ2R0D0pTOQYGxtPlXiY
 FFU/3FO/6W2LJn+341pJXJPqT1GQyEv3Srd8KtnwVFl9ghw5yduIioDTO+HonzvKGQW5
 lCPkMUyGlov4mxkvSIze5viJ5aodSCViAgkiS7aq6pWAioBtQbs6l1yNn1l8sKGQT3CK
 mmxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FEcJThO5
Subject: Re: [Buildroot] [PATCH 3/5] package/mupdf: fix building shared
 libraries
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: james.hilliard1@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiA0LzEvMjQgMjI6MDYsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+IAo+IAo+Wy4u
Ll0gCj4gaWZlcSAoJChCUjJfU1RBVElDX0xJQlMpLHkpCj4gTVVQREZfTUFLRV9PUFRTICs9IHNo
YXJlZD1ubwo+IGVsc2UKPiBNVVBERl9NQUtFX09QVFMgKz0gc2hhcmVkPXllcwo+IGVuZGlmCj4g
Cj5bLi4uXQoKSSBzZW50IGEgdjIsIHNvcnJ5IGZvciB0aGUgZGVsYXkuLi4KCmh0dHBzOi8vcGF0
Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDA2MDcxNjMyMDgu
MTQ0NTcxNS0xLXJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlLwoKCktpbmQgcmVnYXJkcywKClJhcGhh
w6tsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
