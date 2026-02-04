Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFC2EA7944
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 19:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A85481196;
	Wed,  4 Feb 2026 19:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zp-Ytfh_p1Yn; Wed,  4 Feb 2026 19:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80886821A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770233811;
	bh=zYxS47hmHR15T7WlF5YIMhv/uYDB7QuqK6o9cXXwcw4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GcLqspiQ7+V/ClQxWPC3KkopAikwOjTUq4keuNtJIj8FYlmRAS3p6/+GICtUpBWt2
	 9ciI4yMonNhNv4mU76cj5h8yki+6kU+36wgu+aQKVkD2RUdpii6gct6irfHEVh98DW
	 2Z6rHycGpsR5v3kJnnW4vmrfTdJHVS999wIXlQ0kkbqdUrlYEfaDy7oT1ys60ESQz3
	 +dr+8z105tydhz3DEijF028K9qPKwk9r92SK4DuLVgKJlKcTuetLS01fRidaaenX5c
	 BdkCh4ojLkkpLxq25v9fZ3akAtWuZ5HCuzNwJm+8aRG6V+zQJaBS4+HSyXsdJCBL9F
	 lpVUCqAJ0voeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80886821A1;
	Wed,  4 Feb 2026 19:36:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 48EAF17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AAF660AFB
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h1aR3_YQLL-Z for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 19:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4101760DE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4101760DE3
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4101760DE3
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 19:36:48 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-655af782859so297529a12.2
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 11:36:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770233807; x=1770838607;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7DYBFA92/CNCuLMb/J0pC4HpUa1HZvHREDTtOyIYUT0=;
 b=FYUxYFL9dgazJhnlkQdCJXswySmEmyHzvfR1toKJ7D662ZpfW8hacze36CwQ3YiCRP
 9nK/Wzjg0o3+wsXa+U5nhfxZZayQUFiUeuShurp39zEfkE2YsWOEyFt6/PQNCFj/FgOf
 919Smx44OdkMiVCkxUyWk6t3udFmqMOkD5o1MA2k8ebJpbvoc3od3T59F/VJE8eesrk1
 kx8kUufCJEqShaNlCpQGi5KFo7KKrzI3N914PWJFIzNk7AN8TyuXw/5u5d20SB32UW0n
 tfJml3PMi1sCPl/BDjmt7nAVePgZcGNb52Pe6jjIPdMSZFVJ1R7iLwufz8bwLcMIFPhH
 bEsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbm6GC3pXmHYDNa9ERahOx1+G28WzAPMlWA4iqGnJ918ez54v3xuRFlpIWB2m4pBcfNJ2q0v0XOTo=@buildroot.org
X-Gm-Message-State: AOJu0Yzw7kzawydJnT8er5K84jvT9Fxa5AGiqEt12Ht2WESwDwLa0VI+
 HjwAasavEcUeGaaMmfDF/tuVPwytiJ1BxKNinnfFE2wQld1pd0tKeItF1d1hEa+k6LkRDSK5gXR
 m4Za/pH4=
X-Gm-Gg: AZuq6aKIEXhgxXOPmxxPBDi7uOpU2jsjl5hf3R66Zwc9uVF8ojXxyjVQbZ5roWNjq8N
 bUVk1LJSpDaPxac25/V863W0Nnx5Xk+wykTeRJjXKcrrgRlDe8RCzLh1yr5gAznB7uziS1wd6NE
 a3zLs5WB7lLmyxUlA7tIfjlEBo8tUYmL4zrNJVozbmBQHkLWPavtUQingE8Gy6UVD8++ImYjgUQ
 0Pvaih93zb/k4MfXg1y5mmNXogTYrImNfItfj4/jHt/XUY6yLF7zehQ0hAuiPBRAzI06TZrTVU1
 FqexV0ReAW6/SaLLyZLYNpodCCYqXS3eM8CauoviysAdcDsDLONF0b1tQlnZsfj4cT/V7LFGrHz
 jDN/qInOF82S9eO0So0fd9OGTNLHPtHioae6rikRZ/MhIfEp72dUgWwU925g5d54SlsGwYX9DmC
 gqP8xSFX7zx7W+aneRNpkfkM6PyzNFXTFDODnCREMHGnVdQGpVRewNujbzzPh/wqZ0mruhTxWmU
 ZRBobfgKeYfjh8ia+iNA5CYRkizh0L6kznwHhrfxZjLv16BMF/pAw==
X-Received: by 2002:a05:6000:438a:b0:435:9bf7:c6b9 with SMTP id
 ffacd0b85a97d-43617e3c919mr5395735f8f.24.1770227070502; 
 Wed, 04 Feb 2026 09:44:30 -0800 (PST)
Received: from ?IPV6:2a02:8440:7508:b35c:197a:eac1:d9aa:5224?
 (2a02-8440-7508-b35c-197a-eac1-d9aa-5224.rev.sfr.net.
 [2a02:8440:7508:b35c:197a:eac1:d9aa:5224])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e25d02sm7838789f8f.3.2026.02.04.09.44.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 09:44:30 -0800 (PST)
Message-ID: <182c7645-d293-4ee6-8f75-43430aff7af2@smile.fr>
Date: Wed, 4 Feb 2026 18:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250801150722.4003476-1-raphael.melotte@mind.be>
 <20250801150722.4003476-2-raphael.melotte@mind.be>
Content-Language: fr
In-Reply-To: <20250801150722.4003476-2-raphael.melotte@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1770233807; x=1770838607; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7DYBFA92/CNCuLMb/J0pC4HpUa1HZvHREDTtOyIYUT0=;
 b=ILtT9oFa4dP9AcXx1eNfxZRoibyfzNeQBM5nQeMCZvWlyyOKI1EV7HyLGZgF6I1TST
 3FupoBpZQN2Du3XAG6LSTRl2ZjMktPOq5WV+W32MHYJa5c7caXgdt6cVvrEEry61FV/O
 dezBpOTYdb9Bhmjcq1szsvr+b0d9IFviyoDEU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ILtT9oFa
Subject: Re: [Buildroot] [PATCH 1/6] package/llvm-project: enable clang
 python bindings
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

SGVsbG8gUmFwaGHDq2wsIEFsbCwKCkxlIDAxLzA4LzIwMjUgw6AgMTc6MDcsIFJhcGhhw6tsIE3D
qWxvdHRlIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBJdCBzaG91bGQgYmUgbm90ZWQgdGhh
dCBiZWNhdXNlIHRoZSBweXRob24gYmluZGluZ3MgaGF2ZSB3cm9uZyBkZWZhdWx0Cj4gaW5jbHVk
ZSBkaXJzLCB0aGV5IGFyZSB1c2VsZXNzIGlmIHRoZSBpbmNsdWRlcyBhcmUgbm90IHByb3ZpZGVk
Cj4gZXh0ZXJuYWxseS4KCkFwcGxpZWQgcGF0Y2ggMS82LCAzLzYgYW5kIDQvNiBvZiB0aGlzIHNl
cmllcyB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Cj4g
LS0tCj4gIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2NsYW5nL2NsYW5nLm1rIHwgNCArKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
bHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9jbGFuZy9j
bGFuZy5tawo+IGluZGV4IGE1YzhiOTkwYWEuLjFlZTBlYjMyM2YgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcubWsKPiArKysgYi9wYWNrYWdlL2xsdm0tcHJv
amVjdC9jbGFuZy9jbGFuZy5tawo+IEBAIC0xMDksNiArMTA5LDEwIEBAIENMQU5HX0NPTkZfT1BU
UyArPSAtRExMVk1fTElOS19MTFZNX0RZTElCPU9OCj4gIEhPU1RfQ0xBTkdfQ09ORl9PUFRTICs9
IC1ETExWTV9EWUxJQl9DT01QT05FTlRTPWFsbAo+ICBDTEFOR19DT05GX09QVFMgKz0gLURMTFZN
X0RZTElCX0NPTVBPTkVOVFM9YWxsCj4gIAo+ICsjIGhvc3QtcHl0aG9uMyBpcyBhIHBlcm1hbmVu
dCBkZXBlbmRlbmN5IG9mIGNsYW5nLCBzbyB3ZSBjYW4gYnVpbGQgdGhlCj4gKyMgcHl0aG9uIGJp
bmRpbmdzIHVuY29uZGl0aW9uYWxseToKPiArSE9TVF9DTEFOR19DT05GX09QVFMgKz0gLURDTEFO
R19QWVRIT05fQklORElOR1NfVkVSU0lPTlM9JChQWVRIT04zX1ZFUlNJT05fTUFKT1IpCj4gKwo+
ICAjIEhlbHAgaG9zdC1jbGFuZyB0byBmaW5kIG91ciBleHRlcm5hbCB0b29sY2hhaW4sIHVzZSBh
IHJlbGF0aXZlIHBhdGggZnJvbSB0aGUgY2xhbmcKPiAgIyBpbnN0YWxsYXRpb24gZGlyZWN0b3J5
IHRvIHRoZSBleHRlcm5hbCB0b29sY2hhaW4gaW5zdGFsbGF0aW9uIGRpcmVjdG9yeSBpbiBvcmRl
ciB0bwo+ICAjIG5vdCBoYXJkY29kZSB0aGUgdG9vbGNoYWluIGFic29sdXRlIHBhdGguCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
