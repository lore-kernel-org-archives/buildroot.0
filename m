Return-Path: <SRS0=Wz+O=NE=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F7CC4338F
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 23:22:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D6B2610CF
	for <buildroot@archiver.kernel.org>; Fri, 13 Aug 2021 23:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D6B2610CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19D744075F;
	Fri, 13 Aug 2021 23:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jY2w9nIsIe-j; Fri, 13 Aug 2021 23:22:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A926B4079E;
	Fri, 13 Aug 2021 23:22:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 290FC1BF860
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 23:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1798680F48
 for <buildroot@lists.busybox.net>; Fri, 13 Aug 2021 23:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ltQQD7soKRc1 for <buildroot@lists.busybox.net>;
 Fri, 13 Aug 2021 23:22:37 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd10111.aruba.it (smtpcmd10111.aruba.it [62.149.156.111])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8E4380F2A
 for <buildroot@buildroot.org>; Fri, 13 Aug 2021 23:22:36 +0000 (UTC)
Received: from smtpclient.apple ([89.164.42.73])
 by Aruba Outgoing Smtp  with ESMTPA
 id EgOfmcRJVnyXHEgOgmSlBy; Sat, 14 Aug 2021 01:15:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628896531; bh=qb5yNlhHHvCowTKLMVZS/U4b+XtNxv56niFOUjolZEk=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=NlHWoab/dCB2fS8Zmp9E9vGDfEvjg8f8hV4ffaetdRIV1dqQTXr9i0dG5MX98vK2l
 dM4huekp9Z32xJCHaAwQhIiJBadRCLtIzeskauTrXNfK4SR9cFsolerh4kNx22kfW2
 Pj4Ggl35SCUwmArC7fFun96nHoC1uqZ4iOISQUHHp2l5jhnShrrKugyB3BGKcLMXJC
 PV0YN9DXfmjXEMdSKaEaqpRL2N/dVdK9W7RDC1/DXPV5NA1HkJr98BOdwq3QuYfYBm
 xG6ibRR0QTCt3T9+xp7CiVKeFc9iSv4PgtMIj2ipcPV6mXStW+9E9vytE/4bn0B5US
 FBsnRTosAFgZQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 14 Aug 2021 01:15:29 +0200
Message-Id: <ABDF0725-3074-4D93-A484-A99F219E9A50@benettiengineering.com>
References: <20210813213745.1555522-2-giulio.benetti@benettiengineering.com>
In-Reply-To: <20210813213745.1555522-2-giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfJN1O0lRIxqoan3oUcpUpMv2BTMBRWIl5pOCKDxkSXoxawv8QmIdJu8EG1ezEHRvCVstPeYb9GHupDWkkoV8PZRVh9c7iCFcbA5XqoOlxS/nG/2x565Y
 5t6jIwO+mSQfZFLhO6h3YcHQtNDkKaLLo0SYIr6EHrRzG/+9e1nJE/4hnA3yE/RpjILa6UXdc7h71c+ufTHq/5PleWczQkImoNdt3mWufKjwhE/GVosmJJ6N
 Swj2Rhb2VemLLguR26pB40SCqsAwiW/jdNTqMI2Y7GGbSLfqQx7rtRV0GMUaSlEs2U4a9XIfHEmKtmIgLIXculvIaXM885qY7Oc/h6cUcKQ=
Subject: Re: [Buildroot] [PATCH 1/3] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_97208
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGksCgo+IElsIGdpb3JubyAxMyBhZ28gMjAyMSwgYWxsZSBvcmUgMjM6MzgsIEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPiBoYSBzY3JpdHRvOgo+
IAo+IO+7v2xtYmVuY2ggcGFja2FnZSBmYWlscyB0byBidWlsZCBmb3IgdGhlIE1pY3JvYmxhemUg
YXJjaGl0ZWN0dXJlIHdpdGgKPiBvcHRpbWl6YXRpb24gZW5hYmxlZCB3aXRoIGdjYyA9IDExLjEu
MDoKCl5eXiDigJhnY2MgPD0gMTHigJksIG5vdCBvbmx5ID0KCj4gaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3QubmV0L3Jlc3VsdHMvYWUxL2FlMWU0ZDYxZWQzNjdjNmNiNjQ0NDJjNjBkOTg4ODJj
Yzc5ODUzNDYvCj4gCj4gSXQncyBiZWVuIHJlcG9ydGVkIHVwc3RyZWFtIGJ5IFJvbWFpbiBOYW91
cjoKPiBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD05NzIwOAo+
IAo+IENjOiBSb21hbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNv
bT4KPiAtLS0KPiB0b29sY2hhaW4vQ29uZmlnLmluIHwgNyArKysrKysrCj4gMSBmaWxlIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS90b29sY2hhaW4vQ29uZmlnLmlu
IGIvdG9vbGNoYWluL0NvbmZpZy5pbgo+IGluZGV4IDM4ODhlZWFmZTIuLjFkYWUwY2IyY2MgMTAw
NjQ0Cj4gLS0tIGEvdG9vbGNoYWluL0NvbmZpZy5pbgo+ICsrKyBiL3Rvb2xjaGFpbi9Db25maWcu
aW4KPiBAQCAtMTYzLDYgKzE2MywxMyBAQCBjb25maWcgQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JV
R185Mzg0Nwo+ICAgIGJvb2wKPiAgICBkZWZhdWx0IHkgaWYgQlIyX25pb3MyICYmICFCUjJfVE9P
TENIQUlOX0dDQ19BVF9MRUFTVF85Cj4gCj4gKyMgaHR0cHM6Ly9nY2MuZ251Lm9yZy9idWd6aWxs
YS9zaG93X2J1Zy5jZ2k/aWQ9OTcyMDgKPiArIyBJQ0U6IGluIGV4dHJhY3RfaW5zbiwgYXQgcmVj
b2cuYzoyMjk0IG9uIG1pY3JvYmxhemUuCj4gKyMgVGhpcyBidWcgc3RpbGwgZXhpc3RzIGluIGdj
YyA9IDExLjEuMAo+ICtjb25maWcgQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR185NzIwOAo+ICsg
ICAgYm9vbAo+ICsgICAgZGVmYXVsdCB5IGlmIEJSMl9taWNyb2JsYXplCj4gKwo+ICMgaHR0cHM6
Ly9nY2MuZ251Lm9yZy9idWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9OTk0MTAKPiAjIEVycm9yOiBi
cmFuY2ggb2Zmc2V0IG91dCBvZiByYW5nZSBvbiBOaW9zIElJLiBUaGlzIGJ1Zwo+ICMgbm8gbG9u
Z2VyIGV4aXN0cyBpbiBnY2MgPj0gOS54Lgo+IC0tIAo+IDIuMjUuMQo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
