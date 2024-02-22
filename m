Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE246C47DD9
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 22:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 649B6414D8;
	Thu, 22 Feb 2024 22:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGXD2MXMSUUt; Thu, 22 Feb 2024 22:09:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 600F84152A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 600F84152A;
	Thu, 22 Feb 2024 22:09:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E9AB1BF379
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 22:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6ACB0402F3
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 22:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQpfJC9r6RRE for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 22:09:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C693A40118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C693A40118
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C693A40118
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 22:09:54 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3394b892691so162838f8f.1
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 14:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708639793; x=1709244593;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OIg8IXD+NejEKj8vM1+SWFtIs7x2wwMGDC9pMSZf80c=;
 b=RpUejeL0mgLbVXp2vWhLpub5SY3RXQtPchstqo+8wLOLekcOJ9zSqm7KpLva+zmecM
 8bH6dXkJkLUaxIJy/0vF7FOb+Rc+g11tEYG/8aOjuq5+ab6Y1jP0TK/78xYvv6iAzxx1
 Y+Sw36SOhA9c5Y3r6Eedqv9HWv2QRFRfA2wrNTrR/yxEj8F5ZPEUTqSE5kuXyiYSxicP
 pdEoR/90ljzDZqF9WpAJYjwT0fwnXb34S9wZAAm6kwpdqdOXnEZuZCHqYTy1OFoq9/MW
 gVXGP3XAswzaA0KgbkEYDp2xGnqmu4ZqsNO43hoxt3JmdISWeUBfkJbqS3BFEftOAubH
 5ivA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0M68IvQ5oGKhmIfhWywOnuafqsQLZMnOgzZ3Jd60A05iMpRHGPIUnZWHm9N+v/QCkaTKkxpsQqDHgnqilqCtMW099jVVfoQ==
X-Gm-Message-State: AOJu0Yy8ZBuV7L5k96jOxkYDhIDLJAM6LAbyOAjyGslFcz5Yye32uCJ9
 SXqqKrhTkA3s3QOZ9SxaU15Qz+1nni+PFU5HDTON/lLk5X2ecOYcE14o0HxOUPg=
X-Google-Smtp-Source: AGHT+IGip1Gx3OWAgMEDfqOxWZ99LEYp4xcnwyFN4SQpP+aQpNVVdUpaGQp0376AJBBJhcUdak5VEQ==
X-Received: by 2002:a05:6000:1569:b0:33d:39db:a0f8 with SMTP id
 9-20020a056000156900b0033d39dba0f8mr370341wrz.7.1708639792744; 
 Thu, 22 Feb 2024 14:09:52 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a056000014900b0033d2ae84fafsm339542wrx.52.2024.02.22.14.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 14:09:52 -0800 (PST)
Message-ID: <aedf0c99-4532-4b83-a693-d49c6fc245c9@smile.fr>
Date: Thu, 22 Feb 2024 23:09:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
 <20240222101617.18422-13-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240222101617.18422-13-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708639793; x=1709244593;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OIg8IXD+NejEKj8vM1+SWFtIs7x2wwMGDC9pMSZf80c=;
 b=TVmrxDhKC6UQvM1eItQkI8XBOKnYEyqomyR8upj7MmQvk8bv2DNCVIyzgXQ5/Ou31P
 zD3BcICeokjwGjinIgvkHzlYHjxEnoCkUsbKYeXy2B/ksOIZrH+48JKvMNxAu0xTzIbw
 O/3mx8C7pQJQG5zFERX8jY8YVzAnlQS/kpv3h1SvSqIGcyrXv+P+IgQjLDzN4bS10G3z
 obdQJbJvvoq8sMbzlN3t8EoMlaqE8I4r1cpXSgx88h/kCyi1ZmB6eRKyLADSCLscfgsP
 DkbIdqq3SVETcz6VA6ZJ4UK1Beupi85fhYwutWLJmsrzZ2k1QHEU+MN8A3PdLrJkEAaq
 P3dQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=TVmrxDhK
Subject: Re: [Buildroot] [PATCH v5 12/16] boot/uboot: set BINMAN_INDIRS for
 TI K3 DM
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
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAyMi8wMi8yMDI0IMOgIDExOjE2LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IEFzIGV4cGxhaW5lZCBpbiBbMV0sIGFkZGluZyBzdXBwb3J0IGZvciBBTTYyeCBM
UCBTSyBpbiBVLUJvb3QsIHJlcXVpcmVzCj4gYmlubWFuIGZvciBidWlsZGluZyBib290bG9hZGVy
IGltYWdlcy4gVGhlIEJJTk1BTl9JTkRJUlMgZW52aXJvbm1lbnQKPiB2YXJpYWJsZSBpcyB1c2Vk
IHRvIHByb3ZpZGUgYSBzcGFjZS1zZXBhcmF0ZWQgbGlzdCBvZiBkaXJlY3RvcmllcyB0bwo+IHNl
YXJjaCBmb3IgYmluYXJ5IGJsb2JzLgo+IAo+IEluIHRoaXMgd2F5LCB0aGUgcHJldmlvdXMgc2V0
dGluZyBiZWNvbWVzIHVubmVjZXNzYXJ5LCBzbyBsZXQncyByZW1vdmUKPiBpdC4KPiAKPiBbMV0g
aHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L3Vib290L3BhdGNoLzIwMjMxMDMw
MTEwMTM4LjEzNDc2MDMtMy1uLXlhZGF2QHRpLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBC
aW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4gCj4gLS0tCj4g
Cj4gQ2hhbmdlcyBpbiB2NToKPiAtIERyb3AgIkRNPSQoQklOQVJJRVNfRElSKS90aS1kbS8kKFVC
T09UX1RJX0szX0RNX1NPQ05BTUUpL2lwY19lY2hvX3Rlc3RiX21jdTFfMF9yZWxlYXNlX3N0cmlw
LnhlcjVmIgo+ICAgZnJvbSBVQk9PVF9NQUtFX09QVFMuCj4gCj4gbm8gY2hhbmdlcyBzaW5jZSB2
MToKPiAKPiAgYm9vdC91Ym9vdC91Ym9vdC5tayB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3Qv
dWJvb3QubWsgYi9ib290L3Vib290L3Vib290Lm1rCj4gaW5kZXggZGRhNjA2YTg4MDU5Li43MDk4
MmE4NzcxOWYgMTAwNjQ0Cj4gLS0tIGEvYm9vdC91Ym9vdC91Ym9vdC5tawo+ICsrKyBiL2Jvb3Qv
dWJvb3QvdWJvb3QubWsKPiBAQCAtMTg5LDcgKzE4OSw3IEBAIGVuZGlmCj4gIGlmZXEgKCQoQlIy
X1RBUkdFVF9VQk9PVF9ORUVEU19USV9LM19ETSkseSkKPiAgVUJPT1RfVElfSzNfRE1fU09DTkFN
RSA9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VUX1VCT09UX1RJX0szX0RNX1NPQ05BTUUpKQo+
ICBVQk9PVF9ERVBFTkRFTkNJRVMgKz0gdGktazMtYm9vdC1maXJtd2FyZQo+IC1VQk9PVF9NQUtF
X09QVFMgKz0gRE09JChCSU5BUklFU19ESVIpL3RpLWRtLyQoVUJPT1RfVElfSzNfRE1fU09DTkFN
RSkvaXBjX2VjaG9fdGVzdGJfbWN1MV8wX3JlbGVhc2Vfc3RyaXAueGVyNWYKPiArVUJPT1RfTUFL
RV9PUFRTICs9IEJJTk1BTl9JTkRJUlM9JChCSU5BUklFU19ESVIpCgpCaW5tYW4gdG9vbCBpcyBu
b3Qgc3BlY2lmaWMgdG8gVEkgSzMgcGxhdGZvcm0sIHNlZSBteSBwcmV2aW91cyBjb21tZW50IFsx
XQoKWzFdIGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjQt
RmVicnVhcnkvNjg1OTQ5Lmh0bWwKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAgZW5kaWYKPiAg
Cj4gIGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19PUEVOU0JJKSx5KQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
