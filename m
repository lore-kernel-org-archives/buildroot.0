Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524EAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 13:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1160E41A02;
	Fri, 18 Mar 2022 13:36:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iNrhaGL7kLgi; Fri, 18 Mar 2022 13:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A497419FC;
	Fri, 18 Mar 2022 13:36:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 36C6D1C1148
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 234648188A
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:34:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TsxR8bfSLwaI for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 13:34:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47AED81886
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 13:34:58 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 247FF40007;
 Fri, 18 Mar 2022 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647610493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5pZ4GlZilfR5FdqyY2TWgZrZyrLEAkk3XHgi47GnEM0=;
 b=jSnT+oIx8arXbpPfN7C8V7It+BL7WBDrhkuj4wp3b9uqXh0NZzQxrr1zzjZRW4KeqtlCgL
 Jgw9p5+xMhZtGUNYp/OsDX8e1XYIMElvcimxThEnpIaCm6/JNQFe4Tfz4Tn/1+Wr/pj5s/
 BTdwDKMaL5S8mCVom6ZzD9Uo2W8MvjqVC+BdQNZhmUmNkkbclRNLOk17MZLya32/+X61MA
 9wyAMvnp1vSGXYPCcFa/yAx+ocCkQNBpyuEzRzT21DRMXDPhjp0GosgvV870jGJLCIZAJF
 nX0nECtIlxD/UJnFo8GUW5/hlLaBg/PaWn/vR1Oan5qIRPodlkItmBJwFOET7w==
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 14:24:19 +0100
Message-Id: <20220318132427.48737-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 0/8] boot/optee-os: support new optee-os
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
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
b24uCgotLS0tCkNoYW5nZXMgaW4gdjU6Ci0gQWRkIFlhbm4gcGF0Y2ggZm9yIGhvc3QgdmFyaWFi
bGUgaW5oZXJpdGFuY2UKLSBNb3ZlIEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NS
WVBUT0dSQVBIWSBvcHRpb24KLSBSZW1vdmUgaG9zdCBpbmhlcml0ZWQgdmFyaWFibGVzIGZyb20g
cHl0aG9uLWNyeXB0b2dyYXBoeSBwYWNrYWdlCgpDaGFuZ2VzIGluIHY0OgotIEFkZCBtaXNzaW5n
IHZhcmlhYmxlcyBmb3IgcHl0aG9uIGhvc3QgcGFja2FnZQotIEZvdW5kIGEgbWlzc2luZyBEVEMg
ZGVwZW5kZW5jeSB3aGlsZSB0ZXN0aW5nIGJ1aWxkIGluIGRvY2tlciBjb250YWluZXIKLSBGaXgg
QlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZIHRpdGxlCi0gQ2hh
bmdlIHRoZSBsb2dpYyB0byBzZWxlY3QgQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05f
Q1JZUFRPR1JBUEhZCi0gb3B0ZWUtb3Mgbm93IGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9S
VVNUQ19BUkNIX1NVUFBPUlRTCgpDaGFuZ2VzIGluIHYzOgotIEZpeCBhdXRob3JzaGlwIGZvciBj
b21taXRzIHRoYXQgd2VyZSBjb3BpZWQgZnJvbSBFdGllbm5lIG9uZXMuCi0gRml4IHBhY2thZ2Ug
VVJMIGZvciBvcHRlZS1vcwotIEFkZGVkIEFja2VkLWJ5IEV0aWVubmUgQ2FycmllcmUKCkNoYW5n
ZXMgaW4gdjI6Ci0gQnVtcCBvcHRlZS1jbGllbnQsIG9wdGVlLWJlbmNobWFyaywgb3B0ZWUtZXhh
bXBsZXMgYW5kIG9wdGVlLXRlc3QKCkNsw6ltZW50IEzDqWdlciAoNyk6CiAgcGFja2FnZS9weXRo
b24tY3J5cHRvZ3JhcGh5OiBlbmFibGUgaG9zdCBwYWNrYWdlCiAgYm9vdC9vcHRlZS1vczogYWRk
IHN1cHBvcnQgdG8gYnVpbGQgd2l0aCBweXRob24tY3J5cHRvZ3JhcGh5CiAgYm9vdC9vcHRlZS1v
czogYnVtcCB0byB2ZXJzaW9uIDMuMTYuMAogIHBhY2thZ2Uvb3B0ZWUtdGVzdDogYnVtcCB0byB2
ZXJzaW9uIDMuMTYuMAogIHBhY2thZ2Uvb3B0ZWUtZXhhbXBsZXM6IGJ1bXAgdG8gdmVyc2lvbiAz
LjE2LjAKICBwYWNrYWdlL29wdGVlLWNsaWVudDogYnVtcCB0byB2ZXJzaW9uIDMuMTYuMAogIHBh
Y2thZ2Uvb3B0ZWUtYmVuY2htYXJrOiBidW1wIHRvIHZlcnNpb24gMy4xNi4wCgpZYW5uIEUuIE1P
UklOICgxKToKICBwYWNrYWdlL3BrZy1nZW5lcmljOiBob3N0IHZhcmlhbnQgaW5oZXJpdHMgdGFy
Z2V0IGRvd25sb2FkIHNldHRpbmdzCgogYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgIHwgMTQgKysrKysrKysrLS0KIGJvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MuaGFz
aCAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIGJvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsg
ICAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrKy0KIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJr
L29wdGVlLWJlbmNobWFyay5oYXNoICB8ICA0ICsrLS0KIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJr
L29wdGVlLWJlbmNobWFyay5tayAgICB8ICAyICstCiBwYWNrYWdlL29wdGVlLWNsaWVudC9vcHRl
ZS1jbGllbnQuaGFzaCAgICAgICAgfCAgNCArKy0tCiBwYWNrYWdlL29wdGVlLWNsaWVudC9vcHRl
ZS1jbGllbnQubWsgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9vcHRlZS1leGFtcGxlcy9vcHRl
ZS1leGFtcGxlcy5oYXNoICAgIHwgIDQgKystLQogcGFja2FnZS9vcHRlZS1leGFtcGxlcy9vcHRl
ZS1leGFtcGxlcy5tayAgICAgIHwgIDIgKy0KIHBhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0
Lmhhc2ggICAgICAgICAgICB8ICA0ICsrLS0KIHBhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0
Lm1rICAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL3BrZy1nZW5lcmljLm1rICAgICAgICAg
ICAgICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrCiAuLi4vcHl0aG9uLWNyeXB0
b2dyYXBoeS5tayAgICAgICAgICAgICAgICAgICAgfCAxMiArKysrKysrKysrCiAxMyBmaWxlcyBj
aGFuZ2VkLCA2OSBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCi0tIAoyLjM0LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
