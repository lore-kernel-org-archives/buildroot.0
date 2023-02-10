Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115A3C636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 15:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A85BB419F4;
	Fri, 10 Feb 2023 15:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A85BB419F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3mPqQa0zypb; Fri, 10 Feb 2023 15:54:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A912841638;
	Fri, 10 Feb 2023 15:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A912841638
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44EC61BF2B0
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76C8B400D1
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76C8B400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xjbnXiazbmC7 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 15:54:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F734012E
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36F734012E
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 15:54:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 5B5A1CFCEB
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 15:47:04 +0000 (UTC)
Received: (Authenticated sender: alexis.lothore@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6B3D0C000A;
 Fri, 10 Feb 2023 15:46:58 +0000 (UTC)
Message-ID: <da686f83-4541-5bbd-cb7b-3ea401b032c2@bootlin.com>
Date: Fri, 10 Feb 2023 16:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20230210102655.94324-1-alexis.lothore@bootlin.com>
 <874jrtedlz.fsf@dell.be.48ers.dk>
In-Reply-To: <874jrtedlz.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1676044018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MerwrGcx1dQ89qfne0nuEg9QnGCdD9MQVjVw0+9EayU=;
 b=nHeRAPknMezsrzh05ZaYwlXLGIJUKG2H7nF96cfeiaFY1iJHIbWLXrvk/vmLQCvW9eQf3l
 ikjQV29ZQH0h1kn73G3rkZ7HqVy1o4mC4pu8CvBdtuaTVHTQzl+auGjRx1U1uM/vNJia6c
 dmc4lC4z5Hw/60kOulz7/G6/dZ3pRqhljz3q4rKsvKuVuGekx6RK52XOLozy+CVKK1hIwg
 xQqtwNOAVc0i4KO883tKtw49KYVkneZEYamFyWsH9k4HFl4T0+czmW9wJN+XVuJCKpXeSM
 dp6j9U6IZGaWmrXZB7A+pWQdfX2GflnZBDCGs/j1lShKTnItcnaSnSJbaMbUIg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nHeRAPkn
Subject: Re: [Buildroot] [PATCH 1/1] package/python-flit-core: set license
 path
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Alexis_Lothor=c3=a9?= <alexis.lothore@bootlin.com>
Cc: Asaf Kahlon <asafka7@gmail.com>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=c3=a9_via_buildroot?= <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMi8xMC8yMyAxNjozNiwgUGV0ZXIgS29yc2dhYXJkIHdyb3RlOgo+Pj4+Pj4gIkFsZXhpcyIg
PT0gQWxleGlzIExvdGhvcsOpIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
PiB3cml0ZXM6Cj4gCj4gID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLWZsaXQtY29yZS9w
eXRob24tZmxpdC1jb3JlLm1rIGIvcGFja2FnZS9weXRob24tZmxpdC1jb3JlL3B5dGhvbi1mbGl0
LWNvcmUubWsKPiAgPiBpbmRleCA0ZDdiZWU4MWRhLi5mOTYxOTFhZGU2IDEwMDY0NAo+ICA+IC0t
LSBhL3BhY2thZ2UvcHl0aG9uLWZsaXQtY29yZS9weXRob24tZmxpdC1jb3JlLm1rCj4gID4gKysr
IGIvcGFja2FnZS9weXRob24tZmxpdC1jb3JlL3B5dGhvbi1mbGl0LWNvcmUubWsKPiAgPiBAQCAt
OCw2ICs4LDcgQEAgUFlUSE9OX0ZMSVRfQ09SRV9WRVJTSU9OID0gMy44LjAKPiAgPiAgUFlUSE9O
X0ZMSVRfQ09SRV9TT1VSQ0UgPSBmbGl0X2NvcmUtJChQWVRIT05fRkxJVF9DT1JFX1ZFUlNJT04p
LnRhci5nego+ICA+ICBQWVRIT05fRkxJVF9DT1JFX1NJVEUgPSBodHRwczovL2ZpbGVzLnB5dGhv
bmhvc3RlZC5vcmcvcGFja2FnZXMvMTAvZTUvYmUwODc1MWQwN2IzMDg4OWFmMTMwY2VjMjA5NTVj
OTg3YTc0MzgwYTEwMDU4ZTZlODg1NmU0MDEwYWZjCj4gID4gIFBZVEhPTl9GTElUX0NPUkVfTElD
RU5TRSA9IEJTRC0zLUNsYXVzZQo+ICA+ICtQWVRIT05fRkxJVF9DT1JFX0xJQ0VOU0VfRklMRVMg
PSBMSUNFTlNFCj4gCj4gWW91IGFsc28gbmVlZCB0byBhZGQgdGhlIHNoYTI1NiBvZiBMSUNFTlNF
IHRvIHRoZSAuaGFzaCBmaWxlOgo+IAoKPiBDb21taXR0ZWQgd2l0aCB0aGF0IGZpeGVkLCB0aGFu
a3MuCgpBQ0sgZm9yIG5leHQgdGltZSwgc29ycnkgZm9yIG9taXNzaW9uIGFuZCB0aGFua3MgZm9y
IHRoZSBmaXgKCktpbmQgcmVnYXJkcywKCi0tIApBbGV4aXMgTG90aG9yw6ksIEJvb3RsaW4KRW1i
ZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZwpodHRwczovL2Jvb3RsaW4uY29tCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
