Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC1CC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 15:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30B92411ED;
	Fri, 12 Jul 2024 15:40:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jnJGELL2UpZD; Fri, 12 Jul 2024 15:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF74B41203
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF74B41203;
	Fri, 12 Jul 2024 15:40:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 903B81BF5D7
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7BFC94197A
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 15:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xryijB3wEPTg for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 15:40:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E970A40331
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E970A40331
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E970A40331
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 15:40:01 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-42662d80138so13465265e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 08:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720798800; x=1721403600;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=adMinlcomalXWIC7AIkQe8qPvObWYnWFF1ufmBPZZ6s=;
 b=o6Mfz641VZaeARw5nS7xZINZvXFaCGywzikydoQm6M8t3Wm70q6U1EKEMBhU2IIVaq
 FhZQp4PCZcDCp4uw2cqgwlW7L0RBVYt5/8M2BiAEcoPdLLbcuzna3Z0FhSMUrfEJkyHr
 BntH+xkIowLRI/TY1AdnJGPa0btrNi6vn81PVfkY6XNCmaGsC/VqNi6O5PdM2f3UzTPk
 Pb9QK7XBqdeyiNOdtTWoHFQk20HdZkuai08irOSW6zQtLlvZhhvmZxDQewN81zvguh8y
 MUt4BqgjdCIqJtnnrcUYnlcM4mS9W0sgICkIuBQstjgdj4TbrZsf0ZFyfzeM1cAP5biU
 DK0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMCsd9Bx4rCIWMEILMJpWz6FtzZgoY3FZFWIv/pqpxwN2DmABuadLZVVbD+rH8qKFbwgOFt7wOE+H7r0Je8BZmHM1s6HPDGA==
X-Gm-Message-State: AOJu0YyzeNCVOdOmeOtddmlO77e0eQWfPj2XVhBdGTuZHk2YEYbFFwy0
 GvYtb3hIFsRqvmWzsQswUQVnCZ26r04owVhhjkLMRHn5tVLlKf2Qgq9HS8s9cPI=
X-Google-Smtp-Source: AGHT+IGWRiTLwKOH9CS41vqFVUAEu4nA/3hpWuNF1O1uTyRa4L2PCdMGpatLY+EpRKpq4F4FX75dXw==
X-Received: by 2002:a05:600c:5112:b0:426:8884:3781 with SMTP id
 5b1f17b1804b1-4268884382dmr70662375e9.24.1720798799837; 
 Fri, 12 Jul 2024 08:39:59 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f24901csm27536215e9.9.2024.07.12.08.39.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 08:39:59 -0700 (PDT)
Message-ID: <dcf6d299-4876-4196-be84-6f996861f3f3@smile.fr>
Date: Fri, 12 Jul 2024 17:39:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Bryan Brattlof <bb@ti.com>
References: <20240607093712.2880785-1-yann.morin.1998@free.fr>
 <20240607172617.s42p343dw4ijgck4@bryanbrattlof.com>
 <ZmNNKV_vaTkG0JpW@landeda>
 <20240607190634.salcy2c3jnpjzs57@bryanbrattlof.com>
 <ZmNdLpmIeiA83M9B@landeda>
 <20240607203427.feo5giguhthammt2@bryanbrattlof.com>
 <ZmNyrBsiNN-QGXdA@landeda>
Content-Language: fr, en-US
In-Reply-To: <ZmNyrBsiNN-QGXdA@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720798800; x=1721403600; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=adMinlcomalXWIC7AIkQe8qPvObWYnWFF1ufmBPZZ6s=;
 b=fEjVPBypadUvvAcHoIVmz41YOOzBxgvqw0Xi/X6mJ9tHy6SdRBoFMZeIslQsMVevlb
 xDPWw4u05xT2ZrD/2cA67gFxq7PgeuwNZxCxm/k0cdnvfEnarc59wfuP53SfQmKbCKcS
 5ZKPTi3oh8tbTogqzRcckqMR94VXmGtXzPjwU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=fEjVPByp
Subject: Re: [Buildroot] [PATCH] boot/ti-k3-r5-loader: share download files
 with uboot
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Xuanhao Shi <X15000177@gmail.com>, Paresh Bhagat <p-bhagat@ti.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDcvMDYvMjAyNCDDoCAyMjo1MCwgWWFubiBFLiBNT1JJTiBh
IMOpY3JpdMKgOgo+IEJyeWFuLCBBbGwsCj4gCj4gT24gMjAyNC0wNi0wNyAxNTozNCAtMDUwMCwg
QnJ5YW4gQnJhdHRsb2YgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4+IE9uIEp1bmUgIDcs
IDIwMjQgdGh1cyBzYXlldGggWWFubiBFLiBNT1JJTjoKPiBbLS1TTklQLS1dCj4+PiBPaCwgc28g
d291bGQgaXQgbWFrZSBzZW5zZSB0byBjb21wbGV0ZWx5IGRyb3AgdGhhdCBiaWcgY2hvaWNlLCBh
bmQganVzdAo+Pj4gYWx3YXlzIHVzZSB0aGUgc2FtZSB2ZXJzaW9uIGFzIHVib290LCBhbHdheXM/
Cj4gWy0tU05JUC0tXQo+PiBUaGVyZSBpcyB0aGUgZmFsY29uIG1vZGUgb3B0aW9uIGJ1dCBJIGhh
dmVuJ3QgdHlwZWQgb3V0IHRoZSBzdXBwb3J0IGZvciAKPj4gYW55IEszIFNvQ3MgeWV0IChvbiBt
eSB0by1kbyBzb29uIGxpc3QpIGFuZCBJIGhhdmVuJ3Qgc2VlbiBhbnlvbmUgdXNlIGEgCj4+IHNl
cGFyYXRlIGZpdGltYWdlIG1hZGUgb3V0c2lkZSBvZiBVLUJvb3QgZm9yIGZhbGNvbiBtb2RlLiBC
dXQgdGhhdCAKPj4gZG9lc24ndCBlbGltaW5hdGUgdGhlIHBvc3NpYmlsaXR5IG9mIGEgZnV0dXJl
IHBhY2thZ2UgYmVpbmcgaW50cm9kdWNlZCAKPj4gdG8gZG8gdGhhdC4KPiAKPiBUaGFua3MgZm9y
IHRoZSBpbnRlcmVzdGluZyBmZWVkYmFjay4g8J+RjQo+IAo+PiBJZiB5b3UncmUgT0sgd2l0aCBp
dCwgSSB3b3VsZCBwcm9iYWJseSBtYWtlIHRpLWszLXI1LWxvYWRlci8gZGVwZW5kIG9uIAo+PiB1
Ym9vdC8gYW5kIHRpZSB0aGUgdmVyc2lvbnMgdG9nZXRoZXIgdW50aWwgdGhhdCBteXRoaWNhbCBm
YWxjb24gbW9kZSAKPj4gcGFja2FnZSBhcnJpdmVzLgo+IAo+IFllcywgcGxlYXNlLiBCZXdhcmUg
dGhhdCB5b3UnbGwgbmVlZCB0byBiZSBjYXJlZnVsIG9uIHdoYXQgdmFyaWFibGVzIHlvdQo+IGV2
YWx1YXRlIGFuZCB3aGVuOgo+IAo+ICAgLSBzb21lIHZhcmlhYmxlcyBhcmUgdXNlZCB0byBkZWZp
bmUgbWFrZSBkZXBlbmRlbmNpZXM7IGUuZy4gX1ZFUlNJT047Cj4gCj4gICAtIHVib290IHNvcnRz
IGFmdGVyIHRpLWszLXI1LWxvYWRlciwgc28geW91IGNhbid0IHJlbHkgb24gdmFyaWFibGVzCj4g
ICAgIHRoYXQgYXJlIF9jb21wdXRlZF8gaW4gdWJvb3QubWssIGJ1dCBvbmx5IG9uIHRob3NlIHRo
YXQgY29tZSBmcm9tCj4gICAgIEtjb25maWc7Cj4gCj4gICAtIHZhcmlhYmxlcyB0aGF0IGFyZSBl
dmFsdWF0ZWQgaW4gX0NNRCBibG9ja3MgY2FuIGJlIGFueXRoaW5nLCBiZWNhdXNlCj4gICAgIHRo
b3NlIGFyZSBldmFsdWF0ZWQgJ2xhdGUnLgo+IAo+IEkgd291bGQgZGlyZWN0IHlvdSB0byB0aGUg
ZG9jIGFib3V0IHRoYXQsIGlmIHRoZXJlIHdhcyBvbmUuLi4gOi0oCj4gSSB0aGluayBfVkVSU0lP
TiBpcyB0aGUgb25seSB0aGF0IHJlYWxseSBtYXR0ZXJzLCB0aG91Z2gsIGJ1dCBsb29rIGF0Cj4g
aG93IGl0J3MgZG9uZSBmb3IgbGludXgtaGVhZGVycyB2cyBsaW51eCwgdGhpcyBpcyB0aGUga2lu
ZCBvZiB1Z2xpbmVzcwo+IHdpbGwgbmVlZCBoZXJlIHRvby4KCkFzIGlzLCB0aGlzIHBhdGNoIGlz
IGZpbmUuCgpJbmRlZWQsIGluIHByYWN0aWNlIHRoZSBtZXRhLXRpIHlvY3RvIGxheWVyIHVzZSB0
aGUgc2FtZSB1LWJvb3QgdmVyc2lvbiBmb3IgcjUKY29yZSBhbmQgdGhlIEE3MiBjb3JlLgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBSZWdh
cmRzLAo+IFlhbm4gRS4gTU9SSU4uCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
