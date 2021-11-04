Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F57AC433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 21:06:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C581C6124D
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 21:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C581C6124D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=yandex.ru
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A48181ABA;
	Thu,  4 Nov 2021 21:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykjc8h4hMOAw; Thu,  4 Nov 2021 21:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBE3981AAB;
	Thu,  4 Nov 2021 21:06:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0851E1BF8A8
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 21:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E4D07405FC
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 21:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=yandex.ru
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lC-1PuxoaDKH for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 21:06:31 +0000 (UTC)
X-Greylist: delayed 00:06:59 by SQLgrey-1.8.0
Received: from forward500p.mail.yandex.net (forward500p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07FA1405F0
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 21:06:30 +0000 (UTC)
Received: from myt6-1005c883711c.qloud-c.yandex.net
 (myt6-1005c883711c.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:2ca8:0:640:1005:c883])
 by forward500p.mail.yandex.net (Yandex) with ESMTP id 6B07EF01AE8;
 Thu,  4 Nov 2021 23:59:28 +0300 (MSK)
Received: from myt6-9bdf92ffd111.qloud-c.yandex.net
 (myt6-9bdf92ffd111.qloud-c.yandex.net [2a02:6b8:c12:468a:0:640:9bdf:92ff])
 by myt6-1005c883711c.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 lLOHBsr2tn-xSDCkxHA; Thu, 04 Nov 2021 23:59:28 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
 t=1636059568; bh=wagrOCLaN+fW9q0due7qPx1WBW7yZvgC8/3F+ix90ww=;
 h=In-Reply-To:From:Subject:Cc:References:Date:Message-ID:To;
 b=nzELfjW9VJmyQMvIZAvQfVvlWpj4qvxmZ61Izw0zDvud7G3/a3+BcRU3FKfg76wos
 18mAPHcUWdQyvS+AVR2tGcQ2thbFZV+wmwIHh5pE8N+oHEz5nkDtpBFYWoGJlWbDQ4
 WXfYCdnWXITpVndo1XZEwWwDx8uG3XCz72cqkweQ=
Authentication-Results: myt6-1005c883711c.qloud-c.yandex.net;
 dkim=pass header.i=@yandex.ru
Received: by myt6-9bdf92ffd111.qloud-c.yandex.net (smtp/Yandex) with ESMTPS id
 CsnxPOaXL3-xR1qOBFP; Thu, 04 Nov 2021 23:59:27 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 2
Message-ID: <0eeb0b07-b119-8d8c-b3a1-06064c2bf2ee@yandex.ru>
Date: Thu, 4 Nov 2021 23:59:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <3c3603ba-5719-fec9-9bb3-7b0f3967fc9f@yandex.ru>
 <20211104203655.GA2400@scaer>
From: stsp <stsp2@yandex.ru>
In-Reply-To: <20211104203655.GA2400@scaer>
Subject: Re: [Buildroot] generic code with i7 bootlin toolchain?
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgowNC4xMS4yMDIxIDIzOjM2LCBZYW5uIEUuIE1PUklOINC/0LjRiNC10YI6Cj4+IFNvIGl0
IGxvb2tzIGxpa2UgdGhlCj4+IEJSMl9UQVJHRVRfT1BUSU1JWkFUSU9OCj4+IGlzIHNvbWVob3cg
YXBwbGllZCBub3QgdG8gYWxsCj4+IGJ1aWx0IHBhY2thZ2VzPyBXaHkgY2FuIHRoYXQgYmU/Cj4+
IElzIHRoZXJlIGFueSBvdGhlciB3YXkgSSBjYW4KPj4gdXRpbGl6ZSBib290bGluIHRvb2wtY2hh
aW4gZm9yIHNvbWUKPj4gImdlbmVyaWMiIChub24tU1NFMy80KSBDUFU/Cj4gWW91IHdpbGwgbm90
IGJlIGFibGUgdG8gdXNlIHRoYXQgdG9vbGNoYWluIGZvciB0aGUgUGhlbm9tLiBZb3Ugd2lsbCBo
YXZlCj4gdG8gYnVpbGQgeW91ciBvd24gdG9vbGNoYWluLgo+Cj4gTm90ZSB0aGF0IHlvdSBjYW4g
YnVpbGQgdGhlIHRvb2xjaGFpbiBvbmNlLCBhbmQgbGF0ZXIgcmUtdXNlIHRoYXQgYXMgYQo+IHBy
ZS1idWlsdCB0b29sY2hhaW4uIFNlZSB0aGUgbWFudWFsIG9uIGRpcmVjdGlvbnMgb24gaG93IHRv
IGRvIHRoYXQ6Cj4gICAgICBodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL21hbnVhbC9t
YW51YWwuaHRtbCNfY3Jvc3NfY29tcGlsYXRpb25fdG9vbGNoYWluClRoYW5rcywgIm1ha2Ugc2Rr
IiBpcyBhbgppbnRlcmVzdGluZyBzdWJqZWN0IHRvIHBsYXkgd2l0aC4KSG93ZXZlciwgYW55IGhv
cGVzIGJvb3RsaW4KY2FuIHByb3ZpZGUgdGhlICJnZW5lcmljIgp0b29sLWNoYWluIGluIGFkZGl0
aW9uIHRvIGk3PwpBbHNvIHRoZSBkb2MgeW91IG1lbnRpb25lZCwKcG9pbnRzIHRvIHNvbWUgY29k
ZXNvdXJjZXJ5CnRvb2wtY2hhaW4uIFdoZXJlIGlzIGl0PwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
