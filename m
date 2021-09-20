Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB10C433FE
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 13:21:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67E8860F6F
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 13:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67E8860F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16F9240457;
	Mon, 20 Sep 2021 13:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iHWVmJbt0xBn; Mon, 20 Sep 2021 13:21:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD0134018B;
	Mon, 20 Sep 2021 13:21:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 724821BF297
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 13:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6213582A53
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 13:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h5HJYdikDJ_2 for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 13:21:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 314BC82A4E
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 13:21:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D8A1604E9;
 Mon, 20 Sep 2021 13:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632144066;
 bh=QpP7g2BojRSjKi0TPQZKcx5r3Oe8ENMNSVI1nAlHvLo=;
 h=In-Reply-To:References:Subject:Cc:To:From:Date:From;
 b=dziZl5i48Ejt0DinGm5T5a7X0ieGTYMs1q9x0rwVbu9XKk+xit7Em0wzMmuuGr3ff
 QpIZwNHpmxWHuVhOsfay6MV+1+zhi5OXEo87wlv0uzyvetGQ/SlcKuGfNRQl6f6xX3
 aI7ioMEGKu+/gW7tYh7A7EkxWD//Nt0gFI975Iajhn0CxIHCTBg/62nR4BTW6EFVkL
 2K8nQ5Bnbp0LRunbUdPLhNOV0DwF9hpObizXSuArVJxTh97UFLmx8JhNrXzjXE5rdd
 vCz3YoeWCG1AszNmktXiSZZSzKbgrotAJ17jSnuT0OBDXb4Nv6hetxkKB0r1EnhMlG
 vNbHeczZKsr2g==
MIME-Version: 1.0
In-Reply-To: <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <163189935709.536094.10717640766848618610@kwain>
 <CAJPV9MrYNwrrZ34-JgRPO62Y_6yT0HZ564YuB_qFKYdsRo7nXQ@mail.gmail.com>
 <163213021612.4283.1135197152174473636@kwain>
 <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
To: José Pekkarinen <jose.pekkarinen@unikie.com>
From: Antoine Tenart <atenart@kernel.org>
Message-ID: <163214406368.4283.14394760824414034461@kwain>
Date: Mon, 20 Sep 2021 15:21:03 +0200
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

UXVvdGluZyBKb3PDqSBQZWtrYXJpbmVuICgyMDIxLTA5LTIwIDExOjQ0OjQyKQo+ICAgIE9uIE1v
biwgU2VwIDIwLCAyMDIxIGF0IDEyOjMwIFBNIEFudG9pbmUgVGVuYXJ0IDxbMV1hdGVuYXJ0QGtl
cm5lbC5vcmc+Cj4gICAgd3JvdGU6Cj4gCj4gICAgICBRdW90aW5nIEpvc8OpIFBla2thcmluZW4g
KDIwMjEtMDktMjAgMDg6MDE6MjcpCj4gICAgICA+Cj4gICAgICA+wqAgwqAgQWJzb2x1dGVseSwg
aW4gdGhlIHNlY3VyaXR5IHNlY3Rpb24gb2YgbXkgLmNvbmZpZyB3ZSBjYW4gcmVhZCB0aGUKPiAg
ICAgID7CoCDCoCBmb2xsb3dpbmc6Cj4gICAgICA+wqAgwqAgQlIyX1BBQ0tBR0VfUE9MSUNZQ09S
RVVUSUxTPXkKPiAgICAgID7CoCDCoCBCUjJfUEFDS0FHRV9SRUZQT0xJQ1k9eQo+ICAgICAgPsKg
IMKgIEJSMl9SRUZQT0xJQ1lfRVhUUkFfTU9EVUxFU19ESVJTPSIkT1VUUFVUX0RJUi9zZWxpbnV4
Igo+ICAgICAgPsKgIMKgIEJSMl9QQUNLQUdFX1JFRlBPTElDWV9QT0xJQ1lfU1RBVEVfRU5GT1JD
SU5HPXkKPiAKPiAgICAgIFRoaXMgc2hvdWxkIHdvcmsuIERpZCB5b3UgY2hlY2sgdGhlIGNvbnRl
bnQgb2YgeW91ciBtb2R1bGUgc2hvdyB1cCBhZnRlcgo+ICAgICAgYXBwbHlpbmcgdGhpcyBwYXRj
aD8KPiAKPiAgICBZZXMsIGFmdGVyIHRoZSBwYXRjaCBJIGNhbiBzZWUgdGhlIG1vZHVsZSBjb3Bp
ZWQgaW4gdGhlIGZvbGRlcjoKPiAgICBidWlsZC9yZWZwb2xpY3ktMi4yMDIwMDgxOCQgbHMgcG9s
aWN5L21vZHVsZXMvYnVpbGRyb290Lwo+ICAgIGJhc2UuZmMgwqBiYXNlLmlmIMKgYmFzZS50ZSDC
oG1ldGFkYXRhLnhtbCDCoHNlY3VyZS5mYyDCoHNlY3VyZS5pZiDCoHNlY3VyZS50ZQo+IAo+ICAg
ICAgQW5kOgo+IAo+ICAgIC9idWlsZC9yZWZwb2xpY3ktMi4yMDIwMDgxOCQgZ3JlcCBzZWN1cmUg
cG9saWN5L21vZHVsZXMuY29uZgo+ICAgICMgTW9kdWxlOiBzZWN1cmUKPiAgICBzZWN1cmUgPSBi
YXNlCj4gICAgIyBTbWFsbCBhbmQgc2VjdXJlIEROUyBkYWVtb24uCgpJJ20gbWlzc2luZyBzb21l
dGhpbmcgaGVyZS4gSSBkaWQgdGhlIHRlc3QgYW5kIHVzaW5nIHRoZSBtb2R1bGUgYW5kCmNvbmZp
Z3VyYXRpb24gc25pcHBldHMgeW91IHByb3ZpZGVkIChyZXBsYWNpbmcgJE9VVFBVVF9ESVIvc2Vs
aW51eCB3aXRoCnNvbWV0aGluZyBlbHNlOyBhbmQgYWRkaW5nIGEgPHN1bW1hcnk+IHRvIHNlY3Vy
ZS5pZlsxXSkuIEl0IHdvcmtlZC4gVGhlCidzZWN1cmUnIG1vZHVsZSB3YXMgZm91bmQgYW5kIGVu
YWJsZWQuCgpUaGUgbG9naWMgaXMgdGhlIGZvbGxvd2luZyBpbiBCdWlsZHJvb3QgZm9yIGV4dHJh
IG1vZHVsZXM6CgoxLiBUaGUgbW9kdWxlcyBhcmUgcnN5bmNlZCBpbiBwb2xpY3kvbW9kdWxlcy9i
dWlsZHJvb2QvLgoyLiBJZiBub3QgYWxyZWFkeSB0aGVyZSwgYSBtZXRhZGF0YS54bWwgZmlsZSBp
cyBhZGRlZC4KMy4gVGhlIHJlZnBvbGljeSBidWlsZCBzeXN0ZW0gaXMgdXNlZFsyXSB0byBnZW5l
cmF0ZSBtb2R1bGVzLmNvbmYgdXNpbmcKICAgYWxsIG1vZHVsZXMgbWF0Y2hpbmcgJ3BvbGljeS9t
b2R1bGVzLyovKi50ZScuCjQuIEFsbCBtb2R1bGVzIGluIG1vZHVsZXMuY29uZiBhcmUgZGlzYWJs
ZWQgYW5kIHRoZW4gb25seSB0aGUgb25lcyBpbgogICBSRUZQT0xJQ1lfTU9EVUxFUyBhcmUgZW5h
YmxlZC4KCkl0IGxvb2tzIGxpa2UgbW9yZSBvZiBhIHJlZnBvbGljeS9tb2R1bGUgaXNzdWUgdGhh
biBhIEJ1aWxkcm9vdCBvbmU6CnN0ZXBzIDEgYW5kIDIgc2VlbSB0byB3b3JrLCBidXQgbm90IHN0
ZXAgMy4gSWYgeW91IHJldHJpZXZlIHRoZQpyZWZwb2xpY3kgcHJvamVjdCBvdXRzaWRlIG9mIEJ1
aWxyb290IGFuZCBtaW1pYyB0aGUgYWJvdmUgc3RlcHMsIGFyZQp5b3VyIG1vZHVsZXMgbGlzdGVk
IGluIG1vZHVsZXMuY29uZj8gSWYgbm90IHRoYXQgbWlnaHQgYmUgYSBnb29kCnN0YXJ0aW5nIHBv
aW50LiBJIGRvbid0IGhhdmUgYSBiZXR0ZXIgaWRlYSBmb3Igbm93Li4uCgpBbnRvaW5lCgpbMV0g
V2hpY2ggSSBndWVzcyBpcyBub3QgeW91ciBpc3N1ZSBhcyBvdGhlcndpc2UgdGhlIGNvbmZpZ3Vy
YXRpb24gc3RlcAogICAgZmFpbHMgYW5kIHRoZSBidWlsZCBzdG9wcy4KWzJdIGBtYWtlIC1qMSBi
YXJlIGNvbmZgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
