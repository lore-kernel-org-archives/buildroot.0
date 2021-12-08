Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFA4C433FE
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 10:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0518A40202;
	Wed,  8 Dec 2021 10:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HvaQ7d3QwoVk; Wed,  8 Dec 2021 10:30:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E9FB40207;
	Wed,  8 Dec 2021 10:30:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C7D311BF362
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 10:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3F1D60F41
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 10:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6cMUApbefGyK for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 10:30:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D5E160F40
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 10:30:47 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id v1so6853057edx.2
 for <buildroot@buildroot.org>; Wed, 08 Dec 2021 02:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=AtYqqSL3Ai3lrITMgnwsUkA1xfsysIDqOhGznFJsQLg=;
 b=e7StLq7BMTqG5+dH3TDIv7W7K/XlWu3N+RO9pPlMkHeCdrSF0kqIRazhO4EuSJ0No0
 eTuG85+9R9zNyYjda2Bq4nQpS1/9Mz3jx540vX/j52L1GEQCPKNEYMHE+Xn8psB06fTx
 UH+QFewjoSjyiv2WybZevEZV6rgh6kB5FmN97vlbZLC1EnVz+xOQTzrgBsSnGnT/0HJB
 noWUH/mfol9muVH8ab7+U9DB2Qln2U7x83TBGbMDkFgHbX7GoF+igMf/J0KvQS4i/6Mh
 rJrxjy6p+L9eMEwyCBKaLwR+KIKmPLVPWAeYwJER5NHJy/On/gv4axw4dzbKORYedgv6
 jOAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=AtYqqSL3Ai3lrITMgnwsUkA1xfsysIDqOhGznFJsQLg=;
 b=TdWxElZoiY3PtvAFGS5oKfkfAaEE3MtHiJWAATF61uI11UmMQqR+/1o/2cvihjC6YK
 R8Zl/9tBh2Pa8oO5JgoXLoUdvd2+/isDPQErd8LhA+fPoyRF0c/6pi0kxLLIV/APIqs3
 k13bV1d3Uw4Vu6jX9qcOwtn63dYnBnSTfN56iIfd2RW+FCwVfbQLhK023hoJnWDEO/em
 YOnwS5dgnDD+2/IuAITsLVVswnbJQ7h5P3Q608y/lV/nwLYfz7zFY+yeMZhg8zgHZ9ei
 LQn/IZoKGGFFLUScgVJYvRCWJRqgHGXErrGxBzXP/h3+55py2/Kp/yXrgZa0amh2ohd8
 aUiA==
X-Gm-Message-State: AOAM533Q6sX1fGqJQIzq12xOhm43CxA9sbs/vD9tG6Z2+lVjyQmJIN9w
 sOiaLIk9DPPmqmIxPgZd5+KbQ7doevvYSQ==
X-Google-Smtp-Source: ABdhPJwvAtr/8bVx1FVFTPBO8rzmBGHieW/ha5eTKLtUStrRS5j9zGz+0Pph5F+AjDc7qWY6yggY9A==
X-Received: by 2002:a17:906:cd03:: with SMTP id
 oz3mr6551649ejb.252.1638959445095; 
 Wed, 08 Dec 2021 02:30:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id m25sm1750857edj.80.2021.12.08.02.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 02:30:44 -0800 (PST)
Message-ID: <48949c5e-6a37-13c5-bad9-cb555d344cf8@mind.be>
Date: Wed, 8 Dec 2021 11:30:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: =?UTF-8?Q?Jos=c3=a9_Pekkarinen?= <jose.pekkarinen@unikie.com>,
 buildroot <buildroot@buildroot.org>
References: <CAJPV9MqnSviULFaVRO6m00bF-bfysMQ_Z9qWQiwzx+E1u-iLqg@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <CAJPV9MqnSviULFaVRO6m00bF-bfysMQ_Z9qWQiwzx+E1u-iLqg@mail.gmail.com>
Subject: Re: [Buildroot] Arm opcodes support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8xMi8yMDIxIDEyOjI3LCBKb3PDqSBQZWtrYXJpbmVuIHdyb3RlOgo+IAo+ICAgICBI
aSwKPiAKPiAgICAgSSBoaXQgdGhlIGZvbGxvd2luZyBpc3N1ZSBtYWtpbmcgYQo+IAo+IHBhY2th
Z2UgZm9yIGF2b2NhZG8gZnJhbWV3b3JrLiBJIHdvbmRlcgo+IHdoYXQgb3RoZXIgcGFja2FnZXMg
ZG8gd2hlbiB0aGlzIGlzIGhpdC4KPiAKPiAuLi9zcmMvYXJtL3N5c3YuUzogQXNzZW1ibGVyIG1l
c3NhZ2VzOgo+IC4uL3NyYy9hcm0vc3lzdi5TOjEwNDogRXJyb3I6IHNlbGVjdGVkIHByb2Nlc3Nv
ciBkb2VzIG5vdCBzdXBwb3J0IEFSTSBvcGNvZGVzCgogIFRoaXMgbWVhbnMgdGhhdCB0aGUgcGFj
a2FnZSBkb2Vzbid0IHN1cHBvcnQgdGhlIHNwZWNpZmljIEFSTSBhcmNoaXRlY3R1cmUgeW91IAph
cmUgYnVpbGRpbmcgZm9yLiBJZiB5b3UncmUgbHVja3ksIHRoZXJlJ3Mgc29tZSBraW5kIG9mIGNv
bmZpZ3VyZSBvcHRpb24gdG8gCnNwZWNpZnkgdGhlIChzdWIpYXJjaGl0ZWN0dXJlIGFuZCB0aGUg
cGFja2FnZSBiZWhhdmVzIGNvcnJlY3RseSB3aXRoIHRoYXQuIElmIAp5b3UncmUgbm90IGx1Y2t5
LCB5b3UgbmVlZCB0byBwdXQgYXJjaGl0ZWN0dXJlIGV4Y2VwdGlvbnMgZm9yIHRoZSBwYWNrYWdl
LgoKICBJdCdzIHZlcnkgYW5ub3lpbmcgYmVjYXVzZSB3ZSBvZiBjb3Vyc2UgdGVzdCBvbmx5IGEg
dmVyeSBsaW1pdGVkIHN1YnNldCBvZiBhbGwgCnRoZSBwb3NzaWJsZSBzdWJhcmNoaXRlY3R1cmVz
LCBzbyBhbnl0aGluZyB0aGF0IGZhbGxzIG91dCBvZiB0ZXN0LXBrZyByYW5nZSBpcyAKbGlrZWx5
IHRvIGJlIHdyb25nLi4uCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+ICAgICBUaGFua3MhCj4g
Cj4gCj4gICAgIEpvc8OpIFBla2thcmluZW4uCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
