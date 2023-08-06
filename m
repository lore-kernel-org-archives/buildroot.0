Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9BAEC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 11:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE92414BF;
	Sun,  6 Aug 2023 11:08:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EE92414BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lOvayA37PF8; Sun,  6 Aug 2023 11:08:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2262E408D6;
	Sun,  6 Aug 2023 11:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2262E408D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 468871BF293
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DDC0402E4
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 11:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DDC0402E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6n8VuKCR-acd for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 11:08:05 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AD4C400DD
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 11:08:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AD4C400DD
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e587eso65445e9.0
 for <buildroot@buildroot.org>; Sun, 06 Aug 2023 04:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691320083; x=1691924883;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L31uu7UQpo5056xnrdFTHxpvdGSp0tAa0FIBdqFUbTc=;
 b=hd3sQVzanflvvnRa5QMocx8TniamOke4LDt0WH6RCa+BN5IQrvpNWSskE/fiYYuz81
 sJfQfUI3Cig7cIWdifQylvcvcopLKMsU5M0pfllug4T3rezZlWvm+bFwtMxyye0M4piE
 Q0T0TfJ4k35Qf+YaezDTWYnp71BSXCPl/MctNfIMOSe6KEDx1SMtRLER25JTMma5/uZT
 1lzWlo0qkLwFV2hmAsaqhmgRkO+4Xl1WWtcgFJSR8ePOlOxewH2foVkPyHbX7il1EH5/
 ofAsyREDnce4ksuGmdzGiEcRdonyCwiSXuOpD6Z+iVMXurkADQ221yV9XxnxBEaK4Q7K
 kLhQ==
X-Gm-Message-State: AOJu0YxXfHXLdB9I4YDg53TcesCJ/qOxXMS+pktSUW6n1yK+8xgw9mYJ
 43jnBlX0xcswbfyQDS8dMLQ=
X-Google-Smtp-Source: AGHT+IH+yRzqybLP0xETKkcHoFVdBPdCtlStzIMqwI+aB7Ngo32UCDl6PdKLKfUBgZH1yJCqniBGJA==
X-Received: by 2002:a5d:6345:0:b0:316:ef23:9276 with SMTP id
 b5-20020a5d6345000000b00316ef239276mr5542928wrw.52.1691320083149; 
 Sun, 06 Aug 2023 04:08:03 -0700 (PDT)
Received: from aura15.fritz.box ([2a02:578:8505:b00:39f1:3674:12da:165b])
 by smtp.gmail.com with ESMTPSA id
 d11-20020adfe84b000000b0031760af2331sm7326988wrn.100.2023.08.06.04.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Aug 2023 04:08:02 -0700 (PDT)
Message-ID: <594a3b25d2c520e8df9bef2be2533f1dd41821d0.camel@gmail.com>
From: Lothar Felten <lothar.felten@gmail.com>
To: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Date: Sun, 06 Aug 2023 13:08:02 +0200
In-Reply-To: <20230726202838.1931660-1-christian@aperture.us>
References: <20230726202838.1931660-1-christian@aperture.us>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691320083; x=1691924883;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=L31uu7UQpo5056xnrdFTHxpvdGSp0tAa0FIBdqFUbTc=;
 b=E4oqDv14K51hUJgy0i+KGbFQMoY+A+dw4T5+VpxZDfMfC4ElhEp7CL/niPHeNAGxTt
 1QpqW5+Msp1vM/pt59718+lLP7VBAxQBlSmrx6lpKr4GJo9TbNB9WyQgg5m2/fUZtg04
 xeI4w70rirrvrI4siy9HNs+1CDbQZyRtlMFRMC0o1Vwi3kfU88Wzz8BCZ8xm1995Dplp
 aUSOckYX4eWJfINxXcdyTq0UH24cH4XdLzv9+twscrEKVL08FEJjeL2mkCNlZKG9BebV
 oolwIdoGyywiNgcrKNC+c2n90mdHmaydt9Wj751ceORIEWsZSD+3pnlstvY8AVWls/Nj
 TZYQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=E4oqDv14
Subject: Re: [Buildroot] [PATCH v1 1/3] package/python-pylibfdt: bump
 version to 1.7.0.post1
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2hyaXN0aWFuLAoKT24gV2VkLCAyMDIzLTA3LTI2IGF0IDEzOjI4IC0wNzAwLCBDaHJpc3Rp
YW4gU3Rld2FydCB2aWEgYnVpbGRyb290Cndyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+Cj4gLS0tCj4gwqBwYWNrYWdlL3B5dGhv
bi1weWxpYmZkdC9weXRob24tcHlsaWJmZHQuaGFzaCB8IDQgKystLQo+IMKgcGFja2FnZS9weXRo
b24tcHlsaWJmZHQvcHl0aG9uLXB5bGliZmR0Lm1rwqDCoCB8IDYgKysrLS0tCj4gwqAyIGZpbGVz
IGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9weXRob24tcHlsaWJmZHQvcHl0aG9uLXB5bGliZmR0Lmhhc2gKPiBiL3BhY2th
Z2UvcHl0aG9uLXB5bGliZmR0L3B5dGhvbi1weWxpYmZkdC5oYXNoCj4gaW5kZXggMDU2ZmQzYTYy
ZS4uODI1MjdlNzI3ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weWxpYmZkdC9weXRo
b24tcHlsaWJmZHQuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXB5bGliZmR0L3B5dGhvbi1w
eWxpYmZkdC5oYXNoCj4gQEAgLTEsNiArMSw2IEBACj4gwqAjIG1kNSwgc2hhMjU2IGZyb20gaHR0
cHM6Ly9weXBpLnB5dGhvbi5vcmcvcHlwaS9weWxpYmZkdC9qc29uCj4gLW1kNcKgIDU3NjVjMjBh
YzZjZGU1MTdkNWI3MjE4NTAzYWI3MDdiwqAgcHlsaWJmZHQtMS42LjEudGFyLmd6Cj4gLXNoYTI1
NsKgCj4gOTBjNjY3YzVhZGY0NGM2YWIyZjEzYmRjNTY2NTk4ODk3Nzg0YzdiNzgxYmVkOTEwNjRl
NzM3M2JkMjcwYjc3OMKgCj4gcHlsaWJmZHQtMS42LjEudGFyLmd6Cj4gK21kNcKgIDM1M2VlMzA2
M2QwYjEwZTk0ZDE2NWUwMzI4OTdkMzRlwqAgcHlsaWJmZHQtMS43LjAucG9zdDEudGFyLmd6Cj4g
K3NoYTI1NsKgCj4gMmQwNDhmOWY4Y2U5YTA1MjdkNDk3ZjQyM2RlYTFmMTEzNWY5ODExYzA1YjAw
OWNjNWQ1NzUzNzcxYzFmOWJhMcKgCj4gcHlsaWJmZHQtMS43LjAucG9zdDEudGFyLmd6Cj4gwqAj
IExvY2FsbHkgY29tcHV0ZWQKPiDCoHNoYTI1NsKgCj4gNjMxMzEwOGMyM2VmZmZhMzY5NDhmOGIy
Y2ZmMTU2MGE1OTM1MzczYjUyN2IwZTFhODM3Y2M3N2U2ZWQxYmFjZMKgCj4gQlNELTItQ2xhdXNl
Cj4gwqBzaGEyNTbCoAo+IDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUx
NGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDPCoCBHUEwKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRo
b24tcHlsaWJmZHQvcHl0aG9uLXB5bGliZmR0Lm1rCj4gYi9wYWNrYWdlL3B5dGhvbi1weWxpYmZk
dC9weXRob24tcHlsaWJmZHQubWsKPiBpbmRleCBkYzY4ZGU4M2IzLi41NTExYmQxMmIzIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvcHl0aG9uLXB5bGliZmR0L3B5dGhvbi1weWxpYmZkdC5tawo+ICsr
KyBiL3BhY2thZ2UvcHl0aG9uLXB5bGliZmR0L3B5dGhvbi1weWxpYmZkdC5tawo+IEBAIC00LDEw
ICs0LDEwIEBACj4gwqAjCj4gwqAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICMjIyMjIyMjIyMjIwo+IMKgCj4gLVBZ
VEhPTl9QWUxJQkZEVF9WRVJTSU9OID0gMS42LjEKPiArUFlUSE9OX1BZTElCRkRUX1ZFUlNJT04g
PSAxLjcuMC5wb3N0MQo+IMKgUFlUSE9OX1BZTElCRkRUX1NPVVJDRSA9IHB5bGliZmR0LSQoUFlU
SE9OX1BZTElCRkRUX1ZFUlNJT04pLnRhci5nego+IC1QWVRIT05fUFlMSUJGRFRfU0lURSA9Cj4g
aHR0cHM6Ly9maWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzE1LzNjLzQwYjFkNmExZGY5
ZGJjOWQ5YmE1NzAwYTQ3YWQ5NWNhMWU5ODRmMThkYWYyNWVkZTBkYTVmNjdkMGNmNwo+IC1QWVRI
T05fUFlMSUJGRFRfU0VUVVBfVFlQRSA9IHNldHVwdG9vbHMKPiArUFlUSE9OX1BZTElCRkRUX1NJ
VEUgPQo+IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy85Ni81Yy83N2Vm
MGYwNDU5ZTBiMTNmMzllY2MyMmUyMWFkNGFjOWZiZTc0MWU4YTdjZDcwNzAyYWM4MTY1ZjgwZTIK
PiArUFlUSE9OX1BZTElCRkRUX1NFVFVQX1RZUEUgPSBwZXA1MTcKPiDCoFBZVEhPTl9QWUxJQkZE
VF9MSUNFTlNFID0gQlNELTItQ2xhdXNlIG9yIEdQTC0yLjArCj4gwqBQWVRIT05fUFlMSUJGRFRf
TElDRU5TRV9GSUxFUyA9IEJTRC0yLUNsYXVzZSBHUEwKPiDCoFBZVEhPTl9QWUxJQkZEVF9ERVBF
TkRFTkNJRVMgPSBob3N0LXB5dGhvbi1zZXR1cHRvb2xzLXNjbSBob3N0LXN3aWcKClRoaXMgZml4
ZXMgdGhlIGJ1aWxkIGZhaWx1cmU6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2pvYnMvNDc0OTU1NTk5MSAKClRlc3RlZC1ieTogTG90aGFyIEZlbHRlbiA8bG90
aGFyLmZlbHRlbkBnbWFpbC5jb20+CgpCZXN0IHJlZ2FyZHMsCkxvdGhhcgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
