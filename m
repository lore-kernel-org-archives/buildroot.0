Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D46AC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:00:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AABA860EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AABA860EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F73983168;
	Sun, 25 Jul 2021 13:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgbrCRy5Pt2y; Sun, 25 Jul 2021 13:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D356E83410;
	Sun, 25 Jul 2021 13:00:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C4B01BF470
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 691948305C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 12:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1HqrjHK0T5u1 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 12:58:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTP id E16F883168
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 12:58:43 +0000 (UTC)
Received: from smtpclient.apple ([151.19.144.97])
 by Aruba Outgoing Smtp  with ESMTPA
 id 7diImt6ggnxSq7diJmjiCS; Sun, 25 Jul 2021 14:58:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1627217920; bh=x1H5Iltxi4cblE9xdPLV+4Z8omYCFLclsjDFf+LlVUU=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=XOcUqRtFaZ0hAEXW38oKtcTg/9KDRPlP7/N+8XB1mRADE+ftWiDSTGvrgv4b9PrPP
 rvSkHX4TEi5r1dto+AVhUV1dSwUMR0A4wZHee0OvILJmcPZxZJyj3oOW22scv4wz5v
 x3GOUM93qeirQq4qdkQ0bQmJPLjFBNnQZmK9oy0HcvhE+k2Nps5XupJ9HwTFB2hOBP
 O+lNLjHTxnZw0ekGfuEt6Wb8co7sw3y4obiok/PEnRsxEsm1NzTu5pUrA8lqrLDYzP
 Hw16Jay3velF43mliCj4J0xV+v00rG7Ou/UWNoi8680S+L8VeBK8nKo/y0/MqP2Vpv
 dZKw1bOt4rVsw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 25 Jul 2021 14:58:38 +0200
Message-Id: <B05B41C4-B158-4FC1-872A-F3BAC16C6405@benettiengineering.com>
References: <20210725145154.1067abb3@windsurf>
In-Reply-To: <20210725145154.1067abb3@windsurf>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: iPhone Mail (18F72)
X-CMAE-Envelope: MS4wfK4eFtTGkkTrBJo0xoNTXLgnSODwDSQkiWaiifmpbBRR5M/CTDCS1jNJPX774sCAAL5rOoIzXNlEtd6tnFUgqmArVndCu1Bw/gGTcdLe3+/txbnf4IRC
 tfbhDiTukL0291I5eUM1LJk9VW40E8isXbTIwMYWAkhjHta9DmXXOzS98wsJ2oZjD83BEs4LtPps6P7crcQwRZehUj6iWYVIHpPNbQS2zb6X5pIZs6DPHdxx
 88UPpmyGMxXOSgWQPjqSYQ==
Subject: Re: [Buildroot] [PATCH] package/libgeos: improve Config.in comments
 with binutils bugs
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8gVGhvbWFzLAoKPiBJbCBnaW9ybm8gMjUgbHVnIDIwMjEsIGFsbGUgb3JlIDE0OjUyLCBU
aG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBoYSBzY3JpdHRv
Ogo+IAo+IO+7v0hlbGxvIEdpdWxpbywKPiAKPj4gT24gU2F0LCAyNCBKdWwgMjAyMSAyMjo1NToz
NyArMDIwMAo+PiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVy
aW5nLmNvbT4gd3JvdGU6Cj4+IAo+PiBBdCB0aGUgbW9tZW50IGlmIHBhY2thZ2UgaXMgbm90IGF2
YWlsYWJsZSBkdWUgdG8gYmludXRpbHMgYnVncyBjb21tZW50Cj4+IG9ubHkgc3RhdGVzIHRoYXQg
aXQncyBub3QgYXZhaWxhYmxlIGJlY2F1c2UgdG9vbGNoYWluIGlzIG1pc3NpbmcgQysrLAo+PiB3
Y2hhci4KPiAKPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHlvdSdyZSBzYXlpbmcgdGhhdCwgdGhl
IGV4aXN0aW5nIGNvbW1lbnQgc2F5czoKPiAKPj4gLWNvbW1lbnQgImxpYmdlb3MgbmVlZHMgYSB0
b29sY2hhaW4gdy8gQysrLCB3Y2hhciwgbm90IGJpbnV0aWxzIGJ1ZyAyMTQ2NCwgMjc1OTciCj4g
Cj4gQW5kIGl0IGlzIHByb2JhYmx5IHByaW50ZWQgaWYgYXQgbGVhc3Qgb25lIG9mIHRoZSBmb2xs
b3dpbmcgY29uZGl0aW9ucyBpcyBtZXQ6Cj4gCj4gKiBUb29sY2hhaW4gZG9lc24ndCBoYXZlIEMr
Kwo+IAo+ICogVG9vbGNoYWluIGRvZXNuJ3QgaGF2ZSB3Y2hhcgo+IAo+ICogVG9vbGNoYWluIGhh
cyBidWcgMjE0NjQKPiAKPiAqIFRvb2xjaGFpbiBoYXMgYnVnIDI3NTk3Cj4gCj4gU28sIEkgZG9u
J3QgdW5kZXJzdGFuZCB0aGUgcHVycG9zZSBvZiB5b3VyIHBhdGNoLCBJJ20gc29ycnkgOi8KCk15
IGJhZCwgaXQgd2FzIGZpeGVkIHByZXZpb3VzbHkuIFBsZWFzZSBkcm9wIHRoaXMgcGF0Y2guCgpT
b3JyeSBmb3IgdGhlIG5vaXNlCgpCZXN0IHJlZ2FyZHMKR2l1bGlvIEJlbmV0dGkKCj4gCj4gQmVz
dCByZWdhcmRzLAo+IAo+IFRob21hcwo+IC0tIAo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cj4gaHR0cHM6Ly9ib290bGluLmNvbQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidXN5
Ym94Lm5ldAo+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1
c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
