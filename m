Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73806CD6E4A
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 09:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0846242DB3;
	Sat, 30 May 2026 09:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5x2NlXXIoMI; Sat, 30 May 2026 09:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2EEC42D6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780134906;
	bh=cIMEGHGwafwH0PyfpNhYs6O1seiZbN2RwSpUYlu1/yA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I4ZvZMJdvaKwDIHIpUVk2ZhOeveDn15cHhnXh5eKB1VNFz7VbaPKI7ysgFp9Hb0z5
	 wrE6JsB1PCfFOax1XCpX8eLRzpBurAjSon7uqCvQ2jVds/7gsIkUSngSugg3nacVCa
	 SMvBARMDRR5dxw7p07Q+lyoZncnWStupx03CAOUHoYjateAVrTMUMZwx6vb5CqKkUI
	 HDp0tzc/SAfFSlckn2DBA09CQagBLG4CorB3/iwKSVrvCA/MMJyCEW333gz9xl4ivV
	 hA2UfjnDHgXmbFvfhTGeOUMu7s4zJiQNizef+/1I39YA8I1E3iG5P3yBEMpJ3MmQoq
	 frMnpS5ppXaRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2EEC42D6E;
	Sat, 30 May 2026 09:55:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B9F3D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C9F9407D2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ju1FyE7se9Z4 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 09:55:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04E3A406F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04E3A406F0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04E3A406F0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 09:55:02 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4906869f0cbso73471555e9.1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 02:55:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780134900; x=1780739700;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uc48TNQb4L5k9MI7hh//0hUloz4UlnJe7RcQYnwrqVw=;
 b=FFipMnjb+/AtNJv8S9N7MnB22T2j5IwV9dV2OKHRBbEb8pGkSbnbuCuZh22bGtNmIk
 bL9g+bXMoSu12dhFKDrQV6JshCihA9s6qObHuL3DMu+aU0NRwshpMeabSdQ3UsFruEIg
 IvQaxIDYo9XU/6qLFjM0/Oz3YQ8vifLcbLiniJrY3Fnl85zorIQwuctDWY8U9HC0tS1p
 6jEUh0BCGYggIREVOgyFr+7gL7DUfoIFkntYSHcz4+HgagcUn7ZOwAqCSwC+kAKUTWRZ
 teZQnmsVbjEUGE201KWZ8OhTwhhcRZUlvHR4hIUoqc7RDdWDB83BpWtG2YQI380MWZeE
 IzdQ==
X-Gm-Message-State: AOJu0YyP+8Vs2T4ceXLJvch+3roOlpOLkGcEjK96zBxiSNrGap459m71
 hvYmOFrL1VQ7/y0adPycr/PKb2K7+3sfhfnMjCQauuyzc4e2vYKkKZ/THwKh7O8U0w4=
X-Gm-Gg: Acq92OEfrefgk9ZamvyzAdJIJZ/jys8qZ8qQFsbodh6AdHhhdbj8BC8LQ2WIMCUu4I/
 xSJSBIg0fkNirGTCqORldMGafBmJoXqTvv0FVUMK8LAsOefECv4EL19xlLdgg8Fa2CtDiLwsYgw
 0p3/CLolU7yDjot1VCLqXBkKsWC7c6dnh6nKzW+LaW/eXD8Gs7XKtU320sBttdKYtY1ioD7OsCy
 6wKl8B4pxRegNaLZhAaksY3Tw0zUva3bZfWTvC+wuEdBNkE5kTxhgwzG9jLPCB0CFln77aLYzUz
 SfN4/TV84qYVfwEQ637YXMlWuelhQTWHdSfFE8EO+5jJ6bRvz4pA73hZE7LT/Ye3h6DxUN363Ly
 DpuRcs/bIrIiALljHInLUjDoGiwm+mPypbo/3B+98NjynLYPgr+2aU9UbRt3GuOKNovINEaTG+N
 0Kha2YEYhOuHFoNdBKLjSr7o2S5fvvNd/kEvftygVWJrdSaNdv5aCt1hVvmTyxo88PdaW4dLMyF
 TBuu8MnHcHJJfLlpjM=
X-Received: by 2002:a05:600d:8498:10b0:489:5022:39a4 with SMTP id
 5b1f17b1804b1-490a2915da1mr39271795e9.9.1780134899757; 
 Sat, 30 May 2026 02:54:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef?
 ([2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909ca6db64sm101837385e9.6.2026.05.30.02.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 May 2026 02:54:59 -0700 (PDT)
Message-ID: <22a288c8-0eb8-496d-a966-cee7ac5d244f@mind.be>
Date: Sat, 30 May 2026 11:54:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
References: <ahPrm_0gVDGw5B5-@waldemar-brodkorb.de>
 <756cd9fedba04ceaca7ab15bd4d37f14@free.fr>
Content-Language: en-US
In-Reply-To: <756cd9fedba04ceaca7ab15bd4d37f14@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780134900; x=1780739700; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Uc48TNQb4L5k9MI7hh//0hUloz4UlnJe7RcQYnwrqVw=;
 b=OFsv8p02aalHMjFqZL/5bAclr8nYJo0Rhk15KHZ8e0hFI+AUzafMHiZwktZ6bknqsW
 TIXtX2M18D44m8MEz5NhEkec1jFUW+BBiAvOpNZpHFaaU9W4UEL8vdqRXpSdFeGDlSl1
 dml0l6Kda9/uCS7VJEN1ZtWPpVq/pIfuwBTwlnxcHcDmPcsQQY59Aye/3SU/Z57B4/U4
 nBzsLqFOjyMwhWUGbUiAqB7tdENMM/YXZYyskKg13+AddVd02lhvhArrPx1jwIodyD+3
 1jAhBLcFBvvo4CMp06QVx9KnhjlGd6SBP+iTUc6GMJkq7bv64zMBVdZ6TuQMdK1drqwG
 WpPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OFsv8p02
Subject: Re: [Buildroot] [PATCH for next] package/uclibc: bump to 1.0.58
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLCBXYWxkZW1hciBhbmQgYWxsLAoKSSBiZWxpZXZlIHdlIHNob3VsZCBhbHNv
IGFwcGx5IHRoaXMgb24gbWFzdGVyOgoKT24gMjUvMDUvMjYgMTQ6MzUsIEp1bGllbiBPbGl2YWlu
IHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gT24gMjUvMDUvMjAyNiAwODoyNiwgV2FsZGVtYXIgQnJv
ZGtvcmIgd3JvdGU6Cj4+IE5ldyByZWxlYXNlIHdpdGggZm9sbG93aW5nIGNoYW5nZXM6Cj4+Clst
LSBzbmlwIC0tXQo+PiBXYWxkZW1hciBCcm9ka29yYiAoNyk6Cj4+IMKgwqDCoMKgwqAgYml0cy9z
dGF0eC5oOiBhZGQgc29tZSBtaXNzaW5nIGRlZmluZXMKPj4gwqDCoMKgwqDCoCBiaXRzL3N0YXR4
Lmg6IHN5bmMgc3RydWN0IHdpdGggZ2xpYmMKPj4gwqDCoMKgwqDCoCBzeXMvZmFub3RpZnkuaDog
c3luYyB3aXRoIG11c2wKPj4gwqDCoMKgwqDCoCBsaWJpY29udjogZml4IHR5cGVkZWYgb2YgaWNv
bnZfdApeXl5eXl5eXl5eXl5eXl5eXl4KVGhpcyB1Y2xpYmMgbGliaWNvbnYgY29tbWl0IGFjdHVh
bGx5IGZpeGVzIGEgc2FtYmE0IGJ1aWxkIGZhaWx1cmUuClRoZSBpc3N1ZSBpcyBwcmVzZW50IG9u
IG1hc3RlciwgYW5kIG5vIGxvbmdlciBvbiBuZXh0ICh0ZXN0ZWQgd2l0aCAKLi91dGlscy90ZXN0
LXBrZyAtcCBzYW1iYTQgLVQgYm9vdGxpbi1hcm12NS11Y2xpYmMpLgoKS2luZCByZWdhcmRzLApU
aXRvdWFuCj4+IMKgwqDCoMKgwqAgbWlzYzogYWRkIHVuaWNvZGUgY2hhcmFjdGVyIGZ1bmN0aW9u
cyAoYzExKQo+PiDCoMKgwqDCoMKgIG5ldGluZXQvdGNwLmg6IHN5bmMgd2l0aCBnbGliYwo+PiDC
oMKgwqDCoMKgIGJ1bXAgdmVyc2lvbiBmb3IgMS4wLjU4IHJlbGVhc2UKPj4KPj4gU2lnbmVkLW9m
Zi1ieTogV2FsZGVtYXIgQnJvZGtvcmIgPHdieEBvcGVuYWRrLm9yZz4KPgo+IEFwcGxpZWQgdG8g
bmV4dCwgdGhhbmtzLgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
