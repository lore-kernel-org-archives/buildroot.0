Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A9EE77170
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 16:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B6AE607E2;
	Wed,  4 Dec 2024 16:08:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FTYodHsU0nel; Wed,  4 Dec 2024 16:08:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C5176085B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C5176085B;
	Wed,  4 Dec 2024 16:08:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EEC81DD1
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FD0C40879
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 16:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3Fo5xYnzxs8 for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 16:08:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=raphael.pavlidis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E70F940951
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E70F940951
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E70F940951
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 16:08:40 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e96a285eso2381335f8f.3
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 08:08:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733328519; x=1733933319;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0B3FoHrfP8PnvpyfOC/GDPYpwuZv4CjT7J5EgLQbkI8=;
 b=qFaZLbp/alulgPlNvkOKuJqnoG9MTr3VnQo5unA2LC/ji9WavIpjZu7ZBuN1ysibwR
 k5To+2HJpUfsdmE1FGOpf1t5G9dfI8am5VDNxToCoQyTqV6t7iTmYRXpp5C8HyUi7yXo
 hMR/HO1fOaelBsMIrz6L3KFK9Uv9VgJD4c++KrRvPvU1BVfdrBsnCTpE9ARiVgyT3252
 eiFKU+U6qRzy9oW8zECsuZ8e3cp24HBXI46O86T59a0DkVDqzVV1jA5SN//qQI/JB7CL
 5+ii8bOHpoPsqqkvYcv2Wf6o5/QqVKsd7pdKbhzKVq93XnodA4ZU2THKlVHR1t8ejyQR
 VqYQ==
X-Gm-Message-State: AOJu0Yxs4b9UBOBjzV+Mbsq+xxFphuyUBUTX4KbNJy0vl5oZav+nGevv
 5gS5w3GqxzxkCAf7ryIW0JigpSzTkuzS4UbynRrm3mz4l2bolPRI
X-Gm-Gg: ASbGncvpifsTTpmpb4Wu27zICnOnSs2SW3cZCOcjH65981d8rvgR8EcKTVD3hag0Fsj
 ASVtN/Rx9R4IgZcXc9e5EHqNzCs3UBb48j+U//VhUsG25DtPgOWsJrOMFC3BDxsrKAHMelBgxXx
 01NUr2gAe3kGb3/kydtV5C71Qkr0GapsckB5X1dAe8ZWb18MZ6IkR24muqY4tdD8lau9SwOlqAZ
 mk2WSREdUxDvzS03+0PbRS11EDF4oRJg6XocsR8uza4CD1p/+1Slj5ZVMYKbAEukmOxGgso
X-Google-Smtp-Source: AGHT+IGxfhnTNBvuFYDTr5PaQ5rZwwUrGiF7PSGbd5XTRgMgCyyDDGawWlFqTdQeOtzKV4Om9cA+gQ==
X-Received: by 2002:a05:6000:1f86:b0:385:f060:b7fc with SMTP id
 ffacd0b85a97d-38607acfd6fmr4685197f8f.25.1733328518579; 
 Wed, 04 Dec 2024 08:08:38 -0800 (PST)
Received: from ?IPV6:2a02:8070:2483:7e00::f0b8? ([2a02:8070:2483:7e00::f0b8])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ea17f78esm11640577f8f.64.2024.12.04.08.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 08:08:38 -0800 (PST)
Message-ID: <6e175966-6d5b-42b5-ae9c-fefd8db55388@gmail.com>
Date: Wed, 4 Dec 2024 17:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241124114907.16924-1-raphael.pavlidis@gmail.com>
 <26e34f1dceb2496f7f6f17248c258154@free.fr>
Content-Language: en-US
From: Raphael Pavlidis <raphael.pavlidis@gmail.com>
In-Reply-To: <26e34f1dceb2496f7f6f17248c258154@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733328519; x=1733933319; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0B3FoHrfP8PnvpyfOC/GDPYpwuZv4CjT7J5EgLQbkI8=;
 b=W14h4z3tpBwImt3wVgTIQQm2S45dOyJESaagAgfyYaUBXXbiIuKY05ngUJqnvVntHo
 Sm4STy8IaIpmD3cJn7AQZ4Vq4QBxyhM7C2VRgtDsDKCx8P/QrN2EeB7yUMewHWGqmRe5
 d0Fdq/GPvHWcvs2Pm6TWyLKwGrlWMhfmuzIk65LR2qEYgYzwJIghcJLu3rl0D1BUqD2f
 /z0or6/QuYIr8Rx25E8nmN8OATWunAZjpqdPUNoH6PFht8vrnFKw1pBODU6NvfndlmhV
 qoYR8CFjORcNYXpsfneoYmycWKMYy01cJEHvoRVCbMA3MYv1fYpNSxNJkFetGs6/IZ5N
 tlkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W14h4z3t
Subject: Re: [Buildroot] [PATCH 0/4] package/sway: bump to version 1.10
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

SGkgSnVsaWVuLAoKT24gMTIvMS8yNCAxODo1MSwgSnVsaWVuIE9saXZhaW4gd3JvdGU6CltTTklQ
XQo+IEkgYXBwbGllZCB0aGlzIHNlcmllcyB0byB0aGUgYnJhbmNoICJuZXh0Ii4gV2hpbGUgZG9p
bmcgbXkgcmV2aWV3LCBJIGRpZAo+IGZldyByZXdvcmtzIChtaW5vciBmaXh1cHMsIGFuZCBhZGRp
bmcgaW5mbyBpbiBjb21taXQgbG9ncykuIFNlZToKClRoYW5rcyBmb3IgdGhlIGZpeHVwcy4gSSBu
ZXh0IHRpbWUgSSB3aWxsIGJlIG1vcmUgY2FyZWZ1bGx5LgoKW1NOSVBdCj4+IFJhcGhhZWwgUGF2
bGlkaXMgKDQpOgo+PiDCoCBwYWNrYWdlL2xpYnhrYmNvbW1vbjogYnVtcCB2ZXJzaW9uIHRvIDEu
Ny4wCj4+IMKgIHBhY2thZ2Uvd2xyb290czogYnVtcCB0byB2ZXJzaW9uIDAuMTguMQo+PiDCoCBw
YWNrYWdlL2NhZ2U6IGJ1bXAgdG8gdmVyc2lvbiAwLjIuMAo+PiDCoCBwYWNrYWdlL3N3YXk6IGJ1
bXAgdG8gdmVyc2lvbiAxLjEwCj4+CltTTklQXQoKVGhhbmtzLApSYXBoYWVsIFBhdmxpZGlzCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
