Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A82BDC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 20:27:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 512F061242
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 20:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 512F061242
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1719340290;
	Sun, 22 Aug 2021 20:27:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4aTO0VuAOMmo; Sun, 22 Aug 2021 20:27:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DC354029A;
	Sun, 22 Aug 2021 20:27:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3D8491BF44C
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 20:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 266BC40180
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 20:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IFR-SFKD_pYT for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 20:27:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AB134000B
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 20:27:12 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x12so22986224wrr.11
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 13:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zodzfxA1Ypsm11N7jvNH38azfejggCWuntLuqJDJyKA=;
 b=JaDYLxupCnTEibVZYFlxl2FQD6n9YFYYciB/R850t1JnfH0S31+2p9FyByINUyPsQW
 Orsm/GoV+BMNurT+nFmYO/x8kmZJU2qQPIrabiz1tuOLk1Z4zvRJnXo7TheI5jPIHVnc
 xgSeirMIZn9gzKo6CMjkFvX5uqzKJ/6R4IZuTJ9dSOBu4mqGGo3Wvm3+etLc5fj1yFG+
 791S698H4/dHYe8oLe4phs4swDkNhGxasQ9QFCh4+YTNfiCO6A8R1E0Pu6k2HgJpVoFe
 kFKq9xR8H7vnjO+KsuBsbhlrm5/6DgDqg/GELu0hzstUqxiypvf3e3VXQ+L+AjF8NsXs
 inaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zodzfxA1Ypsm11N7jvNH38azfejggCWuntLuqJDJyKA=;
 b=S9NrLg1XkowbLCiu6AzpTCbDhtBilYul54eCzQjEQWJdhVwOszSymTcJhGpKYuP779
 8PpKm5muRL2ZUXJtZtDGZHDr3M9EO7lRlunvm0jA2BuY/4S6aP1NdcFgLRcG2KXE6UC5
 ELlblfGGBYr6peyWkel/3MNOZ38iUem2p2vsID+oQrhwNHTEBsgb6L+U6gzqlE2147O+
 L8Iki1JlYLQB+utiuiZ19wZNXmQhCd5AYVX0Lm5kVqNShVrzM3SfAXgt21XM7tOgH6IH
 R/6IRflraRAh8cp1aB9CTG7TDZcst86Y91qTLLibEv2TSwNcdOSooIdcgdlFX1WpQDLK
 rMEw==
X-Gm-Message-State: AOAM530lmD1uviDIxD5EPbyWA9ynwxVCD6+4AUiSB+luoXWERyTqVME2
 adNik+oxAJckT1NpQII5dW4=
X-Google-Smtp-Source: ABdhPJwVxk1SG6HoyUat2SHVIOWN6AhPRx1R04ojijvXBAZU9/FM5Ti6bPkpSeZsCk2nnZ6MUp/AzQ==
X-Received: by 2002:a05:6000:114d:: with SMTP id
 d13mr10054524wrx.295.1629664030872; 
 Sun, 22 Aug 2021 13:27:10 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id o6sm12806068wru.92.2021.08.22.13.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 13:27:10 -0700 (PDT)
To: =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org, Philippe Serbruyns <Philippe.Serbruyns@ugent.be>
References: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <e25ad303-2283-20c4-5ce6-c893bf38376d@gmail.com>
Date: Sun, 22 Aug 2021 22:27:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] package/zfs: Fix cross-platform-compilations
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gSm9zw6kgTHVpcywKCkxlIDIyLzA4LzIwMjEgw6AgMjI6MDUsIEpvc8OpIEx1aXMgU2Fs
dmFkb3IgUnVmbyBhIMOpY3JpdMKgOgo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGBtYWtlYCBleGVj
dXRlZCBmcm9tIHRoZSBga2VybmVsLm00YCBpbgo+IGNyb3NzLXBsYXRmb3JtLWNvbXBpbGF0aW9u
cyBlbnZpcm9ubWVudHM6Cj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL2Jsb2IvemZz
LTIuMC41L2NvbmZpZy9rZXJuZWwubTQjTDU4OAo+IAo+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1
aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgo+IC0tLQo+IEhl
bGxvIGFsbC4KPiAKPiBAUm9tYWluIE5hb3VyLCB0aGlzIHBhdGNoIHdpbGwgZml4IHRoZSBidWls
ZHJvb3QgZ2l0bGFiIENJLgoKSW5kZWVkIGl0IGZpeCB0aGUgaXNzdWUhCgpUZXN0ZWQtYnk6IFJv
bWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KCj4gCj4gQFBoaWxpcHBlIFNlcmJy
dXlucyzCoHRoaXMgcGF0Y2ggd2lsbCBmaXggeW91ciBpc3N1ZSB3aXRoIHlvdXIgcnBpNC4KPiAK
PiAgcGFja2FnZS96ZnMvemZzLm1rIHwgMTMgKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMubWsg
Yi9wYWNrYWdlL3pmcy96ZnMubWsKPiBpbmRleCAzYjFhZmI0MTlhLi4yNDA2NGNiYTgyIDEwMDY0
NAo+IC0tLSBhL3BhY2thZ2UvemZzL3pmcy5tawo+ICsrKyBiL3BhY2thZ2UvemZzL3pmcy5tawo+
IEBAIC0xMyw2ICsxMywxOSBAQCBaRlNfQ1BFX0lEX1BST0RVQ1QgPSBvcGVuemZzCj4gIAo+ICBa
RlNfQVVUT1JFQ09ORiA9IFlFUwo+ICAKPiArIyBjcm9zcyBjb21waWxlIGVudmlyb25tZW50IGZv
ciBsaW51eCBrZXJuZWwgbW9kdWxlCj4gK1pGU19NQUtFX0VOViA9IFwKPiArCUhPU1RDQz0iJChI
T1NUQ0MpICQoSE9TVF9DRkxBR1MpICQoSE9TVF9MREZMQUdTKSIgXAo+ICsJQVJDSD0kKEtFUk5F
TF9BUkNIKSBcCj4gKwlDUk9TU19DT01QSUxFPSIkKFRBUkdFVF9DUk9TUykiIFwKPiArCURFUE1P
RD0kKEhPU1RfRElSKS9zYmluL2RlcG1vZAoKWW91IGNhbiByZXBsYWNlIGFsbCA0IGxpbmVzIHdp
dGggJChMSU5VWF9NQUtFX0ZMQUdTKSBoZXJlIGluc3RlYWQuCgo+ICsjIGAuL2NvbmZpZ3VyZWAg
d2lsbCBleGVjdXRlIGEgYG1ha2UgbW9kdWxlc2AgdGVzdCBjYXNlCj4gK1pGU19DT05GX0VOViA9
IFwKPiArCUhPU1RDQz0iJChIT1NUQ0MpICQoSE9TVF9DRkxBR1MpICQoSE9TVF9MREZMQUdTKSIg
XAo+ICsJQVJDSD0kKEtFUk5FTF9BUkNIKSBcCj4gKwlDUk9TU19DT01QSUxFPSIkKFRBUkdFVF9D
Uk9TUykiIFwKPiArCURFUE1PRD0kKEhPU1RfRElSKS9zYmluL2RlcG1vZAoKU2FtZSBoZXJlLgoK
Cgo+ICsKPiAgWkZTX0RFUEVOREVOQ0lFUyA9IGxpYmFpbyBvcGVuc3NsIHVkZXYgdXRpbC1saW51
eCB6bGliCj4gIAo+ICAjIHN5c3Zpbml0IGluc3RhbGxzIG9ubHkgYSBjb21tZW50ZWQtb3V0IG1v
ZHVsZXMtbG9hZC5kLyBjb25maWcgZmlsZQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVz
eWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
