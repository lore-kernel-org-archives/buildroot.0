Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD9FC4320A
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 20:36:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDADB6113A
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 20:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDADB6113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=petri.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1DBC40151;
	Tue, 24 Aug 2021 20:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mUyIPkRnbzoB; Tue, 24 Aug 2021 20:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDF6E404E6;
	Tue, 24 Aug 2021 20:36:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2FE1BF5A5
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 20:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECEAB404E6
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 20:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id irXIg51dW_Od for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 20:35:57 +0000 (UTC)
X-Greylist: delayed 00:17:58 by SQLgrey-1.8.0
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48E5D40151
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 20:35:57 +0000 (UTC)
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit03.runbox with esmtp (Exim 4.86_2)
 (envelope-from <jonah@petri.us>)
 id 1mId9F-0000mL-6E; Tue, 24 Aug 2021 22:35:53 +0200
Received: by submission02.runbox with esmtpsa [Authenticated ID (799462)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1mId91-0003Hm-Ey; Tue, 24 Aug 2021 22:35:39 +0200
Message-ID: <78204681-4e6d-625e-718a-fe9be05c682b@petri.us>
Date: Tue, 24 Aug 2021 16:35:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:92.0) Gecko/20100101
 Thunderbird/92.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20210824201657.1553593-1-jonah@petri.us>
From: Jonah Petri <jonah@petri.us>
In-Reply-To: <20210824201657.1553593-1-jonah@petri.us>
Subject: Re: [Buildroot] [PATCH] toolchain: handle toolchains with multiple
 ld*.so.* files
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

U29ycnkgZm9yIHRoZSBtaXNzaW5nIFNPQiAtIEkgd2lsbCByZXN1Ym1pdC7CoCBUaGUgaW5zdHJ1
Y3Rpb25zIG9uIApodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9tYW51YWwu
aHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMgCm1pZ2h0IG5lZWQgYSBtb2RpZmljYXRpb24sIGFzIEkg
Zm9sbG93ZWQgdGhlbSBwcmVjaXNlbHksIEkgdGhpbmshIEV4cGVjdCAKYSB2MiBzaG9ydGx5IHdp
dGggYSBTT0IuCgpKb25haAoKT24gOC8yNC8yMSA0OjE2IFBNLCBKb25haCBQZXRyaSB3cm90ZToK
PiBTb21lIDNyZCBwYXJ0eSB2ZW5kb3IgdG9vbGNoYWlucyBoYXZlIG11bHRpcGxlIGZpbGVzIHdo
aWNoIG1hdGNoCj4gdGhlc2UgZ2xvYiBwYXR0ZXJucy4gIEluIHRoaXMgY2FzZSwgdGhlIHNoZWxs
IHNjcmlwdCBmYWlsZWQuCj4gU3dpdGNoaW5nIHRvIHVzZSBmaW5kIGFuZCB4YXJncyBzb2x2ZXMg
dGhlIGlzc3VlLgo+IC0tLQo+ICAgdG9vbGNoYWluL2hlbHBlcnMubWsgfCA2ICsrLS0tLQo+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS90b29sY2hhaW4vaGVscGVycy5tayBiL3Rvb2xjaGFpbi9oZWxwZXJzLm1rCj4gaW5k
ZXggZGZiMjU4MWVkNS4uNWVkMTQ5ZDU3ZCAxMDA2NDQKPiAtLS0gYS90b29sY2hhaW4vaGVscGVy
cy5tawo+ICsrKyBiL3Rvb2xjaGFpbi9oZWxwZXJzLm1rCj4gQEAgLTEzNSwxMCArMTM1LDggQEAg
Y29weV90b29sY2hhaW5fc3lzcm9vdCA9IFwKPiAgIAkJCSQoY2FsbCBzaW1wbGlmeV9zeW1saW5r
LCQkaSwkKFNUQUdJTkdfRElSKSkgOyBcCj4gICAJCWRvbmUgOyBcCj4gICAJZmkgOyBcCj4gLQlp
ZiBbICEgLWUgJChTVEFHSU5HX0RJUikvbGliL2xkKi5zby4qIF07IHRoZW4gXAo+IC0JCWlmIFsg
LWUgJCR7QVJDSF9TWVNST09UX0RJUn0vbGliL2xkKi5zby4qIF07IHRoZW4gXAo+IC0JCQljcCAt
YSAkJHtBUkNIX1NZU1JPT1RfRElSfS9saWIvbGQqLnNvLiogJChTVEFHSU5HX0RJUikvbGliLyA7
IFwKPiAtCQlmaSA7IFwKPiArICAgICAgIGlmICEgZmluZCAtd2hvbGVuYW1lICQoU1RBR0lOR19E
SVIpJy9saWIvbGQqLnNvLionID4gL2Rldi9udWxsOyB0aGVuIFwKPiArICAgICAgICAgICAgICAg
ZmluZCAtd2hvbGVuYW1lICQke0FSQ0hfU1lTUk9PVF9ESVJ9Jy9saWIvbGQqLnNvLionIC1wcmlu
dDAgfCB4YXJncyAtMCAtSSAlIGNwICUgJChTVEFHSU5HX0RJUikvbGliLzsgXAo+ICAgCWZpIDsg
XAo+ICAgCWlmIFsgYHJlYWRsaW5rIC1mICQke1NZU1JPT1RfRElSfWAgIT0gYHJlYWRsaW5rIC1m
ICQke0FSQ0hfU1lTUk9PVF9ESVJ9YCBdIDsgdGhlbiBcCj4gICAJCWlmIFsgISAtZCAkJHtBUkNI
X1NZU1JPT1RfRElSfS91c3IvaW5jbHVkZSBdIDsgdGhlbiBcCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
