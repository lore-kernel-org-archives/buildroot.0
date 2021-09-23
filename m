Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66BBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 09:17:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38B5361107
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 09:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38B5361107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C261341630;
	Thu, 23 Sep 2021 09:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_59akSqqZWG; Thu, 23 Sep 2021 09:17:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2405940502;
	Thu, 23 Sep 2021 09:17:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 759391BF318
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 09:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71215607AC
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 09:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3SNjM6mYkm-F for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 09:17:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D7266607A5
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 09:17:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD0BD6103D;
 Thu, 23 Sep 2021 09:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632388631;
 bh=pCpjYf+uxsLrMTlFBG9+a78Hdm6wvfW3Cs7NyMYKiWg=;
 h=In-Reply-To:References:From:To:Subject:Cc:Date:From;
 b=Jgp8TGv8ImIdUSna0V3K1C+7ZRSU6ntb3RKKQe6SJ3meeB/3zegfOrGl40cGR8QXn
 6zpL5SzspWxXaneaOxhX0Vqcw9jccQQseSG30pb/vtFP73PpVr78SSDFCHIpAW1Lei
 IIlYNoiVX1VyCEOxuRRYfk354f5b8Y6FyJxCBUrchTLC58LLDzgM8YgptqXHurOn2K
 Sy7Q+12talb89X34wb4xcb+AEzMdoQD2miJL0Ek/JvPnKDD5/hWq+ubC2bQLY8bNpA
 WZJQZrwa6V3+5IVFg11lAIs/DinX5fQBuzZVA9dmZZew5weAu7zLn9FmKALUU8jpdg
 EACqOfkyz+lmw==
MIME-Version: 1.0
In-Reply-To: <CAJPV9MqnsNV5zjWMPDZJWCTBSpqZnsO53Gq23DtfKD3JOG0GRQ@mail.gmail.com>
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
 <163220836697.4283.6363157164675068449@kwain>
 <CAJPV9MpNh0rXA6ZTJJyj5A58goFtt7GnPNimddk94eZw8S2bdQ@mail.gmail.com>
 <163223176981.4283.2007173106051805069@kwain>
 <CAJPV9Mp-6PBtw5G2YDORJ_5cqypjtrc2CR3cMrzfe36RpUW2oQ@mail.gmail.com>
 <163232062091.4283.13096713479109144471@kwain>
 <CAJPV9MpWep997PN1v+R0E6RKhe4EOwY=ogFECnyfG0ppz2ekww@mail.gmail.com>
 <163238398624.3979.10768324598204859494@kwain>
 <CAJPV9MqnsNV5zjWMPDZJWCTBSpqZnsO53Gq23DtfKD3JOG0GRQ@mail.gmail.com>
From: Antoine Tenart <atenart@kernel.org>
To: José Pekkarinen <jose.pekkarinen@unikie.com>
Message-ID: <163238862837.3979.686140854662980146@kwain>
Date: Thu, 23 Sep 2021 11:17:08 +0200
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

UXVvdGluZyBKb3PDqSBQZWtrYXJpbmVuICgyMDIxLTA5LTIzIDExOjA4OjI4KQo+ICBPbiBUaHUs
IFNlcCAyMywgMjAyMSBhdCAxMDo1OSBBTSBBbnRvaW5lIFRlbmFydCA8WzFdYXRlbmFydEBrZXJu
ZWwub3JnPgo+ICB3cm90ZToKPgo+ICAgIERvIHRoZSBmb2xsb3dpbmcgZml4ZXMgdGhlIGlzc3Vl
WzFdIG9uIHlvdXIgc2lkZT8KPgo+ICAgIMKgIGRpZmYgLS1naXQgYS9wYWNrYWdlL3JlZnBvbGlj
eS9bM11yZWZwb2xpY3kubWsKPiAgICBiL3BhY2thZ2UvcmVmcG9saWN5L1s0XXJlZnBvbGljeS5t
awo+ICAgIMKgIGluZGV4IDExODBmMGQzOGJhZS4uZWNkOGNmMjI2YjQ1IDEwMDY0NAo+ICAgIMKg
IC0tLSBhL3BhY2thZ2UvcmVmcG9saWN5L1s1XXJlZnBvbGljeS5tawo+ICAgIMKgICsrKyBiL3Bh
Y2thZ2UvcmVmcG9saWN5L1s2XXJlZnBvbGljeS5tawo+ICAgIMKgIEBAIC0xNCw3ICsxNCw4IEBA
IFJFRlBPTElDWV9ERVBFTkRFTkNJRVMgPSBcCj4gICAgwqAgwqAgwqAgwqAgwqAgaG9zdC1wb2xp
Y3ljb3JldXRpbHMgXAo+ICAgIMKgIMKgIMKgIMKgIMKgIGhvc3QtcHl0aG9uMyBcCj4gICAgwqAg
wqAgwqAgwqAgwqAgaG9zdC1zZXRvb2xzIFwKPiAgICDCoCAtwqAgwqAgwqAgwqBob3N0LWdhd2sK
PiAgICDCoCArwqAgwqAgwqAgwqBob3N0LWdhd2sgXAo+ICAgIMKgICvCoCDCoCDCoCDCoGhvc3Qt
bGlieG1sMgo+Cj4gICAgwqAgwqBpZmVxICgkKEJSMl9QQUNLQUdFX1JFRlBPTElDWV9DVVNUT01f
R0lUKSx5KQo+ICAgIMKgIMKgUkVGUE9MSUNZX1ZFUlNJT04gPSAkKGNhbGwKPiAgICBxc3RyaXAs
JChCUjJfUEFDS0FHRV9SRUZQT0xJQ1lfQ1VTVE9NX1JFUE9fVkVSU0lPTikpCj4gICAgwqAgQEAg
LTMwLDYgKzMxLDcgQEAgZW5kaWYKPiAgICDCoCDCoCMgQ2Fubm90IHVzZSBtdWx0aXBsZSB0aHJl
YWRzIHRvIGJ1aWxkIHRoZSByZWZlcmVuY2UgcG9saWN5Cj4gICAgwqAgwqBSRUZQT0xJQ1lfTUFL
RSA9IFwKPiAgICDCoCDCoCDCoCDCoCDCoCBQWVRIT049JChIT1NUX0RJUikvdXNyL2Jpbi9weXRo
b24zIFwKPiAgICDCoCArwqAgwqAgwqAgwqBYTUxMSU5UPSQoTElCWE1MMl9IT1NUX0JJTkFSWSkg
XAo+ICAgIMKgIMKgIMKgIMKgIMKgIFRFU1RfVE9PTENIQUlOPSQoSE9TVF9ESVIpIFwKPiAgICDC
oCDCoCDCoCDCoCDCoCAkKFRBUkdFVF9NQUtFX0VOVikgXAo+ICAgIMKgIMKgIMKgIMKgIMKgICQo
TUFLRTEpCj4KPiAgQ29uZmlybWVkLCB0aGUgcGF0Y2ggKndvcmtzKjoKCkdyZWF0ISBJJ2xsIHNl
bmQgdGhpcyBwYXRjaCB3aXRoIHlvdXIgVGVzdGVkLWJ5IHRoZW4uCgpUaGFua3MsCkFudG9pbmUK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
