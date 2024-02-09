Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5AFC48297
	for <buildroot@archiver.kernel.org>; Fri,  9 Feb 2024 13:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26F926071E;
	Fri,  9 Feb 2024 13:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TL_6zFfCLyM9; Fri,  9 Feb 2024 13:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4670760720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4670760720;
	Fri,  9 Feb 2024 13:15:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3BF7D1BF2B8
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 13:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 297CF60720
 for <buildroot@lists.busybox.net>; Fri,  9 Feb 2024 13:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C63IdlblChhm for <buildroot@lists.busybox.net>;
 Fri,  9 Feb 2024 13:15:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5DACA6071E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DACA6071E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5DACA6071E
 for <buildroot@buildroot.org>; Fri,  9 Feb 2024 13:15:50 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4106cf2e9e2so4516465e9.3
 for <buildroot@buildroot.org>; Fri, 09 Feb 2024 05:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707484549; x=1708089349;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fwk7KSMwDbh6lf6DN/sTah//3ZRkC6njXoBr8wYMCN0=;
 b=uS9tFDhvSCN0yopZrjjEF8vjuuR/2SyVhP4L+uv3hXiyusm6w3nsvvJ7HRp2C7CS/G
 8qZdAccvn8S7mFq/I9zFUPV68Ri1d197cMz+9JXa9tCidvTGeBDt7einW26Vex61hyif
 qhYDCjThVL5uiNNpIx9rKn0P0kWgIHwsOWKx+HYcB64tJ9GlMsIendZSs2EpBRhXPq41
 XVwothQ8YFZPYr0MroUXaflD1LcKYKtnUI1mR7u2jhfxCwCwI6+zhFbAPoFZ4e7MKE1N
 ReFhv2Ru3l+ZzYCyEh4uwk3xZsbSoKSUOBxGgANwg9qjWE7m0yRUSqe/tZJYRrGdcxoo
 TqSQ==
X-Gm-Message-State: AOJu0YwAWUpGaTnXf436OOInbJO2BgmDeW7l+bYbP/x5lPjj29xCqbnL
 7vN93OqXKnWMtSokUDeIBfw+uNNn+XlQOPoUq0ogaAbuW4/lk6sVUECV4EL/ltY=
X-Google-Smtp-Source: AGHT+IEq2K6U9rrgGjn3Juoi3Hao/AN7VXh45/pHbZ+Cx3OXQf5S9qFgZ92M7GqqLn5sMxViSeMKQw==
X-Received: by 2002:a05:600c:3ac6:b0:40f:dd76:27ea with SMTP id
 d6-20020a05600c3ac600b0040fdd7627eamr1109512wms.0.1707484549053; 
 Fri, 09 Feb 2024 05:15:49 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUCDoDe5MlzMfMaGLhjQbluEBWTvCAOpQk0ziQG3kgSQDiDWCXQY/8vB7KLNk9KWEygGfx/NTDRjNroh1iNbxCttGEhVIDyu6Sy/LQh+82hPRINGLecyELrqBvcuc5pQXrBbMAhLRO9IaP5/sQJydGwpqOTIH8OpO5/FNDlsBRv59H5SO8RUlNAbyEqV6TA437cgb434lFf1za+vERn7/kU5w==
Received: from [192.168.178.20] (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 jw21-20020a05600c575500b004101543e843sm609028wmb.10.2024.02.09.05.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Feb 2024 05:15:48 -0800 (PST)
Message-ID: <36c6330f-b003-4649-87c8-a9691e185325@mind.be>
Date: Fri, 9 Feb 2024 14:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240110093850.2302133-1-james.hilliard1@gmail.com>
 <20240110093850.2302133-6-james.hilliard1@gmail.com>
 <454a12aa-fe40-4435-8c6e-5f020d960bb5@mind.be>
 <269f1999-249c-4ede-82a6-6240bc36dbdd@mind.be>
Content-Language: en-US
In-Reply-To: <269f1999-249c-4ede-82a6-6240bc36dbdd@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707484549; x=1708089349; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fwk7KSMwDbh6lf6DN/sTah//3ZRkC6njXoBr8wYMCN0=;
 b=TKtZewsG9vJRNIYTs2Eanin9zIbtdWvpLQgBAdM+jIduDw0+bg7daaWAWxi1XuSJBx
 /US9NysLP0wHAiBzEyURvFgnZBYf9eNPSw42GndQP2UKFPH2JlZ4N2V2F5CfBNXtL8CL
 cpKWfFg1f090fJ8G3T9H0FkEM4q2TmdfYoVAKl3bwMCMDPnUYOSeEOcJxWFkeMHUd7aq
 O2age3Zshxi9VkWNBpRCKzkdZAesse6dOPuFjbZtW705pIz+T2G+o3NpcdzqF6+yE5by
 uMdHkO5v+shj8lgi5R70/30IXSVXRCtP9CQFiEfzLbydPZbnRiR+0HOeXpGKEcnR4YRw
 NAsQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TKtZewsG
Subject: Re: [Buildroot] [PATCH 6/6] package/python-pymupdf: bump to version
 1.23.9rc2
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMi84LzI0IDIyOjI5LCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToK
PiAgwqBIaSBSYXBoYWXMiGwsCj4gCj4gT24gMDgvMDIvMjAyNCAxMjoyOCwgUmFwaGHDq2wgTcOp
bG90dGUgdmlhIGJ1aWxkcm9vdCB3cm90ZToKPj4gSGkgSmFtZXMsIGFsbCwKPj4KPj4gVGhhbmtz
IGZvciB0aGUgcGF0Y2hlcyEKPj4gSSBhZGRlZCBhIGZldyBjb21tZW50cy9xdWVzdGlvbnMgYmVs
b3cuCj4gCj4gIMKgWW91ciBjb21tZW50cyBhY3R1YWxseSBzb3VuZCBwcmV0dHkgZXNzZW50aWFs
LCBhbmQgSSB0aGluayB0aGV5IGFmZmVjdCB0aGUgZWFybGllciBwYXRjaGVzIGluIHRoZSBzZXJp
ZXMgYXMgd2VsbC4gU2hvdWxkIEkgbWFyayB0aGUgZW50aXJlIHNlcmllcyBhcyBDaGFuZ2VzIFJl
cXVlc3RlZD8KClRoZSBuZXcgcHl0aG9uLXB5bXVwZGYgdmVyc2lvbiBmcm9tIHRoaXMgc2VyaWVz
IGRvZXNuJ3QgY3Jvc3MtY29tcGlsZSwgYW5kIHVwZGF0aW5nIG11cGRmIGFsb25lIHdvdWxkIGFs
c28gYnJlYWsgcHl0aG9uLXB5bXVwZGYgKGFzIHRoZWlyIHZlcnNpb25zIGhhdmUgdG8gYmUga2Vw
dCBpbiBzeW5jKSBzbyB0byBtZSwgeWVzLgoKPiAKPiAgwqBBbHNvLCB3aWxsIHlvdSB3b3JrIG9u
IGZpeGluZyB0aGUgaXNzdWVzIG9yIHNob3VsZCBKYW1lcyB0YWtlIGl0IG9uPwoKSSBoYXZlIHNv
bWUgaWRlYSBvZiB3aGF0IGlzIGNhdXNpbmcgdGhlIG5ldyBidWlsZCBmYWlsdXJlIGZvciBweXRo
b24tcHltdXBkZiwgSSB3aWxsIHRha2UgY2FyZSBvZiBpdCAoSSBzaG91bGQgYmUgYWJsZSB0byBk
byB0aGF0IHdpdGhpbiB0aGUgbmV4dCBmZXcgZGF5cykuCgoKS2luZCByZWdhcmRzLAoKUmFwaGHD
q2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
