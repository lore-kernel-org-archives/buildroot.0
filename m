Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F60C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:52:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88152611EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88152611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embedded.rocks
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5ADA9404D7;
	Mon, 18 Oct 2021 19:52:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qMs0jxc4EDi; Mon, 18 Oct 2021 19:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66B774051B;
	Mon, 18 Oct 2021 19:51:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 85E801BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72A77824EE
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new); dkim=neutral
 reason="invalid (public key: not available)" header.d=embedded.rocks
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g0sLgdnBpT-g for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:51:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B45C82435
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:51:56 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id 660FE240029
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:51:53 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4HY6vr6CBYz6tmF
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:51:52 +0200 (CEST)
Authentication-Results: mail.embedded.rocks (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=embedded.rocks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:x-mailer:message-id:date:date:subject:subject:from
 :from:received:received; s=default; t=1634586711; x=1635191512;
 bh=hqBxtNgvRT3l+vL6F+xmM+5bIbqNaFsrI8xVovbrEAE=; b=Amz9GQGxP/kb
 DsgjfzD9yBELXPlN+ln9TicYZSMG8wHED1NDUgH5NreBKHXIvNOWR0nSMSAVatyi
 QhyMiMmOOE1INWIvY1S4htfj1BR6o0RjYXIgzvifXYp1VBnN1BplVqHfx6iOcRi1
 2gzkR6AXpzvC5D08pyLTPwywoyzaMEOR/6R+yo0H8aihegEmcNa0UhFfrF7CU4mC
 pjkOoElD9L8MWx1T2hkELVB9Cp9BE3v0ck50OZPsEcNbFSvhUTiSeZvB9IBJWcgq
 seEVoUHxTjJSEo7O165GGQcXyDAPIkrgFK05m8cSEYL2YODnRkvK5QorrafxiU3U
 v5acienRGQ==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id sflrVSsAdpoO; Mon, 18 Oct 2021 21:51:51 +0200 (CEST)
Received: from nzxt.fritz.box (port-92-193-134-170.dynamic.as20676.net
 [92.193.134.170]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Mon, 18 Oct 2021 21:51:51 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 19:51:46 +0000
Message-Id: <20211018195146.184984-1-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gerbera: bump to version 1.9.2
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
Ci0tLQogcGFja2FnZS9nZXJiZXJhL2dlcmJlcmEuaGFzaCB8IDIgKy0KIHBhY2thZ2UvZ2VyYmVy
YS9nZXJiZXJhLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dlcmJlcmEvZ2VyYmVyYS5oYXNo
IGIvcGFja2FnZS9nZXJiZXJhL2dlcmJlcmEuaGFzaAppbmRleCAzNDVkODY2OTNjLi41ZGNkMzY0
YzMzIDEwMDY0NAotLS0gYS9wYWNrYWdlL2dlcmJlcmEvZ2VyYmVyYS5oYXNoCisrKyBiL3BhY2th
Z2UvZ2VyYmVyYS9nZXJiZXJhLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0
ZWQ6Ci1zaGEyNTYgIDVkMzIzYzZjYjQxNTBlMzQ1NGI4YzZlMDAxMmY0MTY0ODQ0MTc5OWJhNDRj
YjU5NDM2YjEyNGI1NGQzZmM4MmIgIGdlcmJlcmEtMS45LjEudGFyLmd6CitzaGEyNTYgIGRlZTU2
MmNjNWQyMmU4NDQyZTJmZTE2MjBiMDczYmRhNjEyYzgwZjljNGE4MzMzMzExYzY0N2RiMDZjMWM0
Y2QgIGdlcmJlcmEtMS45LjIudGFyLmd6CiBzaGEyNTYgIGNhZTQxMzgzNzNiZTQxZmQyYmU3NWZh
ZjQxY2U3ZWZiY2Y0OWZiMTdkMGUwNWFkMWM1MWNjMDFhYzMzNWI5YjYgIExJQ0VOU0UubWQKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZ2VyYmVyYS9nZXJiZXJhLm1rIGIvcGFja2FnZS9nZXJiZXJhL2dl
cmJlcmEubWsKaW5kZXggNDliNzAyZTU5Yy4uYWI0OWY2NjFhYyAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9nZXJiZXJhL2dlcmJlcmEubWsKKysrIGIvcGFja2FnZS9nZXJiZXJhL2dlcmJlcmEubWsKQEAg
LTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1HRVJCRVJBX1ZFUlNJ
T04gPSAxLjkuMQorR0VSQkVSQV9WRVJTSU9OID0gMS45LjIKIEdFUkJFUkFfU0lURSA9ICQoY2Fs
bCBnaXRodWIsZ2VyYmVyYSxnZXJiZXJhLHYkKEdFUkJFUkFfVkVSU0lPTikpCiBHRVJCRVJBX0xJ
Q0VOU0UgPSBHUEwtMi4wCiBHRVJCRVJBX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLm1kCi0tIAoy
LjMzLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
