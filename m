Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A754FC433EF
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 12:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42D7F61296;
	Fri, 11 Mar 2022 12:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9kaq2E3nhonR; Fri, 11 Mar 2022 12:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28B096128F;
	Fri, 11 Mar 2022 12:38:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD2091BF3BD
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2E9061276
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEBqQVMTTwcb for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 12:38:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F7E760B20
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 12:38:04 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 50F58C0006;
 Fri, 11 Mar 2022 12:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647002281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x2mgRJdyKjU6LuBEMN/7RPnv+vHKfRfwkJB1vTeeHaY=;
 b=W/qndcpZLmX3t95b1nQi0t1/JA1Itof3vI1oQvp53rNfvlWx2KVAN+tQPUKqy0UDeMIEfv
 PbrgKWYcYioPNRdlbGJIJzJFIB7Tk7s8TW56eA3a+VJw6iyATm47ZeRGFtnRfmmoxsBTak
 7wacZdKpMjdxBfCbHi8kvbdXhKeZbjTJWx3qZ6VPBPUqshuaqEujmreD8bUxITRJKMvyz0
 9kUFMPlO0l+3EmVOgB4Hx7SSsj2zzwiuWA+hCRsYNnf+wBjWneUwBECOpOD1+YJ1POMqfG
 uoHoglVLI3jdxcShIJmiXziLZtHMxEJAaCUS/L26fWJFnad0UdzOECkzjDQqAA==
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 13:36:29 +0100
Message-Id: <20220311123636.13415-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 0/7] boot/optee-os: support new optee-os
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
b24uCgotLS0tCkNoYW5nZXMgaW4gdjM6Ci0gRml4IGF1dGhvcnNoaXAgZm9yIGNvbW1pdHMgdGhh
dCB3ZXJlIGNvcGllZCBmcm9tIEV0aWVubmUgb25lcy4KLSBGaXggcGFja2FnZSBVUkwgZm9yIG9w
dGVlLW9zCi0gQWRkZWQgQWNrZWQtYnkgRXRpZW5uZSBDYXJyaWVyZQoKQ2hhbmdlcyBpbiB2MjoK
LSBCdW1wIG9wdGVlLWNsaWVudCwgb3B0ZWUtYmVuY2htYXJrLCBvcHRlZS1leGFtcGxlcyBhbmQg
b3B0ZWUtdGVzdAoKQ2zDqW1lbnQgTMOpZ2VyICg3KToKICBwYWNrYWdlL3B5dGhvbi1jcnlwdG9n
cmFwaHk6IGVuYWJsZSBob3N0IHBhY2thZ2UKICBib290L29wdGVlLW9zOiBhZGQgc3VwcG9ydCB0
byBidWlsZCB3aXRoIHB5dGhvbi1jcnlwdG9ncmFwaHkKICBib290L29wdGVlLW9zOiBidW1wIHRv
IHZlcnNpb24gMy4xNi4wCiAgcGFja2FnZS9vcHRlZS10ZXN0OiBidW1wIHRvIHZlcnNpb24gMy4x
Ni4wCiAgcGFja2FnZS9vcHRlZS1leGFtcGxlczogYnVtcCB0byB2ZXJzaW9uIDMuMTYuMAogIHBh
Y2thZ2Uvb3B0ZWUtY2xpZW50OiBidW1wIHRvIHZlcnNpb24gMy4xNi4wCiAgcGFja2FnZS9vcHRl
ZS1iZW5jaG1hcms6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKCiBib290L29wdGVlLW9zL0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDEzICsrKysrKysrKysrLS0KIGJvb3Qv
b3B0ZWUtb3Mvb3B0ZWUtb3MuaGFzaCAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQog
Ym9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tayAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyAr
KysrKystCiBwYWNrYWdlL29wdGVlLWJlbmNobWFyay9vcHRlZS1iZW5jaG1hcmsuaGFzaCAgICAg
ICB8ICA0ICsrLS0KIHBhY2thZ2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVlLWJlbmNobWFyay5tayAg
ICAgICAgIHwgIDIgKy0KIHBhY2thZ2Uvb3B0ZWUtY2xpZW50L29wdGVlLWNsaWVudC5oYXNoICAg
ICAgICAgICAgIHwgIDQgKystLQogcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lm1r
ICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9vcHRlZS1leGFtcGxlcy9vcHRlZS1leGFt
cGxlcy5oYXNoICAgICAgICAgfCAgNCArKy0tCiBwYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVl
LWV4YW1wbGVzLm1rICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL29wdGVlLXRlc3Qvb3B0ZWUt
dGVzdC5oYXNoICAgICAgICAgICAgICAgICB8ICA0ICsrLS0KIHBhY2thZ2Uvb3B0ZWUtdGVzdC9v
cHRlZS10ZXN0Lm1rICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2UvcHl0aG9uLWNy
eXB0b2dyYXBoeS9weXRob24tY3J5cHRvZ3JhcGh5Lm1rIHwgIDcgKysrKysrKwogMTIgZmlsZXMg
Y2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgotLSAKMi4zNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
