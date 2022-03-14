Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B865C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 15:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 02AA081D70;
	Mon, 14 Mar 2022 15:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0XQKlUTEy0LM; Mon, 14 Mar 2022 15:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294EE81C2F;
	Mon, 14 Mar 2022 15:32:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2C70D1BF395
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A5E060D66
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:32:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jGz9g-Dtu5IP for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 15:32:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB14960C21
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 15:32:53 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C29586000E;
 Mon, 14 Mar 2022 15:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647271971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qekPviEgJo7q+MvuwVNLaTnUXyNmHtQjnh0f2Azl9Zg=;
 b=AYBlRXM70Drt/BY9Y3HJWCphdnGlHFJ1pf6F3zOx0ns5JOgoK7vk1bWtV41mx9FiM0H0Hg
 KSiQTtQT32IS/BWcC8o6hCwi6v+pLFZ3ypF5Fya+keg3LtG5yEOvQr466iSbGJ8hoxRhqv
 45NGGX2zW/04TzKxlhxTJkQYFeF54r6MC+BVC3rTWsLHiKQ52Njw95isseQJtX91vFBs7Y
 pFHE0q1iDruKXJqHYD2Jg+EmU51eCgtjzYczrHYzrresjkKxlZPe9ehObVXSrGEfQwHHU8
 la24RfEY0PZxy/bcrJAfN+T4aWkWBzMvoMQA0hm4z0D0BzSKX1n8EDNvugQhMA==
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 16:31:03 +0100
Message-Id: <20220314153111.1390512-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 0/8] boot/optee-os: support new optee-os
 3.16.0 build dependencies
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmV3ZXIgdmVyc2lvbnMgb2Ygb3B0ZWUtb3MgKD49IDMuMTYuMCkgdXNlcyBweXRob24tY3J5cHRv
Z3JhcGh5IGluc3RlYWQKb2YgcHl0aG9uLXB5Y3J5cHRvZG9tZXggdG8gYnVpbGQuIFRoaXMgc2Vy
aWVzIGFkZHMgc3VwcG9ydCB0byBidWlsZApob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkgYW5kIHVz
ZXMgaXQgaW4gb3B0ZWUtb3MgcGFja2FnZSB0byBidWlsZCB0aGUKMy4xNi4wIHZlcnNpb24uIEFs
c28gYnVtcCBvcHRlZS1jbGllbnQsIG9wdGVlLWJlbmNobWFyaywgb3B0ZWUtZXhhbXBsZXMKYW5k
IG9wdGVlLXRlc3Qgd2hpY2ggbmVlZHMgdG8gYmUgYWxpZ25lZCB3aXRoIG9wdGVlLW9zIHZlcnNp
b24uCgotLS0tCkNoYW5nZXMgaW4gdjQ6Ci0gQWRkIG1pc3NpbmcgdmFyaWFibGVzIGZvciBweXRo
b24gaG9zdCBwYWNrYWdlCi0gRm91bmQgYSBtaXNzaW5nIERUQyBkZXBlbmRlbmN5IHdoaWxlIHRl
c3RpbmcgYnVpbGQgaW4gZG9ja2VyIGNvbnRhaW5lcgotIEZpeCBCUjJfVEFSR0VUX09QVEVFX09T
X05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFkgdGl0bGUKLSBDaGFuZ2UgdGhlIGxvZ2ljIHRvIHNl
bGVjdCBCUjJfVEFSR0VUX09QVEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFkKLSBvcHRl
ZS1vcyBub3cgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDX0FSQ0hfU1VQUE9SVFMK
CkNoYW5nZXMgaW4gdjM6Ci0gRml4IGF1dGhvcnNoaXAgZm9yIGNvbW1pdHMgdGhhdCB3ZXJlIGNv
cGllZCBmcm9tIEV0aWVubmUgb25lcy4KLSBGaXggcGFja2FnZSBVUkwgZm9yIG9wdGVlLW9zCi0g
QWRkZWQgQWNrZWQtYnkgRXRpZW5uZSBDYXJyaWVyZQoKQ2hhbmdlcyBpbiB2MjoKLSBCdW1wIG9w
dGVlLWNsaWVudCwgb3B0ZWUtYmVuY2htYXJrLCBvcHRlZS1leGFtcGxlcyBhbmQgb3B0ZWUtdGVz
dAoKQ2zDqW1lbnQgTMOpZ2VyICg4KToKICBib290L29wdGVlLW9zOiBhZGQgb3B0aW9uIHRvIHNl
bGVjdCBEVEMgZGVwZW5kZW5jeQogIHBhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeTogZW5hYmxl
IGhvc3QgcGFja2FnZQogIGJvb3Qvb3B0ZWUtb3M6IGFkZCBzdXBwb3J0IHRvIGJ1aWxkIHdpdGgg
cHl0aG9uLWNyeXB0b2dyYXBoeQogIGJvb3Qvb3B0ZWUtb3M6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2
LjAKICBwYWNrYWdlL29wdGVlLXRlc3Q6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKICBwYWNrYWdl
L29wdGVlLWV4YW1wbGVzOiBidW1wIHRvIHZlcnNpb24gMy4xNi4wCiAgcGFja2FnZS9vcHRlZS1j
bGllbnQ6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKICBwYWNrYWdlL29wdGVlLWJlbmNobWFyazog
YnVtcCB0byB2ZXJzaW9uIDMuMTYuMAoKIGJvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluICAgICAgICAg
ICAgICAgICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrLS0KIGJvb3Qvb3B0ZWUtb3Mvb3B0
ZWUtb3MuaGFzaCAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGJvb3Qvb3B0ZWUtb3Mvb3B0
ZWUtb3MubWsgICAgICAgICAgICAgICAgICAgICB8IDEyICsrKysrKysrKystCiBwYWNrYWdlL29w
dGVlLWJlbmNobWFyay9vcHRlZS1iZW5jaG1hcmsuaGFzaCAgfCAgNCArKy0tCiBwYWNrYWdlL29w
dGVlLWJlbmNobWFyay9vcHRlZS1iZW5jaG1hcmsubWsgICAgfCAgMiArLQogcGFja2FnZS9vcHRl
ZS1jbGllbnQvb3B0ZWUtY2xpZW50Lmhhc2ggICAgICAgIHwgIDQgKystLQogcGFja2FnZS9vcHRl
ZS1jbGllbnQvb3B0ZWUtY2xpZW50Lm1rICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2Uvb3B0ZWUt
ZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMuaGFzaCAgICB8ICA0ICsrLS0KIHBhY2thZ2Uvb3B0ZWUt
ZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMubWsgICAgICB8ICAyICstCiBwYWNrYWdlL29wdGVlLXRl
c3Qvb3B0ZWUtdGVzdC5oYXNoICAgICAgICAgICAgfCAgNCArKy0tCiBwYWNrYWdlL29wdGVlLXRl
c3Qvb3B0ZWUtdGVzdC5tayAgICAgICAgICAgICAgfCAgMiArLQogLi4uL3B5dGhvbi1jcnlwdG9n
cmFwaHkubWsgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKwogMTIgZmlsZXMg
Y2hhbmdlZCwgNTggaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgotLSAKMi4zNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
