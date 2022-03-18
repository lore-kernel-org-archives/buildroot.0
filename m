Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9861C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 13:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55D2561364;
	Fri, 18 Mar 2022 13:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEEiM-YpKoWA; Fri, 18 Mar 2022 13:41:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B4376135E;
	Fri, 18 Mar 2022 13:41:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 641B21BF27E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4431E6135E
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 13:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id as6aJwDhxQxJ for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 13:41:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18765607BC
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 13:41:42 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::222])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 45E73D3DDC
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 13:34:59 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 896F040002;
 Fri, 18 Mar 2022 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647610494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L9Eb4tJJyjDoUToCPFOOyteOx1rvpEbsar9ptG3fEJ4=;
 b=dcvH3jfIBfQ/kKrx0e5kAE80X/k/oWl+1F++fLq83pjE+4q0XrUI3ObOWfA6CSPaDZUlrr
 hdiiAt9IiLfYpeRvo1nf+OBhxp2M6xfY3oX48h2M5wCKcXcOfKXVdBmd4kg/JMZZ7f74dA
 oD7aRES8+9Lgtg33xpqu/h+NwoMwolUCNuzr+IiA5SEE/8FzxVmWep10SlSoM3ohek0Qgh
 S9XPbGtM0794/mrkpuQz/wpiahdMbNH3uMSJEozKa0js4WRznCttmJ/153aY+bgZphf8g+
 U72qzJZKPeWbtocbnS1vMDwSRcGg2GjwRlB2xtJckgFZFxH9BKSXDYVCrhwD8g==
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 14:24:22 +0100
Message-Id: <20220318132427.48737-4-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220318132427.48737-1-clement.leger@bootlin.com>
References: <20220318132427.48737-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 3/8] boot/optee-os: add support to build with
 python-cryptography
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

TmV3ZXIgdmVyc2lvbiBvZiBvcHRlZS1vcyAoPj0gMy4xNikgdXNlcyBweXRob24tY3J5cHRvZ3Jh
cGh5IGluc3RlYWQgb2YKcHl0aG9uLXB5Y3J5cHRvZG9tZXggaW4gcHl0aG9uIHNjcmlwdHMuIEFk
ZCBzdXBwb3J0IHRvIGJ1aWxkIHRoZXNlCm5ld2VyIHZlcnNpb25zIGJ5IGFkZGluZyBhIG5ldwpC
UjJfVEFSR0VUX09QVEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFkgb3B0aW9uIHdoaWNo
IHdpbGwKc2VsZWN0IGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeSBkZXBlbmRlbmN5IHdoZW4gYnVp
bGRpbmcgb3B0ZWUtb3MuCgpBY2tlZC1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJy
aWVyZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQu
bGVnZXJAYm9vdGxpbi5jb20+Ci0tLQogYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICB8IDkgKysr
KysrKysrCiBib290L29wdGVlLW9zL29wdGVlLW9zLm1rIHwgOCArKysrKysrLQogMiBmaWxlcyBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYm9v
dC9vcHRlZS1vcy9Db25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgppbmRleCBlYTE2
NTUwYjcyLi4wMmI1ZDdjODZmIDEwMDY0NAotLS0gYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbgor
KysgYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgpAQCAtMSw2ICsxLDcgQEAKIGNvbmZpZyBCUjJf
VEFSR0VUX09QVEVFX09TCiAJYm9vbCAib3B0ZWVfb3MiCiAJZGVwZW5kcyBvbiBCUjJfQVJNX0NQ
VV9BUk1WOEEgfHwgQlIyX0FSTV9DUFVfQVJNVjdBCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9I
T1NUX1JVU1RDX0FSQ0hfU1VQUE9SVFMKIAloZWxwCiAJICBPUC1URUUgT1MgcHJvdmlkZXMgdGhl
IHNlY3VyZSB3b3JsZCBib290IGltYWdlIGFuZCB0aGUgdHJ1c3QKIAkgIGFwcGxpY2F0aW9uIGRl
dmVsb3BtZW50IGtpdCBvZiB0aGUgT1AtVEVFIHByb2plY3QuIE9QLVRFRSBPUwpAQCAtNjEsNiAr
NjIsMTQgQEAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfRFRDCiAJICBTZWxlY3Qg
dGhpcyBvcHRpb24gaWYgeW91ciBPUC1URUUgT1MgcGxhdGZvcm0gY29uZmlndXJhdGlvbgogCSAg
cmVxdWlyZXMgdGhlIERldmljZSBUcmVlIGNvbXBpbGVyIHRvIGJlIGF2YWlsYWJsZS4KIAorY29u
ZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWQorCWJvb2wg
Ik9QLVRFRSBPUyBuZWVkcyBob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkiCisJaGVscAorCSAgT1At
VEVFIE9TIHZlcnNpb24gYmVsb3cgMy4xNiB1c2VkIHB5dGhvbi1weWNyeXB0b2RvbWV4CisJICBw
YWNrYWdlIGluIHB5dGhvbiBzY3JpcHRzLiBOZXdlciB2ZXJzaW9uIHVzZXMKKwkgIHB5dGhvbi1j
cnlwdG9ncmFwaHkuIFNlbGVjdCB0aGlzIG9wdGlvbiBpZiBvcHRlZS1vcyBuZWVkcworCSAgcHl0
aG9uLWNyeXB0b2dyYXBoeSB0byBiZSBidWlsdC4KKwogY29uZmlnIEJSMl9UQVJHRVRfT1BURUVf
T1NfQ09SRQogCWJvb2wgIkJ1aWxkIGNvcmUiCiAJZGVmYXVsdCB5CmRpZmYgLS1naXQgYS9ib290
L29wdGVlLW9zL29wdGVlLW9zLm1rIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawppbmRleCA5
Zjc2ZDg0NTBlLi41MzEzYTFiYWRjIDEwMDY0NAotLS0gYS9ib290L29wdGVlLW9zL29wdGVlLW9z
Lm1rCisrKyBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsKQEAgLTIxLDcgKzIxLDEzIEBAIGVs
c2UKIE9QVEVFX09TX1NJVEUgPSAkKGNhbGwgZ2l0aHViLE9QLVRFRSxvcHRlZV9vcywkKE9QVEVF
X09TX1ZFUlNJT04pKQogZW5kaWYKIAotT1BURUVfT1NfREVQRU5ERU5DSUVTID0gaG9zdC1vcGVu
c3NsIGhvc3QtcHl0aG9uMyBob3N0LXB5dGhvbi1weWNyeXB0b2RvbWV4IGhvc3QtcHl0aG9uLXB5
ZWxmdG9vbHMKK09QVEVFX09TX0RFUEVOREVOQ0lFUyA9IGhvc3Qtb3BlbnNzbCBob3N0LXB5dGhv
bjMgaG9zdC1weXRob24tcHllbGZ0b29scworCitpZmVxICgkKEJSMl9UQVJHRVRfT1BURUVfT1Nf
TkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWSkseSkKK09QVEVFX09TX0RFUEVOREVOQ0lFUyArPSBo
b3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkKK2Vsc2UKK09QVEVFX09TX0RFUEVOREVOQ0lFUyArPSBo
b3N0LXB5dGhvbi1weWNyeXB0b2RvbWV4CitlbmRpZgogCiBpZmVxICgkKEJSMl9UQVJHRVRfT1BU
RUVfT1NfTkVFRFNfRFRDKSx5KQogT1BURUVfT1NfREVQRU5ERU5DSUVTICs9IGhvc3QtZHRjCi0t
IAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
