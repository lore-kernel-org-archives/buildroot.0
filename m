Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9702AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 09:10:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 101E761360
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 09:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 101E761360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D01B983ECC;
	Wed, 22 Sep 2021 09:10:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 47CeYrF1RDeQ; Wed, 22 Sep 2021 09:10:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33B4C83ED8;
	Wed, 22 Sep 2021 09:10:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 93F761BF3E8
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 09:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9090083ED8
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 09:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-IiDDGnP7e1 for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 09:10:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7EAA83ECC
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 09:10:40 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id h20so1918120ilj.13
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 02:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lyrL5PiFN6wJkhaRosfe0a2rwyaolFftGirNS6E0DIE=;
 b=qayOr9raHvQ9NB/QLmH0flvbO3y2mMABwlHOrIi3ItLv9xWiDWx8EXZdMfELQQtiJQ
 4MUchRC85zSNfpSyJ6QvXE5/qa3EII5kJjriSmp5Af15tOQkwXsIoeTLUMFm98AvKVsi
 FVbsA2mvvX/1i/oROy9draNZOIXo80LtO18BavIL5Z2UD8BrnwToU1TsVFdxH8eRvJ5r
 bxkfzpMWReC7Sx4HRqJT2PsgBkNaGW2nA+JhgOtfg5qHCPHc1vvqoGb1JhvnXDpe7gmn
 i7QcvETkGeSn9uC6hhplUMP62rgQO+t5iQHwhaY76+LHmW4FLvnhLIt5B8w2UKuv8dc1
 BdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lyrL5PiFN6wJkhaRosfe0a2rwyaolFftGirNS6E0DIE=;
 b=zg0ODzI0V3wcdBV334/RjOglH4kRdIZPsifEmfxwHOfvrdCzNraTFtDBVfCIgVdO1N
 ojhxEPMBSRB+ihYRH1h0UBY3vjsykcazMVTSLr4f7gVclLBe/61pBtith0PGzNnsPTmw
 O8WnF65OF3l/2XnwHjivcC2tkxRTrlvyuCXdjYhpnyjAO+dHuBCqg1oxmdy/NwXq3b5W
 b/8B+zcfwdhH2CKo2V7v+pujLV2kaOA876zPVRJEXrNAZEdiwYghZrDMJnOdDMh5NFLc
 grDBf4yMxyDzFGWQY79kPsVEXOGF+MZpaJuFqNF6qX2+msoTGpTeHjVY539Wn32xreJK
 VvpA==
X-Gm-Message-State: AOAM531ORNJYqgWhPG0xQqZ5rOps4CT2jXGnBhUBNEvVbODiXFEtoON7
 s1gSNOT+zpa9WX79hb7bj8EeA9eCGI83CyDo+6E=
X-Google-Smtp-Source: ABdhPJy3iKAFucbyohwG4Dn3UUzrXfOInn4EmBDVKIuOYGZlE7DbXjheEDBv7BSYhbE9M/1iVH/W40slzJyFY6zL+dk=
X-Received: by 2002:a05:6e02:1a46:: with SMTP id
 u6mr8060566ilv.214.1632301840035; 
 Wed, 22 Sep 2021 02:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210913072942.30109-1-patrickdepinguin@gmail.com>
 <20210913072942.30109-2-patrickdepinguin@gmail.com>
 <1d202363-484d-cc2a-818f-2b1b4fb7b358@mind.be>
In-Reply-To: <1d202363-484d-cc2a-818f-2b1b4fb7b358@mind.be>
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 22 Sep 2021 11:10:29 +0200
Message-ID: <CAAXf6LUGQ54q35i8nY9mfTKbEjTUBnObwMSfz5PNXF9wHWSSGw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 2/2] toolchain/helpers.mk: gdbinit: set
 auto-load-safe-path before sysroot
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGkgQXJub3V0LAoKRWwgbWFyLCAyMSBzZXB0IDIwMjEgYSBsYXMgMjI6NDYsIEFybm91dCBWYW5k
ZWNhcHBlbGxlCig8YXJub3V0QG1pbmQuYmU+KSBlc2NyaWJpw7M6Cj4KPgo+Cj4gT24gMTMvMDkv
MjAyMSAwOToyOSwgVGhvbWFzIERlIFNjaGFtcGhlbGVpcmUgd3JvdGU6Cj4gPiBGcm9tOiBUaG9t
YXMgRGUgU2NoYW1waGVsZWlyZSA8dGhvbWFzLmRlX3NjaGFtcGhlbGVpcmVAbm9raWEuY29tPgo+
ID4KPiA+IFRoZSBnZGJpbml0IHN1cHBsaWVkIGJ5IEJ1aWxkcm9vdCBkb2VzIHR3byB0aGluZ3M6
Cj4gPiBBLiBzcGVjaWZ5IHRoZSBzeXNyb290IHdoZXJlIGdkYiBjYW4gZmluZCBzaGFyZWQgbGli
cmFyaWVzCj4gPiBCLiBtYXJrIHRoZSBzeXNyb290IGFzIGEgJ3NhZmUgcGF0aCcgZm9yIGl0cyBh
dXRvLWxvYWQgZmVhdHVyZSwgdG8gbWFrZSBzdXJlCj4gPiAgICB0aGF0IHByZXR0eSBwcmludGVy
cyBmb3IgbGlic3RkYysrLnNvIGFyZSBhZGRlZCBhdXRvbWF0aWNhbGx5IChzZWUgY29tbWl0Cj4g
PiAgICA2ZmIzMjE2YTgwYzY0YzA4Mzc1NDI5ZDg5NDk3ZWFlZWM1NjIyMTUwKQo+ID4KPiA+IFdo
ZW4gZGVidWdnaW5nIGEgY29yZSBmaWxlLCBhbmQgdGhlIGdkYmluaXQgZmlsZSBpcyBzcGVjaWZp
ZWQgdmlhICcteCcKPiA+IHJhdGhlciB0aGFuICctaXgnLCB0aGVuIHRoZSBvcmRlciBvZiB0aGVz
ZSBzZXR0aW5ncyBtYXR0ZXJzOiBJZiB5b3UgZmlyc3QKPiA+IHNldCB0aGUgc3lzcm9vdCwgdGhl
biBnZGIgd2lsbCBpbW1lZGlhdGVseSBzdGFydCBmaW5kaW5nIHRoZSBzaGFyZWQKPiA+IGxpYnJh
cmllcyBpdCBuZWVkcyBmb3IgdGhlIGNvcmUgZmlsZSwgZGV0ZWN0IGxpYnN0ZGMrKyBhbmQgaXRz
IGFzc29jaWF0ZWQKPiA+IGxpYnN0ZGMrKy1nZGIucHkgZmlsZSwgdGhlbiBnaXZlIGEgYmlnIHdh
cm5pbmcgYWJvdXQgc2FmZSBwYXRoczoKPiA+Cj4gPiAgICB3YXJuaW5nOiBGaWxlICIuLi4vaTY4
Ni1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvbGliL2xpYnN0ZGMrKy5zby42LjAuMjQtZ2Ri
LnB5Igo+ID4gICAgICAgICAgICBhdXRvLWxvYWRpbmcgaGFzIGJlZW4gZGVjbGluZWQgYnkgeW91
ciBgYXV0by1sb2FkIHNhZmUtcGF0aCcgc2V0Cj4gPiAgICAgICAgICAgIHRvICIkZGVidWdkaXI6
JGRhdGFkaXIvYXV0by1sb2FkIi4KPiA+ICAgIFRvIGVuYWJsZSBleGVjdXRpb24gb2YgdGhpcyBm
aWxlIGFkZAo+ID4gICAgICAgICAgICBhZGQtYXV0by1sb2FkLXNhZmUtcGF0aCAuLi4vaTY4Ni1i
dWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvbGliL2xpYnN0ZGMrKy5zby42LjAuMjQtZ2RiLnB5
Cj4gPiAgICBsaW5lIHRvIHlvdXIgY29uZmlndXJhdGlvbiBmaWxlICIvaG9tZS9tZS8uZ2RiaW5p
dCIuCj4gPiAgICBUbyBjb21wbGV0ZWx5IGRpc2FibGUgdGhpcyBzZWN1cml0eSBwcm90ZWN0aW9u
IGFkZAo+ID4gICAgICAgICAgICBzZXQgYXV0by1sb2FkIHNhZmUtcGF0aCAvCj4gPiAgICBsaW5l
IHRvIHlvdXIgY29uZmlndXJhdGlvbiBmaWxlICIvaG9tZS9tZS8uZ2RiaW5pdCIuCj4gPiAgICBG
b3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGlzIHNlY3VyaXR5IHByb3RlY3Rpb24gc2VlIHRo
ZQo+ID4gICAgIkF1dG8tbG9hZGluZyBzYWZlIHBhdGgiIHNlY3Rpb24gaW4gdGhlIEdEQiBtYW51
YWwuICBFLmcuLCBydW4gZnJvbSB0aGUgc2hlbGw6Cj4gPiAgICAgICAgICAgIGluZm8gIihnZGIp
QXV0by1sb2FkaW5nIHNhZmUgcGF0aCIKPiA+Cj4gPiBhbmQgdGhlIHByZXR0eSBwcmludGluZyBj
b2RlIGlzIG5vdCBsb2FkZWQuIFRoaXMgaXMgYmVjYXVzZSB0aGUgc2Vjb25kCj4gPiBsaW5lIGZy
b20gdGhlIGdkYmluaXQgZmlsZSB3YXMgbm90IHlldCBwYXJzZWQgYXQgdGhpcyBwb2ludC4KPiA+
Cj4gPiBCeSBjaGFuZ2luZyB0aGUgb3JkZXIgKGZpcnN0IGNvbmZpZ3VyaW5nIHRoZSBzYWZlIHBh
dGgsIHRoZW4gc2V0dGluZyB0aGUKPiA+IHN5c3Jvb3QpLCB0aGlzIGlzc3VlIGRvZXMgbm90IGFw
cGVhciBhbmQgZXZlcnl0aGluZyBpcyBhcyBleHBlY3RlZC4KPiA+Cj4gPiBOb3RlIHRoYXQgd2hl
biAnLWl4JyB3ZXJlIHVzZWQgaW5zdGVhZCBvZiAnLXgnIHRvIHBhc3MgdGhlIGdkYmluaXQgZmls
ZSB0bwo+ID4gZ2RiLCB0aGVuIHRoZSBvcmRlciB3b3VsZCBub3QgbWF0dGVyLCBiZWNhdXNlIHRo
ZSBlbnRpcmUgZ2RiaW5pdCBmaWxlIHdvdWxkCj4gPiBiZSBwYXJzZWQgYmVmb3JlIGNvbnNpZGVy
aW5nIHRoZSBjb3JlIGZpbGUuCj4gPiBIb3dldmVyLCBldmVuIHRob3VnaCB0aGUgQnVpbGRyb290
IG1hbnVhbCBub3cgc3VnZ2VzdHMgJy1peCcsIHVzZXJzIG1heSBub3QKPiA+IGhhdmUgbm90aWNl
ZCB0aGlzIGNoYW5nZSBhbmQgY29udGludWUgdG8gdXNlICcteCcuCj4KPiAgIFdoYWEsIGV4Y2Vs
bGVudCwgbm90IGNvbnRlbnQgd2l0aCBmaXhpbmcgYSBidWcgb25jZSwgeW91IGZpeCBpdCB0d2lj
ZSEKCgpKdXN0IHRvIGNsYXJpZnk6IHRoZXJlIHdlcmUgdHdvIHNldHMgb2Ygd2FybmluZ3M6Cgox
LiBwcm9ibGVtcyBsb2FkaW5nIHNoYXJlZCBsaWJyYXJpZXMKMi4gcHJvYmxlbXMgd2l0aCB0aGUg
YXV0by1sb2FkIHBhdGggLyBwcmV0dHkgcHJpbnRlcnMKClN3aXRjaGluZyBmcm9tIC14IHRvIC1p
eCBzb2x2ZXMgYm90aCBwcm9ibGVtcy4KQnV0IGlmIHlvdSBzdGljayB3aXRoICcteCcsIHRoaXMg
c2Vjb25kIHBhdGNoIG9ubHkgZml4ZXMgdGhlIHNlY29uZApwcm9ibGVtLCBub3QgdGhlIGZpcnN0
LgoKQmVzdCByZWdhcmRzLApUaG9tYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
