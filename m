Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CB1E87841
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 15:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC40409A0;
	Tue,  3 Feb 2026 15:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0wPwkynOseo; Tue,  3 Feb 2026 15:54:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CD0C4085D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770134081;
	bh=HLYmgPqxX7XIRGVxknf7WEXJRuA5nQnXp0oZJEIL09U=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=VMams0exRjK6Oetn80R+0YhF1p2q4GcjZ/Qky8EzEZyNs0ullulH4iq6sWsfsqZff
	 ZuqidIdXD1oYHloBO8ZgHchRtT6P+GNqWASNC76ED/jw/xy4FQhVJDIiQlR94Eacp6
	 YnGvqdaMWESyvk/PdFH8oaXLU79WGJmAHKGv0JVRj6FXhbA36hy35FLOKmSAScx48c
	 A6FMmVGBQ/ZHO6UIKR3Dp3ROdXxRUQwl2h+iQJn6zooDGdACs8qhWogZnozJFa831u
	 mx0p6KapbdvpjY8jTmVJtU1VWO/O7CoIEVZai50uWnTtXCxdXfYLOUjPjdsUsspgO6
	 rsX3UPpjlq+8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CD0C4085D;
	Tue,  3 Feb 2026 15:54:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C55CF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D10D80CD8
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VZKw9sbl5sca for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 15:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.56.78;
 helo=9.mo576.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1A44E80C77
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A44E80C77
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net
 [46.105.56.78])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A44E80C77
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 15:54:37 +0000 (UTC)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.254.119])
 by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4f55h06WV4z5yXb
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:38:24 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-5twcp (unknown [10.110.101.93])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8468610015C;
 Tue,  3 Feb 2026 14:38:24 +0000 (UTC)
Received: from armadeus.com ([37.59.142.98])
 by ghost-submission-7d8d68f679-5twcp with ESMTPSA
 id DBaCFGAIgmkRehQA2wKZ7w
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Tue, 03 Feb 2026 14:38:24 +0000
X-OVh-ClientIp: 90.126.104.208
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Tue, 03 Feb 2026 15:38:11 +0100
Message-Id: <20260203-bump-imx-packages-lf-6-12-49-2-2-0-v1-0-548f3fc77a59@armadeus.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFMIgmkC/x2NwQrCMBAFf6Xs2Qe70bbor0gPabOpi7aGBKVQ+
 u8GmdNcZnYqmk0L3Zqdsn6t2HutIqeGpodfZ4WF6uTYdSzSYvwsCbZsSH56+lkLXhEdxOFyhas
 wepY+tueRAweqoZQ12vaf3Ifj+AHuKExedAAAAA==
X-Change-ID: 20260115-bump-imx-packages-lf-6-12-49-2-2-0-7017f53b0d0d
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 603482352677284725
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGY9qpGRGwB+OqREurgiDkYuWq6w7eX4qIuFl1CUpScIPCTDnJHZsybcB7lxv9C7mRwswEghXBLCGeiYGK6+7ivQg00dslNEiK14YH5Vc6mW1kwaHipC7GAedYzvDm5PSNF88aJ58j7epGpRhdgfvqp/2CXkj+qaWepx7eAuITcHVwaoN12YEeXFAhG0USa1bx09kZvx70Ccli1e1UQcV0KVJ7sAcxWsA5+jMKGPXcoB5WPNDXcY3q6fzaXWoetmP5M0oMtwDp34lvHc+sp0TsTcPIJSPkLqMNm3bL5NoBSmBvb2CIM2qt1BFAv8p/v4HU5LtQEtuwcgSoGPlwaYgnnsbgxWWCfvL37PwuoqDHWz8m3ON+QVIjQPR7ubizsuuCfrxawCQypywIMU+zX1UrVMAiNvGxJDl/W4W1ikPx1h810k/WgfQZEybHnOJAphzCWvJ7/K7j87/5TYnYCYzaftOmxUliStKx38F0iu5WI2sii5P889wnOAavGsTQKALa9WPguRByDHGhhljMNK/sFeDg3dcfyTLBD0YBt1kTAWdnIHVRO0OlIaN7oORhHGi76r2ikl+KiPB40FFONKEFsYvwFjBdYjPkUhwlFmdo0ViYDTzmol1PXlllcRBojcImWiLve508goj17ra2eYXN9vPdo6Dc4v1RW3wZdiVlrFA
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=la9q+/qJJR1rIhnqbkooGQ4zzcQZOpkbEEWHMe7ZcXY=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1770129505; v=1;
 b=Jr4B75y1q3W20KI6/cMjM4hvEE+yHESUckmlZaSv4dWud+4LVSJJF50v17FvAHMk8L8ym/0r
 +a5lTHKL5gk1JvbiExJjezNCOYWypFDPkbiFdIbc7dB36FlJ++RihcdSDHnbl9ADzuQFqhuDDbf
 37qYrIutXWl7DK9Ej9G0MqXLtE2NVl1fA4FCrOQog6fGDyW3KYAatvWf0BvzE1kUB6MbCdmIE95
 9p+32pusWwmFCMnt3gK7gqytMRqPI4b/oBtfgUf0ZKZ/M6RmT+iFjlDzw+5yvNJ6m7ThCqE6lbw
 c22wB+i0/t26TgZxiP0P7o0HtPbAmIaIXp81Lh433A4lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=Jr4B75y1
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002daaf9b3e-f2ff-4fc2-b8a5-ae3d9653c148,
 004BD5E907DC429EAD4B1A0856BA767B03FD8B65)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH 0/9] package/freescale-imx: bump to NXP release
 LF6.12.49_2.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Erik Larsson <karl.erik.larsson@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgYnVtcHMgc29tZSBmcmVlc2NhbGUtaW14IHBhY2thZ2VzIHRvIHRoZSBsYXRl
c3QgTlhQIHJlbGVhc2UKTEY2LjEyLjQ5XzIuMi4wOgoKaHR0cHM6Ly93d3cubnhwLmNvbS9kb2Nz
L2VuL3JlbGVhc2Utbm90ZS9STjAwMjEwLnBkZgoKU2lnbmVkLW9mZi1ieTogU8OpYmFzdGllbiBT
enltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29tPgotLS0KU8OpYmFzdGll
biBTenltYW5za2kgKDkpOgogICAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxl
LWlteDogYnVtcCB0byB2ZXJzaW9uIDIuMC40CiAgICAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9m
aXJtd2FyZS1pbXg6IGJ1bXAgdmVyc2lvbiB0byA4LjMwCiAgICAgIHBhY2thZ2UvZnJlZXNjYWxl
LWlteC9pbXgtZ3B1LWcyZDogYnVtcCB2ZXJzaW9uIHRvIDYuNC4xMS5wNC4yCiAgICAgIHBhY2th
Z2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LXZpdjogYnVtcCB2ZXJzaW9uIHRvIDYuNC4xMS5wNC4y
CiAgICAgIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRybzogYnVtcCB2ZXJzaW9u
IHRvIDEuMzkuMAogICAgICBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LXZwdS1oYW50cm8tZGFl
bW9uOiBidW1wIHZlcnNpb24gdG8gMS44LjAKICAgICAgcGFja2FnZS9mcmVlc2NhbGUtaW14L2lt
eC12cHUtaGFudHJvLXZjOiBidW1wIHZlcnNpb24gdG8gMS4xMS4wCiAgICAgIHBhY2thZ2UvZnJl
ZXNjYWxlLWlteC9pbXgtY29kZWM6IGJ1bXAgdG8gdmVyc2lvbiA0LjEwLjAKICAgICAgcGFja2Fn
ZS9pbXgtbWtpbWFnZTogYnVtcCB0byB2ZXJzaW9uIGxmLTYuMTIuNDktMi4yLjAKCiBwYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9maXJtd2FyZS1lbGUtaW14Lmhhc2ggICAg
ICB8IDYgKysrLS0tCiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvZmlybXdhcmUtZWxlLWlteC9maXJt
d2FyZS1lbGUtaW14Lm1rICAgICAgICB8IDQgKystLQogcGFja2FnZS9mcmVlc2NhbGUtaW14L2Zp
cm13YXJlLWlteC9maXJtd2FyZS1pbXguaGFzaCAgICAgICAgICAgICAgfCA2ICsrKy0tLQogcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2Zpcm13YXJlLWlteC9maXJtd2FyZS1pbXgubWsgICAgICAgICAg
ICAgICAgfCA0ICsrLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtY29kZWMvaW14LWNvZGVj
Lmhhc2ggICAgICAgICAgICAgICAgICAgIHwgOCArKysrLS0tLQogcGFja2FnZS9mcmVlc2NhbGUt
aW14L2lteC1jb2RlYy9pbXgtY29kZWMubWsgICAgICAgICAgICAgICAgICAgICAgfCA1ICsrKy0t
CiBwYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS1nMmQvaW14LWdwdS1nMmQuaGFzaCAgICAg
ICAgICAgICAgICB8IDggKysrKy0tLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtZ3B1LWcy
ZC9pbXgtZ3B1LWcyZC5tayAgICAgICAgICAgICAgICAgIHwgNiArKystLS0KIHBhY2thZ2UvZnJl
ZXNjYWxlLWlteC9pbXgtZ3B1LXZpdi9pbXgtZ3B1LXZpdi5oYXNoICAgICAgICAgICAgICAgIHwg
OCArKysrLS0tLQogcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtdml2L2lteC1ncHUtdml2
Lm1rICAgICAgICAgICAgICAgICAgfCA2ICsrKy0tLQogLi4uL2lteC12cHUtaGFudHJvLWRhZW1v
bi9pbXgtdnB1LWhhbnRyby1kYWVtb24uaGFzaCAgICAgICAgICAgICAgfCAyICstCiAuLi4vZnJl
ZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby1kYWVtb24vaW14LXZwdS1oYW50cm8tZGFlbW9uLm1r
ICB8IDQgKystLQogcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC12cHUtaGFudHJvLXZjL2lteC12
cHUtaGFudHJvLXZjLmhhc2ggICAgfCA2ICsrKy0tLQogcGFja2FnZS9mcmVlc2NhbGUtaW14L2lt
eC12cHUtaGFudHJvLXZjL2lteC12cHUtaGFudHJvLXZjLm1rICAgICAgfCA0ICsrLS0KIHBhY2th
Z2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby9pbXgtdnB1LWhhbnRyby5oYXNoICAgICAg
ICAgIHwgNiArKystLS0KIHBhY2thZ2UvZnJlZXNjYWxlLWlteC9pbXgtdnB1LWhhbnRyby9pbXgt
dnB1LWhhbnRyby5tayAgICAgICAgICAgIHwgNCArKy0tCiBwYWNrYWdlL2lteC1ta2ltYWdlL2lt
eC1ta2ltYWdlLmhhc2ggICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIHBhY2th
Z2UvaW14LW1raW1hZ2UvaW14LW1raW1hZ2UubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMiArLQogMTggZmlsZXMgY2hhbmdlZCwgNDYgaW5zZXJ0aW9ucygrKSwgNDUgZGVsZXRp
b25zKC0pCi0tLQpiYXNlLWNvbW1pdDogZmNlNzI4NzY1NjMyZjU4ODJkMzM0ZjI5NTU4Njg2NDA0
MzEyMWNjOQpjaGFuZ2UtaWQ6IDIwMjYwMTE1LWJ1bXAtaW14LXBhY2thZ2VzLWxmLTYtMTItNDkt
Mi0yLTAtNzAxN2Y1M2IwZDBkCgpCZXN0IHJlZ2FyZHMsCi0tIApTw6liYXN0aWVuIFN6eW1hbnNr
aSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
