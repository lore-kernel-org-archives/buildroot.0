Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460DCEB64DA
	for <buildroot@archiver.kernel.org>; Mon, 10 Jul 2023 19:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B0A4F40B93;
	Mon, 10 Jul 2023 19:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0A4F40B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-yEBHYVZfNQ; Mon, 10 Jul 2023 19:58:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7A1540A65;
	Mon, 10 Jul 2023 19:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7A1540A65
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A152B1BF3A1
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 796A8416B7
 for <buildroot@lists.busybox.net>; Mon, 10 Jul 2023 19:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 796A8416B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BnnHWPqVVy-d for <buildroot@lists.busybox.net>;
 Mon, 10 Jul 2023 19:58:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ECCB416C3
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4ECCB416C3
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 19:58:51 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-1b060bce5b0so4230824fac.3
 for <buildroot@buildroot.org>; Mon, 10 Jul 2023 12:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689019130; x=1691611130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8JAlZDh0dITh5K8kwvKwDxWFmfE1ZBFRvddDUwVcNNU=;
 b=DmINX8oHDgH/IlKD4qRsHYJiaGnaJK9FjEPBjaNUgr1QsGUCZoh2LHJPotW52C3IpH
 ov/lsxJVYa9lB5yDBy1Uqx51JYxAUNFnR1/wwsj9ktnKXM7Tcl1p7pNzbBGk4nd9JVJm
 TORtnSDM9w9cwgd9GTf3MVImMQwTOhEC8PEQatM5v6lltSMdbMVzj1mRleTqx2JwRFkM
 ooLaOSJFQvjoSHtJTZysIKhYD1EF5ddxEFNVAzbCYKkHED14x5iO/GuQEhHqzkP1UXpS
 jgP0Q3sypi+HZV+NC2fEtOrKRXdNYM/Ehy5FD7Al5zuvIcpEJ27IjBd4C1/C7qHu8Ddz
 VaRw==
X-Gm-Message-State: ABy/qLZFtqINMBN8US03cGNOgdAb2hA3T/m5WAV2gwxDMgGCZX8xRqsk
 8M46QpNlrE1u7JqfYQT6pNMIr/J9nedQ/TgbTi0=
X-Google-Smtp-Source: APBJJlHyxw496JLei1P7XDlG9cpDhkyhP+PDmtOc/emq+gyCUeXvVPcK6pMynPID8t69iRNmE4Qv83ced7mOGlKHY9Q=
X-Received: by 2002:a05:6870:1f87:b0:1b3:9e41:de07 with SMTP id
 go7-20020a0568701f8700b001b39e41de07mr15269058oac.36.1689019130192; Mon, 10
 Jul 2023 12:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230627072640.2437216-1-james.hilliard1@gmail.com>
 <20230627072640.2437216-2-james.hilliard1@gmail.com>
 <20230710200146.33aa4362@windsurf>
In-Reply-To: <20230710200146.33aa4362@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 10 Jul 2023 13:58:38 -0600
Message-ID: <CADvTj4ruzjfhJ-Ns9rPYhrW4oGWGqCkf66gUjTT+DR+DB8C3Xw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689019130; x=1691611130;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8JAlZDh0dITh5K8kwvKwDxWFmfE1ZBFRvddDUwVcNNU=;
 b=TJGyIVM5dIPvFaQa5fUqokjE9CFCWBHij73YOnpZ9n5FwksDCJh3rtq7G8bfdcPcIK
 gbQwVZJbXfjvKMMNmGxDrZ1U/utadlNy84gta5Su8JNxFHyibXYvylhNVb/18gz3Pslb
 +Enp8p1w7kbC81qtHAjyLjjbgFpnQ3pzLTDv6TRoL/Nzpw+IbIMXUbHBjKmYw8YYC2lK
 pGA84gdFBZgA4circGnZ2cHd+82P0Ke5ipF91Gj3iloI0gQsA0OIpcy6BBtwAphCsWwh
 U4xxBlSfbafj5jlGJSa9snp3l+ZZKkmC39AuX2zH84a/c6WxHfdKbjA0bk7ooCfs0V9S
 IKYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TJGyIVM5
Subject: Re: [Buildroot] [PATCH 2/2] package/python-terminaltables: fix
 build backend
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gTW9uLCBKdWwgMTAsIDIwMjMgYXQgMTI6MDHigK9QTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9t
YXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIEphbWVzLAo+Cj4gT24g
VHVlLCAyNyBKdW4gMjAyMyAwMToyNjo0MCAtMDYwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5o
aWxsaWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gV2UgbmVlZCB0byBtaWdyYXRlIHB5dGhv
bi10ZXJtaW5hbHRhYmxlcyB0byB0aGUgcGVwNTE3IHBvZXRyeS1jb3JlCj4gPiBiYWNrZW5kIGFz
IHNldHVwdG9vbHMgaXMgbm90IHN1cHBvcnRlZC4KPiA+Cj4gPiBVcHN0cmVhbSBoYXMgbWVyZ2Vk
IGEgcGF0Y2ggcmVwbGFjaW5nIHBvZXRyeSB3aXRoIHBvZXRyeS1jb3JlLCBob3dldmVyCj4gPiB3
ZSBjYW4gbm90IGJhY2twb3J0IHRoaXMgdXNpbmcgYSBwYXRjaCBmaWxlIGR1ZSB0byBDUkxGIGxp
bmUgZW5kaW5nCj4gPiBpc3N1ZXMgc28gd2Ugd2lsbCBoYXZlIHRvIGFwcGx5IHRoZSBjaGFuZ2Ug
aW4gdGhlIHBhdGNoIHVzaW5nIHNlZAo+ID4gaW5zdGVhZC4KPiA+Cj4gPiBTZWUgdXBzdHJlYW0g
Y29tbWl0Ogo+ID4gaHR0cHM6Ly9naXRodWIuY29tL21hdHRoZXdkZWFubWFydGluL3Rlcm1pbmFs
dGFibGVzL2NvbW1pdC85ZTNkZGEwZWZiNTRmZWU2OTM0Yzc0NGExM2E3MzM2ZDI0YzZlOWU5Cj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFp
bC5jb20+Cj4KPiBXaGF0IGlzIHRoZSBtb3RpdmF0aW9uIHRvIGRvIHRoaXMsIGlmIHRoZSBjdXJy
ZW50IHZlcnNpb24gb2YKPiBweXRob24tdGVybWluYWx0YWJsZXMgYnVpbGRzIGZpbmUgd2l0aCBz
ZXR1cHRvb2xzPwoKSXQgZG9lc24ndCBidWlsZCBpbiBjb21iaW5hdGlvbiB3aXRoIHBlcDUxNyBz
ZXR1cHRvb2xzIHNpbmNlIHRoZSBweXByb2plY3QudG9tbApzcGVjaWZpZXMgcG9ldHJ5IGFzIHRo
ZSBidWlsZCBiYWNrZW5kIGFuZCBub3Qgc2V0dXB0b29scy4KCj4KPiBUaG9tYXMKPiAtLQo+IFRo
b21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
