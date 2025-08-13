Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06044C87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 08:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C514C40F94;
	Wed, 13 Aug 2025 08:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p4as2PeAnlas; Wed, 13 Aug 2025 08:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDD3C41060
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDD3C41060;
	Wed, 13 Aug 2025 08:25:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5D43938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6FB44120D
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QZhdkV2dEC85 for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 08:25:24 +0000 (UTC)
X-Greylist: delayed 408 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 13 Aug 2025 08:25:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD16C41060
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD16C41060
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.34.113;
 helo=3.mo581.mail-out.ovh.net; envelope-from=sebastien.tisserand@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 3.mo581.mail-out.ovh.net (3.mo581.mail-out.ovh.net
 [46.105.34.113])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD16C41060
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:25:23 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.58.120])
 by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4c21V058xJz6SlL
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 08:18:32 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-gbd4g (unknown [10.108.42.201])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 189BDC023B;
 Wed, 13 Aug 2025 08:18:32 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-5b5ff79f4f-gbd4g with ESMTPSA
 id PY+uMVdKnGgBLAAAuE9Nhw
 (envelope-from <sebastien.tisserand@armadeus.com>);
 Wed, 13 Aug 2025 08:18:31 +0000
X-OVh-ClientIp: 82.66.61.158
From: =?UTF-8?q?S=C3=A9bastien=20Tisserand?= <sebastien.tisserand@armadeus.com>
To: buildroot@buildroot.org
Date: Wed, 13 Aug 2025 10:18:13 +0200
Message-ID: <20250813081813.4475-1-sebastien.tisserand@armadeus.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 5357031758475097846
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeejjeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpefurogsrghsthhivghnucfvihhsshgvrhgrnhguuceoshgvsggrshhtihgvnhdrthhishhsvghrrghnugesrghrmhgruggvuhhsrdgtohhmqeenucggtffrrghtthgvrhhnpeeivddtffevteejteeuvddvhefgkedvjeejtddvvdevhfelhedvtdetudevtdefieenucffohhmrghinhepshhighhmrgdqtghhvghmnhhithiirdguvgenucfkphepuddvjedrtddrtddruddpkedvrdeiiedriedurdduheekpdefjedrheelrddugedvrdduudefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvggsrghsthhivghnrdhtihhsshgvrhgrnhgusegrrhhmrgguvghushdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdfovfetjfhoshhtpehmohehkedumgdpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=sRoz7xvfEflmSxS1OVovuieVcM1lmkxdVnTUTcv4Sqk=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1755073112; v=1;
 b=WJW1977MabfkIgRRMyUJ+0UwPOZlnNV5O6Z+Nk15lUtFydbCZ3oFsfOXDhKq+/uNnB1iQ5sh
 mTPf0Uv4VA+G23Vr7mgOuES+OPlFoacsHTMAZONyOXirIcuniTgYw1pdX0e8/OssUBlvOEnuefM
 jjKsmV/AjYfFaXgPUq6Oe5XijkpUVxAWcvf0FEoNvlnc/G3irwwLKMeVZDv0KDOSZpZurryDT1Y
 pO5bIZ4CvUAp0KQUhdZC8c/QLYDGf1g0sObFiHChZbHAuhED3+aLZLupfAydQD4jaX15ruiRdyf
 ecoLNkElGCWTWOkhFvB+jq2sD68FIOKW6Xf2EburJvGyQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=WJW1977M
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007998b1a7e-61a0-499c-ba05-6363354311f1,
 9E69EF9D757CCE8A4B0CF4546F3487C95A201DA6)
 smtp.auth=sebastien.tisserand@armadeus.com
Subject: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-bayer2rgb-neon:
 bump to latest git commit
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
Cc: =?UTF-8?q?S=C3=A9bastien=20Tisserand?= <sebastien.tisserand@armadeus.com>,
 Eloi Bail <eloi.bail@savoirfairelinux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGFzdGVzdCBnaXQgY29tbWl0IHN1cHBvcnRzIG1vcmUgYmF5ZXIgZm9ybWF0czoKaHR0cHM6Ly9n
aXRsYWItZXh0LnNpZ21hLWNoZW1uaXR6LmRlL2Vuc2MvZ3N0LWJheWVyMnJnYi1uZW9uLy0vY29t
bWl0L2I1YWQ3OGExYzZiZmFhM2FkY2U1ZjBmNjk0OTNlZmNjZTEwNmU5NTMKClNpZ25lZC1vZmYt
Ynk6IFPDqWJhc3RpZW4gVGlzc2VyYW5kIDxzZWJhc3RpZW4udGlzc2VyYW5kQGFybWFkZXVzLmNv
bT4KLS0tCiAuLi4vZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uLmhhc2ggICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAyICstCiAuLi4vZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uL2dz
dDEtcGx1Z2lucy1iYXllcjJyZ2ItbmVvbi5tayAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dzdHJl
YW1lcjEvZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uL2dzdDEtcGx1Z2lucy1iYXllcjJyZ2It
bmVvbi5oYXNoIGIvcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtcGx1Z2lucy1iYXllcjJyZ2ItbmVv
bi9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24uaGFzaAppbmRleCAxZWZhZjY0MjFkLi5lNDk1
MDYxOTk5IDEwMDY0NAotLS0gYS9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJheWVy
MnJnYi1uZW9uL2dzdDEtcGx1Z2lucy1iYXllcjJyZ2ItbmVvbi5oYXNoCisrKyBiL3BhY2thZ2Uv
Z3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24vZ3N0MS1wbHVnaW5zLWJheWVy
MnJnYi1uZW9uLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hh
MjU2ICA2YWU4OWFkZjE5NzllZGY1NzYwYmJmMmZiNTg5ZGNhYTkwNWNmZjU1YmI4MjhlNmIyNzFi
YzNkMWU0MDNhMTMwICBnc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24tYjYzMDc5OGVmY2Q2MTE4
NzllN2NiMWMyNDYwNTJlNWJhMWFjYzQxZC1naXQ0LnRhci5negorc2hhMjU2ICBhOWUyYzllZmIw
YzI1NWYxNmVkNzVkMjU1NTEyODUxM2JlNTRhYzljMWZjNThiZmZiNDg5MjFiNGViMWY5OTQ1ICBn
c3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24tN2UwNmFhMzEwODA1YjE2MDBkMTJmMWQzYmIwMDU4
YWEwMmFiOGY4My1naXQ0LnRhci5negogc2hhMjU2ICA4Y2ViNGI5ZWU1YWRlZGRlNDdiMzFlOTc1
YzFkOTBjNzNhZDI3YjZiMTY1YTFkY2Q4MGM3YzU0NWViNjViOTAzICBDT1BZSU5HCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2dzdHJlYW1lcjEvZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uL2dzdDEt
cGx1Z2lucy1iYXllcjJyZ2ItbmVvbi5tayBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdp
bnMtYmF5ZXIycmdiLW5lb24vZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uLm1rCmluZGV4IDBk
NGFlYWM3ZjUuLmNkZTI1YWQ0NWUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3Qx
LXBsdWdpbnMtYmF5ZXIycmdiLW5lb24vZ3N0MS1wbHVnaW5zLWJheWVyMnJnYi1uZW9uLm1rCisr
KyBiL3BhY2thZ2UvZ3N0cmVhbWVyMS9nc3QxLXBsdWdpbnMtYmF5ZXIycmdiLW5lb24vZ3N0MS1w
bHVnaW5zLWJheWVyMnJnYi1uZW9uLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKIAotR1NUMV9QTFVHSU5TX0JBWUVSMlJHQl9ORU9OX1ZFUlNJT04gPSBiNjMw
Nzk4ZWZjZDYxMTg3OWU3Y2IxYzI0NjA1MmU1YmExYWNjNDFkCitHU1QxX1BMVUdJTlNfQkFZRVIy
UkdCX05FT05fVkVSU0lPTiA9IDdlMDZhYTMxMDgwNWIxNjAwZDEyZjFkM2JiMDA1OGFhMDJhYjhm
ODMKIEdTVDFfUExVR0lOU19CQVlFUjJSR0JfTkVPTl9TSVRFID0gaHR0cHM6Ly9naXRsYWItZXh0
LnNpZ21hLWNoZW1uaXR6LmRlL2Vuc2MvZ3N0LWJheWVyMnJnYi1uZW9uLmdpdAogR1NUMV9QTFVH
SU5TX0JBWUVSMlJHQl9ORU9OX1NJVEVfTUVUSE9EID0gZ2l0CiBHU1QxX1BMVUdJTlNfQkFZRVIy
UkdCX05FT05fTElDRU5TRSA9IEdQTC0zLjAKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
