Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C13C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0D6E60D8D;
	Fri,  4 Sep 2026 12:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3h4lBdnjuB_u; Fri,  4 Sep 2026 12:18:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 69E2E60D8E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524319;
	b=GShcKsclfSDPABdW1WoFEPK7nrm7GUDP/ebrUJI3Nx7nb/qvcujmgMP2tKolKKHHsRNu
	 YWQoJl5yeWJrSRyVeb0EwczOddPI/SLbVURaPeJokV1oMrsHgvZ1tJQTXE3/drvMRw5m4
	 nWTftZuTOGMZq4bpNuuOeym2cttuKqr3H84jcbM/t0mSvOAjI0ur1M55UVe9Dg3mr67UP
	 2twkjMnIGZF0ysEohRYK8IOBseTIK9haG66zq5abSOUITAUzEBR6aFLzcu9Xza0ne/V7K
	 zIOV6FvKHk2leQOlek6QI7mdx7kKZqCRJB2wHksN+y87T94iJuisF/DeoiXm7Jl/ckw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524319;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ofeB5QvtsURsSP+Zo6xIA0RtL8TEsrev9cHhvNt9A7Q=;
	b=dD65s0tAP0IG9+p5Eb0wvFcOXEiixcnMVcaBARMX0w0cxLEbswADTiVRbRMOqwskQyz3
	 F0GHmRXaKGPrblHCFMtmeUWL4ue1DmRHPxjOmMl4KLBL7B92mWllnL5l0FNeS/5ZNjoOb
	 JLbE8DARcGcM1CEfC9ZVpvFvBAY6ukr22iepH4cLNh9/RL9fKD29+jlHq3hHbHubZyNYC
	 0uFvB7WK2AbytiBCppQxRdc1z72tDh4ngflxpikI+TxOmBBXYu+cNPSLqZFFth52kVBLS
	 mjdQomfr4Zfprw7C5lVviWF5VcoBRh7jleetET/XP6UsGQlxepQU3WQE3WUvq2T++cA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524319;
	bh=ofeB5QvtsURsSP+Zo6xIA0RtL8TEsrev9cHhvNt9A7Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RPv8P9IhTGlq+vufM+PmBhKNM+x0cNnwGKQiWGIRmKaM/GOR8DEmXg738mAqLUMpk
	 WQwG+RwCDkrPY2nVf4QkzhV4QGtKMQ0hWRBaSmBwGqfgHV59DGFBYZwJQZnXoSc3UB
	 zf0UUxHfo4VfbsxvKprdp2Va4hsfpAgqD02cPOOrSS5JbJRJVnbA356UH2EZqxl2+h
	 dLsY/VjvdtaNYswR1x1hE5uDliixnwWJxPkIaYSuiHZYtC/vA/nKgdyGzf9xcpYkRn
	 bwTt5bYOrYxPLOWpDxQYERqpbZFBcgkh6lAFmVloIK1T6SJW8DKDn2glPEFtXAqY/q
	 2+ptAHXW5zSqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E2E60D8E;
	Fri,  4 Sep 2026 12:18:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D68210E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63AE740B91
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgCGS-a_Z33M for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1B4DE40B7F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524315;
 b=T4bGXQRNBrq6+3PTBdwgto+jzO9yIc4FfX9o+43duy5jMfzAnMGOdMV4XYAwHodoMnAD
 FbPtuOOICYxTOQcEmz+88S4U8pSPTfJQiem1kislouh5A46kDLozzN5s+lubX4HnwFhac
 e81++LJ8AwRa3X1Zs1w62AtnBNxFO++mpo+5QudcDyRB2ROQ3dhk7qcXPfpUHwhB/Trb8
 GZdxpft0Uj3XqUA5CAOwWyZEI2NcwmjQGkRtHH/n2lm0ovemYP4q/4V74kmDr8m8BUPMQ
 r9mz8yjH/L/HjVHUzbwjAX+Z/2U2Ylbud0igtLSujlSrNWX6vJehxsXezAyPlvdpmxg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524315;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=lJwHRzkaWb7dFXLkqaPk0Np+DO/TOMRODK+YsmdZyus=;
 b=tgrLEzd4m0yw7rFxlSQ5DYtM+kIAJA1iFPF1+oaZHl+kOkOb/KvANX0zPR6WW+vKHBTr
 MZxyYVzHznBzHEkgkhskU/2idTAF5HKiUfYZuwxr4XPeEwN4tL2NRScoi0rdCBAKByCu/
 +7fYisyu0fHc3hBcoZ6FRkF2c9tv1VOfW7vD6LUH6J5jQ2dg7L2r0YJscyYOyC29Pd32h
 VRDXqoPUl9DyXWTWTGzEkwIC4T+uger17D0ChvDVcyFyB6zkd9XWY7RMSqpxWO+T8XamZ
 UNRc1H6zwIBa3caSnxG4rmZkK2mpY9+F92QqaXIKJxyuxFWpPouNRXMpR3FVFDEjmDQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EkeBUmw+; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1B4DE40B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:34 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49954b88fffso6904835e9.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524313; x=1789129113;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=lJwHRzkaWb7dFXLkqaPk0Np+DO/TOMRODK+YsmdZyus=;
 b=hwP8tRNGaxRPeUSvyHkqZcEZMjXUv8bbkVTW7Vi2Z/72C3ylhn++7CMCGu+BGFtLD3
 I9E50/yzXfCl9e1kNKWIO8gbvJAfbst9RRwrZzl8N5kqo2ieYCkqoz1cqVcH8m5wBgVF
 hhGKDucV9D81TeDe8teWwkPj/1SBWz2yglD5Z17Gqfyb0rsXTkPSYa7fVxubHLtCG0tI
 Fh1UYs+25oH67coaXzhQchIqUah/IveXCQacYsT2Tw1lf0bNovpsetWLj0Xjq9QDmZZH
 7MA/MM2OSl7LxGQYP5GUY/pVAmI+6Fz3w+WwwyAQsRq9HIVJXqdhDZpNMno3cIB9fYu7
 GSjQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzxl8Rx+4PrcWJNs4X9IKXCKsKwhJsIDcQ/Hqo6d+T8S2DxYneVQz/nvrmeisoKCyMVKSYXYfoSlSQ=@buildroot.org
X-Gm-Message-State: AFuF++naYNIi1ozHjnPTMKmm4w/R34kx+uy4iAv0MYHmEsqBHMD11KQW
 H3jFIVfSG3Uoqu2EaInkZ7xQKgIKFxo25IGldU1uAVRFA1hsaP9pAlxik9zEq0l8Xis=
X-Gm-Gg: AYBFou0JdnMbp20rsPRu3tztWLuC2uEDo4lGRReaR6YoqzI3hJy8a7fSyMQuhGC61GN
 7twyz01k6zNDI5+NhR9iynEV+FtgmC3cQfWa+Ij6/XGQz697UU686Ii6Wwes8YZxlxGru9YIy1h
 I3hA/Gs9I6lRWlTenTIlm8iCHVxhXIh3oZBq4VTR9gbwfXpBQ6ohDQSEgMXYiBKoFpzLaMIP860
 E9eGmjyhpJ4NX8V0aYYH/6XK8tKf8CMqIN55e2E5GcxLP/22HU3FyEvpy960GD9tcSwUbTLELnr
 a0XUz9rNna961O5JosOVnowK3CC3sr0JCYx4nGdXkdaWDlrXmq5byBDEk7jbkJ/H8TLleubdNGi
 7kkC4X2N4b+Ls7uMEDrKQn4FlB3vd27oRWEDoCtesgN/hLYC/urGASqEgftxS/ioFmIFZYiWwef
 y1wywsvfJW/h8m7jpPXytL+3t8eGkNoG1PEPb1n2sRbn2zuoUK5rmR0A==
X-Received: by 2002:a05:600c:a0b:b0:49c:cee2:1697 with SMTP id
 5b1f17b1804b1-49cf8262133mr63480615e9.16.1788524312438; 
 Fri, 04 Sep 2026 05:18:32 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7710aa5sm66451225e9.7.2026.09.04.05.18.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:32 -0700 (PDT)
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:25 +0200
Message-ID: <20260904121831.405382-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823-fix-host-erlang-v1-1-4886b00d10f0@bootlin.com>
References: <20260823-fix-host-erlang-v1-1-4886b00d10f0@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/erlang: fix link failure on
 odbcserver
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

SW4gcmVwbHkgb2Y6Cj4gaG9zdC1lcmxhbmcgYnVpbGQgY2FuIGZhaWwgd2l0aCB0aGUgZm9sbG93
aW5nIGVycm9yOgo+IAo+ICAgbWFrZVs1XTogTm90aGluZyB0byBiZSBkb25lIGZvciAnb3B0Jy4K
PiAgICBNQUtFCW9wdAo+ICAgIENDCS4uL3ByaXYvYmluL3g4Nl82NC1wYy1saW51eC1nbnUvb2Ri
Y3NlcnZlcgo+ICAgL3Vzci9iaW4vbGQ6IC4uL3ByaXYvb2JqL3g4Nl82NC1wYy1saW51eC1nbnUv
b2RiY3NlcnZlci5vOiBpbiBmdW5jdGlvbiBgZW5jb2RlX2NvbHVtbl9keW4nOgo+ICAgb2RiY3Nl
cnZlci5jOigudGV4dCsweDZiNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGVpX3hfZW5jb2Rl
X3R1cGxlX2hlYWRlcicKPiAgIC91c3IvYmluL2xkOiBvZGJjc2VydmVyLmM6KC50ZXh0KzB4NmMy
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZWlfeF9lbmNvZGVfdHVwbGVfaGVhZGVyJwo+ICAg
L3Vzci9iaW4vbGQ6IG9kYmNzZXJ2ZXIuYzooLnRleHQrMHg2ZDQpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBlaV94X2VuY29kZV91bG9uZycKPiAgIC91c3IvYmluL2xkOiBvZGJjc2VydmVyLmM6
KC50ZXh0KzB4NmU3KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZWlfeF9lbmNvZGVfdWxvbmcn
Cj4gICAvdXNyL2Jpbi9sZDogb2RiY3NlcnZlci5jOigudGV4dCsweDZmYSk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGVpX3hfZW5jb2RlX3Vsb25nJwo+ICAgL3Vzci9iaW4vbGQ6IG9kYmNzZXJ2
ZXIuYzooLnRleHQrMHg3MDgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBlaV94X2VuY29kZV90
dXBsZV9oZWFkZXInCj4gICAvdXNyL2Jpbi9sZDogb2RiY3NlcnZlci5jOigudGV4dCsweDcxYik6
IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGVpX3hfZW5jb2RlX3Vsb25nJwo+ICAgL3Vzci9iaW4v
bGQ6IG9kYmNzZXJ2ZXIuYzooLnRleHQrMHg3MmUpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBl
aV94X2VuY29kZV91bG9uZycKPiAgIFsuLi5dCj4gCj4gVGhpcyBjYW4gYmUgcmVwcm9kdWNlZCB3
aXRoIHRoZSBmb2xsb3dpbmcgbWluaW1hbCBkZWZjb25maWcgKGFuZAo+IGxpYmVpLnNvIHByZXNl
bnQgb24gaG9zdCwgc2VlIGRldGFpbHMgYmVsb3cpOgo+IAo+ICAgQlIyX3g4Nl82ND15Cj4gICBC
UjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiAgIEJSMl9QQUNLQUdFX0VSTEFORz15Cj4gCj4gVGhv
c2UgbWlzc2luZyBzeW1ib2xzIGFyZSBwYXJ0IG9mIHRoZSBlcmxfaW50ZXJmYWNlLCBleHBvc2Vk
IGJ5IGxpYmVpLmEuCj4gaG9zdC1lcmxhbmcgYnVpbGRzIGNvcnJlY3RseSBsaWJlaS5hIF9iZWZv
cmVfIG9kYmNzZXJ2ZXIuYyAoaXQgY2FuIGJlCj4gZm91bmQgaW4gbGliL2VybF9pbnRlcmZhY2Uv
b2JqL3g4Nl82NC1wYy1saW51eC1nbnUvbGliZWkuYSksIGJ1dCB0aGUKPiBmYWlsdXJlIGlzIGFj
dHVhbGx5IGR1ZSB0byB0aGUgYnVpbGQgY29tbWFuZCBnZW5lcmF0ZWQgYW5kIHVzZWQgZm9yCj4g
b2RiY3NlcnZlci5jLCBlc3BlY2lhbGx5IHRoZSBsaW5rIGFyZ3VtZW50czoKPiAKPiAgIC91c3Iv
YmluL2djYyBcCj4gICBbLi4uXQo+ICAgLW8gLi4vcHJpdi9iaW4veDg2XzY0LXBjLWxpbnV4LWdu
dS9vZGJjc2VydmVyIFwKPiAgIC4uL3ByaXYvb2JqL3g4Nl82NC1wYy1saW51eC1nbnUvb2RiY3Nl
cnZlci5vIFwKPiAgIC1ML3Vzci9saWI2NCBcCj4gICAtbG9kYmMgXAo+ICAgLUwvaG9tZS9hbGV4
aXMvc3JjL2J1aWxkcm9vdC9lcmxhbmctbWFzdGVyL2J1aWxkL2hvc3QtZXJsYW5nLWN1c3RvbS9s
aWIvZXJsX2ludGVyZmFjZS9vYmoveDg2XzY0LXBjLWxpbnV4LWdudSBcCj4gICAtbHB0aHJlYWQg
LWxlaQo+IAo+IC91c3IvbGliNjQgaXMgc2VhcmNoZWQgYmVmb3JlIHRoZSBwYXRoIHdoZXJlIGxp
YmVpLmEgaGFzIGJlZW4gYnVpbHQsIHNvCj4gaWYgd2hldGhlciBhIHZhbGlkIGxpYmVpLmEgb3Ig
bGliZWkuc28gaXMgZm91bmQgdGhlcmUsIGl0IHNoYWRvd3MgdGhlCj4gZXhwZWN0ZWQgbGliZWku
YS4gSW4gdGhlIGJ1aWxkIGZyb20gd2hpY2ggdGhlIGxvZ3MgYWJvdmUgY29tZSwgdGhlCj4gbm90
YWJsZSBwb2ludCBpcyB0aGF0IHRoZSBob3N0IHN5c3RlbSBpbmRlZWQgaGF2ZSBhIHZhbGlkIGxp
YmVpLnNvLCBidXQKPiBpcyBjb21wbGV0ZWx5IHVucmVsYXRlZCB0byBlcmxfaW50ZXJmYWNlOyBp
dCByYXRoZXIgZXhwb3NlcyB0aGUgRW11bGF0ZWQKPiBJbnB1dCBwcm90b2NvbCBhaW1lZCBhdCBX
YXlsYW5kIHN0YWNrOyBhbmQgc28gaXQgb2J2aW91c2x5IGNvbnRhaW5zIG5vbmUKPiBvZiB0aGUg
ZXhwZWN0ZWQgZWlfKiBzeW1ib2xzLgo+IAo+IFVwc3RyZWFtIGhhcyBhbHJlYWR5IGlkZW50aWZp
ZWQgYW5kIGZpeGVkIHRoZSBpc3N1ZSwgdGhlIGZpeCBpcyBhbHJlYWR5Cj4gcmVsZWFzZWQgaW4g
dmVyc2lvbnMgPj0gMjcueC55LiBFcmxhbmcgMjYgKHRoZSB2ZXJzaW9uIGN1cnJlbnRseQo+IHBh
Y2thZ2VkIGluIGJ1aWxkcm9vdCksIGlzbid0IHN1cHBvcnRlZCBhbnltb3JlIChvbmx5IHRoZSB0
aHJlZSBsYXRlc3QKPiByZWxlYXNlcyBhcmUgc3VwcG9ydGVkLCBzZWUKPiBodHRwczovL2dpdGh1
Yi5jb20vZXJsYW5nL290cC9ibG9iL21hc3Rlci9TRUNVUklUWS5tZCksIHNvIHRoZXJlIHdvbid0
Cj4gYmUgYW55IG5ldyBtaW5vciB1cGRhdGUgdGhhdCB3aWxsIHJlbGVhc2UgdGhpcyBmaXguCj4g
Cj4gUGljayBhbmQgYmFja3BvcnQgdGhlIGZpeGluZyBwYXRjaCBzbyB0aGF0IHRoZSBjdXJyZW50
IHZlcnNpb24gcGFja2FnZWQKPiBpbiBidWlsZHJvb3QgY2FuIHN0aWxsIGJ1aWxkLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
CgpBcHBsaWVkIHRvIDIwMjUuMDIueCAmIDIwMjYuMDUueC4gVGhhbmtzCgo+IC0tLQo+IFRoZSBp
c3N1ZSBhZmZlY3RzIDIwMjUuMDIueCwgMjAyNi4wNS54IGFuZCBtYXN0ZXIuCj4gCj4gSSd2ZSBh
bHNvIHRha2VuIGEgbG9vayBhdCB1cGRhdGluZyB0aGUgZXJsYW5nIHBhY2thZ2UsIGJ1dDoKPiAt
IEkgaG9wZSB0aGUgZml4IHRvIGJlIGFwcGxpZWQgb24gY3VycmVudCBMVFMsIHNvIGEgcGFja2Fn
ZSB1cGdyYWRlCj4gICB1cGRhdGluZyB0byBhIG5ldyBtYWpvciB2ZXJzaW9uIHNlZW1zIG91dCBv
ZiBzY29wZQo+IC0gT24gbWFzdGVyIGJyYW5jaCwgd2hpbGUgSSBtYW5hZ2VkIHRvIGJ1aWxkIGhv
c3QtZXJsYW5nIDI5IHdoZW4KPiAgIHVwZGF0aW5nIHRoZSAubWssIEkgcXVpY2tseSBlbmNvdW50
ZXJlZCBzb21lIGZhaWx1cmVzIG9uIHNvbWUgZXJsYW5nCj4gICBwYWNrYWdlcywgc28gaXQgbmVl
ZHMgbW9yZSB3b3JrCj4gLS0tCj4gIC4uLmJzLW9yZGVyLXRvLWF2b2lkLXBpY2tpbmctdXAtc3lz
dGVtLWxpYmVpLnBhdGNoIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMzIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2VybGFuZy8w
MDAxLUNoYW5nZS1saWJzLW9yZGVyLXRvLWF2b2lkLXBpY2tpbmctdXAtc3lzdGVtLWxpYmVpLnBh
dGNoIGIvcGFja2FnZS9lcmxhbmcvMDAwMS1DaGFuZ2UtbGlicy1vcmRlci10by1hdm9pZC1waWNr
aW5nLXVwLXN5c3RlbS1saWJlaS5wYXRjaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXgg
MDAwMDAwMDAwMDAwLi5jMjEzMTFjYmIzOTUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2Fn
ZS9lcmxhbmcvMDAwMS1DaGFuZ2UtbGlicy1vcmRlci10by1hdm9pZC1waWNraW5nLXVwLXN5c3Rl
bS1saWJlaS5wYXRjaAo+IEBAIC0wLDAgKzEsMzIgQEAKPiArRnJvbSBkZTU4Y2JlOTc5OTQyMzA4
ZWI4ODIzYTUyNmNkNjhiMDZkNWRjNjYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9t
OiBTYWNoYSA8c2FjaGFob255QGdtYWlsLmNvbT4KPiArRGF0ZTogV2VkLCAxMyBNYXIgMjAyNCAx
MzoyODo0MSArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIENoYW5nZSBsaWJzIG9yZGVyIHRvIGF2
b2lkIHBpY2tpbmcgdXAgc3lzdGVtIGxpYmVpCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRo
dWIuY29tL2VybGFuZy9vdHAvY29tbWl0L2RlNThjYmUKPiArU2lnbmVkLW9mZi1ieTogQWxleGlz
IExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KPiArLS0tCj4gKyBsaWIvb2Ri
Yy9jX3NyYy9NYWtlZmlsZS5pbiB8IDYgKysrLS0tCj4gKyAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL2xpYi9vZGJjL2Nf
c3JjL01ha2VmaWxlLmluIGIvbGliL29kYmMvY19zcmMvTWFrZWZpbGUuaW4KPiAraW5kZXggZDFi
MjY3NDNhNmE0Li4wM2VkMzE0ZjZhMjYgMTAwNjQ0Cj4gKy0tLSBhL2xpYi9vZGJjL2Nfc3JjL01h
a2VmaWxlLmluCj4gKysrKyBiL2xpYi9vZGJjL2Nfc3JjL01ha2VmaWxlLmluCj4gK0BAIC04MCwx
MCArODAsMTAgQEAgT0RCQ19JTkNMVURFID0gQE9EQkNfSU5DTFVERUAKPiArICMgLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICsgQ0MgPSAgQEND
QAo+ICsgQ0ZMQUdTID0gJChUWVBFRkxBR1MpIEBDRkxBR1NAIEBUSFJfREVGU0AgQERFRlNACj4g
Ky1FSV9MREZMQUdTID0gLUwkKEVJX1JPT1QpL29iaiQoVFlQRU1BUktFUikvJChUQVJHRVQpCj4g
KytFSV9MREZMQUdTID0gLUwkKEVJX1JPT1QpL29iaiQoVFlQRU1BUktFUikvJChUQVJHRVQpICQo
RUlfTElCKQo+ICsgTEQgPSBATERACj4gKy1MREZMQUdTID0gICQoT0RCQ19MSUIpICQoRUlfTERG
TEFHUykKPiArLUxJQlMgPSBATElCU0AgQFRIUl9MSUJTQCAkKEVJX0xJQikKPiArK0xERkxBR1Mg
PSAgJChFSV9MREZMQUdTKSAkKE9EQkNfTElCKQo+ICsrTElCUyA9IEBMSUJTQCBAVEhSX0xJQlNA
Cj4gKyBJTkNMVURFUyA9IC1JLiAkKE9EQkNfSU5DTFVERSkgJChFSV9JTkNMVURFKQo+ICsgVEFS
R0VUX0ZMQUdTID0gIEBUQVJHRVRfRkxBR1NACj4gKyAKPiArLS0gCj4gKzIuNTUuMAo+ICsKPiAK
PiAtLS0KPiBiYXNlLWNvbW1pdDogYzNmMzcwNWEyZmQyNzIwNmNmMmU3OWZkODAyYjY4MWU3N2Jl
MmNmZQo+IGNoYW5nZS1pZDogMjAyNjA4MjMtZml4LWhvc3QtZXJsYW5nLTVjMGI4MmJhN2EyZgo+
IAo+IEJlc3QgcmVnYXJkcywKPiAtLSAgCj4gQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9y
ZUBib290bGluLmNvbT4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
