Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9F5C433F5
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 19:43:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A43E61167
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 19:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A43E61167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3544E4063E;
	Fri, 10 Sep 2021 19:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbLJ5xstH1NT; Fri, 10 Sep 2021 19:43:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61EE4402D9;
	Fri, 10 Sep 2021 19:43:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 223991BF352
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 19:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 121CC6067B
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 19:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pb73QVgUS11p for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 19:43:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC57B606A8
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 19:43:15 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPA
 id OmQbmFmHUiqGsOmQbmbMlR; Fri, 10 Sep 2021 21:43:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631302994; bh=3/DeZ3rLYzpFdWkAm7BwS4S0Rt8ffP6Wgv5LFIiwDGg=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=CHPeoW6exBnO6p0XWRZ0kEAquOvt/X15SUbCORlEVkBGIQBlj3IrfYQ/yJAzSroPn
 9XkyOT0bkOT1tc5epEZMh/PEG4wb7mEmbKZ6jipMpZZ+7Ck5SXNuqlqgDXlS6Xe/dR
 5GLZQzONGzPqCW0VZfAI+u+Lli4EpTrZ0pyxyYL/+vJqjMO6+3MaTT1qBp1P1zPF82
 LEtIt5Vznppfdxpa1Iu3EtcDc6fuDs6lNr6XYsz5jZY/ypeS2ftNOy7gzNyq0N4F1/
 ugU9el6M5npbWwOwEuBsqZrMGdcbxytSrLyEqm53j2bocTdiPd/puEd2Pk3UGVnrXU
 1qivjFGi6LBlw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 10 Sep 2021 21:43:13 +0200
Message-Id: <6AE92217-9CCD-4F8D-A98F-314ABC3C1233@benettiengineering.com>
References: <20210910171815.6d6d00ea@windsurf>
In-Reply-To: <20210910171815.6d6d00ea@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfI0W9ZTH44jtDW9l+FxqKpZhVLW9Q59VuiKlVTLfuCpcv6VOAmpW0G/LS5FJ4ez84Zd5aIu4clXvrTXH8LjTGrG/1CvMF98egpvjk0U4zJu0fnxYRkoT
 pr90JiZZVR4BOvx3HgFt/yk6n0M/my/GbmD8JtXXFIc5WO5bMztxTf/J67ApXwMpRmumxfPwMd6ogh7PvYfS2axGfo9z2Zlxf47MzJd9oIkHi4ObxN0rn/7S
 udRyG2u+PcR+kymJUIkEa53ozJSkaK+TpA9G7gTNGpe+jM2+JnQGBv9uqoqyH2pq
Subject: Re: [Buildroot] Arc and C-Sky toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gVGhvbWFzLAoKPiBJbCBnaW9ybm8gMTAgc2V0IDIwMjEsIGFsbGUgb3JlIDE3OjE4LCBU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRv
Ogo+IAo+IO+7v09uIFdlZCwgOCBTZXAgMjAyMSAyMzoyOTowNyArMDIwMAo+IEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiB3cm90ZToKPiAKPj4g
SSBjYW4ndCB1bmRlcnN0YW5kIHRoZSByZWFzb24gd2h5IEFyYyBhbmQgQy1Ta3kgcHJvdmlkZSBh
IHNwZWNpYWwgCj4+IHRvb2xjaGFpbihpLmUuIHN5bm9wc2lzIGdjYzEwKSBpbnN0ZWFkIG9mIHRy
ZWF0aW5nIHRoZW0gbGlrZSBleHRlcm5hbCAKPj4gdG9vbGNoYWlucy4gQ2FuIHlvdSBoZWxwIG1l
IGluIHVuZGVyc3RhbmRpbmcgdGhpcz8KPiAKPiBZb3UncmUgY29uZnVzaW5nIHRoaW5ncyBoZXJl
Lgo+IAo+IEFSQyBhbmQgQy1TS1kgc3VwcG9ydCBpcyAod2FzIGZvciBBUkMpIG5vdCBpbiB1cHN0
cmVhbQo+IGdjYy9iaW51dGlscy9nZGIsIHNvIHdlIGhhdmUgKGhhZCkgdG8gdXNlIHNwZWNpZmlj
IGZvcmtzIG9mIHRoZXNlCj4gcHJvamVjdHMsIHRoYXQgaGF2ZSBzdXBwb3J0IGZvciB0aG9zZSBD
UFUgYXJjaGl0ZWN0dXJlcy4KCkFoIGhlcmUgaXMgdGhlIHJlYXNvbiwgdGhleSB3ZXJlIG5vdCB1
cHN0cmVhbWVkCgo+IAo+IFRoaXMgaXMgY29tcGxldGVseSBpbmRlcGVuZGVudCBmcm9tIHRoZSBh
YmlsaXR5IHRvIHVzZSBleHRlcm5hbAo+IHRvb2xjaGFpbnMgZm9yIHRob3NlIENQVSBhcmNoaXRl
Y3R1cmVzLgo+IAo+IEFuIGV4dGVybmFsIHRvb2xjaGFpbiBpcyBhIHByZS1jb21waWxlZCB0b29s
Y2hhaW4uIEhlcmUgd2hhdCB3ZSB3YW50IGlzCj4gc3VwcG9ydCBmb3IgQVJDIGFuZCBDLVNLWSBp
biBvdXIgaW50ZXJuYWwgdG9vbGNoYWluIGJhY2tlbmQsIHdoZXJlCj4gQnVpbGRyb290IGJ1aWxk
cyBnY2MvYmludXRpbHMvZ2RiL2xpYmMuCgpBbGwgY2xlYXIgbm93LiBUaGFuayB5b3UgdmVyeSBt
dWNoLgpTbyBuZXh0IHBhdGNoZXMgcmVnYXJkaW5nIEFSQyBnY2MxMCBtYWtlIHNlbnNlLgoKQmVz
dCByZWdhcmRzCkdpdWxpbyBCZW5ldHRpCgo+IAo+IEJlc3QgcmVnYXJkcywKPiAKPiBUaG9tYXMK
PiAtLSAKPiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4gRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPiBodHRwczov
L2Jvb3RsaW4uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
