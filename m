Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B05BC25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 04:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A019640724;
	Wed, 22 May 2024 04:37:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tck7rTyAnCho; Wed, 22 May 2024 04:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C31140725
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C31140725;
	Wed, 22 May 2024 04:37:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D84A41C5761
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 04:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C486040725
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 04:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbw1ynev1rqZ for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 04:37:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=jan.kraval@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D80840724
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D80840724
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D80840724
 for <buildroot@buildroot.org>; Wed, 22 May 2024 04:37:33 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e45c0a8360so50319881fa.3
 for <buildroot@buildroot.org>; Tue, 21 May 2024 21:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716352652; x=1716957452;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GqKJ/56vdl/JOx1SZWfu4+4W7ejjb2W1ZhjDpokivkg=;
 b=PWFSSmvkPsFv+RvyETz/NyqORhxHAIlPMoZVAvVb2OO1w1Vbdx6GOOj/Y4PEEUDMUi
 E9ZtLaxZN8sRt0oQt/oYNth+fBD5JfzvafIuPL6xCJjVBTILYZ9qoQ4F4HcpiHrlBYOX
 3BbwnYqaVH4MLUOyWRhnuHtUNqKd/7Z/MXEvBci4aGNartmJq/eFH8m76wGS0IS1LGlU
 QXIOTGjT0SyJVYruOf4VwOz2fsGgtCtyM7njxiQXPRskee31A+2OW9wY9wt6JOMA9GPn
 W1KtZdSrzC3mt+yOtwFtil/xJn7r4FbXz0279uNKFralvd7uWD/quViKJiYD7D/YTshh
 BYJQ==
X-Gm-Message-State: AOJu0Ywi64Ou0mkX5R/XE5h9TqoCVVYlI89PNwZMgelIzHhGySr4KDjj
 so8GSgHpurfxRAwRrN4YKTbuWCtCRIROak6QzlJ+ST5fI4tM1Op0
X-Google-Smtp-Source: AGHT+IFJQ37E0LU3ewuAgRMYKjKN+wK5Z9gQuSu2WFhoxT4k53KHtVThE7LwB84CFeeeib6Nw4BhQQ==
X-Received: by 2002:a2e:8297:0:b0:2df:97b1:e21c with SMTP id
 38308e7fff4ca-2e94949e1ccmr3508671fa.31.1716352651309; 
 Tue, 21 May 2024 21:37:31 -0700 (PDT)
Received: from [192.168.2.213] (ip-89-102-235-73.bb.vodafone.cz.
 [89.102.235.73]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-420111f2decsm401069215e9.22.2024.05.21.21.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 21:37:30 -0700 (PDT)
Message-ID: <12ae846b-1fc5-49ca-a996-485eb8283405@gmail.com>
Date: Wed, 22 May 2024 06:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240220051926.68559-1-jan.kraval@gmail.com>
 <20240513233014.3b09e56e@windsurf>
Content-Language: sv-FI
From: Jan Kraval <jan.kraval@gmail.com>
In-Reply-To: <20240513233014.3b09e56e@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716352652; x=1716957452; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GqKJ/56vdl/JOx1SZWfu4+4W7ejjb2W1ZhjDpokivkg=;
 b=JIX5Gap2i184p2BRhY+cIJU+ofpFrxpDhQU/Rq2Z2+3nt1EUz2yV01tzSD932FEABA
 q/sIrZD/7wucDvxeuhgZ4ATeE8lVHWjhT+SMUwuJuvOcjINw9GwiZRoiqUXoR85yTIRk
 tbiqSnES+OBer78EWF23V6vLLMzJxarPFzIKbKp1t+C6a+caWzwMXne+TOqum8YfnBcM
 BnfZJ3Vyws9kzA5775tG0MRhLoqx9kAtb6KQRXjxDYXKGLmgxS89xatv5udXmxTw8Oi+
 OG8gwlIoTV4kim65k66Nvmuf0GzS0dWUR1OHHCVv3kWvpcD43Dw4JGpJf7lxvrDlNPWw
 2Cmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JIX5Gap2
Subject: Re: [Buildroot] [PATCH 1/2] board/orangepi/orangepi-lite: switch to
 extlinux
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTMuIDA1LiAyNCAyMzozMCwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiBPbiBUdWUsIDIw
IEZlYiAyMDI0IDA2OjE5OjI1ICswMTAwCj4gSmFuIEtyYXZhbCA8amFuLmtyYXZhbEBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4+IFN3aXRjaCB0byBleHRsaW51eCBpbnN0ZWFkIG9mIFUtQm9vdCBib290
IHNjcmlwdC4gRHJvcCBjdXN0b20KPj4gYm9vdCBzY3JpcHQgYW5kIGdlbmltYWdlIGNvbmZpZy4g
SW5zdGVhZCB1c2UgY29tbW9uIG9yYW5nZXBpCj4+IGZpbGVzIGZyb20gYm9hcmQvb3JhbmdlcGkv
Y29tbW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gS3JhdmFsIDxqYW4ua3JhdmFsQGdtYWls
LmNvbT4KPiBUaGFua3MgZm9yIHRoaXMgcGF0Y2gsIGl0IGxvb2tzIGdvb2QsIGV4Y2VwdCBmb3Ig
b25lIHF1ZXN0aW9uLCBiZWxvdy4KPgo+PiBAQCAtMjUsMTUgKzI5LDcgQEAgQlIyX1RBUkdFVF9V
Qk9PVF9DVVNUT01fVkVSU0lPTj15Cj4+ICAgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lP
Tl9WQUxVRT0iMjAyMS4xMCIKPj4gICBCUjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0i
b3JhbmdlcGlfbGl0ZSIKPj4gICBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQz15Cj4+IC1CUjJf
VEFSR0VUX1VCT09UX05FRURTX1BZVEhPTjM9eQo+IFdoeSBpcyB0aGlzIG9wdGlvbiBiZWluZyBk
cm9wcGVkPyBJIGRvbid0IHNlZSBob3cgdGhlIG1vdmUgdG8gZXh0bGludXgKPiBoYXMgYW55dGhp
bmcgdG8gZG8gd2l0aCB0aGlzLiBGb3IgYSBnaXZlbiB2ZXJzaW9uL2NvbmZpZ3VyYXRpb24gb2YK
PiBVLUJvb3QgKHdoaWNoIGFyZSBub3QgY2hhbmdlZCBpbiB0aGlzIGNvbW1pdCksIHdoZXRoZXIg
aG9zdC1weXRob24zIGlzCj4gbmVlZGVkIG9yIG5vdCBzaG91bGQgbm90IGNoYW5nZS4KPgo+IENv
dWxkIHlvdSBjbGFyaWZ5PwoKSGkgVGhvbWFzLAoKQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWVRI
T04zPXnCoHdhcyByZW1vdmVkIGJ5IG1ha2Ugc2F2ZWRlZmNvbmZpZy4gQWN0dWFsCnZhbHVlIGRp
ZCBub3QgY2hhbmdlLCBpdCBpcyBlbmFibGVkIGF1dG9tYXRpY2FsbHkgYnl8QlIyX1RBUkdFVF9V
Qk9PVF9ORUVEU19QWUxJQkZEVCwgd2hpY2ggcmVtYWluZWQgdW5jaGFuZ2VkIGluIHRoZSAKZGVm
Y29uZmlnLiBJZiB0aGVyZSBpcyBzb21lIHJlYXNvbiB0byBrZWVwIHRoZSBsaW5lIGluIHRoZSBk
ZWZjb25maWcsIApwbGVhc2UgbGV0IG1lIGtub3csIEknbGwgc2VuZCBwYXRjaCB2MiBSZWdhcmRz
LCBKYW4gfAoKPiBNYWtlIHN1cmUgdG8gdGVzdCB5b3VyIGNvbmZpZ3VyYXRpb24gd2l0aCAuL3V0
aWxzL2RvY2tlci1ydW4sIHRvIHZlcmlmeQo+IHRoYXQgeW91IGFyZSBub3QgZGVwZW5kZW50IG9u
IHN5c3RlbS1wcm92aWRlZCBwYWNrYWdlcy4KPgo+IFRoYW5rcyEKPgo+IFRob21hcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
