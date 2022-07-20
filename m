Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06E7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 08:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335D561113;
	Wed, 20 Jul 2022 08:54:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 335D561113
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1dyyBwbdAYoN; Wed, 20 Jul 2022 08:54:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B28A610EE;
	Wed, 20 Jul 2022 08:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B28A610EE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B86C1BF300
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 08:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5630E827D2
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 08:54:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5630E827D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1EoAbElltbQh for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 08:54:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DE2E827CA
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DE2E827CA
 for <buildroot@busybox.net>; Wed, 20 Jul 2022 08:54:32 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id CDAB9440F3B;
 Wed, 20 Jul 2022 11:53:56 +0300 (IDT)
To: buildroot@busybox.net
Date: Wed, 20 Jul 2022 11:54:05 +0300
Message-Id: <7e2b2434ee6372f950cce9f78a113fc1ef71d047.1658307245.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658307242;
 bh=RKJjzNNjUNTuf6K3cd9YEZJRVVCfTyXw4q6dn0D23S8=;
 h=From:To:Cc:Subject:Date:From;
 b=RIUS1k1k4qtpUJkpGo73ydmJvR+BowUAKB0D0dEj6QUBOC8MVLoKiHNmDZqLMNOTZ
 JCqgEbKu+uCMFJFgDTDr6+22AEHBtk2WNdfY8wBtL7PUZvnqiHfSAyL5ARHL3AuABE
 aImgOkmMkNf2zCYm98J0OgwR9uwKJz/OhGYkzuPSZoBdwrtmP9mmZ/gpx9k+wOBIIn
 daBN8i6ZHZjDhEu6le2DldhQQQmAiaj5YPpU4YCnnBgQgyVg21ZKgsYlZBFe/WMr5I
 9gvhBZQgybfYbTIsXaCEy52upuptzRm4iBbfRZtqV60hA/UEjiL2CojT2kfWxNtw7p
 +rcmlElZSbVUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=RIUS1k1k
Subject: [Buildroot] [PATCH] package/zeromq: drop libuuid dependency
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WmVyb01RIHJlbW92ZWQgdGhlIGxpYnV1aWQgZGVwZW5kZW5jeSBpbiB2ZXJzaW9uIDMuMS4wLCAx
MCsgeWVhcnMgYWdvLgoKQ2M6IEFzYWYgS2FobG9uIDxhc2Fma2E3QGdtYWlsLmNvbT4KU2lnbmVk
LW9mZi1ieTogQmFydWNoIFNpYWNoIDxiYXJ1Y2hAdGtvcy5jby5pbD4KLS0tCiBwYWNrYWdlL3pl
cm9tcS9Db25maWcuaW4gfCAyIC0tCiBwYWNrYWdlL3plcm9tcS96ZXJvbXEubWsgfCAxIC0KIDIg
ZmlsZXMgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3plcm9t
cS9Db25maWcuaW4gYi9wYWNrYWdlL3plcm9tcS9Db25maWcuaW4KaW5kZXggY2Y1YzY0NGMzOWJm
Li4yMDlhY2YxYTU3YmUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvemVyb21xL0NvbmZpZy5pbgorKysg
Yi9wYWNrYWdlL3plcm9tcS9Db25maWcuaW4KQEAgLTUsOCArNSw2IEBAIGNvbmZpZyBCUjJfUEFD
S0FHRV9aRVJPTVEKIAlib29sICJ6ZXJvbXEiCiAJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJT
VERDUFAKIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMKLQlzZWxlY3QgQlIy
X1BBQ0tBR0VfVVRJTF9MSU5VWAotCXNlbGVjdCBCUjJfUEFDS0FHRV9VVElMX0xJTlVYX0xJQlVV
SUQKIAloZWxwCiAJICDDmE1RIChaZXJvTVEsIDBNUSwgem1xKSBsb29rcyBsaWtlIGFuIGVtYmVk
ZGFibGUgbmV0d29ya2luZwogCSAgbGlicmFyeSBidXQgYWN0cyBsaWtlIGEgY29uY3VycmVuY3kg
ZnJhbWV3b3JrLiBJdCBnaXZlcyB5b3UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemVyb21xL3plcm9t
cS5tayBiL3BhY2thZ2UvemVyb21xL3plcm9tcS5tawppbmRleCAxODI2OTk0MDNjYjIuLmMyMmY2
OWVjNjZjMSAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZXJvbXEvemVyb21xLm1rCisrKyBiL3BhY2th
Z2UvemVyb21xL3plcm9tcS5tawpAQCAtNyw3ICs3LDYgQEAKIFpFUk9NUV9WRVJTSU9OID0gNC4z
LjQKIFpFUk9NUV9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL3plcm9tcS9saWJ6bXEvcmVsZWFz
ZXMvZG93bmxvYWQvdiQoWkVST01RX1ZFUlNJT04pCiBaRVJPTVFfSU5TVEFMTF9TVEFHSU5HID0g
WUVTCi1aRVJPTVFfREVQRU5ERU5DSUVTID0gdXRpbC1saW51eAogWkVST01RX0NPTkZfT1BUUyA9
IC0tZGlzYWJsZS1XZXJyb3IgLS13aXRob3V0LWRvY3VtZW50YXRpb24KIFpFUk9NUV9MSUNFTlNF
ID0gTEdQTC0zLjArIHdpdGggZXhjZXB0aW9ucwogWkVST01RX0xJQ0VOU0VfRklMRVMgPSBDT1BZ
SU5HIENPUFlJTkcuTEVTU0VSCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
