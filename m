Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A05ACD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 14:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E4FF4112B;
	Fri, 15 May 2026 14:36:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0dPVPhwkAFP; Fri, 15 May 2026 14:36:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49D9741130
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778855772;
	bh=6VdkQGpl860/H1vBjHRBYJ6piTghGEAxQ+ggbhGw1pI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=AcA+9W6UEHLNYxNtzOaE/BcyoN8Z05OljGCh2JiP4pE3BBUG1NkINjnYy1eUppHAr
	 27Gg/Su1D/LMRD2mejGKHhoYuBBA55japp/I6JjXq0RKMvsJdcy0WPTkxUTWo/jdPj
	 0gh19JIFBh6ejwoaDVtF23eU9q4ntIx6EFDU1wIUCPKZzX9z8aXkgMY3dRz62aMKfq
	 a/RiegFMmhrSzzHUQv9jeQP/7FN76PmpsWPQlIhPSsnOHZrS+53qnOvEkTMubrHLMC
	 g0IQWgyVueIkiJm0rZOteOMxJs4PiDrp5OYD7C9/sC1Xio6kHLTyGrOedwKG9i7Wf/
	 HHDE+Huj5w9yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49D9741130;
	Fri, 15 May 2026 14:36:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48CAEE7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3479041130
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEh550s5Yvh3 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 14:36:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B0D5F4112B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0D5F4112B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B0D5F4112B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:36:08 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-44509921fbcso4777054f8f.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 07:36:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855766; x=1779460566;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v0X3ZRMxQtxwmA7ID0k3Vq5zVGRxPQx/YoWeCwUQ+hA=;
 b=qbmsoo2VW6QXyemBzINXibIblvXh51pGAhwUBrincYROOBcCqba500WUaVxF9Hljsa
 JXFz4EbJDzKBRw1ZASWNM0tOLuQLCf18xgoD/+rI+Sw4UA01BFU+HEbrI+hIhdgJeeIj
 yzquD4kUMbtqqO5NTnozojWZb8u18kVBzfxIT/84dN4RforA4SN5vpZ9HX5UGoHkniWc
 iwn6jCbWjbecFZGUJJpjdUhnyu79Aqom72us8AqyRO2VXEacKXo6b4qOHiau9X27cSIE
 RS2k46FzrYgkxMUODPKpbV1ijSSz+RE3smbVM9dmRQhP/glZrZYtmPcsjQsiAzF/7hiU
 DK7A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9jlBJZ+niFppixwhN8RPni5rJzeyeeNl1uOwM9tBO7jST4fDU5C1XTdgLd/3UyIDf+yuqIKuE9RsY=@buildroot.org
X-Gm-Message-State: AOJu0YyviQYssVSr6xBQPI0sBnCoVwagMZzo5rl7/1VSCZMao6tXJ/9r
 +xhYvqdKVVWXJsCBNXtzALAuOy4VSv6BC4VpumQ/F9EVdvRewaX2WJWD2nlDxfHWeOB+vuS6TfV
 epA80CCE=
X-Gm-Gg: Acq92OFRSZdfBSb6vaGEVZv23JRTW5u8Oc6wKv8Vdjep3u1NWyBqrz6nJzQOXANmvAY
 /qwQavUpqkbzDPDdh9rVKwypEzXZ0bUtXY5PsGE/Ys+qInlZFAAddU2oBXguSOyJbN1+z/UbNeC
 fMkm291AOezlQ9IrqUajkZHJMZ8EjCFZ4hAOo44H/Ex+gBfErcakn9VeTlD5XAIiUoA4FxCsYBy
 wenRrY7+MlHK8Jhfn2mBx91f93RGXX4L2X0VKkLIx53p/QB98LmyFClSsiRTMbxRLoHdIdxPf+N
 jiFSCDbz1bvRhP08EdYlM0v56I4z2gdhU8o/HsfvEaiovz+8KqkaiFIql5TAQqM98XnKGMKbpwr
 0gKQ+cLnYX22A7TBQGgnNlOlp8dsv4sY7/Iuue/Az3gZrcDybTYMlSTTxUNTlBwBhReHOZULUZD
 OOE8KTIBJqHv1LG+u8rT3Db3wixO5jYYgaORO13iIR50FufEfUjXJiaotibtOLF2gjji8BgyyU4
 eyyni9JFuMERcKMFks1mcoFTx96C0zCxf4STNIaMX6jTUvVLWqKOeIUJTapAJ0jjA==
X-Received: by 2002:a05:600c:1389:b0:48f:de4e:882b with SMTP id
 5b1f17b1804b1-48fe60e524dmr57805655e9.6.1778855766232; 
 Fri, 15 May 2026 07:36:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab3977sm71477805e9.9.2026.05.15.07.36.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 07:36:05 -0700 (PDT)
Message-ID: <9b2f8fe9-71ca-4bd0-b2fa-ff1cb72224a2@smile.fr>
Date: Fri, 15 May 2026 16:36:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20260221184550.3080991-1-giulio.benetti@benettiengineering.com>
Content-Language: fr, en-US
In-Reply-To: <20260221184550.3080991-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778855766; x=1779460566; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=v0X3ZRMxQtxwmA7ID0k3Vq5zVGRxPQx/YoWeCwUQ+hA=;
 b=sOY+XQ0KCzukj7t5RI4yjTk7fyh078qhz/6hkIpSwVr189bh3z0VinHTQmIPeotarp
 xP9pvQxGCK3FDIDW1Qg9/wJXdYhZwpdhAES1XqteUP5JC57UCH1cSAZbX6OgEODRaJKA
 xbz3qH9qH3nKLopmK+tuz10XgjOlVRDLN/uIo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=sOY+XQ0K
Subject: Re: [Buildroot] [PATCH] package/zlib-ng: fix build failure for
 PowerPC soft-float
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

SGVsbG8gR2l1bGlvLCBBbGwsCgpMZSAyMS8wMi8yMDI2IMOgIDE5OjQ1LCBHaXVsaW8gQmVuZXR0
aSBhIMOpY3JpdMKgOgo+IEFzIHN1Z2dlc3RlZCBpbiB0aGlzIHJldmlld1sxXSwgd2hlbiBidWls
ZGluZyBmb3IgUG93ZXJQQyB3aXRoIHNvZnQtZmxvYXQKPiBlbmFibGVkLCBsZXQncyBhbHNvIGRp
c2FibGUgYm90aCBXSVRIX1BPV0VSOC85IHRoYXQgaW4gb3JkZXIgZGlzYWJsZXMKPiBhbGwgdGhl
IHBvc3NpYmxlIFBvd2VyUEMgYWNjZWxlcmF0aW9uIGluc3RydWN0aW9ucy4KPiAKPiBGaXhlczoK
PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYTBmYTVhMTc1YzU0Njk5
M2Q4MTgzNzFhMGRlOTNiMmU5ODQ1YTE4My8KPiAKPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS96
bGliLW5nL3psaWItbmcvcHVsbC8yMTUxL2NoYW5nZXMjcjI4MDMyNjQ4ODIKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5n
LmNvbT4KPiAtLS0KPiAgcGFja2FnZS96bGliLW5nL3psaWItbmcubWsgfCA1ICsrKysrCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS96
bGliLW5nL3psaWItbmcubWsgYi9wYWNrYWdlL3psaWItbmcvemxpYi1uZy5tawo+IGluZGV4IDU5
ZTRlMTUyODIuLjkyZTM2NTliNTkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS96bGliLW5nL3psaWIt
bmcubWsKPiArKysgYi9wYWNrYWdlL3psaWItbmcvemxpYi1uZy5tawo+IEBAIC0zMCw2ICszMCwx
MCBAQCBlbHNlCj4gIFpMSUJfTkdfQ09ORl9PUFRTICs9IC1EV0lUSF9ORU9OPU9GRgo+ICBlbmRp
Zgo+ICAKPiAraWZlcSAoJChCUjJfUE9XRVJQQ19TT0ZUX0ZMT0FUKSx5KQo+ICsjIEV4cGxpY2l0
bHkgZGlzYWJsZSBQb3dlclBDIGFjY2VsZXJhdGlvbnMKPiArWkxJQl9OR19DT05GX09QVFMgKz0g
LURXSVRIX1BPV0VSOD1PRkYgLURXSVRIX1BPV0VSOT1PRkYKPiArZWxzZQo+ICBpZmVxICgkKEJS
Ml9wb3dlcnBjX3Bvd2VyOCkseSkKPiAgWkxJQl9OR19DT05GX09QVFMgKz0gLURXSVRIX1BPV0VS
OD1PTgo+ICBlbHNlCj4gQEAgLTQxLDUgKzQ1LDYgQEAgWkxJQl9OR19DT05GX09QVFMgKz0gLURX
SVRIX1BPV0VSOT1PTgo+ICBlbHNlCj4gIFpMSUJfTkdfQ09ORl9PUFRTICs9IC1EV0lUSF9QT1dF
Ujk9T0ZGCj4gIGVuZGlmCj4gK2VuZGlmCgpJIHdvdWxkIHN1Z2dlc3QgYWRkaW5nIEJSMl9QT1dF
UlBDX1NPRlRfRkxPQVQgaW4gZWFjaCBpZiBjbGF1c2U6CgojIHpsaWItbmcgUG93ZXJQQyBhY2Nl
bGVyYXRpb24gaW5zdHJ1Y3Rpb25zIGFyZSBub3Qgc3VwcG9ydGVkIGZvciBQb3dlclBDIHdpdGgK
c29mdC1mbG9hdC4KaWZlcSAoJChCUjJfcG93ZXJwY19wb3dlcjgpOiQoQlIyX1BPV0VSUENfU09G
VF9GTE9BVCkseTopClpMSUJfTkdfQ09ORl9PUFRTICs9IC1EV0lUSF9QT1dFUjg9T04KZWxzZQpa
TElCX05HX0NPTkZfT1BUUyArPSAtRFdJVEhfUE9XRVI4PU9GRgplbmRpZgoKaWZlcSAoJChCUjJf
cG93ZXJwY19wb3dlcjkpOiQoQlIyX1BPV0VSUENfU09GVF9GTE9BVCkseTopClpMSUJfTkdfQ09O
Rl9PUFRTICs9IC1EV0lUSF9QT1dFUjk9T04KZWxzZQpaTElCX05HX0NPTkZfT1BUUyArPSAtRFdJ
VEhfUE9XRVI5PU9GRgplbmRpZgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gIAo+ICAkKGV2YWwg
JChjbWFrZS1wYWNrYWdlKSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
