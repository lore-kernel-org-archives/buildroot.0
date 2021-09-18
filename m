Return-Path: <SRS0=9D0o=OI=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D80FC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 09:55:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9576D60FBF
	for <buildroot@archiver.kernel.org>; Sat, 18 Sep 2021 09:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9576D60FBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38F01400FB;
	Sat, 18 Sep 2021 09:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boiWaTBXsoNz; Sat, 18 Sep 2021 09:55:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B221401F1;
	Sat, 18 Sep 2021 09:55:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 32D5F1BF2F4
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 09:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22B85840E6
 for <buildroot@lists.busybox.net>; Sat, 18 Sep 2021 09:55:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvYiDZv0HUIg for <buildroot@lists.busybox.net>;
 Sat, 18 Sep 2021 09:55:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED623840E9
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 09:55:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed4a:2560:2180:38b6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CEB3AB0054C;
 Sat, 18 Sep 2021 11:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631958903;
 bh=2dE7tOqmdeQDPLtv7t5JgYnyes1AwEI8pG20gUjoFWM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n3ilf9U4QZzKmGuRxG9D93CyxQJRqYmHCUJW5Udxehtqwqw0i9qCLq9/wLdJsCo4n
 1r4YpTvxOLN3XQKZyY+o4WI2bx3TA2Pc3oXQG++NVtjHMnP1y7OFt0Wkx1CHwTA95F
 1zYrD01omWjA9W1bFpdtN7Ma2D5lK8hueeZYWAso7C/LFIijA082swFKc4IBh6cH7p
 kQmAsZ6dlTdtseBDyp9Ep7lQwxIpkCgX8QQG/N+gw3UVbT3YaC3ztpYrpyGXwq1M/Y
 eb4jfQ34+yzjKGDG843ReBalL2Iu2tXoSYZodPpZsZt1SXVn069SlrQoCZKXaJGQg4
 ps9yRQDJL235A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Sep 2021 11:54:56 +0200
Date: Sat, 18 Sep 2021 11:54:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210918095456.GI1053080@scaer>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
 <20210914093457.1389174-2-kory.maincent@bootlin.com>
 <20210917212429.GY1053080@scaer> <20210918105042.7a0887cd@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210918105042.7a0887cd@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/8] boot/grub2: add support to build
 multiple Grub2 configurations in the same build
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
Cc: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

VGhvbWFzLCBLw7ZyeSwgQWxsLAoKT24gMjAyMS0wOS0xOCAxMDo1MCArMDIwMCwgVGhvbWFzIFBl
dGF6em9uaSBzcGFrZSB0aHVzbHk6Cj4gT24gRnJpLCAxNyBTZXAgMjAyMSAyMzoyNDoyOSArMDIw
MAo+ICJZYW5uIEUuIE1PUklOIiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+ID4g
V2hhdCB5b3UgZm9yZ290IHRvIHN0YXRlIGluIGJvbGQgZmF0IGNoYXJhY3RlcnMgaGVyZSwgaXMg
dGhhdCB3ZSBjYW4gbm8KPiA+IGxvbmdlciB1c2UgYXV0b3Rvb2xzLXBhY2thZ2UgYXMgYSBjb25z
ZXF1ZW5jZSBvZiB0aGlzIG11bHRpLWJ1aWxkLCBhbmQKPiA+IHRoYXQgd2UgaGF2ZSB0byByZXNv
cnQgdG8gZ2VuZXJpYy1wYWNha2dlIGFuZCBhIHBhcnRpYWwgZHVwbGljYXRpb24gb2YKPiA+IHRo
ZSBhdXRvdG9vbHMtaW5mcmEuClstLVNOSVAtLV0KPiA+IElmIEkgdW5kZXJzdGFuZCBjb3JyZWN0
bHksIHdlIGFyZSBpbiBhIHNpbWlsYXIgc2l0dWF0aW9uIHdpdGggZ3J1YjIsIGFuZAo+ID4gdGhl
cmUgYXJlIG9ubHkgZXZlciBhdCBtb3N0IHR3byAicGxhdGZvcm1zIiB3ZSBjYW4gYnVpbGQsIGFu
ZCBpdCBkb2VzCj4gPiBub3QgbG9vayBsaWtlIGl0IHdpbGwgZXZlciBjaGFuZ2U6ClstLVNOSVAt
LV0KPiA+ICAgICB4ODZfNjQ6Cj4gPiAgICAgICAgIEJSMl9UQVJHRVRfR1JVQjJfSTM4Nl9FRkkK
PiA+ICAgICAgICAgQlIyX1RBUkdFVF9HUlVCMl9YODZfNjRfRUZJCj4gT24geDg2LTY0LCB3ZSBj
YW4gaGF2ZToKPiAJQlIyX1RBUkdFVF9HUlVCMl9JMzg2X1BDCj4gCUJSMl9UQVJHRVRfR1JVQjJf
STM4Nl9FRkkKPiAJQlIyX1RBUkdFVF9HUlVCMl9YODZfNjRfRUZJCj4gCj4gdG8gY292ZXIgbGVn
YWN5IEJJT1MgcGxhdGZvcm1zICgzMi1iaXQpLCAzMi1iaXQgRUZJIEJJT1MgYW5kIDY0LWJpdCBF
RkkKPiBCSU9TLiBEYW5zIHRoaXMgaXMgcHJlY2lzZWx5IHRoZSB1c2UtY2FzZSB3ZSBhcmUgaW4g
ZmFjdCBpbnRlcmVzdGVkIGluLgo+IAo+IFNvIHRoYXQgbWVhbnMgd2Ugd291bGQgbmVlZCAzIEdy
dWIgcGFja2FnZXMsIHdoaWNoIGlzIHRoZSByZWFzb24gd2h5IGl0Cj4gZmVsdCBtdWNoIG1vcmUg
cmVhc29uYWJsZSB0byBqdXN0IGV4dGVuZCB0aGUgZ3J1YjIgcGFja2FnZSBpdHNlbGYuCgpBcmcs
IEkgaW5kZWVkIG1pc3NlZCB0aGUgQlIyX1RBUkdFVF9HUlVCMl9JMzg2X1BDIGZvciB4ODYtNjQs
IHdoaWNoCmluZGVlZCBiYXNpY2FsbHkgaW52YWxpZGF0ZXMgdGhlIHR3by1wYWNrYWdlIHNvbHV0
aW9uLCBhbmQgdGhlCnRocmVlLXBhY2thZ2UgYWx0ZXJuYXRpdmUgaXMgbm90IGEgdmlhYmxlIHNv
bHV0aW9uIGVpdGhlci4uLgoKWy0tU05JUC0tXQo+ID4gPiAtJChldmFsICQoYXV0b3Rvb2xzLXBh
Y2thZ2UpKQo+ID4gPiArJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkgIAo+ID4gVGhpcyBpcyBt
eSBtYWluIHByb2JsZW06IHdlJ3JlIG1vc3RseSBkdXBsaWNhdGluZyBiaXRzIGFuZCBwaWVjZXMg
b2YgdGhlCj4gPiBhdXRvdG9sbHMtcGFja2FnZSBpbmZyYSwgd2hpY2ggbWVhbnMgd2UgKndpbGwq
IGZhbGwgYmVoaW5kIHZlcnkgcXVpY2tseQo+ID4gd2hlbiB3ZSBoYXZlIHRvIHVwZGF0ZSBzYWlk
IGluZnJhLCBhbmQgdGhvc2UgY2hhbmdlcyB3aWxsIG5vdCBwZXJjb2xhdGUKPiA+IHRvIHRoaXMg
Z3J1YjIgcGFja2FnZS4KPiBUaGF0IGlzIHRydWUsIGJ1dCBvbiB0aGUgb3RoZXIgaGFuZCwgZ3J1
YjIgaXMgbm90IHRoZSB0eXBpY2FsCj4gdXNlci1zcGFjZSBhdXRvdG9vbHMgcGFja2FnZSBlaXRo
ZXIuClstLVNOSVAtLV0KPiBTbyBldmVuIHRob3VnaCB3ZSBkbyB1c2UgYXV0b3Rvb2xzLXBhY2th
Z2UsIGl0J3Mgbm90IGxpa2Ugd2UgZG9uJ3QKPiBhbHJlYWR5IGhhdmUgdG8gcGxheSBxdWl0ZSBh
IGZldyB0cmlja3MgdG8gZ2V0IGl0IHRvIGRvIHRoZSByaWdodCB0aGluZwo+IHdpdGggdGhlIHdl
aXJkbmVzcyBvZiBncnViMi4KClRoYXQncyB0cnVlLgoKS8O2cnk6IHdoZW4geW91IHJlc3Bpbiwg
aW4gYWRkaXRpb24gdG8gdGhlIG90aGVyIHBvaW50cywgY2FuIHlvdSBleHRlbmQKdGhlIGNvbW1p
dCBsb2cgd2l0aCBhIHN1bW1hcnkgb2YgdGhlIGV4cGxhbmF0aW9ucyBmcm9tIFRob21hcywgb24g
d2h5IGEKbXVsdGktcGFja2FnZSBzb2x1dGlvbiBsaWtlIGJhcmVib3ggaXMgbm90IHZpYWJsZSwg
YW5kIHRoYXQgZ3J1YjIgaXMKYWxyZWFkeSBwcmV0dHkgc3BlY2lhbCBhbnl3YXksIHBsZWFzZT8K
ClRoYW5rcyEKClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0t
LS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkg
UklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2Fy
ZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCAr
MzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwg
IFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8q
XF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0t
LS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
