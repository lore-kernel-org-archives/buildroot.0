Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BED1D6554F
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 12:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D98260A7D;
	Wed, 17 Dec 2025 12:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBvXcPE6RhHg; Wed, 17 Dec 2025 12:05:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DD56607AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765973134;
	bh=T1DtV0n6I/xLoRieF00dW+dNemej928UVQfinCv5cKE=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LPh5jRNKgeZqSrH8W0DyLWfqXYF3LMLsawBxw7WzfBoMhajcdSCmx8R862ljL8xQo
	 MVTCF0I/w6zlqd/o+Xu//zlfGwvpRmoVhgvn3yguGXmVTiJG79J+TMSneDK8fITsDD
	 PjE/mMTG6LyhCrot7gEJS+9QxYzD5Mp7v5lyEhVwVhETY3OXUM6bVbzCtkE4c5hQA9
	 4Oon1Yyu/E4sgJzsJ1ubes3j13zbFaa6Ij1gCnWNn5fOcVHgtTBztDtkvQyyXy0+qq
	 eBB0lPahA18xptepFFUJCqnmf9UOjJnEH/mOjuOFEeta0pZ/FUAy1IKf9SQs/NL98a
	 jtU4zcB4rneqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DD56607AC;
	Wed, 17 Dec 2025 12:05:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E184C364
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 12:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D31BA82FB1
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 12:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8b2Yvx8dvps for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 12:05:32 +0000 (UTC)
X-Greylist: delayed 4207 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 17 Dec 2025 12:05:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E611582477
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E611582477
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.58.60;
 helo=3.mo575.mail-out.ovh.net; envelope-from=sebastien.szymanski@armadeus.com;
 receiver=<UNKNOWN> 
Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net
 [46.105.58.60])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E611582477
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 12:05:29 +0000 (UTC)
Received: from director10.ghost.mail-out.ovh.net (unknown [10.110.54.196])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4dWXM65s6cz5vxd
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 11:56:18 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-ggsqx (unknown [10.108.54.171])
 by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 76E57C142F;
 Wed, 17 Dec 2025 11:56:18 +0000 (UTC)
Received: from armadeus.com ([37.59.142.113])
 by ghost-submission-7d8d68f679-ggsqx with ESMTPSA
 id kxHLD2KaQmlzDwoAQ0PQJw
 (envelope-from <sebastien.szymanski@armadeus.com>);
 Wed, 17 Dec 2025 11:56:18 +0000
X-OVh-ClientIp: 90.11.244.6
From: =?utf-8?q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Wed, 17 Dec 2025 12:56:13 +0100
MIME-Version: 1.0
Message-Id: <20251217-pixman-aarch64-neon-fix-v2-1-e0889825b157@armadeus.com>
X-B4-Tracking: v=1; b=H4sIAFyaQmkC/4WNQQ6CMBBFr0Jm7Zi2alFW3sOwGMpUZkFLWiUYw
 t2tXMDle8l/f4XMSThDU62QeJYsMRQwhwrcQOHJKH1hMMpctNE1TrKMFJAoucGeMXAM6GVBbT0
 729Wd8h7Kekpc9F5+tIUHya+YPvvRrH/2f3PWqPFEluhqlLrVfKc0Us/vfHRxhHbbti+wIY8Tw
 QAAAA==
X-Change-ID: 20251217-pixman-aarch64-neon-fix-16fec6b7b0ff
To: buildroot@buildroot.org
X-Mailer: b4 0.14.3
X-Ovh-Tracer-Id: 11124454029723364213
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTGnwuHToFZjfUhXG+sVRUtA4uxHOr6UDQwaQ3d9mOPklDfWEb8Dew0x2i2j0nPK+0pW68SbTu8pypZSddW8EKExe/rLaf0Nq6A1uO5cGyGT/jpj5RfYCUU6iGWVRCE/Evzx176NCdz8+MSs0TBXTa8DpQo8AMxr2w9uJFdvGWhWDnMFaAXnJu4txfXpzBCcCy7aKKwop5fYVH/5JWK6N3Y9q06sJlKCxFgJGo/YfUr1e4sAEYjAuiHpXUVbgfdR9fuNgCNyDR2N1o1XbKnUFlIRZkRQ/5ib44DB1FyupHS0k4ZdZrUczgYgL7hiIZlIYUo4WqkLMkfFwhEAjynbCETDLTLl5XIN3MLezpWfHHDqCLqmQq21WKkEYBCI2kanwy5/yHr97OujzNrT5VP/TZLsHVli3WLUwxpn7kFAQkYVhJMU+GSdSvErtrazMJwubb3Xc9yUxOJlZRv/pYITzmY5cn29stFZHzB9Hk2Uc0DA/bvM7vp8hWXhWW+g2l6HEO1UaoBYjB4IoIxmchQNN0Vwr7TxwImbhElKDBXqq8Rvy3Kay00Bq/Sed4eqnPfE2bmQANWzkeBWKjkuaGYyWh4GYX8DZ0dqrDW5Sxs1qEstVl1/kNHXBF1AC40ZwRnBJ7XgH0T5NVxvNw8sjn1QUDSp40VHYQVgmAvfSAdcdPePrw
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=wvAhRjcIJ0OxRCXU9z6VWOqBPjOgwvewPxvlftwkL9s=; 
 c=relaxed/relaxed; d=armadeus.com; h=From; s=ovhmo103079-selector1;
 t=1765972578; v=1;
 b=AEr6h+ra/MSlAqSbeYkUkj5q/DjvsZWk9JwwTNizLnOoQl2wuo5r5mL151TVm8nh4Mrn0izn
 S35R+QvK0ng5Ryt9urpDr4RAd2xVCUFvFjOKQu2KLgN35Naoz8swIF8dqLL0mO28k9gg/Tfrc8x
 cTjRvAcpn7uaK9fNFQT7s6aHORYg1ttvWpto7p7agkDscvhsW/heo9IGzZJ9ajLjaMgEy9vzd7O
 sNvn2VHzZkSsJ9T5IiHBOdKhZnyyhw0cDu24/x+8YZ6gi83l5NTTV16h4lUT6Ivo106L6gCZvjx
 bWler10SmVbRqDPukppwI8diw5D+nJn7iavg187XVxEBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=armadeus.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=armadeus.com header.i=@armadeus.com header.a=rsa-sha256
 header.s=ovhmo103079-selector1 header.b=AEr6h+ra
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-113S007e808b951-0e50-4c44-9e45-3d43f80be461,
 4C433822E3DABC298646871AECD04F63782792CD)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: [Buildroot] [PATCH v2] package/pixman: fix NEON support on AArch64
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHRlc3QgdG8gZW5hYmxlIE5FT04gb24gQUFyY2g2NCBpcyBhcyBmb2xsb3dpbmc6CgppZmVx
ICgkKEJSMl9hYXJjaDY0KSQoQlIyX0FSTV9DUFVfSEFTX05FT04pLHl5KQoKSXQgY2Fubm90IGJl
IHRvIHRydWUgYXMgJChCUjJfYWFyY2g2NCkgYW5kICQoQlIyX0FSTV9DUFVfSEFTX05FT04pIGFy
ZQptdXR1YWxseSBleGNsdXNpdmUuIE5FT04gaXMgY29tcHVsc29yeSBvbiBBQXJjaDY0IHNvIHJl
bW92ZQokKEJSMl9BUk1fQ1BVX0hBU19ORU9OKSBmcm9tIHRoZSB0ZXN0LgoKU2lnbmVkLW9mZi1i
eTogU8OpYmFzdGllbiBTenltYW5za2kgPHNlYmFzdGllbi5zenltYW5za2lAYXJtYWRldXMuY29t
PgotLS0KQ2hhbmdlcyBpbiB2MjoKKiBmaXggY29tbWl0IHRpdGxlIChwYWNrYWdlL3BpeG1hbjog
aW5zdGVhZCBvZiBwaXhtYW46KQoqIFJlbW92ZSAiY2hlcnJ5IHBpY2tlZCBmcm9tLi4uIiBsaW5l
IGZyb20gdGhlIGNvbW1pdCBsb2cKKiBhZGQgIkJhY2twb3J0IHRvOiIgbm90ZQoqIExpbmsgdG8g
djE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTEyMTctcGl4bWFuLWFhcmNoNjQtbmVv
bi1maXgtdjEtMS0zYTZhYTgyMDA5N2VAYXJtYWRldXMuY29tCi0tLQpCYWNrcG9ydCB0bzogMjAy
NS4xMS54LCAyMDI1LjAyLngKLS0tCiBwYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsgYi9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsKaW5k
ZXggMWI2NmI0MTcxOTI1Li44N2Q5NzMyMzBmNzggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcGl4bWFu
L3BpeG1hbi5taworKysgYi9wYWNrYWdlL3BpeG1hbi9waXhtYW4ubWsKQEAgLTY4LDcgKzY4LDcg
QEAgZWxzZQogUElYTUFOX0NPTkZfT1BUUyArPSAtRG5lb249ZGlzYWJsZWQKIGVuZGlmCiAKLWlm
ZXEgKCQoQlIyX2FhcmNoNjQpJChCUjJfQVJNX0NQVV9IQVNfTkVPTikseXkpCitpZmVxICgkKEJS
Ml9hYXJjaDY0KSx5KQogUElYTUFOX0NPTkZfT1BUUyArPSAtRGE2NC1uZW9uPWVuYWJsZWQKIGVs
c2UKIFBJWE1BTl9DT05GX09QVFMgKz0gLURhNjQtbmVvbj1kaXNhYmxlZAoKLS0tCmJhc2UtY29t
bWl0OiAxN2Q4MzkyNjAzMmJmYTY5MjkzYjk5NDQ3M2U1OTkxNTlhMGZjOGNiCmNoYW5nZS1pZDog
MjAyNTEyMTctcGl4bWFuLWFhcmNoNjQtbmVvbi1maXgtMTZmZWM2YjdiMGZmCgpCZXN0IHJlZ2Fy
ZHMsCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSA8c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1
cy5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
