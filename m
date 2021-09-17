Return-Path: <SRS0=uTOM=OH=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED08C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 13:53:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C05F1610D1
	for <buildroot@archiver.kernel.org>; Fri, 17 Sep 2021 13:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C05F1610D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.buildroot.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5949260BC9;
	Fri, 17 Sep 2021 13:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSB6qXHsyC7T; Fri, 17 Sep 2021 13:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF9C560BC8;
	Fri, 17 Sep 2021 13:53:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8ED41BF369
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 13:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9757784073
 for <buildroot@lists.busybox.net>; Fri, 17 Sep 2021 13:53:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=senzilla.io
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_iqiJzv5gSf for <buildroot@lists.busybox.net>;
 Fri, 17 Sep 2021 13:53:02 +0000 (UTC)
X-Greylist: delayed 00:09:15 by SQLgrey-1.8.0
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91FCC84072
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 13:53:02 +0000 (UTC)
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com
 [188.165.51.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-4321.protonmail.ch (Postfix) with ESMTPS id 4H9wCd4Xyxz4x2Gl
 for <buildroot@buildroot.org>; Fri, 17 Sep 2021 13:43:57 +0000 (UTC)
Authentication-Results: mail-4321.protonmail.ch;
 dkim=pass (2048-bit key) header.d=senzilla.io header.i=@senzilla.io
 header.b="dysrFWZj"
Date: Fri, 17 Sep 2021 13:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=senzilla.io;
 s=protonmail; t=1631886224;
 bh=VOrfrqr2/4zhFi7VBkEhkQX0gVQTfURHllFjEqH8kfU=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=dysrFWZjqwwkaFnwdbfq+bnSiwjLtmGA+4/zd/xnO+0hkKg4CugwVZeHqLclHyhQF
 TqWHGUzDrlUGWnUr8mVNpAwMfdtbptJ1jeyvIl9HruV7LJ9In9dtV/5Kl5lpJx/kjZ
 tU7ldQ0QVqvafEoOyjC9JrbCHS7YmoFesguoZ6ZoTy6H71L6zLMGc3GoquNx7z8HQ2
 4rfZtflSi5lJeSigS/Ybkg8av6H4117PqNLbECg5S14752v/9DZeH0sNbD382im6cQ
 nnZWZ6ExL3dgVTdJeLJY1+iYgt3NMqCBwyUoSC0x0OjjzTm+p5emytozwjl6rFdK2G
 VhfUf3aY9j/2g==
To: Kory Maincent <kory.maincent@bootlin.com>, buildroot@buildroot.org
Message-ID: <KzkhQpdQv77nQ-S-fjvQle8wMkZhXcU-JWX5SFM4jE6BmEvO24yL_RlALbjiJ5JuOokHs3-WHnc1R32suKq42HrQnqI2Sds16WhnVUGyoEg=@senzilla.io>
In-Reply-To: <20210914093457.1389174-8-kory.maincent@bootlin.com>
References: <20210914093457.1389174-1-kory.maincent@bootlin.com>
 <20210914093457.1389174-8-kory.maincent@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 7/8] package/edk2-images: new package
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
From: "D. Olsson via buildroot" <buildroot@lists.buildroot.org>
Reply-To: "D. Olsson" <hi@senzilla.io>
Cc: thomas.petazzoni@bootlin.com
Content-Type: multipart/mixed; boundary="===============3598735893452171210=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

This is a multi-part message in MIME format.

--===============3598735893452171210==
Content-Type: multipart/alternative;
 boundary="b1_02mDUHjHE7wWXbbY5gXh2xoYKSS9gNYY3CcQxnKROdw"

This is a multi-part message in MIME format.

--b1_02mDUHjHE7wWXbbY5gXh2xoYKSS9gNYY3CcQxnKROdw
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGkgS29yeSwKCk9uIFR1ZSwgU2VwIDE0LCAyMDIxIGF0IDExOjM0LCBLb3J5IE1haW5jZW50IDxr
b3J5Lm1haW5jZW50QGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSW4gb3JkZXIgdG8gYWRkIHN1cHBv
cnQgZm9yIEVGSSBib290IGZyb20gdGhlIGVtdWxhdG9yLCB0aGlzIHBhdGNoIGFkZCBhCj4gcGFj
a2FnZSB0byBkb3dubG9hZCB0aGUgRUZJIEJJT1MgcHJlYnVpbHQgYmluYXJ5IGZyb206Cj4gaHR0
cHM6Ly93d3cua3JheGVsLm9yZy9yZXBvcy9qZW5raW5zL2VkazIvCgpTaW5jZSBhIGZldyBtb250
aHNbMV0gaXQncyBiZWVuIHBvc3NpYmxlIHRvIGJ1aWxkIEVESzIgZnJvbSBzb3VyY2UgaW4gQnVp
bGRyb290LiBXb3VsZCBpdCBiZSBwb3NzaWJsZSB0byBleHRlbmQgdGhlIGV4aXN0aW5nIHBhY2th
Z2UgaW5zdGVhZCBvZiBkdXBsaWNhdGluZyB0aGUgZWZmb3J0IGJ5IG1haW50YWluaW5nIHR3byBw
YWNrYWdlcz8KClsxXTogaHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvbG9nL2Jv
b3QvZWRrMi9lZGsyLmhhc2g/c2hvd21zZz0xCgpDaGVlcnMKCkQuIE9sc3Nvbg==

--b1_02mDUHjHE7wWXbbY5gXh2xoYKSS9gNYY3CcQxnKROdw
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGh0bWw+PGhlYWQ+PC9oZWFkPjxib2R5PiAgPGRpdj5IaSBLb3J5LDxjYXJldD48L2NhcmV0Pjwv
ZGl2PjxkaXY+PGJyPjwvZGl2Pk9uIFR1ZSwgU2VwIDE0LCAyMDIxIGF0IDExOjM0LCBLb3J5IE1h
aW5jZW50ICZsdDs8YSBocmVmPSJtYWlsdG86a29yeS5tYWluY2VudEBib290bGluLmNvbSIgY2xh
c3M9IiI+a29yeS5tYWluY2VudEBib290bGluLmNvbTwvYT4mZ3Q7IHdyb3RlOjxibG9ja3F1b3Rl
IGNsYXNzPSJwcm90b25tYWlsX3F1b3RlIiB0eXBlPSJjaXRlIj4gIEluIG9yZGVyIHRvIGFkZCBz
dXBwb3J0IGZvciBFRkkgYm9vdCBmcm9tIHRoZSBlbXVsYXRvciwgdGhpcyBwYXRjaCBhZGQgYTxi
cj5wYWNrYWdlIHRvIGRvd25sb2FkIHRoZSBFRkkgQklPUyBwcmVidWlsdCBiaW5hcnkgZnJvbTo8
YnI+aHR0cHM6Ly93d3cua3JheGVsLm9yZy9yZXBvcy9qZW5raW5zL2VkazIvPC9ibG9ja3F1b3Rl
PlNpbmNlIGEgZmV3IG1vbnRoc1sxXSBpdCdzIGJlZW4gcG9zc2libGUgdG8gYnVpbGQgRURLMiBm
cm9tIHNvdXJjZSBpbiBCdWlsZHJvb3QuIFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGV4dGVuZCB0
aGUgZXhpc3RpbmcgcGFja2FnZSBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIHRoZSBlZmZvcnQgYnkg
bWFpbnRhaW5pbmcgdHdvIHBhY2thZ2VzPzxkaXY+PGJyPjwvZGl2PjxkaXY+WzFdOiZuYnNwOzxh
IGhyZWY9Imh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2xvZy9ib290L2VkazIv
ZWRrMi5oYXNoP3Nob3dtc2c9MSI+aHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3Qv
bG9nL2Jvb3QvZWRrMi9lZGsyLmhhc2g/c2hvd21zZz0xPC9hPjxicj48YnI+PC9kaXY+PGRpdj48
YnI+PC9kaXY+PGRpdj48Y2FyZXQ+PC9jYXJldD5DaGVlcnM8L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2PkQuIE9sc3NvbjwvZGl2PjwvYm9keT48L2h0bWw+


--b1_02mDUHjHE7wWXbbY5gXh2xoYKSS9gNYY3CcQxnKROdw--


--===============3598735893452171210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3598735893452171210==--

