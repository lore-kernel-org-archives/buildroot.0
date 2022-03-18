Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7705C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 13:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CD4261358;
	Fri, 18 Mar 2022 13:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ibtaqghUUC7E; Fri, 18 Mar 2022 13:35:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9417060A7B;
	Fri, 18 Mar 2022 13:35:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 169F01BF27E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 347C2419F5
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nun8w9BXQ7iC for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 13:34:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A5BA40529
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 13:34:56 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A36BB40009;
 Fri, 18 Mar 2022 13:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647610494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbuL6pqSglIMRgjv0Eu7fm24pO2TTDUXxBdbl4XK5wA=;
 b=BxQrrS4GlrZQsUagn/cpyIhvjlq1wsacfr6lgN8+R4yDjZL4d5GkMv2G0ac9NmPu8n44nn
 4UAkRUK3IlPIe6mFLtASRgLd2cV0Y1/kM7bZplmqS+hpR6T/kR6aBXCpCEaXon6prfa1TC
 xVE7ep9AZlcbdxr7YE4vQVWJyG8NIiQI/0TOEB3Rkt58w3MTYETa+jW7L9s+domjFDup80
 VTAkQ0tCmvxqLP8W9NaxdZpPG8LQC2S85pppPeCQW56lAWH3BTXbIBLPCZzVZM4lTpsdqb
 L46FVHtw9TuCgrQdpmTSNqM1cNcX7T9p715avxGYw4t+1TIAZ0d0TS7F1JlMHA==
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 14:24:20 +0100
Message-Id: <20220318132427.48737-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132427.48737-1-clement.leger@bootlin.com>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/8] package/pkg-generic: host variant
 inherits target download settings
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KCkl0IHNlZW1z
IHJlYXNvbmFibGUgdG8gZXhwZWN0IHRoYXQgdGhlIGRvd25sb2FkIG9mIHRoZSBob3N0IGFuZCB0
YXJnZXQKdmFyaWFudHMgc2hvdWxkIHVzdWFsbHkgYmUgZXhhY3RseSB0aGUgc2FtZSBhbmQgdGh1
cyByZXVzZSB0aGUgdGFyZ2V0CnBhY2thZ2UgdmFsdWVzIGZvciB0aGUgaG9zdCBwYWNrYWdlLiBU
aGlzIGNvbW1pdHMgYWRkIHN1cHBvcnQgdG8KaW5oZXJpdCBob3N0IF9ETF9TVUJESVIsIF9ET1dO
TE9BRF9ERVBFTkRFTkNJRVMsIF9ETF9FTlYgYW5kCl9ET3dOTE9BRF9QT1NUX1BST0NFU1MgdmFy
aWFibGVzIGZyb20gdGFyZ2V0IG9uZXMuIFRoZXNlIHZhcmlhYmxlcyBjYW4Kc3RpbGwgYmUgb3Zl
cnJpZGVuIGlmIG5lY2Vzc2FyeSBmb3IgdGhlIGhvc3QgcGFja2FnZS4KClNpZ25lZC1vZmYtYnk6
IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPgpTaWduZWQtb2ZmLWJ5OiBD
bMOpbWVudCBMw6lnZXIgPGNsZW1lbnQubGVnZXJAYm9vdGxpbi5jb20+Ci0tLQogcGFja2FnZS9w
a2ctZ2VuZXJpYy5tayB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy1nZW5lcmljLm1r
IGIvcGFja2FnZS9wa2ctZ2VuZXJpYy5tawppbmRleCBiM2E3ZTFkNjBlLi43OWZjZjYwM2QzIDEw
MDY0NAotLS0gYS9wYWNrYWdlL3BrZy1nZW5lcmljLm1rCisrKyBiL3BhY2thZ2UvcGtnLWdlbmVy
aWMubWsKQEAgLTU0MCw2ICs1NDAsMzAgQEAgaWZuZGVmICQoMilfU1VCRElSCiAgZW5kaWYKIGVu
ZGlmCiAKK2lmbmRlZiAkKDIpX0RMX1NVQkRJUgorIGlmZGVmICQoMylfRExfU1VCRElSCisgICQo
MilfRExfU1VCRElSID0gJCQoJCgzKV9ETF9TVUJESVIpCisgZW5kaWYKK2VuZGlmCisKK2lmbmRl
ZiAkKDIpX0RPV05MT0FEX0RFUEVOREVOQ0lFUworIGlmZGVmICQoMylfRE9XTkxPQURfREVQRU5E
RU5DSUVTCisgICQoMilfRE9XTkxPQURfREVQRU5ERU5DSUVTID0gJCQoZmlsdGVyLW91dCAkKDEp
LCQkKCQoMylfRE9XTkxPQURfREVQRU5ERU5DSUVTKSkKKyBlbmRpZgorZW5kaWYKKworaWZuZGVm
ICQoMilfRExfRU5WCisgaWZkZWYgJCgzKV9ETF9FTlYKKyAgJCgyKV9ETF9FTlYgPSAkJCgkKDMp
X0RMX0VOVikKKyBlbmRpZgorZW5kaWYKKworaWZuZGVmICQoMilfRE9XTkxPQURfUE9TVF9QUk9D
RVNTCisgaWZkZWYgJCgzKV9ET1dOTE9BRF9QT1NUX1BST0NFU1MKKyAgJCgyKV9ET1dOTE9BRF9Q
T1NUX1BST0NFU1MgPSAkJCgkKDMpX0RPV05MT0FEX1BPU1RfUFJPQ0VTUykKKyBlbmRpZgorZW5k
aWYKKwogaWZuZGVmICQoMilfU1RSSVBfQ09NUE9ORU5UUwogIGlmZGVmICQoMylfU1RSSVBfQ09N
UE9ORU5UUwogICAkKDIpX1NUUklQX0NPTVBPTkVOVFMgPSAkJCgkKDMpX1NUUklQX0NPTVBPTkVO
VFMpCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
