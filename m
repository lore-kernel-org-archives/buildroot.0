Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E25C433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 20:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F80C84260;
	Tue, 15 Mar 2022 20:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fGWCcYzIcrM3; Tue, 15 Mar 2022 20:54:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C3EA84206;
	Tue, 15 Mar 2022 20:54:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF7BD1BF263
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DAB860B6B
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 20:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgEUjoc4R_OA for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 20:54:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48F5160B53
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 20:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647377647;
 bh=BJjR1+gEf73X0uh5Ir9GoDKGvxdYCmkUWWTljFsbRXs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=lu8lkCjCdO2netlYxVNNEqHj73jMqdge7IHgPX05DrIpAQHQKLw1AouowW0ZlOr7c
 vYUxDJQjcj30dYBiRytt2CfVs7GNOvA1xBlz99kkBnK+rCSYUVeC87kAJigF3riS93
 Om0+RvPHWmeeCPavkfD4EKOIEbO3YhA31Krx0ISE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.226]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M3UV8-1nUmPU3aAU-000Z6B; Tue, 15 Mar 2022 21:54:06 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 21:54:05 +0100
Message-Id: <20220315205405.9291-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:9vbp4Sm+7nA4PMMj1xSlPEgEx4jLezyYcYN1zbzCi2q9i+Xvl1j
 Erl41dNoMB1Bv05Z9GOWp3avs5srmezRP1J+zZT0JjDjlfUhLhsRxt4seT8Qt94+NklJ71A
 ARHgj9b0Iis/aAt7IC+klcTEylD5YqZpxOTmhw6DIiC2nwArmSoZXHPpVAWuXm5C+C2hsZy
 Pg4avpz+Wm1+Zn1wPzwpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UdUernRITzE=:S2MbMl+4fxfU/L33yULnjs
 Gje0rkG+Ek5trAhlufmBOynvlmHBuS4wnwtefrKDhpEO0CxtW8HjG5m5Nn+csFtde4YgviRE5
 aJHUuJIuopHLNeHSCfs7nofJ/VHKwN+e9wgXLrnJdr7PE8F8l7rKF3iJqAUxcV1YrFgNJvuse
 w8bEevWmyWikkCRDl2uICM154a05UFoNl1xjdlRqnne2/ZfJcxR5EAaSQnj/3IipGy78prHoH
 G+9+LLx6N948hdwdtDxfM2z6GQVi/DlddQ/1GnENO8dpdkrnpin5J0Rd1MbqLufwGXZkFSmBL
 IquB8SBICXIDywQLTJdGa17lU7fW2yn7kvJTfnCAKLUGZ+QkcAS7emaBMogSviRAbWjMMEQy/
 v3BNWs7lefZIp1czYKctv3uNYF0iKpywbFeY/G+NMVNhtFCGiK7EENyBs+qFnSjADLdoGcR3Y
 nBnEsEyckCnmzrwi6bTZiNtdTPp4+n80tP0/9lBTwi2543GFc94I7ed9U2cjeDot/alieEQ52
 QQx2kNfISrKHpk5qw6G9d26J0wa31WRZoE0JeJ9zRiQPsfqiEQptOQIb0lzP0nm6RHyfafw8r
 2xYYebkypT4hbb75n+JKMt0o/Wr8Qvyn8P7n15AbMkBQAH97Op3g2nDBSwNCin+SQ9fmGR/wb
 2Caxw3EkqNjMFqv/V9Gtbo4vd8PAH2z3sjBtSipnV32Wg+8v+dO7U69f0d5qmbNFEf5j5xpIb
 3QTY3wOj0PvSSpQS2nm669NoORVfygkZg2pzzTO3jyHjcQDjovjq52/BwqClalYoWi08ydreV
 bQT3wdyT6Z3IIXIDsjyU46sbcXOra0ol3ya0xI83K5NqTkmYLNcImsDvZNYh3ajeQvJI8AUgy
 U5VWatXj8DR1O5GuH+FazhW1BCIeIYN/8USouJCOkkyTTIUx/wu++YWkOmv2j0wLthpXh726w
 XwU/rKJc+rD8UhqNLLJrjAQYhTlwAhsSRpV/y8ceJ2L1mvlSiehMJgvbIMhbhJpiu7Fnv3ljQ
 CqmV1peFdBy3u5q+pZyF8T3wozExvGk9Vi014gUpSAllmcDUfihT41LEpK80GcfjxqCfC1RB1
 BsWGwSChOBoPbk=
Subject: [Buildroot] [PATCH v1] package/libopenssl: bump version to 1.1.1n
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlcyBiZXR3ZWVuIDEuMS4xbSBhbmQgMS4xLjFuIFsxNSBNYXIgMjAyMl0KCiAgKikgRml4
ZWQgYSBidWcgaW4gdGhlIEJOX21vZF9zcXJ0KCkgZnVuY3Rpb24gdGhhdCBjYW4gY2F1c2UgaXQg
dG8gbG9vcCBmb3JldmVyCiAgICAgZm9yIG5vbi1wcmltZSBtb2R1bGkuCgogICAgIEludGVybmFs
bHkgdGhpcyBmdW5jdGlvbiBpcyB1c2VkIHdoZW4gcGFyc2luZyBjZXJ0aWZpY2F0ZXMgdGhhdCBj
b250YWluCiAgICAgZWxsaXB0aWMgY3VydmUgcHVibGljIGtleXMgaW4gY29tcHJlc3NlZCBmb3Jt
IG9yIGV4cGxpY2l0IGVsbGlwdGljIGN1cnZlCiAgICAgcGFyYW1ldGVycyB3aXRoIGEgYmFzZSBw
b2ludCBlbmNvZGVkIGluIGNvbXByZXNzZWQgZm9ybS4KCiAgICAgSXQgaXMgcG9zc2libGUgdG8g
dHJpZ2dlciB0aGUgaW5maW5pdGUgbG9vcCBieSBjcmFmdGluZyBhIGNlcnRpZmljYXRlIHRoYXQK
ICAgICBoYXMgaW52YWxpZCBleHBsaWNpdCBjdXJ2ZSBwYXJhbWV0ZXJzLgoKICAgICBTaW5jZSBj
ZXJ0aWZpY2F0ZSBwYXJzaW5nIGhhcHBlbnMgcHJpb3IgdG8gdmVyaWZpY2F0aW9uIG9mIHRoZSBj
ZXJ0aWZpY2F0ZQogICAgIHNpZ25hdHVyZSwgYW55IHByb2Nlc3MgdGhhdCBwYXJzZXMgYW4gZXh0
ZXJuYWxseSBzdXBwbGllZCBjZXJ0aWZpY2F0ZSBtYXkKICAgICB0aHVzIGJlIHN1YmplY3QgdG8g
YSBkZW5pYWwgb2Ygc2VydmljZSBhdHRhY2suIFRoZSBpbmZpbml0ZSBsb29wIGNhbiBhbHNvCiAg
ICAgYmUgcmVhY2hlZCB3aGVuIHBhcnNpbmcgY3JhZnRlZCBwcml2YXRlIGtleXMgYXMgdGhleSBj
YW4gY29udGFpbiBleHBsaWNpdAogICAgIGVsbGlwdGljIGN1cnZlIHBhcmFtZXRlcnMuCgogICAg
IFRodXMgdnVsbmVyYWJsZSBzaXR1YXRpb25zIGluY2x1ZGU6CgogICAgICAtIFRMUyBjbGllbnRz
IGNvbnN1bWluZyBzZXJ2ZXIgY2VydGlmaWNhdGVzCiAgICAgIC0gVExTIHNlcnZlcnMgY29uc3Vt
aW5nIGNsaWVudCBjZXJ0aWZpY2F0ZXMKICAgICAgLSBIb3N0aW5nIHByb3ZpZGVycyB0YWtpbmcg
Y2VydGlmaWNhdGVzIG9yIHByaXZhdGUga2V5cyBmcm9tIGN1c3RvbWVycwogICAgICAtIENlcnRp
ZmljYXRlIGF1dGhvcml0aWVzIHBhcnNpbmcgY2VydGlmaWNhdGlvbiByZXF1ZXN0cyBmcm9tIHN1
YnNjcmliZXJzCiAgICAgIC0gQW55dGhpbmcgZWxzZSB3aGljaCBwYXJzZXMgQVNOLjEgZWxsaXB0
aWMgY3VydmUgcGFyYW1ldGVycwoKICAgICBBbHNvIGFueSBvdGhlciBhcHBsaWNhdGlvbnMgdGhh
dCB1c2UgdGhlIEJOX21vZF9zcXJ0KCkgd2hlcmUgdGhlIGF0dGFja2VyCiAgICAgY2FuIGNvbnRy
b2wgdGhlIHBhcmFtZXRlciB2YWx1ZXMgYXJlIHZ1bG5lcmFibGUgdG8gdGhpcyBEb1MgaXNzdWUu
CiAgICAgKENWRS0yMDIyLTA3NzgpCiAgICAgW1RvbcOhxaEgTXLDoXpdCgogICopIEFkZCBjaXBo
ZXJzdWl0ZXMgYmFzZWQgb24gREhFX1BTSyAoUkZDIDQyNzkpIGFuZCBFQ0RIRV9QU0sgKFJGQyA1
NDg5KQogICAgIHRvIHRoZSBsaXN0IG9mIGNpcGhlcnN1aXRlcyBwcm92aWRpbmcgUGVyZmVjdCBG
b3J3YXJkIFNlY3JlY3kgYXMKICAgICByZXF1aXJlZCBieSBTRUNMRVZFTCA+PSAzLgoKICAgICBb
RG1pdHJ5IEJlbHlhdnNraXksIE5pY29sYSBUdXZlcmldCgpTaWduZWQtb2ZmLWJ5OiBQZXRlciBT
ZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLQogcGFja2FnZS9saWJvcGVuc3NsL2xpYm9w
ZW5zc2wuaGFzaCB8IDQgKystLQogcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsgICB8
IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLmhhc2ggYi9wYWNrYWdl
L2xpYm9wZW5zc2wvbGlib3BlbnNzbC5oYXNoCmluZGV4IGEwNTVjYmMyNzAuLjIyYmIzNjViY2Mg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlib3BlbnNzbC9saWJvcGVuc3NsLmhhc2gKKysrIGIvcGFj
a2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBo
dHRwczovL3d3dy5vcGVuc3NsLm9yZy9zb3VyY2Uvb3BlbnNzbC0xLjEuMW0udGFyLmd6LnNoYTI1
Ngotc2hhMjU2ICBmODkxOTliZThiMjNjYTQ1ZmM3Y2I5ZjFkOGQzZWU2NzMxMjMxODI4NmFkMDMw
ZjUzMTZhY2E2NDYyZGI2Yzk2ICBvcGVuc3NsLTEuMS4xbS50YXIuZ3oKKyMgRnJvbSBodHRwczov
L3d3dy5vcGVuc3NsLm9yZy9zb3VyY2Uvb3BlbnNzbC0xLjEuMW4udGFyLmd6LnNoYTI1Ngorc2hh
MjU2ICA0MGRjZWI1MWE0ZjZhNTI3NWJkZTBlNmJmMjBlZjRiOTFiZmMzMmVkNTdjMDU1MmUyZThl
MTU0NjMzNzJiMTdhICBvcGVuc3NsLTEuMS4xbi50YXIuZ3oKIAogIyBMaWNlbnNlIGZpbGVzCiBz
aGEyNTYgIGMzMjkxM2IzMzI1MmU3MTE5MGFmMjA2NmYwODExNWM2OWJjOWZkZGFkZjNiZjI5Mjk2
ZTIwYzgzNTM4OTg0MWMgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlib3BlbnNzbC9s
aWJvcGVuc3NsLm1rIGIvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsKaW5kZXggYmQ4
ZWY2MTQxYS4uYWU2NjU4ZWQ0MCAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9w
ZW5zc2wubWsKKysrIGIvcGFja2FnZS9saWJvcGVuc3NsL2xpYm9wZW5zc2wubWsKQEAgLTQsNyAr
NCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSUJPUEVOU1NMX1ZFUlNJT04g
PSAxLjEuMW0KK0xJQk9QRU5TU0xfVkVSU0lPTiA9IDEuMS4xbgogTElCT1BFTlNTTF9TSVRFID0g
aHR0cHM6Ly93d3cub3BlbnNzbC5vcmcvc291cmNlCiBMSUJPUEVOU1NMX1NPVVJDRSA9IG9wZW5z
c2wtJChMSUJPUEVOU1NMX1ZFUlNJT04pLnRhci5negogTElCT1BFTlNTTF9MSUNFTlNFID0gT3Bl
blNTTCBvciBTU0xlYXkKLS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
