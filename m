Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2438BC3ABBC
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 13:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9062E6078C;
	Fri,  9 May 2025 13:30:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cfMfnPNCROc; Fri,  9 May 2025 13:30:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D08E560ABA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D08E560ABA;
	Fri,  9 May 2025 13:30:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AE3C15A
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BD1683C29
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P1XLEYgdvP7N for <buildroot@buildroot.org>;
 Fri,  9 May 2025 13:30:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com;
 envelope-from=lancethepants@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 786ED83C1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 786ED83C1E
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 786ED83C1E
 for <buildroot@buildroot.org>; Fri,  9 May 2025 13:30:31 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-72d3b48d2ffso2502942b3a.2
 for <buildroot@buildroot.org>; Fri, 09 May 2025 06:30:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746797431; x=1747402231;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eVADuQyLeJ5te+Z2r2gihV9IR/83DdjTFCWkpvrkJwI=;
 b=PmZucQ4xwexs4WsZ87MpAlTd6uDAUD/9O+5+wNv99TYSC6ClBRT/uqN4XHVxkPbs62
 3+zXhBL7IAE8+49i5cXJgN6yQJQbRmLNIcHcXJqctxBPGn8NVSzElIQCL+z5zvODandB
 rldkQNlzBsVz5HOLuGxA9NlA1yeftWViNkhb2f4F9OrEb559CkjblHoXAw0Bjyf131iJ
 XNOZgdGcElvmJfQSwO4nHMRk/a1ZIGgJyK641pHbkXmAG1FxvIb1IpYL9hlXlabyPnOz
 PTXTIo7kN8kj5gB/HJlUEtrEyIttjnv3g7ApqYBKAKB3QNiy2WO/xEr5kR6roW6JiS6h
 I6PA==
X-Gm-Message-State: AOJu0YzLFUQsOMDA6HaZutw7b66doiaJVEdQ9DRx77AANM1AjgbXPzwQ
 ID+TFTVuY5/eIqCB/dWZj3lrUCLSG4Fyfgf3umsO/Jb7QVb62qBjGCsISA==
X-Gm-Gg: ASbGncue3Eb28FA0okp4nKQHc78bXm1crtWRGGORq398Fj/9Ulqjd1fvnVxogLMZNHk
 NStkdWz+/4WqWAqhvuEXyZkyMUOfghurgDynZfrv/HMxT1N8e1ptpB7ixBsQ6k35HAUkjJuUaT8
 P8c55zCG7neqJlhQ4iPTslN8dukHmWkv4VNH5xPz0KbeowzCpTks39a2bhywbhKIHkTSpm2FT1U
 Y2EKgfEasJP1gt5INKxooqodNXc8nKj+NaDqCsymVPSK0spjwQaGNEN76GUCd/43D9Hz4q7ioEy
 nKocIQLTexi0Bp4WYZHh81ojkthiqJBzp797B0qsVn0uqlrzov1e/g==
X-Google-Smtp-Source: AGHT+IHPRlhORN24xCH0BCAzRiQbDOu5dTWhRHhc8nzoXt0FVj4Wt8IPnAlkEyUGcO+qgknrZzPI9w==
X-Received: by 2002:a17:903:2309:b0:22e:7f20:52c6 with SMTP id
 d9443c01a7336-22fc8b5c3dfmr48820825ad.23.1746797430464; 
 Fri, 09 May 2025 06:30:30 -0700 (PDT)
Received: from [10.0.0.72] ([76.8.199.226]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc75491f5sm16894415ad.39.2025.05.09.06.30.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 May 2025 06:30:30 -0700 (PDT)
Message-ID: <d94268af-a9b4-46e4-80a7-ad7cc4e0e7c5@gmail.com>
Date: Fri, 9 May 2025 07:30:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <60b8483c-b717-41ce-a406-bceb71c3a089@rnout.be>
 <ab994654-61f8-443c-ba70-777fc4379462@grenoble.cnrs.fr>
Content-Language: en-US
From: Lance Fredrickson <lancethepants@gmail.com>
In-Reply-To: <ab994654-61f8-443c-ba70-777fc4379462@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746797431; x=1747402231; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eVADuQyLeJ5te+Z2r2gihV9IR/83DdjTFCWkpvrkJwI=;
 b=MMD/df9TrhEEY799eJPIVHA7ZDgKQjBqsuG79ejGVjraOtVYQfKJg9MGG1gQg1HqQI
 pd6OMZFRQzoHHZCxG2BolE00daTC/MPdrUETm/bZw8+5DJH/mhpPmMFDX6jeN5ylvTqN
 +sJrXjD3BYakJbHqHFIGoVd+/rBP/btPzD52jzX8XhPsybOLsFS2pFrnoJCfPzM1JnkZ
 NnNCSsbJLbrgiGXz99oFLghIHKTZHv3LRZxzRbBwuxhchzmwyqoTo5DxrI6vYrcWUdTp
 APd/902iKuyn46w6dP6tKrCV78+sy2d9wcd6o4y9dD+igW/z4r1dMibjIJqT+EOZXXFy
 bUhg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MMD/df9T
Subject: Re: [Buildroot] Buildroot 2025.02.1 released
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWVzLCB0aGUgd2Vic2l0ZSBzdGlsbCBoYXNuJ3QgYmVlbiB1cGRhdGVkIHRvIHJlZmxlY3QgdGhl
IDIwMjUuMDIuMSByZWxlYXNlLgoKTGFuY2UKCk9uIDQvMzAvMjAyNSAyOjE5IEFNLCBFZGdhciBC
b25ldCB2aWEgYnVpbGRyb290IHdyb3RlOgo+IEhlbGxvIQo+Cj4gT24gMjAyNS0wNC0yMiwgQXJu
b3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4+IEJ1aWxkcm9vdCAyMDI1LjAyLjEgaXMgcmVsZWFz
ZWQgWy4uLl0KPiBUaGVyZSBpcyBzb21ldGhpbmcgd2VpcmQuIFRoZSBCdWlsZHJvb3QgZG93bmxv
YWQgcGFnZVsxXSBzdGlsbCBsaXN0cwo+IDIwMjUuMiBhcyB0aGUg4oCcbGF0ZXN0IHN0YWJsZSAv
IGxvbmcgdGVybSBzdXBwb3J0IHJlbGVhc2XigJ0uCj4KPiBSZWdhcmRzLAo+Cj4gRWRnYXIuCj4K
PiBbMV0gaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2FkLmh0bWwKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
