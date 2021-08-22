Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9AACC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 18:41:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 406C56103D
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 18:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 406C56103D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embedded.rocks
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3E6060594;
	Sun, 22 Aug 2021 18:41:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7gntSavJ7Z2; Sun, 22 Aug 2021 18:41:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46E7760627;
	Sun, 22 Aug 2021 18:41:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 448A41BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 18:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34E8380D22
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 18:41:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new); dkim=neutral
 reason="invalid (public key: not available)" header.d=embedded.rocks
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jz9s2ET1tfCa for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 18:41:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E08D80D1B
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 18:41:29 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 6BBDD240028
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 20:41:26 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4Gt42s6lmlz6tm4
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 20:41:25 +0200 (CEST)
Authentication-Results: mail.embedded.rocks (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=embedded.rocks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:x-mailer:message-id:date:date:subject:subject:from
 :from:received:received; s=default; t=1629657684; x=1630262485;
 bh=Uf3q5w/C1uYbqGmdvR7KBY2v8k/uqvdgtgzIWfe7r5U=; b=UNm4w5CE+cFN
 pwLXmnCrYcgUqqD0IhhB9UvNsVbudT8y8ZopdU0XfIRnURfedgReHRfRoZunas+N
 okaAcQV7k1GcN24ing7q297E/7Af1cUmamEQfViX9Zhj6LMuL0bTApgPZLrVtqs9
 IYs/DXjsK6/+P3jJ4cNb89Ii+V+JLxjLqr8TlX/LSl6j8PwZvOeL529vvZiARfiS
 OlWC/ZhCUHH7uvWsexIc7C+pWpi6clSXcSii/lE62DiYqapM6l2PJ0B09d5u6MMB
 yttof0AGHvZTqGHHIsijRTFjG8v4XGptGqf/7+BrbedhaI5c9jNY67f+ZNX87Ash
 g7FuK6/olA==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id epqnZsGgEuBQ; Sun, 22 Aug 2021 20:41:24 +0200 (CEST)
Received: from nzxt.fritz.box (port-92-195-127-56.dynamic.as20676.net
 [92.195.127.56]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Sun, 22 Aug 2021 20:41:24 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: buildroot@buildroot.org
Date: Sun, 22 Aug 2021 18:41:21 +0000
Message-Id: <20210822184121.526921-1-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/luv: bump to version 1.41.1-0
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
Ci0tLQogcGFja2FnZS9sdXYvbHV2Lmhhc2ggfCAyICstCiBwYWNrYWdlL2x1di9sdXYubWsgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2L2x1di5oYXNoIGIvcGFja2FnZS9sdXYvbHV2Lmhhc2gK
aW5kZXggYTYxOWRiMmM3Ni4uMjcxMTMyOGYzZiAxMDA2NDQKLS0tIGEvcGFja2FnZS9sdXYvbHV2
Lmhhc2gKKysrIGIvcGFja2FnZS9sdXYvbHV2Lmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2Fs
bHkgY2FsY3VsYXRlZAotc2hhMjU2ICA0MDE4ZjI5M2Q3MWMyZDc1NzU3YjY0ZmNkYWNmOTgyNzI5
YzlkYzhiMGJmOGVkYTQwMTVhODgxOGE1YTI5MzIxICBsdXYtMS40MS4wLTAudGFyLmd6CitzaGEy
NTYgIGFiYzNiZDlkNzQxYWVjMzkyMjAzZGJmNjI5ZGE1ODgxN2JkNTcwNWU4MmIyZTlmNzlmNDQ4
NjE3MjY3NGEwYTMgIGx1di0xLjQxLjEtMC50YXIuZ3oKIHNoYTI1NiAgY2ZjNzc0OWI5NmY2M2Jk
MzFjM2M0MmI1YzQ3MWJmNzU2ODE0MDUzZTg0N2MxMGYzZWIwMDM0MTdiYzUyM2QzMCAgTElDRU5T
RS50eHQKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbHV2L2x1di5tayBiL3BhY2thZ2UvbHV2L2x1di5t
awppbmRleCAxYTI0YTMzYmIyLi5iOWYwZDZhMDcwIDEwMDY0NAotLS0gYS9wYWNrYWdlL2x1di9s
dXYubWsKKysrIGIvcGFja2FnZS9sdXYvbHV2Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotTFVWX1ZFUlNJT04gPSAxLjQxLjAtMAorTFVWX1ZFUlNJT04g
PSAxLjQxLjEtMAogTFVWX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbHV2aXQvbHV2L3JlbGVh
c2VzL2Rvd25sb2FkLyQoTFVWX1ZFUlNJT04pCiBMVVZfTElDRU5TRSA9IEFwYWNoZS0yLjAKIExV
Vl9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKLS0gCjIuMzMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
