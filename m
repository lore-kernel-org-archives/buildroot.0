Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7B7CD4F3D
	for <buildroot@archiver.kernel.org>; Sun, 17 May 2026 22:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F60C42880;
	Sun, 17 May 2026 22:01:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOyAFm3INp8B; Sun, 17 May 2026 22:01:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85CE242884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779055281;
	bh=ppTIIw9uoOTRLbK3qTjgnfYBvQ7clniboG13auweGMo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=WJ4G3OA1t4KgOlEmnCLfRwTPZx12r/GHTa/f1bouTBuEFMDwIbW+En/6pfGQkl+M/
	 IYMW9xMDFvgHHUZaKnxlXHBv93q3qZrBaewCZ4MwG/J+8u1fLRgKpZ9mrU4F8rlSqx
	 IbaMMGsELchkeNGChNxKE1PgyN0I2rc8uAwlf6EAhONg2j/pLYyaDSn+9mIl23z98N
	 THubZ50zFtZJpTXmeNzRO9lRKjsODYcRLtPmvsXrDlrHcr5ZfAoPBzlYbxZhvBA9Vl
	 qv++S/rz9z/CjBsljZmVCZLhqX7uZBXsseoU2lw4EcK720bD/3l8CWDuH0SjaXCAQn
	 qViMXCf5gSWYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85CE242884;
	Sun, 17 May 2026 22:01:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D8B4390
 for <buildroot@buildroot.org>; Sun, 17 May 2026 22:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5455542884
 for <buildroot@buildroot.org>; Sun, 17 May 2026 22:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AvBCPqkzawxC for <buildroot@buildroot.org>;
 Sun, 17 May 2026 22:01:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 215F742880
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 215F742880
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 215F742880
 for <buildroot@buildroot.org>; Sun, 17 May 2026 22:01:18 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4891c00e7aeso9742645e9.2
 for <buildroot@buildroot.org>; Sun, 17 May 2026 15:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779055277; x=1779660077;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+lTxRPQVvAuOiIJSpEuxJNJ4tIK21oS7cBxgwJc/Idc=;
 b=ald5BvkQCZzXSWrsZlVLR3giNDzAXegQRo1D5hkFLmXGCck+kOq4uFGBoC5FKvtXZX
 weU7NFK7KKXJd7Biv4675Ktu/5KKyfrozkQSO4ZN3r2qnw9/dCb8D3uyoh7zocI44Z1j
 99UpJYBHukFXvwD/YubcYIviUi31xgyHrFwl1CnRh5UGMarc/OhesmG92N7zCamet55z
 wi90DVW89QWsODiUkXbh1e2Wscw9apNKVrlGU8Ggf/Mp6BbtlP4V4jJ+OVk2COMpzon2
 KTtxvKwTRvhzgqzggNDe8VkdaEbjCMWh3rsdR+w0D4JdLTa2JUMv9HMI2tdgj43da1tO
 pKnQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Fmdbq8hZWWm/OmAcdIfBMsQdvM+cP/ZUJ0lOTu0NB2V3wnuIcJ0yUFvnWGUCdOG6NGSakUyB+LAQ=@buildroot.org
X-Gm-Message-State: AOJu0Yw6CP5yIMfwzVd2c0Ey0moI7zxGjzQcGvXlT/80MFUh0dpkk6sv
 S7EPfbPwCupsvoA1TYcbl7w8XPDpjdizz/gI2cWzdR0CC6KMs5GWcGnoEQMTJySCkQ4=
X-Gm-Gg: Acq92OHHbu5n2UL6Y4g4m9C4i7Kkc/xx0g1j/ufdjCYYXiRm+yIfxm6zdLt56W6zNld
 tqjmLcAvWg1nLGoCsmS1Tx877VvYZcMh5wxEJjjkb1nGJuRBpju0DYyU7aLOjeqviINDZBvgyWc
 vdxOWO3PrGgTP57bGVwpRqqStRfP/Xa/lalWhvOen0NYoiWa8ztbuuTj2un5MAd2aLNXiNq47YK
 zH+7WCOgzysoqedU75dhjij3Br2Jvu8XhaEYQIuYhBlyaD4+7poe4XeTLdS0OKpJIxt4yNBbLJ4
 ZKpqokafBcHBwP9h0fRyPJvo6x1xJCA6MKHe/WljCydDYHLqcUTET5cVfa/c+Lp07yICXymQBZZ
 LYlaXJ+e5BWDb4dHqjfc0Kf8DDmJIHcYMQtzgD8p2v9duLFEfiijTJBOFyUnziS1hIWzp6yatrT
 AZGxQtvZQigiG4OyBnM1evrOVxG/WyVwF1YEI7Z/A1st+85Jf2WioDKGqWq19K2TxbWgoURtvge
 BcOWl8WxET49yPzFo/BbtM8xrL5vWWTzh5ypgLhdiRQfGuZvWk8HHqFOt0SP2Hq1g==
X-Received: by 2002:a05:600c:8189:b0:48e:89f9:9408 with SMTP id
 5b1f17b1804b1-48fe632374fmr194448035e9.20.1779055276417; 
 Sun, 17 May 2026 15:01:16 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe5ab527asm236982865e9.11.2026.05.17.15.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2026 15:01:16 -0700 (PDT)
Message-ID: <eb747a3f-9ca6-4ca2-8730-b72104609489@smile.fr>
Date: Mon, 18 May 2026 00:01:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20260516203118.672513-1-giulio.benetti@benettiengineering.com>
Content-Language: fr
In-Reply-To: <20260516203118.672513-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1779055277; x=1779660077; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+lTxRPQVvAuOiIJSpEuxJNJ4tIK21oS7cBxgwJc/Idc=;
 b=lsqsAmNUCf/5PudMnd9PiyeqnX1+HsYHZLRLCbqGTujwgsqEJ3io1Q+dJR37p4Pw19
 ZrnSylQ49YJlyyRw06f0GuWY/Lef5cE7BtEaZ3iRJA0tsPs0IuWz49YzAfx6FlMVabX7
 cgnrpKG0su8lqlYZdtcCXB5yThV2WitVTx3DE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=lsqsAmNU
Subject: Re: [Buildroot] [PATCH v2] package/zlib-ng: fix build failure for
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

SGVsbG8gR2l1bGlvLCBBbGwsCgpMZSAxNi8wNS8yMDI2IMOgIDIyOjMxLCBHaXVsaW8gQmVuZXR0
aSBhIMOpY3JpdMKgOgo+IEFzIHN1Z2dlc3RlZCBpbiB0aGlzIHJldmlld1sxXSwgd2hlbiBidWls
ZGluZyBmb3IgUG93ZXJQQyB3aXRoIHNvZnQtZmxvYXQKPiBlbmFibGVkLCBsZXQncyBhbHNvIGRp
c2FibGUgYm90aCBXSVRIX1BPV0VSOC85IHRoYXQgaW4gb3JkZXIgZGlzYWJsZXMKPiBhbGwgdGhl
IHBvc3NpYmxlIFBvd2VyUEMgYWNjZWxlcmF0aW9uIGluc3RydWN0aW9ucy4KPiAKPiBGaXhlczoK
PiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYTBmYTVhMTc1YzU0Njk5
M2Q4MTgzNzFhMGRlOTNiMmU5ODQ1YTE4My8KPiAKPiBbMV06IGh0dHBzOi8vZ2l0aHViLmNvbS96
bGliLW5nL3psaWItbmcvcHVsbC8yMTUxL2NoYW5nZXMjcjI4MDMyNjQ4ODIKPiAKPiBTaWduZWQt
b2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5n
LmNvbT4KPiAtLS0KPiBWMS0+VjI6Cj4gKiBjaGFuZ2UgdG8gY2xlYW5lciBNYWtlZmlsZSBjb2Rl
IHN0eWxlIGFzIHN1Z2dlc3RlZCBieSBSb21haW4gTmFvdXIKClRoYW5rcyBmb3IgdGhlIHVwZGF0
ZS4KCkFwcGxpZWQgdG8gbWFzdGVyLiBUaGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAt
LS0KPiAgcGFja2FnZS96bGliLW5nL3psaWItbmcubWsgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS96bGliLW5nL3psaWItbmcubWsgYi9wYWNrYWdlL3psaWItbmcvemxpYi1uZy5tawo+IGlu
ZGV4IDU5ZTRlMTUyODIuLjQ0ODQ1Nzc5OWUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS96bGliLW5n
L3psaWItbmcubWsKPiArKysgYi9wYWNrYWdlL3psaWItbmcvemxpYi1uZy5tawo+IEBAIC0zMCwx
MyArMzAsMTMgQEAgZWxzZQo+ICBaTElCX05HX0NPTkZfT1BUUyArPSAtRFdJVEhfTkVPTj1PRkYK
PiAgZW5kaWYKPiAgCj4gLWlmZXEgKCQoQlIyX3Bvd2VycGNfcG93ZXI4KSx5KQo+ICtpZmVxICgk
KEJSMl9wb3dlcnBjX3Bvd2VyOCk6JChCUjJfUE9XRVJQQ19TT0ZUX0ZMT0FUKSx5OikKPiAgWkxJ
Ql9OR19DT05GX09QVFMgKz0gLURXSVRIX1BPV0VSOD1PTgo+ICBlbHNlCj4gIFpMSUJfTkdfQ09O
Rl9PUFRTICs9IC1EV0lUSF9QT1dFUjg9T0ZGCj4gIGVuZGlmCj4gIAo+IC1pZmVxICgkKEJSMl9w
b3dlcnBjX3Bvd2VyOSkseSkKPiAraWZlcSAoJChCUjJfcG93ZXJwY19wb3dlcjkpOiQoQlIyX1BP
V0VSUENfU09GVF9GTE9BVCkseTopCj4gIFpMSUJfTkdfQ09ORl9PUFRTICs9IC1EV0lUSF9QT1dF
Ujk9T04KPiAgZWxzZQo+ICBaTElCX05HX0NPTkZfT1BUUyArPSAtRFdJVEhfUE9XRVI5PU9GRgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
