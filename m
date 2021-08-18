Return-Path: <SRS0=Hlwc=NJ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA0BC4338F
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:54:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79EAF610FF
	for <buildroot@archiver.kernel.org>; Wed, 18 Aug 2021 21:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79EAF610FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36C26403BD;
	Wed, 18 Aug 2021 21:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2sIVwUkeDlM; Wed, 18 Aug 2021 21:54:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F5B40455;
	Wed, 18 Aug 2021 21:54:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 71DF71BF2C7
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C7F24042F
 for <buildroot@lists.busybox.net>; Wed, 18 Aug 2021 21:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pu2RQsjlsuMZ for <buildroot@lists.busybox.net>;
 Wed, 18 Aug 2021 21:54:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0DAD4019A
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 21:54:00 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q6so5746545wrv.6
 for <buildroot@buildroot.org>; Wed, 18 Aug 2021 14:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wDWW+gZ0wIeOOkt7QH541ttK9T6Cvu/4qJ+Wl4aQ5eU=;
 b=e0ohnZ5ytM3emgY3rzPzmkIMFfj6oNBS1FZMof6m4tTHUN13w7FNHN9QZQeUIelexe
 zqSrljI6O4X4uEOb9eMp5TKHPeP5jzEQ6vTX0soSNhoZeikmDImImI3zUIaA4v35n4aA
 ZCIciq5vtar+2yWZb7Gh0lSYdLzfjiaWWuVGdU8wF57b6mXsfai5Gf05+AynB5yaswMG
 YkYvcmr1YDuyGS1iqxmOBaayNRICFihM4HtQmAvYNDZO94Kfze68smABeshKzH5t2lc0
 r+1YQDO66nEw5/a4Pbe+pMdxNEo0y7hzZiToiYYKqpPjUVG76CdJr/5HPw/Pg3MAp2FT
 VZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=wDWW+gZ0wIeOOkt7QH541ttK9T6Cvu/4qJ+Wl4aQ5eU=;
 b=l2suvW6mrNO++RBjotpMkuV5rLvubG8HKudJaV/jbO6bAJ/rpH3oGyL+NrEZ/78xVw
 /tOMUGIxRd3uSQTbidIcJqRShOk8AytdJxWABT+Y4XHlVTgj4sB2QJfVBRNrGVO8Xr4w
 SNnNzn5i4FdDBvTYObcs+VhtpQ2e3QTS0zgEmUlA1cdW/peYSw5F7ZmZcq7A7f+siYuc
 bHawlYjocm09lmBOMvfBdU2hI5zxUpxorVo6rDPo4QI8K+il7d9UUVVIu2lsm3CqUlMf
 dIXCAKPZv1wfuMTOspzhuWM2ZHB4HcQF0u2Q2PsUJmq4uMsC1asuZu2s2i5QtlBHsbvX
 wFZw==
X-Gm-Message-State: AOAM533s337dddlMMGwO0yrNIdXD4UNEeS9sHfhw0ash+iwJN8uBL9sT
 5DyarlJvQdzkVaAGZwwJkMPyxX/7Cet7K/22
X-Google-Smtp-Source: ABdhPJzOgO4Y5urtRTzwcFhoYGAQObal8VHCE+u3SdfsdwNOcUZBrFlhwdt4CI1IVCrJm2bf2p21aw==
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr13269661wrv.72.1629323638820; 
 Wed, 18 Aug 2021 14:53:58 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id x18sm1009632wrw.19.2021.08.18.14.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 14:53:58 -0700 (PDT)
Date: Wed, 18 Aug 2021 23:53:55 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <YR2Bc4t7UMIDUhgb@pevik>
References: <20210804172259.9143-1-petr.vorel@gmail.com>
 <20210804213019.6cf2a25d@windsurf>
 <e85b8610-6f8c-c581-138a-a73d6131f521@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e85b8610-6f8c-c581-138a-a73d6131f521@gmail.com>
Subject: Re: [Buildroot] [RFC][PATCH 1/1] package/glibc: bump version to
 2.34-5-g9995d0588f4f9adc68419224d2b3698e2ca4f77e
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGkgUm9tYWluLAoKPiBIZWxsbywKCj4gTGUgMDQvMDgvMjAyMSDDoCAyMTozMCwgVGhvbWFzIFBl
dGF6em9uaSBhIMOpY3JpdMKgOgo+ID4gSGVsbG8gUGV0ciwKCj4gPiBPbiBXZWQsICA0IEF1ZyAy
MDIxIDE5OjIyOjU5ICswMjAwCj4gPiBQZXRyIFZvcmVsIDxwZXRyLnZvcmVsQGdtYWlsLmNvbT4g
d3JvdGU6Cgo+ID4+IEFsc28gdXBncmFkZSB0byBvbiBSSVNDLVYgKHRoYXQgY291bGQgaGF2ZSBi
ZWVuIGRvbmUgaW4gZDVjZTNiNWRiNSkKCj4gPj4gU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8
cGV0ci52b3JlbEBnbWFpbC5jb20+Cj4gPj4gLS0tCj4gPj4gSGksCgo+ID4+IEkgdGVzdGVkIGl0
IHdpdGggYnVpbGRpbmcgcGNfeDg2XzY0X2VmaV9kZWZjb25maWcsIGFkZGluZyBuZnMtdXRpbHMs
Cj4gPj4gbHRwLXRlc3RzdWl0ZSBhbmQgZmV3IG90aGVyIHRvb2xzLiBOb3Qgc3VyZSBpZiB0aGlz
IGlzIGVub3VnaCBmb3IKPiA+PiB0ZXN0aW5nLgoKPiA+IEkgdGhpbmsgdGhhdCB3aGF0IFJvbWFp
biBOYW91ciB0eXBpY2FsbHkgZG9lcyBpcyBydW4gYWxsIHFlbXVfKgo+ID4gZGVmY29uZmlncyAo
b2YgY291cnNlIHR3ZWFrZWQgdG8gdXNlIGdsaWJjIGluc3RlYWQgb2YgdWNsaWJjKSwgYW5kIHB1
c2gKPiA+IHRoZW0gdG8gR2l0bGFiLCBzbyB0aGF0IHRoZXkgZ2V0IGJ1aWxkIHRlc3RlZCAqYW5k
KiBib290IHRlc3RlZCB1bmRlcgo+ID4gUWVtdS4KCj4gSW5kZWVkLCB0aGUgcnVudGltZSB0ZXN0
IGlzIG9ubHkgYSBib290IHRlc3QuIEkndmUgbG9va2VkIGF0IHRoZSBnbGliYyB0ZXN0c3VpdGUK
PiBidXQgaXQncyBkaWZmaWN1bHQgdG8gc2V0dXAgd2l0aCBhIGNyb3NzLWNvbXBpbGVkIHN5c3Rl
bSBydW5uaW5nIHVuZGVyIFFlbXUgaW4gYQo+IENJIChnbGl0bGFiKS4KSSBob3BlZCB0aGVyZSB3
b3VsZCBiZSBzb21lIHNldHVwIHJlYWR5LCBidXQgdW5kZXJzdGFuZCB0aGVyZSBpcyBub3RoaW5n
LgoKPiBGb3IgdGVzdGluZywgdXBzdHJlYW0gc3VnZ2VzdCB0byB1c2UgYSBORlMgdG8gc2hhcmUg
dGhlIGdsaWJjIHNvdXJjZXMgYmV0d2Vlbgo+IHRoZSBob3N0IGFuZCB0aGUgdGFyZ2V0IChub3Qg
dmVyeSBoYW5keSk6Cj4gaHR0cHM6Ly9zb3VyY2V3YXJlLm9yZy9nbGliYy93aWtpL1Rlc3Rpbmcv
VGVzdHN1aXRlCkluZGVlZCBub3QgdmVyeSBoYW5keS4KCj4gU29tZSB0ZXN0cyByZXF1aXJlcyBh
IG1pbmltYWwgYW1vdW50IG9mIFJBTSB0aGF0IGlzIG5vdCBhbHdheXMgcHJvdmlkZWQgYnkgUWVt
dQo+IHRhcmdldC4KCj4gVGhlcmUgaXMgYWxzbyBsaWJjLXRlc3QgcHJvamVjdCBmcm9tIG11c2wg
cHJvamVjdDoKPiBodHRwczovL3dpa2kubXVzbC1saWJjLm9yZy9saWJjLXRlc3QuaHRtbApJbnRl
cmVzdGluZywgYWx0aG91Z2ggbm90IHN1cmUgaG93IHJlbGV2YW50IGlzIGZvciBnbGliYyAod291
bGQgcmVxdWlyZSB0bwpjb21wYXJlIHdpdGggb2xkIHJlbGVhc2UpLgoKPiBJbmRlZWQgcnVubmlu
ZyBzb21lIHRlc3RzIGZyb20gbHRwLXRlc3RzdWl0ZSB3b3VsZCBiZSBiZXR0ZXIgdGhhbiBub3Ro
aW5nLgo+IE9uIHRoZSBvdGhlciBoYW5kIHdlIGNhbiBkZXRlY3QgZW5vdWdoIGJvb3QgaXNzdWUg
cmVsYXRlZCB0byB0b29sY2hhaW4gdXBncmFkZQo+IHRvIGtlZXAgdXMgYnVzeS4KClRoYW5rcyBm
b3IgYWxsIHN1Z2dlc3Rpb25zLiBJJ20gbm90IHN1cmUgd2hlbiBJIGdldCB0byBpdCwgYnV0IHRo
ZSBtYXggd2hpY2gKdGltZSBhbGxvd3Mgd2lsbCBwcm9iYWJseSBiZSBqdXN0IHRvIGJvb3Qgd2l0
aCBxZW11IGFuZCBydW4gTFRQIHN5c2NhbGxzLgoKS2luZCByZWdhcmRzLApQZXRyCgo+IEJlc3Qg
cmVnYXJkcywKPiBSb21haW4KCgo+ID4gVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
