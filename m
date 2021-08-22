Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389CEC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 18:56:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD7EA60F5E
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 18:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD7EA60F5E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embedded.rocks
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A074B401C6;
	Sun, 22 Aug 2021 18:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYNoH7rNux8B; Sun, 22 Aug 2021 18:55:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2DC3401CC;
	Sun, 22 Aug 2021 18:55:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7B531BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 18:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7D4E80D7B
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 18:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new); dkim=neutral
 reason="invalid (public key: not available)" header.d=embedded.rocks
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PRYNN-9Dl4bT for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 18:55:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D526280D76
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 18:55:51 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id A8C5F240104
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 20:55:48 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Gt4MS1t8fz9rxV
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 20:55:48 +0200 (CEST)
Authentication-Results: mail.embedded.rocks (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=embedded.rocks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:x-mailer:message-id:date:date:subject:subject:from
 :from:received:received; s=default; t=1629658546; x=1630263347;
 bh=TbzdpTeg4++sNGH07idYLrfQOLaEppveIuEuXq+gz/k=; b=nSD/oiKxFgA2
 OA5e0kTn+vEQZuAq6oOrY9aZp9wJybEhvaqhvcbkxsPiQ/3LMhtwzhRCVGjUxHkk
 LB85bvKXyTCJnRC1UY/z8pu9RfEX639twnPLFTm2+CgoPZ/qkQbnSGoOMQNgI/of
 MQK/hdOTtIg4XPnYpjUTe3MeNfCgyWQ0YcDvX5k6q+X/dGf5Iox3IjbxR5pNnTsR
 EqUifKnTW2n6I8wSx2VnKY3fLMcg/dFVq1QQ/DCKbA3JjL3r5eUlHDDovq7WE/FK
 F02/A4jmbbpjbeQVraQJUutXgztWPC4d4u6838ocPBvRE92wFid7dzXkLxI7cFnj
 5Wx4/dLP4g==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id Ac_YKtloVmAk; Sun, 22 Aug 2021 20:55:46 +0200 (CEST)
Received: from nzxt.fritz.box (port-92-195-127-56.dynamic.as20676.net
 [92.195.127.56]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Sun, 22 Aug 2021 20:55:46 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 18:55:44 +0000
Message-Id: <20210822185544.666516-1-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mpd: bump to version 0.22.10
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

U2lnbmVkLW9mZi1ieTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+
Ci0tLQogcGFja2FnZS9tcGQvbXBkLmhhc2ggfCAyICstCiBwYWNrYWdlL21wZC9tcGQubWsgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXBkL21wZC5oYXNoIGIvcGFja2FnZS9tcGQvbXBkLmhhc2gK
aW5kZXggMTA3OWNjZjM2Ny4uMzg0N2ZjNjcyNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9tcGQvbXBk
Lmhhc2gKKysrIGIvcGFja2FnZS9tcGQvbXBkLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2Fs
bHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Agc2lnbmF0dXJlCi1zaGEyNTYgIDk2MTdl
ZDA4YzlmZmFmY2Y1ZjkyNTgxOTI1MWY2YjkwZGYzZjRmNzNjZjI4MzhjNDEwMzNlMTk2MjEwNDI4
NmQgIG1wZC0wLjIyLjgudGFyLnh6CitzaGEyNTYgIDA3YzgyNTM1ZTk5OTljM2Q0YTA5OWQ4ZTY1
MmM4ODcyNDYzNTEyNWIzYzlmMjY1YmE5YjZmMjk3NGZmOWU2MTQgIG1wZC0wLjIyLjEwLnRhci54
egogc2hhMjU2ICBhYjE1ZmQ1MjZiZDhkZDE4YTllNzdlYmMxMzk2NTZiZjRkMzNlOTdmYzcyMzhj
ZDExYmY2MGUyYjliODY2NmM2ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL21wZC9tcGQu
bWsgYi9wYWNrYWdlL21wZC9tcGQubWsKaW5kZXggZTVlNTA5NzA0OC4uNjJlMzE4NjBjMCAxMDA2
NDQKLS0tIGEvcGFja2FnZS9tcGQvbXBkLm1rCisrKyBiL3BhY2thZ2UvbXBkL21wZC5tawpAQCAt
NSw3ICs1LDcgQEAKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKIE1QRF9WRVJTSU9OX01BSk9S
ID0gMC4yMgotTVBEX1ZFUlNJT04gPSAkKE1QRF9WRVJTSU9OX01BSk9SKS44CitNUERfVkVSU0lP
TiA9ICQoTVBEX1ZFUlNJT05fTUFKT1IpLjEwCiBNUERfU09VUkNFID0gbXBkLSQoTVBEX1ZFUlNJ
T04pLnRhci54egogTVBEX1NJVEUgPSBodHRwOi8vd3d3Lm11c2ljcGQub3JnL2Rvd25sb2FkL21w
ZC8kKE1QRF9WRVJTSU9OX01BSk9SKQogTVBEX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBi
b29zdAotLSAKMi4zMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRw
Oi8vbGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
