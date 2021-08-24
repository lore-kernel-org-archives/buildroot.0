Return-Path: <SRS0=7Mk9=NP=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FE14C4338F
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 22:38:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4562361220
	for <buildroot@archiver.kernel.org>; Tue, 24 Aug 2021 22:38:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4562361220
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=petri.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02399605EA;
	Tue, 24 Aug 2021 22:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3E4-mC1t-NA; Tue, 24 Aug 2021 22:38:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63D9C6064E;
	Tue, 24 Aug 2021 22:38:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8261C1BF5AD
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 22:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A20D600B6
 for <buildroot@lists.busybox.net>; Tue, 24 Aug 2021 22:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rK14t1Nev14r for <buildroot@lists.busybox.net>;
 Tue, 24 Aug 2021 22:38:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FD5B6064F
 for <buildroot@buildroot.org>; Tue, 24 Aug 2021 22:38:37 +0000 (UTC)
Received: from [10.9.9.73] (helo=submission02.runbox)
 by mailtransmit02.runbox with esmtp (Exim 4.86_2)
 (envelope-from <jonah@petri.us>)
 id 1mIf3x-0001Bj-Hk; Wed, 25 Aug 2021 00:38:33 +0200
Received: by submission02.runbox with esmtpsa [Authenticated ID (799462)]
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
 id 1mIf3t-0000QD-CT; Wed, 25 Aug 2021 00:38:29 +0200
Message-ID: <98467939-bbe9-17c7-eba2-531e039be28f@petri.us>
Date: Tue, 24 Aug 2021 18:38:26 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:92.0) Gecko/20100101
 Thunderbird/92.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210824201657.1553593-1-jonah@petri.us>
 <78204681-4e6d-625e-718a-fe9be05c682b@petri.us>
 <20210824230247.19116d61@windsurf>
From: Jonah Petri <jonah@petri.us>
In-Reply-To: <20210824230247.19116d61@windsurf>
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Ck9uIDgvMjQvMjEgNTowMiBQTSwgVGhvbWFzIFBldGF6em9uaSB3cm90ZToKPiBIZWxsbywKPgo+
IE9uIFR1ZSwgMjQgQXVnIDIwMjEgMTY6MzU6MzYgLTA0MDAKPiBKb25haCBQZXRyaSA8am9uYWhA
cGV0cmkudXM+IHdyb3RlOgo+Cj4+IFNvcnJ5IGZvciB0aGUgbWlzc2luZyBTT0IgLSBJIHdpbGwg
cmVzdWJtaXQuwqAgVGhlIGluc3RydWN0aW9ucyBvbgo+PiBodHRwczovL2J1aWxkcm9vdC5vcmcv
ZG93bmxvYWRzL21hbnVhbC9tYW51YWwuaHRtbCNzdWJtaXR0aW5nLXBhdGNoZXMKPj4gbWlnaHQg
bmVlZCBhIG1vZGlmaWNhdGlvbiwgYXMgSSBmb2xsb3dlZCB0aGVtIHByZWNpc2VseSwgSSB0aGlu
ayEgRXhwZWN0Cj4+IGEgdjIgc2hvcnRseSB3aXRoIGEgU09CLgo+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCBhbmQgZ29pbmcgdGhyb3VnaCBvdXIgbWFudWFsLiBJZiB5b3UgdGhpbmsKPiBhbnl0aGlu
ZyBpcyBtaXNzaW5nLCB0aGUgbWFudWFsIHNvdXJjZSBjb2RlIGlzIGluIGRvY3MvbWFudWFsLywg
c28geW91Cj4gY2FuIGVhc2lseSBzZW5kIGEgcGF0Y2guCj4KPiBIb3dldmVyLCBJIHRoaW5rIHRo
aXMgcmVxdWlyZW1lbnQgZm9yIGEgU2lnbmVkLW9mZi1ieSBpcyBjbGVhcmx5IGluIG91cgo+IGlu
c3RydWN0aW9ucy4gU2VjdGlvbiAyMi41LjEgb2Ygb3VyIG1hbnVhbCBoYXM6CgpIaSBUaG9tYXMs
CgpZZXMsIHlvdSdyZSByaWdodCwgdGhlIHJlcXVpcmVtZW50IGlzIHRvdGFsbHkgY2xlYXIuwqAg
SSBoYXZlIHNvbWUgZXJyb3IgCmluIG15IHVuZGVyc3RhbmRpbmcgb2YgYGdpdCBzZW5kLWVtYWls
YC7CoCBJJ2xsIHN1Ym1pdCBhIGNsYXJpZmljYXRpb24gdG8gCnRoZSBtYW51YWwgb25jZSBJIG5h
cnJvdyBkb3duIGV4YWN0bHkgd2hhdCB3ZW50IHdyb25nLgoKVGhhbmtzIGZvciBhbGwgeW91ciB3
b3JrLAoKSm9uYWgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9s
aXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
