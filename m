Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E5FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 20:21:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F68861B3B
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 20:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F68861B3B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1825640150;
	Sat,  2 Oct 2021 20:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mdtc64WPHn_x; Sat,  2 Oct 2021 20:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2116B400FC;
	Sat,  2 Oct 2021 20:21:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F31841BF2B9
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 20:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF98684437
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 20:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9Soch3vAZ_D for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 20:21:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 171BB84436
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 20:21:06 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id s21so21481961wra.7
 for <buildroot@buildroot.org>; Sat, 02 Oct 2021 13:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z7KxjfXVF3mvmkzAELlTTiArVbovVa6k4y10hn/TETk=;
 b=GOFA4hU5Auckx9IQN/Ro8qagwztSArQLud8xZCmoJqBms4M4m2T64Agj4tsCEEuZkI
 c5yD3DHRDLhYUif5wzcjw1o3YW0U0edIkG9PWoeFbQeZovTDAnpD80hchBsiW7Ze7Ycw
 VdFTJiyDp+003m0cxZffJI/+GKWyIKICv2zspRA4fCvKluRS9BhDjG3b/pIxxPsEMNzY
 aMrQOxTDrfiK+GWQTJIdmN5boxt9Idb0U6fy7UYjGGds1eR7pzxr+NRbX4TdPlbq/1tB
 Jj07f8jBta1vYWMYu5OKt01emTnPbnpcYOcrSUCOhfvLhHTPIvf6NwDGpha9S2nNhF/g
 isVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z7KxjfXVF3mvmkzAELlTTiArVbovVa6k4y10hn/TETk=;
 b=zh2GRSd90Th29DSHXXDaP+G0Uzd804/0H0MML+S9CR+rZtGh6QU6SWXTpgXv03vQrS
 raUGccrv/f6fKjKRKBsfbu31yQ8Ff64nZXiiXPukwVGmbT4eDgmNFXjyy7vzCMV64c/p
 OmGqnnegVGcE8WyZFnMq16aEifd0YrisbHB4xCcC3VeHOl4N2cZL0rDO8e4+Z+xFu0r1
 gYBlkUCqh3YT3IERpc3+J4SyMrPqidpYMpz+HVXjNZqVfawjEWzzCBvRvngbYE8oVTfN
 MAWztNT3vctQ3MLUR9Dl6wBdGWfq+hIftMClibZicUUBISFzOIeFOpZTktB3LszHS02e
 d8kw==
X-Gm-Message-State: AOAM531449NCQ8snd9XM444dwoPjSFaVFmvQJpKwN4jwwaJbH257sJjw
 08+v1Ro+NdYgjhPDmNnYc0hO9ZMia9g=
X-Google-Smtp-Source: ABdhPJxGywb0GK9pqIn1zuSTtoxgtj/JvXUPUpAZEi5WuSFZCNCDjiMr52fWJdb4Hz0Cp1YAguQkTw==
X-Received: by 2002:a5d:608e:: with SMTP id w14mr4928144wrt.119.1633206064160; 
 Sat, 02 Oct 2021 13:21:04 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id s2sm9127788wrn.77.2021.10.02.13.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 13:21:03 -0700 (PDT)
Message-ID: <96717f4f-256e-0fc6-fa20-979233a6093a@gmail.com>
Date: Sat, 2 Oct 2021 22:21:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <37a2790a-8c48-1cfd-a160-567618850bbe@gmail.com>
 <24407e05-d940-826a-690f-5bbe1aeec252@mind.be>
 <6d635d7e-e88a-3b23-9682-a19ff3d08b7d@gmail.com>
 <20211002202534.40ca92ee@windsurf>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20211002202534.40ca92ee@windsurf>
Subject: Re: [Buildroot] csky 8xx toolchain issue
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
Cc: Guo Ren <ren_guo@c-sky.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMDIvMTAvMjAyMSDDoCAyMDoyNSwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiBPbiBTYXQsIDIgT2N0IDIwMjEgMTc6NTg6
MjQgKzAyMDAKPiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+IHdyb3RlOgo+
IAo+PiBUaGUgY3NreSB0b29sY2hhaW4gaXMgc3RpbGwgYnJva2VuIHdpdGggcmVjZW50IGhvc3Qg
Y29tcGlsZXIgYW5kIG91ciBDSSB3aWxsCj4+IHN3aXRjaCB0byBEZWJpYW4gYnVsbHNleWUgc29v
bi4KPj4KPj4gSSB0cmllZCB0byBidWlsZCB3aXRoIHRoZSBsYXRlc3QgdXBzdHJlYW0gdmVyc2lv
biBvZiBiaW51dGlscywgZ2NjIGFuZCBnbGliYyBhbmQKPj4gbm90aGluZyBidWlsZC4KPj4KPj4g
dXBzdHJlYW0gZ2NjLTExIGRvZXNuJ3Qgc3VwcG9ydCBjc2t5NjEwIGFuZCBjc2t5ODYwIG5lZWRl
ZCBmb3IKPj4gcWVtdV9jc2t5NjEwX3ZpcnRfZGVmY29uZmlnIGFuZCBxZW11X2Nza3k4NjBfdmly
dF9kZWZjb25maWcuCj4+Cj4+IHFlbXVfY3NreTgwN192aXJ0X2RlZmNvbmZpZyBhbmQgcWVtdV9j
c2t5ODEwX3ZpcnRfZGVmY29uZmlnIGZhaWwgdG8gYnVpbGQgZ2xpYmMKPj4gd2l0aCB0aGUgZm9s
bG93aW5nIGVycm9yOgo+Pgo+PiBnbGliYy0yLjM0LTktZzlhY2FiMGJiYTZhNWE1NzMyM2IxZjk0
YmY5NWIyMTYxOGE5ZTVhYTQvYnVpbGQvZWxmL2xpYnJ0bGQub3M6IGluCj4+IGZ1bmN0aW9uIGBf
X3N5bmNfZmV0Y2hfYW5kX2FkZF8yJzoKPj4KPj4gYnVpbGQvaG9zdC1nY2MtaW5pdGlhbC0xMS4y
LjAvYnVpbGQvY3NreS1idWlsZHJvb3QtbGludXgtZ251YWJpdjIvbGliZ2NjLy4uLy4uLy4uL2xp
YmdjYy9jb25maWcvY3NreS9saW51eC1hdG9taWMuYzoxMTY6Cj4+IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYF9fa2VybmVsX2NtcHhjaGcnCj4+Cj4+IEJ1dCBldmVuIGlmIHRoZSBidWlsZCBzdWNj
ZWVkZWQgdGhlcmUgaXMgbm8gcWVtdSBiaW5hcnkgdG8gZG8gYSBydW50aW1lIHRlc3QuCj4gCj4g
Q29uc2lkZXJpbmcgdGhlc2UgaXNzdWVzIGFuZCB0aGUgZmFjdCB0aGF0IHRoZXJlIGhhcyBiZWVu
IG5vIHVwZGF0ZXMgaW4KPiB0ZXJtcyBvZiBDLVNLWSBzdXBwb3J0IGZvciBhIGxvbmcgdGltZSwg
SSB0aGluayB3ZSBzaG91bGQgY29uc2lkZXIKPiBkcm9wcGluZyBzdXBwb3J0IGZvciB0aGUgQy1T
S1kgQ1BVIGFyY2hpdGVjdHVyZS4KCmNza3k4NjAgd2lsbCBiZSBzdXBwb3J0ZWQgYnkgZ2NjIDEy
OgpodHRwczovL2djYy5nbnUub3JnL2dpdC8/cD1nY2MuZ2l0O2E9Y29tbWl0ZGlmZjtoPWRiOTJi
ZDIyM2UzOTU3ZWU1OGI1YTBjMGZmZmQ4Yjc3NjZmMWRlZjMKCkJ1dCBubyBzaW5nIG9mIGNrNjEw
LgoKVGhpcyBjcHUgYXJjaGl0ZWN0dXJlIGlzIHJlYWxseSB5b3VuZyBzbyB0aGUgdG9vbGNoYWlu
IHN1cHBvcnQgbmVlZHMgdG8gYmUKbWFpbnRhaW5lZCByZWd1bGFybHkuIEVzcGVjaWFsbHkgc2lu
Y2UgdGhlcmUgaXMgbm90IHVwc3RyZWFtIFFlbXUgc3VwcG9ydCB0byBkbwphIHJ1bnRpbWUgdGVz
dC4KCkZvciBleGFtcGxlLCB3ZSBrbm93IHRoYXQgQVJDIGFyY2hpdGVjdHVyZSBpcyBtYWludGFp
bmVkIGJ5IFN5bm9wc3lzIGJlY2F1c2UgaXQKcmVxdWlyZSBhIHRvb2xjaGFpbiBiYXNlZCBvbiBm
b3JrZWQgdmVyc2lvbiBvZiBiaW51dGlscyBhbmQgZ2NjLiBBbHNvIG1vc3Qgb2YKdGhlIHVwc3Ry
ZWFtIHdvcmsgaGFzIGJlZW4gZG9uZSBvdmVyIHRoZSB5ZWFycyBhbmQgYmFja3BvcnRlZC9tYWlu
dGFpbmVkIGludG8KQnVpbGRyb290LgoKSSBkb24ndCBsaWtlIHRvIGhhdmUgdG8gcmVtb3ZlIGNz
a3kgZHVlIHRvIHRvb2xjaGFpbiBidWlsZCBpc3N1ZXMuLi4KCkJlc3QgcmVnYXJkcywKUm9tYWlu
CgoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gCj4gVGhvbWFzCj4gCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
