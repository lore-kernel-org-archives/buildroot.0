Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D426FE7719A
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 10:50:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF8F54068A;
	Thu,  9 Jan 2025 10:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YB87F8tF11pW; Thu,  9 Jan 2025 10:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C14B40635
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C14B40635;
	Thu,  9 Jan 2025 10:50:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B8AB76C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 10:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C80D60739
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 10:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HcOfSx_eQVOQ for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 10:50:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C37AB60750
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C37AB60750
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C37AB60750
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 10:50:52 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436281c8a38so5808875e9.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 02:50:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736419850; x=1737024650;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RE7BHhhXuwGZBDhnoLOSf6LMP4Wz2CpWdrto2ZK6vvM=;
 b=M05tFnOj8bTwpG/y07HwM4TiNKpA0YyGqrIiiFi4JGU8vvIeTi1QN6t3zQby5fVGJ4
 FRPCqd1J0S8/bQorLHTr7BbW1t5A64N3DxDOO8MtUDVXb2kDr1bCWlLWKuoTyIh/8e6i
 +EZeSRsAx09x2LH7rLOwpmhuAzfYMqQrhZwnwh8ZA/OyXmp/DI6DWmAhs3X8xvspSnFU
 mdtGoYvGZwuNddZWvcjb4iAPGwDi4F+Rn79j6BMo2B7j6ZtzG0KZO9a4mayucrRwmoxh
 115n63V66z2ic8F64YoyYJt8dtmmMIPlXfDsWpO6d+FjjlmMP8cUmbe0sbGe1CJL/lXq
 aHqQ==
X-Gm-Message-State: AOJu0Yw5RJdv2gSG43JjftaJQ8smutYaZD+dzpgCA1l1i1/v6P+CBGew
 eKeYlHu+Am0y9JqEdgaDvoSEQOGBEre3N1nwmO/Agx+/XCZmvNZhvx85HPCJ1WJhJT2N/qRjywl
 M
X-Gm-Gg: ASbGncvi2651B3UUjG6PjJxld5fePECa4AghBGUEyr+ci/FRI9G2hOW/NeeskFIJDtj
 tUrbfIWj1oDR5uUfw+VbZVbleWjvhKqJIhDlZLfA3gKT56Ec27aGzH8NiyYuwAKJQVCUPF1a8KO
 H9cFZD+S7YkQEUBW57mCHbf35bXip8yfZc3wfTNWh0ZpgUQPQUx4OmwB6m6z1W6FuUnBlHDzC/y
 6H+bxCsmIyBAW3deRV0H5XFV9OWaGiR5cXQzy/UJ2bnru1tojGxPxtusm+MaABs1fDExb1mc2r9
 JGTU+ZZ8YBSnAmiJFRU0HZ83BRjCuuQATtoUQZNsnbB77iq9VrF+2tX9ckyyZ4GceN/jtkXQXjE
 7BPF7T/uRMtto3lw8
X-Google-Smtp-Source: AGHT+IFtDQ4/Gyha4hwm28Vqf3XCyEXfclsY/NSZH9imMtQ11h2LQ+t8SIvQvsLI4TDM3qeQe/2a2A==
X-Received: by 2002:a05:600c:4e92:b0:434:fdbc:5ce5 with SMTP id
 5b1f17b1804b1-436e2707f4amr52861455e9.29.1736419850601; 
 Thu, 09 Jan 2025 02:50:50 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b81a4sm1490043f8f.68.2025.01.09.02.50.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 02:50:50 -0800 (PST)
Message-ID: <951e370c-1132-4759-bbd1-317d15e6db55@smile.fr>
Date: Thu, 9 Jan 2025 11:50:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20250107210923.1127755-1-romain.naour@smile.fr>
 <cabf6dca22e81938b46cd749c5ceb921@free.fr>
 <a58bb770-6e83-4ee9-a2a3-7f96ad0536a2@korsgaard.com>
Content-Language: en-US
In-Reply-To: <a58bb770-6e83-4ee9-a2a3-7f96ad0536a2@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736419850; x=1737024650; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RE7BHhhXuwGZBDhnoLOSf6LMP4Wz2CpWdrto2ZK6vvM=;
 b=xGMKync6fp87ZTFmlmHOl+XQyDCU7IHQ9turjx6wB4IGvfc397NmILX2BwXKW1DHso
 LQUfjKOSEbY7iSkJyKwfKM/a33EkUeFz+NoXNoJdY9QOZXaGVAazc3srPzE8qsQ2byj1
 GoRvaiNtA7cYFXhGMzmNNfRIten6ZJ5xyShwU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=xGMKync6
Subject: Re: [Buildroot] [PATCH] package/qemu: fix Qemu stub builds
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

SGVsbG8gUGV0ZXIsIEFsbCwKCkxlIDA5LzAxLzIwMjUgw6AgMTA6MjEsIFBldGVyIEtvcnNnYWFy
ZCBhIMOpY3JpdMKgOgo+IE9uIDEvNy8yNSAyMjo1MSwgSnVsaWVuIE9saXZhaW4gd3JvdGU6Cj4+
IE9uIDA3LzAxLzIwMjUgMjI6MDksIFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290IHdyb3RlOgo+
Pj4gU2luY2UgY29tbWl0ICJzdHViczogYXZvaWQgZHVwbGljYXRlIHN5bWJvbHMgaW4gbGlicWVt
dXV0aWwuYSIgWzFdLAo+Pj4gUWVtdSBkb2Vzbid0IGJ1aWxkIHdpdGg6Cj4+Pgo+Pj4gwqAgLi9j
b25maWd1cmUgLS1lbmFibGUtdXNlciAtLWRpc2FibGUtc3lzdGVtIC0tZW5hYmxlLXRvb2xzCj4+
Pgo+Pj4gwqAgL3Vzci9iaW4vbGQ6IGxpYmh3Y29yZS5hLnAvaHdfY29yZV9xZGV2LmMubzogaW4g
ZnVuY3Rpb24gJ2RldmljZV9maW5hbGl6ZSc6Cj4+PiBbLi4uXW91dHB1dC9idWlsZC9ob3N0LXFl
bXUtOS4yLjAvYnVpbGQvLi4vaHcvY29yZS9xZGV2LmM6Njg5OiAoLnRleHQrMHg3NWMpOgo+Pj4g
dW5kZWZpbmVkIHJlZmVyZW5jZSB0byAncWFwaV9ldmVudF9zZW5kX2RldmljZV9kZWxldGVkJwo+
Pj4gwqAgY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCj4+Pgo+Pj4g
SW5kZWVkLCB3aXRoIGhhdmVfc3lzdGVtID0gZmFsc2UgYW5kIGhhdmVfdG9vbHMgPSB0cnVlLCBR
ZW11IG5lZWRzIHRoZQo+Pj4gc3R1YnMgZm9yIFFBUEkgZXZlbnRzIGFkZGVkIGJ5IHN0dWJfc3Mu
YWRkKGZpbGVzKCdxZGV2LmMnKSkgdG8gcHJvdmlkZQo+Pj4gcWFwaV9ldmVudF9zZW5kX2Rldmlj
ZV9kZWxldGVkKCkuCj4+Pgo+Pj4gRml4ZXM6IDM4OGI4NDlmYjZjMzM4ODJiNDgxMTIzNTY4OTk1
YTc0OWE1NGY2NDguCj4gCj4gRllJLCB0aGlzIHNob3VsZCBoYXZlIGJlZW4gZWRmYzY3ZmIxYTVm
MGZlNjdiYTlkZTkxZTkwYjA2YTQ0OTAyYzIzMSAoInBhY2thZ2UvCj4gcWVtdTogYnVtcCB0byB2
ZXJzaW9uIDkuMi4wIikKPiAKCkluZGVlZCwgdGhpcyBpcyBhY3R1YWxseSB0aGUgZ2l0IGhhc2gg
aW4gdGhlIFFlbXUgcmVwby4uLgoKTXkgYmFkLgoKQmVzdCByZWdhcmRzLApSb21haW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
