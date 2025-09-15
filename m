Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35630CAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 19:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C04A8117D;
	Mon, 15 Sep 2025 19:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-k_ECEvlQPw; Mon, 15 Sep 2025 19:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88EB581168
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88EB581168;
	Mon, 15 Sep 2025 19:38:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB96112D
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1B5781166
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:38:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NClwuUrQKjhd for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 19:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DA0EC81129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA0EC81129
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA0EC81129
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 19:38:09 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6A7245FFC0;
 Mon, 15 Sep 2025 21:38:03 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Julien Olivain <ju.o@free.fr>
Date: Mon, 15 Sep 2025 21:37:56 +0200
Message-ID: <20250915193756.509482-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757965087;
 bh=hdp5dScIwvQ3ZgH7FyUlMC48hodNLW9pWHsVBDrpnUw=;
 h=From:To:Cc:Subject:Date:From;
 b=pbleTDmzZuGha0sJ9QJ9+CFt5mHY84hg2zPiUwOkv/AnmMBeocD4J9T8UkLY321+3
 Nh0MyBt6CiEQEQiZj7yUH9djC8e11KQdBTAeW9Z7bF0b7852NK/+lZp2E2FY0wEcmL
 yK+s9Qp2rqmfQa787YSIFLIgZMLo2xedgrw6kKlIIGTeNETRC5QEG4cpBDOm+Cf6/M
 bfinYsCKURbbJnvJrMA+w/3uDTwkTl/eMFx5LApS3JipZy515G2chkX2NxUsS9oFYp
 fCX5i/vPdIY3adsykV3JTH72MJwEZd0lxMwnggIUn+ilp7VVv2NmqJUTjb8N4i1mVM
 tKUXogUOHeZLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pbleTDmz
Subject: [Buildroot] [PATCH 1/1] configs/arm_foundationv8: add eth0 to be
 configured by dhcp at boot
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlICJib2FyZC9hcm0vZm91bmRhdGlvbi12OC9yZWFkbWUudHh0IiBib2FyZCBkb2N1bWVudGF0
aW9uIGZpbGUgWzFdCnJlY29tbWVuZHMgdG8gc3RhcnQgdGhlIEZvdW5kYXRpb25fUGxhdGZvcm0g
ZW11bGF0b3Igd2l0aCBhIG5hdApuZXR3b3JrLCBidXQgdGhlIGNvcnJlc3BvbmRpbmcgZGVmY29u
ZmlnIGRvZXMgaW5jbHVkZSB0aGUgZGhjcApuZXR3b3JrIGNvbmZpZ3VyYXRpb24gZm9yIHRoZSBu
ZXR3b3JrIGludGVyZmFjZS4KClRoaXMgY29tbWl0IGFkZHMgdGhlICJldGgwIiBpbnRlcmZhY2Ug
dG8gYmUgY29uZmlndXJlZCBieSBESENQCmF0IGJvb3QsIGluIG9yZGVyIHRvIGhhdmUgYSB3b3Jr
aW5nIG5ldHdvcmsgY29ubmVjdGl2aXR5LgoKWzFdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAyNS4wOC9ib2FyZC9hcm0vZm91bmRhdGlvbi12OC9y
ZWFkbWUudHh0I0wzOQoKQ2M6IFZpbmNlbnQgU3RlaGzDqSA8dmluY2VudC5zdGVobGVAbGFwb3N0
ZS5uZXQ+ClNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Ci0tLQpQ
YXRjaCB0ZXN0ZWQgb24gYnJhbmNoIG1hc3RlciBhdCBjb21taXQgY2NiY2IwZCwKZm9sbG93aW5n
IGluc3RydWN0aW9ucyBmcm9tOgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9ibG9iLzIwMjUuMDgvYm9hcmQvYXJtL2ZvdW5kYXRpb24tdjgvcmVhZG1lLnR4dAoK
VGhlbiwgbG9nZ2VkIGluIHRoZSBlbXVsYXRvciBhcyAicm9vdCIKCndnZXQgaHR0cDovL2J1aWxk
cm9vdC5vcmcvCi0tLQogY29uZmlncy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvY29uZmlncy9hcm1f
Zm91bmRhdGlvbnY4X2RlZmNvbmZpZyBiL2NvbmZpZ3MvYXJtX2ZvdW5kYXRpb252OF9kZWZjb25m
aWcKaW5kZXggOTIxZmJmNjJjNS4uNjFlMmYzNTljZSAxMDA2NDQKLS0tIGEvY29uZmlncy9hcm1f
Zm91bmRhdGlvbnY4X2RlZmNvbmZpZworKysgYi9jb25maWdzL2FybV9mb3VuZGF0aW9udjhfZGVm
Y29uZmlnCkBAIC0zLDYgKzMsNyBAQCBCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VT
VE9NXzZfMTU9eQogQlIyX0dMT0JBTF9QQVRDSF9ESVI9ImJvYXJkL2FybS9mb3VuZGF0aW9uLXY4
L3BhdGNoZXMiCiBCUjJfRE9XTkxPQURfRk9SQ0VfQ0hFQ0tfSEFTSEVTPXkKIEJSMl9UQVJHRVRf
R0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlBTUEwIgorQlIyX1NZU1RFTV9ESENQPSJldGgwIgogQlIy
X0xJTlVYX0tFUk5FTD15CiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKIEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMTUuNyIKLS0gCjIuNTEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
