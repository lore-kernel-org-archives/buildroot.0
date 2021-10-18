Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED983C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:49:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00B7611EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A00B7611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embedded.rocks
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73A7F817ED;
	Mon, 18 Oct 2021 19:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mu1xvkX5FLih; Mon, 18 Oct 2021 19:49:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D50EE81C38;
	Mon, 18 Oct 2021 19:49:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B69B31BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B392F81C2F
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:49:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBywHr24f-Qq for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:49:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8899819C8
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:49:40 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id A8C1C240104
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:49:37 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4HY6sF0M3yz6tmG
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:49:36 +0200 (CEST)
Authentication-Results: mail.embedded.rocks (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=embedded.rocks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:x-mailer:message-id:date:date:subject:subject:from
 :from:received:received; s=default; t=1634586564; x=1635191365;
 bh=0GJcg/0iiT9kjpSuag1U0ZTn6CapEL1B8/H1rm6YmvE=; b=sjXkmmNgAKKH
 8j3RXwNyNtBtrSQ6cL5Thz0OkmLMDPp5XEkOoq+6wBEJKgWsylOLPCYZmbrhKjoX
 T5g+DuAU9IJiO3tq1lcS5T/9tnDkHVjRHwy682vM+iNN9SF73uRNeGDqv6dkqtvn
 KdBuZYsW3mHzUzdDeTjD83br2MGZjR97dORxZpzatat3/rx0uxePaq68NGa2NFhq
 yEFwglA6E8Amr+X0Ft7inoMGXgPf+tNBAXsOhN0eBp7J6IWVUytFcAcQyXR/h0cO
 NnoQT3IvTzKd0upcsheD7Uki8NMzR/TR2xo+gTywt/PeweYTPnNNEjx4/thIc2Mz
 4lLXbopNTA==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id FIpGQTs1LHJ6; Mon, 18 Oct 2021 21:49:24 +0200 (CEST)
Received: from nzxt.fritz.box (port-92-193-134-170.dynamic.as20676.net
 [92.193.134.170]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Mon, 18 Oct 2021 21:49:24 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 19:49:17 +0000
Message-Id: <20211018194917.183955-1-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.42.0-0
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

U2lnbmVkLW9mZi1ieTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+
Ci0tLQogcGFja2FnZS9sdXYvbHV2Lmhhc2ggfCAyICstCiBwYWNrYWdlL2x1di9sdXYubWsgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2L2x1di5oYXNoIGIvcGFja2FnZS9sdXYvbHV2Lmhhc2gK
aW5kZXggMjcxMTMyOGYzZi4uNmRmZDhiOWYxOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9sdXYvbHV2
Lmhhc2gKKysrIGIvcGFja2FnZS9sdXYvbHV2Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2Fs
bHkgY2FsY3VsYXRlZAotc2hhMjU2ICBhYmMzYmQ5ZDc0MWFlYzM5MjIwM2RiZjYyOWRhNTg4MTdi
ZDU3MDVlODJiMmU5Zjc5ZjQ0ODYxNzI2NzRhMGEzICBsdXYtMS40MS4xLTAudGFyLmd6CitzaGEy
NTYgIGI1MjI4YTlkMGVhYWNkOWY4NjJiNjI3MGM3MzJkNWM5MDc3M2EyOGNlNTNiNmQ5ZTMyYTE0
MDUwZTc5NDdmMzYgIGx1di0xLjQyLjAtMC50YXIuZ3oKIHNoYTI1NiAgY2ZjNzc0OWI5NmY2M2Jk
MzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0MTdiYzUyM2QzMCAgTElDRU5T
RS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2L2x1di5tayBiL3BhY2thZ2UvbHV2L2x1di5t
awppbmRleCBiOWYwZDZhMDcwLi5mYWU5NGZhNmIyIDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1di9s
dXYubWsKKysrIGIvcGFja2FnZS9sdXYvbHV2Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotTFVWX1ZFUlNJT04gPSAxLjQxLjEtMAorTFVWX1ZFUlNJT04g
PSAxLjQyLjAtMAogTFVWX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbHV2aXQvbHV2L3JlbGVh
c2VzL2Rvd25sb2FkLyQoTFVWX1ZFUlNJT04pCiBMVVZfTElDRU5TRSA9IEFwYWNoZS0yLjAKIExV
Vl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKLS0gCjIuMzMuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
