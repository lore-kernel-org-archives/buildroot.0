Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A14C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 427E44093F;
	Sat,  8 Jan 2022 15:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-uSLYamxWt9; Sat,  8 Jan 2022 15:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 967C54091B;
	Sat,  8 Jan 2022 15:05:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 940DF1BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 822668176C
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMde9jTaJvQx for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:05:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9A88C8176B
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:05:06 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id 30so32508287edv.3
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 07:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vln4TPguvH1I/Io4vFQuFbx0v9iKqIbDDZ4TxgNCENE=;
 b=i52OXSwknRjaXxExr/GtZIAAHWP7u9kXyqAFRz5SQFfoqgQaNFn+ho02kKbZak2sSb
 nly6kRJtWhu2kaUcvqu6s9uNJNgdrl8bLVh12xcTUaqGPlo0qmX/6cPXBwyzZ16r05Mu
 TyigThGkOnD22fiqAp2CStWldP1SFuu69jxdzBJx7AnpGJ5XveXN56dqmZwal5jWX5mH
 argG9JrnxBrgcOpjyKRlIYTYCsK3RGSFHPG3LhTe250dDVsaCG//pMYHg5cILuwBk7CD
 dZrnzh6bl6McQgPXXTZsrCkcQqTb4ovnHjyINg7nBLsBRQ4XC/F1j+rWhq8eRr51R50X
 rFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vln4TPguvH1I/Io4vFQuFbx0v9iKqIbDDZ4TxgNCENE=;
 b=1x2I04CTNv4+zWhml2GC4scAgo7IPphuaY6pZ6zLzONeZEucwESAguMdzgnWoruG86
 ifhwmwjXDIdXlZRwvJ9UXX4wsOJ0TadLwsWHON8bWh18ifAwTLmYwapBNIzdb48LXJL6
 aaOE6lV1BGvSuOmLh9V1VGnP4uOFCKO7hgq+yAAIpEoM2vMZmnmwT7YdN1KuDOKxEZsq
 eKcCaPk2n2r5u4b2lMMSsAtgm4zX0KCOocTTHQJSn1w00FRAJZI6gjcZ24tFIE810C5/
 nWzuSZR1RgjNqFDNYDMfWC6zUBuHCvTsCNZGY2APugtrtpP75XR4M7QL/eJ0UZwyf/C4
 wmnA==
X-Gm-Message-State: AOAM530BZOyLxXG3+40JD9KQSy2NMW6R3x4QfdRj5Nyoov/MwqXGeRG0
 Oo3A/SnpB3K66nPKOIfnJfRXJAJfDDGJ8zCWk84=
X-Google-Smtp-Source: ABdhPJz7E7xFsYX31frsqPRuQJ5coDgEXfa2liF71DTDn2Xql2sTKdDOaApWkdnRMX6hxYGHMCuaADcVr2fuaI0Mxt0=
X-Received: by 2002:a17:907:72c6:: with SMTP id
 du6mr51540874ejc.7.1641654304855; 
 Sat, 08 Jan 2022 07:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20211228153345.4087026-1-fontaine.fabrice@gmail.com>
 <20211228164916.2beec0d6@windsurf>
 <CAPi7W80OfGF3AhM2h6mjtsUjLEnYEV4gteJ12GFq4edNysEV5A@mail.gmail.com>
 <20211228181447.2a42dc86@windsurf>
 <ed10db1b-6b39-344d-8c4b-aa0a6d085d40@gmail.com>
 <CAPi7W8094+7P-RRPafDfRgSCe94aqQUfoQ7z=WvGRFsj_wdpww@mail.gmail.com>
 <874k6egvrm.fsf@dell.be.48ers.dk>
In-Reply-To: <874k6egvrm.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 8 Jan 2022 16:03:49 +0100
Message-ID: <CAPi7W80y_knjUqY1TuKsxbqvgPET08pS9vee07zM7HCm9w4qYg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/mbedtls3: new package
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
Cc: Joachim Wiberg <troglobit@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpMZSBzYW0uIDggamFudi4gMjAyMiDDoCAxNToxNCwgUGV0ZXIgS29yc2dhYXJkIDxwZXRl
ckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4KPiA+Pj4+PiAiRmFicmljZSIgPT0gRmFicmlj
ZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyaXRlczoKPgo+IEhpLAo+
Cj4gID4gSW5kZWVkLCB0aGlzIGlzIGFsc28gYW4gYWx0ZXJuYXRpdmUsIGV2ZW4gaWYgSSB0aGlu
ayB0aGF0IGFkZGluZwo+ICA+IG1iZWR0bHMzIHdvdWxkIGJlIGEgZ3JlYXQgYWRkaXRpb24uCj4g
ID4gRm9yIGV4YW1wbGUsIGxpYmN1cmwgc3VwcG9ydHMgbWJlZHRzIDMuMCBzaW5jZSBpdHMgdmVy
c2lvbiA3Ljc5IGFuZAo+ICA+IGh0dHBzOi8vZ2l0aHViLmNvbS9jdXJsL2N1cmwvY29tbWl0LzNm
MTI2MTM4YmUzYzQ1OWEyNzk0ZDM1ZjgxNzBlOTJlNjVhNTBkYWQuCj4gID4gT3RoZXJ3aXNlLCBh
cyByZXF1ZXN0ZWQgYnkgVGhvbWFzLCBJIHNlbnQgYW4gZW1haWwgdG8gbWJlZHRscyBtYWlsaW5n
Cj4gID4gbGlzdDoKPiAgPiBodHRwczovL2xpc3RzLnRydXN0ZWRmaXJtd2FyZS5vcmcvYXJjaGl2
ZXMvbGlzdC9tYmVkLXRsc0BsaXN0cy50cnVzdGVkZmlybXdhcmUub3JnL3RocmVhZC9IRUhDTlFa
VEJPWlY1NlJUR1JUR1NRUVJNRVdZSlBHSS8KPgo+IFdoYXQgaXMgdGhlIHBsYW4gZnJvbSB1cHN0
cmVhbSByZWdhcmRpbmcgbWJlZHRscyAyLng/IFdpbGwgaXQgYmUKPiBtYWludGFpbmVkIGluIHBh
cmFsbGVsIHdpdGggMy54IGZvciBzb21lIHRpbWUgKGFuZCBmb3IgaG93IGxvbmc/KSBvciBpcwo+
IGl0IGVmZmVjdGl2ZWx5IEVPTCBhbHJlYWR5PwoyLjE2LnggaXMgRU9MIHNpbmNlIERlY2VtYmVy
IDIwMjE6Cmh0dHBzOi8vdGxzLm1iZWQub3JnL3RlY2gtdXBkYXRlcy9ibG9nL2Fubm91bmNpbmct
bHRzLWJyYW5jaC1tYmVkdGxzLTIuMTYKVGhlIG5leHQgTFRTIGJyYW5jaCBpcyAyLjI4IHdoaWNo
IHdpbGwgYmUgbWFpbnRhaW5lZCB1bnRpbCBlbmQgb2YKMjAyNDogaHR0cHM6Ly9naXRodWIuY29t
L0FSTW1iZWQvbWJlZHRscy9ibG9iL2RldmVsb3BtZW50L0JSQU5DSEVTLm1kCj4KPiBJZiBpdCBp
cyBFT0wgdGhlbiBJIGd1ZXNzIHdlIHNob3VsZCBqdXN0IHVwZGF0ZSB0aGUgY3VycmVudCBtYmVk
dGxzCj4gcGFja2FnZSB0byAzLnggKGFuZCBkaXNhYmxlIG1iZWR0bHMgc3VwcG9ydCBmb3IgcGFj
a2FnZXMgbm90IGNvbXBhdGlibGUKPiB3aXRoIGl0IHlldCksIGJ1dCBpZiB0aGUgcGxhbiBpcyB0
byBzdXBwb3J0IDIueCBmb3IgcXVpdGUgc29tZSB0aW1lIHRoZW4KPiBpbmRlZWQgYSBzZXBhcmF0
ZSBtYmVkdGxzMyBwYWNrYWdlIG1ha2VzIG1vcmUgc2Vuc2UuCj4KPiAtLQo+IEJ5ZSwgUGV0ZXIg
S29yc2dhYXJkCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
