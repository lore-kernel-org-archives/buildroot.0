Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3E8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 20:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 666A940761;
	Mon, 31 Jan 2022 20:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dK19DXGag_0W; Mon, 31 Jan 2022 20:29:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B19E340140;
	Mon, 31 Jan 2022 20:29:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F1901BF36A
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 749C940140
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 20:29:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OSbXVrEyy1ca for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 20:29:18 +0000 (UTC)
X-Greylist: delayed 00:07:11 by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 206F740135
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 20:29:18 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id A2A13240028
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 21:22:04 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4JnfcD12hzz9rxR
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 21:22:03 +0100 (CET)
Authentication-Results: mail.embedded.rocks (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=embedded.rocks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:x-mailer:message-id:date:date:subject:subject:from
 :from:received:received; s=default; t=1643660522; x=1644265323;
 bh=ZCe6ZakAhY2vQxbVkIuqg7NxFSCLDRiKR6KgXVMNS+Q=; b=AxBQxvZw+ccl
 7w7nwCIo8skRlMw7HKzkbxwnYNpOUw/tSs4rXpc12Zd3PdSon1+6NSkOGLNSleow
 ERclVwgJLIlwYHjod6urBB0W0ZevbH0CubL6wN+BzAIge8DYd46ODDb31R5mA2J5
 mnzRW++KTfv9zx23TYxN0YMASv7vJtEIkRPsUbHk31HiOaAIXjy87Ol0yqVJ24X6
 IKxZjsfKPpcwUePstcQ0Hmod2oVml9P9pHkg95w4Z173jLxpYkcixf2oNAgdpJUD
 7oVXyYeTqfn8zCYzQHB37XusHN0I8kvi8WNAQIS1sO7vACGuPnuGX8rAi/4caIqC
 RkGACDwj+A==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id tTgWHMtdmbHy; Mon, 31 Jan 2022 21:22:02 +0100 (CET)
Received: from nzxt.fritz.box (port-92-193-221-227.dynamic.as20676.net
 [92.193.221.227]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Mon, 31 Jan 2022 21:22:02 +0100 (CET)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 20:21:51 +0000
Message-Id: <20220131202151.937124-1-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] linux: build after wireless-regdb if
 enabled for early loading support
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG8gc3VwcG9ydCBidWlsZGluZyBpbiB0aGUgd2lyZWxlc3MgcmVndWxhdG9yeSBkYXRhYmFzZSBm
aWxlcyAocmVndWxhdG9yeS5kYiopCmludG8gdGhlIGtlcm5lbCB1c2luZyB0aGUgQ09ORklHX0VY
VFJBX0ZJUk1XQVJFIG9wdGlvbiwgd2UgbmVlZCB0byBlbnN1cmUgdGhhdAp0aGUgZGF0YWJhc2Ug
ZmlsZXMgYXJlIGluc3RhbGxlZCBiZWZvcmUgdGhlIExpbnV4IGtlcm5lbCBpcyBidWlsdC4KClNp
Z25lZC1vZmYtYnk6IErDtnJnIEtyYXVzZSA8am9lcmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgot
LS0KIGxpbnV4L2xpbnV4Lm1rIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saW51eC9saW51eC5tayBiL2xpbnV4L2xp
bnV4Lm1rCmluZGV4IGRkMmVlYmQ0NDYuLmZmZTA2MDY5MzAgMTAwNjQ0Ci0tLSBhL2xpbnV4L2xp
bnV4Lm1rCisrKyBiL2xpbnV4L2xpbnV4Lm1rCkBAIC03Miw3ICs3Miw4IEBAIExJTlVYX01BS0Vf
RU5WID0gXAogTElOVVhfSU5TVEFMTF9JTUFHRVMgPSBZRVMKIExJTlVYX0RFUEVOREVOQ0lFUyA9
IGhvc3Qta21vZCBcCiAJJChpZiAkKEJSMl9QQUNLQUdFX0lOVEVMX01JQ1JPQ09ERSksaW50ZWwt
bWljcm9jb2RlKSBcCi0JJChpZiAkKEJSMl9QQUNLQUdFX0xJTlVYX0ZJUk1XQVJFKSxsaW51eC1m
aXJtd2FyZSkKKwkkKGlmICQoQlIyX1BBQ0tBR0VfTElOVVhfRklSTVdBUkUpLGxpbnV4LWZpcm13
YXJlKSBcCisJJChpZiAkKEJSMl9QQUNLQUdFX1dJUkVMRVNTX1JFR0RCKSx3aXJlbGVzcy1yZWdk
YikKIAogIyBTdGFydGluZyB3aXRoIDQuMTYsIHRoZSBnZW5lcmF0ZWQga2NvbmZpZyBwYXNlciBj
b2RlIGlzIG5vIGxvbmdlcgogIyBzaGlwcGVkIHdpdGggdGhlIGtlcm5lbCBzb3VyY2VzLCBzbyB3
ZSBuZWVkIGZsZXggYW5kIGJpc29uLCBidXQKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
