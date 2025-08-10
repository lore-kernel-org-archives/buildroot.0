Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80380C87FDA
	for <buildroot@archiver.kernel.org>; Sun, 10 Aug 2025 18:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 310C340505;
	Sun, 10 Aug 2025 18:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tiVMXXjhZYBN; Sun, 10 Aug 2025 18:01:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6578440506
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6578440506;
	Sun, 10 Aug 2025 18:01:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CD9431
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F302960F85
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnzTygTAK9xF for <buildroot@buildroot.org>;
 Sun, 10 Aug 2025 18:01:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DE0D160F83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE0D160F83
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE0D160F83
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 18:01:01 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-459ddf8acf1so30754575e9.0
 for <buildroot@buildroot.org>; Sun, 10 Aug 2025 11:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754848860; x=1755453660;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MoIyAo/XaCiTbrBo90rI/tPkQVMr4wN4gLKek/BAxzc=;
 b=vq57h6vPqDGG+EulJnT/O7LYDUuzs9WZrpmLBSaNRebHbHGQ0X+37KM5P7jSW0TryR
 CFqYBUX426bsGDGJ9vEYEJQ1TDJhTPeYADhJfvKSKtkuHzCuglxfulq5p+eF56V/PFzf
 T/GbB9CNxz98SREg5S+5X4KZJwKy4+e5Xl3DyimvodO3i2GtSPjfmEZd0eDs8mEMtpbt
 vSwA8iX9Gx4LCN1+lttDtp4JPj3dw+JvdfTT+phjoFMK+BtyFVezzKd/sP8llXTO5Jp4
 krtKfT4zP6YHUUDjTfqN4nUkIWTFsDfquo+Cdbx+UsXDWu+ObTXg0x3BILz3/GztnPNZ
 0rLQ==
X-Gm-Message-State: AOJu0YzkAfrD95W57SVBv4GFWg1/e48+Y7Tv3HmA2r8WM+RPKl6A8L0z
 5eG9kA5ZRqbMNCreOpxXMBD6FnXK6zbn3Xdw3aQXaSCKuIipvnOeRCAGK7IugWa7sgw=
X-Gm-Gg: ASbGncvqn4igL1BwUCUNwQyonBC6GVtYiVtTV9QpMOVMFyie324LWb93l5fHPVDE2GW
 zAGy3AVzK7WxRzB3eJEimMnpBjI1e50vbZq41MNG9eOmlCkZPyPVn5/p++Khg1jfuU9JzERH+WG
 RFGUkGRFUzFlmHtkXtS3jgUABbhTrretnG7vknr+dzUDQetKkEk7//E5NV4G9sECkw9tvqSnhmd
 mCiVfsb+Q4TcWuzw4hZD61J28I0lN0a2EynAxqN4BZnOzF0qCWyoUdz8tox7WAPi+CXcJETuHbE
 uCbFcGGxpgCc8KRjwCLS88zVa5cAYLCZicqJsBHrV3DPW6yoRkayNOF+8dexLRXgoCseuTJiaFS
 qvgrEsI9ovtz6wYugjJ1mLQ6Xlu9bnp6kMbcYlDKb3xf5spDsV+Zr9HNXisi1zH5AYkufurH0VA
 R1YG1l1sndoMfymCaYdRmBAAj0nNfFBnu4KRmT/shxOfzyGsyH6VPtxluUiJZh
X-Google-Smtp-Source: AGHT+IGtsf6k4+k4Vm/yhDpkCUefly4amvvOcBAsRdsy/XCC2XkvPhNvgMAX2OX2UdR4aM2rYbxsbQ==
X-Received: by 2002:a05:600c:1988:b0:456:214f:f78d with SMTP id
 5b1f17b1804b1-459f4f0f55bmr77691805e9.22.1754848859687; 
 Sun, 10 Aug 2025 11:00:59 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5887b7fsm220675625e9.30.2025.08.10.11.00.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Aug 2025 11:00:59 -0700 (PDT)
Message-ID: <3b344658-7e1d-43e9-89bf-c776ba0c39b6@smile.fr>
Date: Sun, 10 Aug 2025 20:00:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20250725184609.3794-1-fl@n621.de>
 <20250728225205.2c22044b@windsurf> <20250728212043.uxfacpm3fovokhcq@n621.de>
Content-Language: fr, en-US
In-Reply-To: <20250728212043.uxfacpm3fovokhcq@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754848860; x=1755453660; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MoIyAo/XaCiTbrBo90rI/tPkQVMr4wN4gLKek/BAxzc=;
 b=ehutxTi+L0ahCwl8UtSIDdMewqQe5CPcZ92I4GOd8BeP5gW3OlxPrPF/Iumh+AUSIx
 hIWqCvmJGgTPx169S367kY70LWhGyf2FMtvzfS55F1s+xFoQ1yhmB0zLJIN5NxP6zkvx
 cy1QuR7JcAyqZ13ovEJ0wuzHJW2yVzNFVUg58=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=ehutxTi+
Subject: Re: [Buildroot] [PATCH 1/1] package/libmbus: switch to git repo
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

SGVsbG8gRmxvcmlhbiwgVGhvbWFzLCBBbGwsCgpMZSAyOC8wNy8yMDI1IMOgIDIzOjIwLCBGbG9y
aWFuIExhcnlzY2ggYSDDqWNyaXTCoDoKPiBIZWxsbyBUaG9tYXMsCj4gCj4gdGhhbmsgeW91IGZv
ciB0YWtpbmcgYSBsb29rIGF0IHRoZSBwYXRjaCEKPiAKPiBPbiBNb24sIEp1bCAyOCwgMjAyNSBh
dCAxMDo1MjowNVBNICswMjAwLCBUaG9tYXMgUGV0YXp6b25pIHdyb3RlOgo+PiBIb3dldmVyLCBz
aG91bGRuJ3Qgd2UgYWxzbyB1cGRhdGUgdGhlIGxpbmsgaW4KPj4gcGFja2FnZS9saWJtYnVzL0Nv
bmZpZy5pbj8KPiAKPiBJJ20gbm90IHN1cmUuIFRoZSBsaWJtYnVzIHJlcG8gc3RpbGwgbGlua3Mg
dG8gdGhhdCBwYWdlIGFuZCB3aGVuIGl0IHdhcwo+IHdvcmtpbmcgZWFybGllciB0aGlzIHllYXIs
IGl0IHNlZW1lZCBtdWNoIG1vcmUgIm9mZmljaWFsIi91c2VmdWwKPiAoaW5jbHVkaW5nIGV4YW1w
bGVzIGFuZCByZW5kZXJlZCBkb2N1bWVudGF0aW9uKSB0aGFuIHdoYXQgZS5nLiB0aGUKPiBSRUFE
TUUgaW4gdGhlIHJlcG8gcHJvdmlkZXMuIEkgZG9uJ3Qga25vdyBob3cgbXVjaCBob3BlIHRoZXJl
IGlzIGZvciBpdAo+IHRvIGNvbWUgYmFjaywgYnV0IGlmIGl0IGRvZXMgaXQgd291bGQgYmUgdGhl
IGJldHRlciBwbGFjZSB0byBwb2ludAo+IHNvbWVib2R5IGF0LgoKV2VsbCwgYSB3b3JraW5nIGxp
bmsgaXMgYmV0dGVyIHRoYW4gYSBicm9rZW4gb25lLgpBY3R1YWxseSB0aGVyZSBpcyBhIG5ldyBy
ZWxlYXNlIDAuOS4wIGZyb20gMjAxOSBidXQgaWYgdGhpcyBwYWNrYWdlIGlzIG5vdCB1c2VkCm9y
IHVwZGF0ZWQgaXQgY2FuIGJlIGEgY2FuZGlkYXRlIGZvciByZW1vdmFsLgpJbmRlZWQsIHJlbGVh
c2UgMC44LjAgd2FzIHJlbGVhc2VkIGJhY2sgaW4gMjAxMi4KClsxXSBodHRwczovL2dpdGh1Yi5j
b20vcnNjYWRhL2xpYm1idXMvcmVsZWFzZXMvdGFnLzAuOS4wCgpCZXN0IHJlZ2FyZHMsClJvbWFp
bgoKCgo+IAo+IEZsb3JpYW4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
