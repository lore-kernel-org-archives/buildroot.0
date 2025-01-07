Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8CCE77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 08:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8996F60892;
	Tue,  7 Jan 2025 08:38:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cnz4VsfcG04y; Tue,  7 Jan 2025 08:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87034606C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87034606C1;
	Tue,  7 Jan 2025 08:38:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B683E6B
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 08:38:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82FCE6062A
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 08:38:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfNRCSdok7v3 for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 08:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5030B60742
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5030B60742
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5030B60742
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 08:38:13 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43635796b48so91803385e9.0
 for <buildroot@buildroot.org>; Tue, 07 Jan 2025 00:38:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736239092; x=1736843892;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KOzTzmXsY8Tdqw1rL1lxOQqGgjh2xSyjgGeeLXdpN94=;
 b=Bf/4rutwYk/Q6tEJvge1RmhsL7hWUIOByQTzDzqb4+Cg1fyCZCYRyVIqgqBCguf9HG
 VJapZsIqz1mO/1LR/OWPvm4EGqPDQ5b37eTRsjuHEzgDMJx+uaZc2NrnJojwly4IlKJ+
 rwCcHa6hXEGg+ydPxNrCh8AEsWJYXnefvbuSLUfAjkNZD0vfZ3vf/G6J3JP0euFlVaLs
 cU5536Q2baYnsDEfaznp+ehUSY+yZWvwLAUBVk8sHxMW+3VwCgNCvIXkoMPQ9buYmC7m
 w1K8x5luUZARSZSS0FlOIn1iCqslWGOvUR44uiT7/ht35SfddPvOEObyb+pV9jQVRu8L
 0IPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMEagleHTRoenpj4wx4kfKMJJoFMrGI67wWSM1+MY2FIbF7i+4k26LwL6tBccNF/xn9TpbE7SGV9Q=@buildroot.org
X-Gm-Message-State: AOJu0YxVY/639yig77hQG3tPxJ40plT4ehrbusLjdfmlGeoD+iqF4QFF
 MNb7QNECliBgUY3TRSL0blfOcoJ1seHODJwX44rFPYEdNQ/VAOngGE12NoPFIIw=
X-Gm-Gg: ASbGncs6C3KgmiFBhse2LNy/xUTFLJeHTXb0BI2GJf6aBqEqLN/H8Hi7Ujn353BbgSD
 vaKJJLRlfxJgRkqrwdQ+1XD7au+i3VOpJ+plxiZoXeXQg414IlDexzPCuB/XJrD9OBfuLfdDqrO
 ip1CnJT2O8o8nnBaMjYAJDvp3YlRiGQ0wRxs0X+A/igk6307+Y1aqaABOg5ZjlnAh1p0xX0BiEO
 kIqUTO78E+9RBuAuDXhrR8yqk7xvscEbmr5ZReyGik3wVwI59j5Q5YGBlP3eiOutTHtLO2iEiPk
 kVsSg3tO3XekpX+2wxgEzYbvEsxhB6TCogMB60w9vkrU9gugenSj3jI2OPJCIqFXq8vEv1cWNRj
 wHhPtv5Rsn9JSIIt7
X-Google-Smtp-Source: AGHT+IFR4wfWo5YOrnmw8izMw8KkSi6vgypJvLsAClATGjcCMDw46YFWqQpm9AYSeEmhd5gtu1yh2Q==
X-Received: by 2002:a05:600c:45d5:b0:434:9e17:190c with SMTP id
 5b1f17b1804b1-436dc158a9amr15788905e9.0.1736239092040; 
 Tue, 07 Jan 2025 00:38:12 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea487sm587369535e9.8.2025.01.07.00.38.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 00:38:11 -0800 (PST)
Message-ID: <377c6b76-fee3-4a7b-ab71-d7313fedd1bf@smile.fr>
Date: Tue, 7 Jan 2025 09:38:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
References: <20250103214754.856971-1-romain.naour@smile.fr>
 <20250106232216.120aea41@windsurf>
Content-Language: fr
In-Reply-To: <20250106232216.120aea41@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736239092; x=1736843892; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KOzTzmXsY8Tdqw1rL1lxOQqGgjh2xSyjgGeeLXdpN94=;
 b=jyBLRegltqPsEWVKRXI1iWHlAVJdw/g7KknySNrWqls3fTc4p504SGGFuYQAMKc3ys
 HCIyVCSj9ghl51P0YxYTgL8YzHkULntcqdDhGTGR06egURtWlJdZYhc1GvLT5tCDcuAy
 5ozJI/XkXhc1WshNguTJqxLanooHZ4RBBEqPM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=jyBLRegl
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 9.2.0
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

SGVsbG8gVGhvbWFzLAoKTGUgMDYvMDEvMjAyNSDDoCAyMzoyMiwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiBPbiBGcmksICAzIEphbiAyMDI1IDIyOjQ3
OjU0ICswMTAwCj4gUm9tYWluIE5hb3VyIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnPiB3cm90ZToKPiAKPj4gQ2hhbmdlcyBsb2c6Cj4+IGh0dHBzOi8vd2lraS5xZW11Lm9y
Zy9DaGFuZ2VMb2cvOS4yCj4gCj4gVGhpcyB1cGRhdGUgaXMgYnJlYWtpbmcgcXVpdGUgYmFkbHkg
b24gdGhlIGF1dG9idWlsZGVyczoKPiAKPiAgIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5l
dC8/cmVhc29uPWhvc3QtcWVtdS05LjIuMAo+IAo+IENvdWxkIHlvdSBoYXZlIGEgbG9vaz8KClRo
ZSBpc3N1ZSBjb21tZSBmcm9tIHRoaXMgY29tbWl0IFsxXSB3aGVuIC0tZW5hYmxlLXVzZXIgLS1k
aXNhYmxlLXN5c3RlbQotLWVuYWJsZS10b29scyBpcyB1c2VkLgoKU3R1YnMgZm9yIFFBUEkgZXZl
bnRzIHNlZW1zIHRvIGJlIG5lZWRlZCBmb3IgLS1lbmFibGUtdXNlciAtLWRpc2FibGUtc3lzdGVt
Ci0tZW5hYmxlLXRvb2xzIG9yIC0tZW5hYmxlLXVzZXIgLS1kaXNhYmxlLXN5c3RlbSAtLWRpc2Fi
bGUtdG9vbHMuCgpNYXliZSB3ZSBoYXZlIHRvIHJldmVydCB0aGUgY29tbWl0IFsxXS4KClsxXQpo
dHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvMzg4Yjg0OWZiNmMz
Mzg4MmI0ODExMjM1Njg5OTVhNzQ5YTU0ZjY0OAoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+
IFRob21hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
