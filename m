Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76FBC432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 13:24:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D83610C9
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 13:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41D83610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=petri.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 071E56142E;
	Thu, 26 Aug 2021 13:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XXIjHR_kAQsZ; Thu, 26 Aug 2021 13:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4285E6142F;
	Thu, 26 Aug 2021 13:24:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7BB751BF391
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 13:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B5296142F
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 13:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tERm_f3AifjV for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 13:24:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BF086142E
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 13:24:50 +0000 (UTC)
Received: from [10.9.9.72] (helo=submission01.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <jonah@petri.us>)
 id 1mJFN6-0006EU-2W; Thu, 26 Aug 2021 15:24:44 +0200
Received: by submission01.runbox with esmtpsa [Authenticated ID (799462)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1mJFMq-0000KN-T6; Thu, 26 Aug 2021 15:24:29 +0200
Message-ID: <55b4305a-036b-43bb-0c3f-9a3840954e47@petri.us>
Date: Thu, 26 Aug 2021 09:24:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:92.0) Gecko/20100101
 Thunderbird/92.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, Baruch Siach <baruch@tkos.co.il>
References: <20210824203841.1554763-1-jonah@petri.us>
 <e8372342-ccd7-9be9-5e78-da1a31ad9162@mind.be> <87fsuwa16g.fsf@tarshish>
 <900b3187-f679-5331-c344-634bdf78abbd@mind.be>
From: Jonah Petri <jonah@petri.us>
In-Reply-To: <900b3187-f679-5331-c344-634bdf78abbd@mind.be>
Subject: Re: [Buildroot] [PATCH v2 1/1] toolchain: handle toolchains with
 multiple ld*.so.* files
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

T24gOC8yNi8yMSA4OjI0IEFNLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4+PiArICAg
ICAgIGlmICEgZmluZCAtd2hvbGVuYW1lICQoU1RBR0lOR19ESVIpJy9saWIvbGQqLnNvLionID4g
L2Rldi9udWxsOyB0aGVuIFwKPiAgIFdpdGggbm8gcGF0aCwgZmluZCBkZWZhdWx0cyB0byB0aGUg
Y3VycmVudCBkaXJlY3RvcnkuIEhvd2V2ZXIsIFNUQUdJTkdfRElSIGlzCj4gdGhlIGZ1bGwgYWJz
b2x1dGUgZGlyZWN0b3J5LCBzbyB3aG9sZW5hbWUgaXMgbmV2ZXIgZ29pbmcgdG8gbWF0Y2ggaXQu
IEl0IHNob3VsZAo+IHByb2JhYmx5IGJlCj4KPiBmaW5kICQoU1RBR0lOR0RJUikgLXdob2xlbmFt
ZSAkKFNUQUdJTkdESVIpL2xpYi9sZCouc28uKgo+Cj4gICBJbiBhZGRpdGlvbiwgaG93ZXZlciwg
ZmluZCdzIGV4aXQgY29kZSBkb2Vzbid0IHNheSBhbnl0aGluZyBhYm91dCB3aGV0aGVyIGl0Cj4g
d2FzIGZvdW5kIG9yIG5vdC4gU28gd2UgaW5zdGVhZCBoYXZlIHRvIHVzZSB0aGUgcHJpbnRlZCBv
dXRwdXQgYW5kIGNoZWNrIGlmIGl0J3MKPiBub24tZW1wdHkuCj4KPiAgIEZpbmFsbHksIGFzIGFu
IG9wdGltaXNhdGlvbiwgd2UgY291bGQgdXNlIC1xdWl0IHRvIG1ha2Ugc3VyZSBpdCBleGl0cyBh
ZnRlciB0aGUKPiBmaXJzdCBtYXRjaCBpbnN0ZWFkIG9mIG5lZWRsZXNzbHkgY29udGludWluZy4K
Pgo+Cj4gICBBcyBCYXJ1Y2ggc2FpZCwgaG93ZXZlciwgdGhpcyBpcyB0b28gcmlza3kgZm9yIG1h
c3Rlciwgc28gaWYgYSB2MyBjb21lcyBpdCB3aWxsCj4gYmUgYXBwbGllZCB0byBuZXh0LgoKCkhp
IEFybm91dCAmIEJhcnVjaCwKClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLCBhbmQgSSBhcG9sb2dp
emUgZm9yIHRoZSBicmVha2FnZS7CoCBJJ20gCmVtYmFycmFzc2VkIGJ5IG15IGluY29ycmVjdCBh
c3N1bXB0aW9uIGFib3V0IHRoZSByZXR1cm4gdmFsdWUgb2YgZmluZCAKKHdvdywgSSd2ZSBiZWVu
IHVzaW5nIHRoYXQgaW5jb3JyZWN0bHkgZm9yIGEgbG90IG9mIHllYXJzISkgYW5kIEkgCnVuZGVy
c3RhbmQgYW5kIGFwcHJlY2lhdGUgdGhlIHJlc3Qgb2YgdGhlIGNvbW1lbnRzIGFib3ZlLgoKSSds
bCB3YWl0IGZvciB0aGUgbmV4dCByZWxlYXNlIHRvIGNvbXBsZXRlIGFuZCB0aGVuIHB1dCBpbiBh
IHYzLgoKVGhhbmtzIGZvciBidWlsZHJvb3QhCgpKb25haAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
