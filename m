Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC0C3C48BC3
	for <buildroot@archiver.kernel.org>; Mon, 19 Feb 2024 10:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3108B40912;
	Mon, 19 Feb 2024 10:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-wikDB6aVfL; Mon, 19 Feb 2024 10:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8A7B408F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8A7B408F0;
	Mon, 19 Feb 2024 10:03:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0731BF5E9
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B97360AD8
 for <buildroot@lists.busybox.net>; Mon, 19 Feb 2024 10:03:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMczi1wxpnGl for <buildroot@lists.busybox.net>;
 Mon, 19 Feb 2024 10:03:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8866E60AC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8866E60AC8
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8866E60AC8
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 10:03:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4125ea5d913so10712375e9.2
 for <buildroot@buildroot.org>; Mon, 19 Feb 2024 02:03:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708337016; x=1708941816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Xm5KMb07G9mLXDltZbnzWW0HjLeQ+IW9ksZWbruGMi0=;
 b=ol+s1oDBMV5iYPj5Pi0pJQQjWF6h8ht9YthoVc8S/1sdbljrxgoRoty6otoF8iO2Wp
 H9JhXxBlZE4kVZ1Nmnmfn60gMnLkKr6JV1zwXAeLLiMZnO3t6RRGFvThXL1PzVdUm83y
 b0fI3k5JOQJEqNKOosAY4XJX3C/ok1Z7IMZi4jkxFMMg57D9RCyUmD+v6gf9iJmv7XR/
 8aeeSlqpuKme4EHopCt4J1oQWjb84j3fdD7EwDNmNbhYd35ckWBeazd/kTpgjXPZYZhy
 CMCmQ3I538wfBL/pFCNWEPerk8ABfzu5P1M34ApxT0TV3o0dgAW/mncdKp6ge1jOER4V
 0CyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYzs5GROgbI2PqBVc2KyFMjdZIKuZwa2cni+DWOWxfMU4bx4djGEpQVkwnvrXGSQG0dN83Uf8diPLrQk8BSyvSgaDtbJgB2g==
X-Gm-Message-State: AOJu0YwN7rOKMrf7Tr/NxdrTK1YcRwsUHYAZ1fSg8PNu8lX5hpcQqAEO
 diG897OlXo2JwNuWO7fwJlsrrhgmlTWKG4Ujsmvu2VZm7rQEkq/rSzlHYOoMrN0=
X-Google-Smtp-Source: AGHT+IFF2QkM8SU9erZaWF2Z3p3UT6DeNZ1DVmwXaO+gzGayIXgicRQYs7y6aaQWHmSzCQNCwwQe5Q==
X-Received: by 2002:a05:600c:1c1e:b0:412:1d7d:6c51 with SMTP id
 j30-20020a05600c1c1e00b004121d7d6c51mr8097644wms.6.1708337016558; 
 Mon, 19 Feb 2024 02:03:36 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a7bc4d3000000b004126101915esm5084036wmk.4.2024.02.19.02.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 02:03:36 -0800 (PST)
Message-ID: <7bbbe31b-210f-49c4-8344-05f2f09b18de@smile.fr>
Date: Mon, 19 Feb 2024 11:03:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
 <20240217160244.1320482-9-dario.binacchi@amarulasolutions.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240217160244.1320482-9-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1708337016; x=1708941816;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Xm5KMb07G9mLXDltZbnzWW0HjLeQ+IW9ksZWbruGMi0=;
 b=O0kc+tQkwE0S/AJvlAP8Lm9ZGIgwClJe/FR6NiYdcEAf+l/LCVDqQ/T2qYypzchQzS
 Zb3qI18/EhHnW2LmKOgLDV2QezuBNtkoKVzKpypT/a6M0foe4xqvbBVskjrg3IprFVcF
 PjX92+a5M1VLaZ6rtMU7OEjW0YOXuoIyjErfE5ImSjzAArCEKvGv74EsdyBehqAGcGGg
 OBIhdD0fPGQrAsjX1rx7IX8A3ZuucYdxycmiWhQPZEJcNXBg0VpdLfIK/g1u79iEi38Z
 78SkvP5O3nK2DTpZLGJzIjMrO2vexILriKzAz8SeUN+qXseGWkC4pZ0vagBYUbZ0nt8J
 xpWg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=O0kc+tQk
Subject: Re: [Buildroot] [PATCH v4 08/20] package/python-jsonschema: add
 host variant
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

SGVsbG8gRGFyaW8sCgpMZSAxNy8wMi8yMDI0IMOgIDE3OjAyLCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IFJlY2VudCB2ZXJzaW9uIG9mIFUtQm9vdCB1c2UgYmlubWFuIHRvIHByb3ZpZGUg
YSBtZWNoYW5pc20gZm9yIGJ1aWxkaW5nCj4gaW1hZ2VzLCBmcm9tIHNpbXBsZSBTUEwgKyBVLUJv
b3QgY29tYmluYXRpb25zLCB0byBtb3JlIGNvbXBsZXgKPiBhcnJhbmdlbWVudHMgd2l0aCBtYW55
IHBhcnRzLiBUaGlzIHBhY2thZ2UgaXMgcmVxdWlyZWQgYnkgYmlubWFuLgoKSSBkaWQgc29tZSBp
bXByb3ZlbWVudCBhYm91dCBob3N0LXB5dGhvbiBwYWNrYWdlIHlvdSBuZWVkIGZvciBiaW5hbS4K
SW5kZWVkLCBob3N0LXB5dGhvbi1qc29uc2NoZW1hIGhhcyBzb21lIHJ1bnRpbWUgZGVwZW5kZW5j
aWVzLCBidXQgd2UgZG9uJ3QgaGF2ZQp0aGUgY29uY2VwdCBvZiBydW50aW1lIGRlcGVuZGVuY2ll
cyBmb3IgaG9zdCBwYWNrYWdlcy4KCkR1ZSB0byB0aG9zZXMgcnVudGltZSBkZXBlbmRlbmNpZXMg
eW91IGNhbid0IGFkZCBweXRob24tanNvbnNjaGVtYSBob3N0IHZhcmlhbnQKYmVmb3JlIGFkZGlu
ZyBob3N0LXB5dGhvbi1hdHRycywgaG9zdC1weXRob24tanNvbnNjaGVtYS1zcGVjaWZpY2F0aW9u
cywKaG9zdC1weXRob24tcmVmZXJlbmNpbmcgYW5kIGhvc3QtcHl0aG9uLXJwZHMtcHkuCgpCZXN0
IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gQ28tZGV2ZWxvcGVkLWJ5OiBNaWNoYWVsIFRyaW1hcmNo
aSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVs
IFRyaW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBEYXJpbyBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4g
Cj4gLS0tCj4gCj4gbm8gY2hhbmdlcyBzaW5jZSB2Mwo+IAo+IENoYW5nZXMgaW4gdjM6Cj4gLSBE
cm9wIENvbmZpZy5pbi5ob3N0Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRh
cmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IC0tLQo+ICBwYWNrYWdlL3B5dGhv
bi1qc29uc2NoZW1hL3B5dGhvbi1qc29uc2NoZW1hLm1rIHwgNiArKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1q
c29uc2NoZW1hL3B5dGhvbi1qc29uc2NoZW1hLm1rIGIvcGFja2FnZS9weXRob24tanNvbnNjaGVt
YS9weXRob24tanNvbnNjaGVtYS5tawo+IGluZGV4IDUxMmM5MmFhNzc1Mi4uODVmZWY3YWQyMmFj
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLWpzb25zY2hlbWEvcHl0aG9uLWpzb25zY2hl
bWEubWsKPiArKysgYi9wYWNrYWdlL3B5dGhvbi1qc29uc2NoZW1hL3B5dGhvbi1qc29uc2NoZW1h
Lm1rCj4gQEAgLTE1LDQgKzE1LDEwIEBAIFBZVEhPTl9KU09OU0NIRU1BX0RFUEVOREVOQ0lFUyA9
IFwKPiAgCWhvc3QtcHl0aG9uLWhhdGNoLWZhbmN5LXB5cGktcmVhZG1lIFwKPiAgCWhvc3QtcHl0
aG9uLWhhdGNoLXZjcwo+ICAKPiArSE9TVF9QWVRIT05fSlNPTlNDSEVNQV9ERVBFTkRFTkNJRVMg
PSBcCj4gKwlob3N0LXB5dGhvbi1oYXRjaGxpbmcgXAo+ICsJaG9zdC1weXRob24taGF0Y2gtZmFu
Y3ktcHlwaS1yZWFkbWUgXAo+ICsJaG9zdC1weXRob24taGF0Y2gtdmNzCj4gKwo+ICAkKGV2YWwg
JChweXRob24tcGFja2FnZSkpCj4gKyQoZXZhbCAkKGhvc3QtcHl0aG9uLXBhY2thZ2UpKQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
