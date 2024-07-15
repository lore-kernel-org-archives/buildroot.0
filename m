Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A449C3DA4B
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14EA540650;
	Mon, 15 Jul 2024 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AzlfdS7Vqvb; Mon, 15 Jul 2024 14:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEAD64074E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEAD64074E;
	Mon, 15 Jul 2024 14:26:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9481BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69B1580FA4
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l2hYtUmXxJLd for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:26:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8E47E80F8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E47E80F8E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E47E80F8E
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:26:42 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4267345e746so29356905e9.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721053600; x=1721658400;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=v38kKC7P1VBnZJaSyb215Ly0iMhV21NsKDO/OU3FzsM=;
 b=BuWsFoeh4wqa6zZeo3TZKcSXUJKGMlFqjZJWox8bt0TGhmWBEov/grZOsLwF3j89jX
 VukJ+EWyj+t1cF0ieVMswwrlPQp+YKcNhu+24ALKyLYwj6AkyDEg7eXiqEov7WxGnZcJ
 XZtI96tXhHCIwgz2ISvHIksB8rS7CwAcFC4XRFXraQI/oXw7zf9z28kOSozg7D1l9Bm+
 aOO9CNQqIkI0/V7HQ0V+5NDjjcsVISibdkHwzGNzkzSg0AUNc0WNXARD3wpZw2YUgHd7
 4YB7inQh8XBSxuWwuko+Lu/tz1OMKM0vOGpsh0iZtRIagZdZYPFxn+ZjAbopi2qv0hqJ
 jV7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD04noYrd4l6Q37P4Y9fOJS38XL/U8TT45slg6sNRAz85dFbBS7LGj4DWSJb8qKwTgo0396OpOKhjSlbWRMHGzYYx5aEkw9w==
X-Gm-Message-State: AOJu0Yy+HHrrz+LvQ9plngVKePvSGArbw6gJNXU3weLmCbaJ+pK3hmut
 zCRPxbnLV/GaGlXMOkw7D9++LFppRz7cvasL/LsqqYFR/xnGx1T2s0liBQ9xtKZnrdoXsQx8Kax
 MusU=
X-Google-Smtp-Source: AGHT+IGX/FANz8UKnpMyd6NZeI0tfDIfflWWS7DVC2la/DZxDEaqUmpCuk4yqeNARFL41Skcb0S2cg==
X-Received: by 2002:a05:600c:2d48:b0:426:5dd0:a1e4 with SMTP id
 5b1f17b1804b1-426707cf79bmr141152355e9.8.1721053600518; 
 Mon, 15 Jul 2024 07:26:40 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2cc42esm124309315e9.32.2024.07.15.07.26.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:26:40 -0700 (PDT)
Message-ID: <a11f3074-ad8d-4c2b-ac9a-50e99b92dba5@mind.be>
Date: Mon, 15 Jul 2024 16:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>,
 buildroot@buildroot.org
References: <20240715141756.522303-1-vincent.stehle@arm.com>
Content-Language: en-GB
In-Reply-To: <20240715141756.522303-1-vincent.stehle@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721053600; x=1721658400; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=v38kKC7P1VBnZJaSyb215Ly0iMhV21NsKDO/OU3FzsM=;
 b=QHTcnktcP1yktuKH7WG8wez5F2xzu8hj28boaLXTEVswA2couhI8WHC1OjIF1FyVSX
 W0+ziyN9F01sa4EG7EKQoBCfBRxGeCfrtq7P7SWggiUYSDy/Un8cpN4lAvljRYAKJwU2
 VJXOk8Bg5tn/tC0DcH6tSoitynX00Vp1EbKGowtczQL0JrKmbwgVRNDMDZw+r8QMODjs
 o7YAOF1ZqVk3W7IZSaAfCnBNKkd8ZnZ8jXXrZkU+gW2/47UvUhorDDLfEJNlyDFeFHGX
 58gOJP51NEhJOTWVJg5EfFbqJwQ1I/D/Vbv6UpjkD2ZaZR5KVeqcIIjw66xcQ6Q+S/cF
 TAkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QHTcnktc
Subject: Re: [Buildroot] [PATCH] Makefile: fix make help
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Steve Hay <me@stevenhay.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8wNy8yMDI0IDE2OjE3LCBWaW5jZW50IFN0ZWhsw6kgd3JvdGU6Cj4gQWRkIG1pc3Np
bmcgJyB0byBmaXggYG1ha2UgaGVscCcuCj4gCj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGVy
cm9yOgo+IAo+ICAgIC9iaW4vYmFzaDogLWM6IGxpbmUgMTogdW5leHBlY3RlZCBFT0Ygd2hpbGUg
bG9va2luZyBmb3IgbWF0Y2hpbmcgYCcnCj4gICAgbWFrZTogKioqIFtNYWtlZmlsZToxMTgwOiBo
ZWxwXSBFcnJvciAyCj4gCj4gRml4ZXM6IGNhNmM4OTZiZGQ3NWNmMzM0YWM5YTAyYTZkZDc4NjQx
NTIyMWY1NWUKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxl
QGFybS5jb20+Cj4gQ2M6IFN0ZXZlIEhheSA8bWVAc3RldmVuaGF5LmNvbT4KCiAgSXQgd2FzIGVu
dGlyZWx5IG15IGZhdWx0LCBub3QgU3RldmUncy4gSSdtIHN1cmUgSSB0ZXN0ZWQgJ21ha2UgaGVs
cCcgYWZ0ZXIgCm1ha2luZyBteSBjaGFuZ2VzIHRob3VnaC4gSSBwcm9iYWJseSBtYWRlIGV2ZW4g
bW9yZSBjaGFuZ2VzIGxhdGVyLi4uCgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJl
Z2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+ICAgTWFrZWZpbGUgfCAyICstCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvTWFr
ZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IGZhYWYwZjE2NWMuLjA0MzJhMDE0YWIgMTAwNjQ0Cj4g
LS0tIGEvTWFrZWZpbGUKPiArKysgYi9NYWtlZmlsZQo+IEBAIC0xMTc3LDcgKzExNzcsNyBAQCBo
ZWxwOgo+ICAgCUBlY2hvICcgIDxwa2c+LWdyYXBoLXJkZXBlbmRzICAgLSBHZW5lcmF0ZSBhIGdy
YXBoIG9mIDxwa2c+J1wnJ3MgcmV2ZXJzZSBkZXBlbmRlbmNpZXMnCj4gICAJQGVjaG8gJyAgPHBr
Zz4tZ3JhcGgtYm90aC1kZXBlbmRzJwo+ICAgCUBlY2hvICcgICAgICAgICAgICAgICAgICAgICAg
ICAgLSBHZW5lcmF0ZSBhIGdyYXBoIG9mIGJvdGggPHBrZz4nXCcncyBmb3J3YXJkIGFuZCcKPiAt
CUBlY2hvICcgICAgICAgICAgICAgICAgICAgICAgICAgICByZXZlcnNlIGRlcGVuZGVuY2llcy4K
PiArCUBlY2hvICcgICAgICAgICAgICAgICAgICAgICAgICAgICByZXZlcnNlIGRlcGVuZGVuY2ll
cy4nCj4gICAJQGVjaG8gJyAgPHBrZz4tZGlyY2xlYW4gICAgICAgICAtIFJlbW92ZSA8cGtnPiBi
dWlsZCBkaXJlY3RvcnknCj4gICAJQGVjaG8gJyAgPHBrZz4tcmVjb25maWd1cmUgICAgICAtIFJl
c3RhcnQgdGhlIGJ1aWxkIGZyb20gdGhlIGNvbmZpZ3VyZSBzdGVwJwo+ICAgCUBlY2hvICcgIDxw
a2c+LXJlYnVpbGQgICAgICAgICAgLSBSZXN0YXJ0IHRoZSBidWlsZCBmcm9tIHRoZSBidWlsZCBz
dGVwJwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
