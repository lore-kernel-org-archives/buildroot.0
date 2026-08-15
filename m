Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D938C5CFC1
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 20:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D6B6064B;
	Sat, 15 Aug 2026 20:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4oEG-aHFTX4; Sat, 15 Aug 2026 20:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCDC860600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786825531;
	bh=/UfGOhEKmvRpNYETkZiSmywSUpmi4Gnu0/BCH2Uj1oU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HJfoeUpswf6tn9ydrPzCD0KgoUP21NZcOVJRoiAKq8FCT5+GWjzYOdZ80IIaQOal/
	 tVl7f2xi2TsI/MntXHZeAs7OXky1iDFQ4rDX5Qj1ItIWB4zxJk9pNzcDzq/27zOKFG
	 DitSl+6kQZ+cV9DP/T5MuE14R8QS5A8Dhq4W9HSTB24VADyx6VnnprTAvoKkyZvPaw
	 XfkgeFS6xp3uZPw6rw8eXCGX9+vRwc+n3KUbahQyNI6HfoiIMoZoKXFxBYQlR4Etb0
	 nslXdeXnJ89doRiw5Av9VtBil2ZMktbU+vbDTMeugzvC/YDTUk53VuTw8axxj+L/o+
	 m8+6ZlmO7jY4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCDC860600;
	Sat, 15 Aug 2026 20:25:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68604336
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 20:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A6F0407AF
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 20:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNqZr4IG3X6R for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 20:25:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 370664078E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 370664078E
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 370664078E
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 20:25:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-495437bb891so17496015e9.1
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 13:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786825527; x=1787430327;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Lsj0ivVGcRwrPC1WfdmZGkSsr+BUJmaPAlMtzIGxOZw=;
 b=ZdNYsQzdvfR9ztnJHe306/Dn3d/ktYThUIWmPlpBmcDvxWE0wc+UxaINBMG3gKbROq
 n5gRIwtflB28qOmFQDEonutNnctiEWxiq3ML+5rvnD170UlGS/UYQIouS50p8CmlEewv
 xr5Tt04TZ7cmopwmkJyG9UfwjzgZTUr1XLs0ykPEnmmhul4xRtlWWuMVYwfnrW79sOIW
 hPKsGP9cANCnMEwx565TEvruOy6JLHm870ZAGTUqE/ZldIFyVyVuGbw3YPKf9fLksnI0
 LrA8y8ieyWRmi0GDLAUqxo73YkywgytNFZ+YRfbuCO/uiJUy9Ko6BBBJnlfCFOd25qvB
 Jn2A==
X-Gm-Message-State: AOJu0YxQsLVvO6Y2z4hFYuCo/XRHw068YYm3HRUjwO0OxULOVs05cBfe
 1Gw5iAOi98kBQ2hKgJxPJ7C2RUW7O6D/FGwiURs8ktlC2U6rEH0iU12UFXwsrusZq63t9F4nnKI
 Y9xXR1JU=
X-Gm-Gg: AR+sD10VbPFLlhU44/jQgrSWJbiDmCvYEyfb9F/r7+k22BA8MNCABm4HbrXMMFYZccR
 stFaI0xbloZrBlM6HBfoEmdKKe0eNtDYJB7/hixRj+oUe7rStBzvL6Lu5cd8BfhOIYXP5fWA1V9
 ps3/rAshiTAEE4+rBmmu2wCvxI3SO/06uYuy1WZr53tTXnXJShGMM8b7j8h7r05kFzdMzLtSuiv
 +ACu0cGc9zYn0LRiVm14vUqlPiZPfzZKLi/Lx/CbaPL0dIDQ2EfvXlbopmVKIEqm3f+5Sfk33k0
 VrUfuyUOy5CixDhV3cly8L4Yx968bXV2pgMgucH+4oP81tdmGfN9O+xvI4NKMjw5oDXrpHS60ii
 VYat/KGfjQLli+EdEPTvcV77diXP8FEUWFxa33cdmXawnBheaRLH8fekzuiiGyN7XNkj8M8he7K
 fTSR6DyctuNoUpuTmKomfnJWqtDS79YZv+68WwBL9q6J4SNynQjanAT0ML3P0GqPqGWvHeCLaKs
 yabuX5MBwz78BugmyajGjFZDzqfwTVd4kQ1nyTgIS6iYTJdIiVZksXGCFIyNKkcCR9yAaTMqlRw
 Zr7wwzSU6YMjJ6PFHg2N6T1dIrU=
X-Received: by 2002:a05:600c:83c8:b0:499:8d9b:832c with SMTP id
 5b1f17b1804b1-4998e080d8cmr116076355e9.4.1786825526765; 
 Sat, 15 Aug 2026 13:25:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988adfb67sm172561375e9.3.2026.08.15.13.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Aug 2026 13:25:26 -0700 (PDT)
Message-ID: <ee9f9d66-fd9e-4e9a-8cb2-3eece63cb494@smile.fr>
Date: Sat, 15 Aug 2026 22:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260815121004.2036403-1-romain.naour@smile.fr>
 <aoC8T910-K9DIofo@waldemar-brodkorb.de>
Content-Language: en-US
In-Reply-To: <aoC8T910-K9DIofo@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH] package/uclibc: disable SSP support for
 riscv32
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

SGVsbG8gV2FsZGVtYXIsIEFsbCwKCkxlIDE1LzA4LzIwMjYgw6AgMjE6MjEsIFdhbGRlbWFyIEJy
b2Rrb3JiIGEgw6ljcml0wqA6Cj4gSGkgUm9tYWluLAo+IFJvbWFpbiBOYW91ciB3cm90ZSwKPiAK
Pj4gT24gbW9kZXJuIDMyLWJpdCBhcmNoaXRlY3R1cmVzIGxpa2UgUklTQy1WIChyaXNjdjMyKSwg
bGVnYWN5IDMyLWJpdAo+PiB0aW1lIHN5c2NhbGxzIGxpa2UgX19OUl9nZXR0aW1lb2ZkYXkgYXJl
IGludGVudGlvbmFsbHkgb21pdHRlZCBiZWNhdXNlCj4+IFJWMzIgaW1wbGVtZW50cyBhIHN0cmlj
dCB0aW1lNjQtb25seSBBQkkgdG8gYXZvaWQgdGhlIFllYXIgMjAzOCBidWcuCj4+Cj4+IEJ1dCB1
Y2xpYmMtbmcgY29kZSBbMV0gaXMgdXNpbmcgYSBkaXJlY3QgX19OUl9nZXR0aW1lb2ZkYXkgc3lz
Y2FsbCB0aGF0Cj4+IGlzIG5vdCBkZWZpbmVkIGZvciByaXNjdjMyLgo+Pgo+PiBbMV0gaHR0cHM6
Ly9naXRodWIuY29tL3dieC1naXRodWIvdWNsaWJjLW5nL2Jsb2IvYWU0YTk4Zjk2MTJjNzA1MGIx
YmNlYjljODM0MGZlNWVmOTM0NWUyMi9sZHNvL2luY2x1ZGUvZGwtc3lzY2FsbC5oI0wyNjMKPj4K
Pj4gQXMgYSB3b3JrYXJvdW5kLCB3ZSBoYXZlIHRvIGRpc2FibGUgdGhlIFNTUCBzdXBwb3J0IGZv
ciB1Y2xpYmMtbmcKPj4gdG9vbGNoYWluIG9uIHJpc2N2MzIgZm9yIG5vdy4KPiAKPiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2guCj4gCj4gSSB3b3VsZCByYXRoZXIgbGlrZSB0byBmaXggaXQgaW5zaWRl
IHVDbGliYy1uZyBsaWtlIHN1Z2dlc3RlZCBoZXJlOgo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjYtQXVndXN0LzgwNzU4MS5odG1sCj4gaHR0cHM6
Ly9tYWlsbWFuLm9wZW5hZGsub3JnL21haWxtYW4zL2h5cGVya2l0dHkvbGlzdC9kZXZlbEB1Y2xp
YmMtbmcub3JnL3RocmVhZC9XSUtNV1BYSllBUFRWVloyTU1aSU5VSk5QSUpYQk1PRS8KClN1cmUs
IHRoYW5rcyBmb3IgZml4aW5nIHRoZSBpc3N1ZSBzbyBmYXN0IQoKQmVzdCByZWdhcmRzLApSb21h
aW4KCj4gCj4gYmVzdCByZWdhcmRzCj4gIFdhbGRlbWFyCj4gIAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
