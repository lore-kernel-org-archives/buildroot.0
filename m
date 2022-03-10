Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F83C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 17:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 700EB4192A;
	Thu, 10 Mar 2022 17:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Km3dIlEhLl8A; Thu, 10 Mar 2022 17:00:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B48841798;
	Thu, 10 Mar 2022 17:00:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 317791BF2F3
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9EAD41929
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 16:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WD9xx52n7Uv9 for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 16:59:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F6DC414CC
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 16:59:04 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0AD5560005;
 Thu, 10 Mar 2022 16:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646931542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LoX0Z7n1zpwk1MdBOqTAuBm8I1H+YJBTPNVDWtpO6o8=;
 b=LPNqBKx9gYCcp+5uOwcWb0Wwdmo7N9nV5+umTdzXtEOsn1nLexVB30kFX9DbSAwCMex53C
 OYUShR7tw6scDOkEQwEPC83vWTrVDsdzC64GfKqVBfsNZfz/nobAdna1mZwsTPKagnv5Ve
 4iC3p6xhI7YmVCJa8hssDPP8rNWS6jVO6T7YVNPQUuNty8de7/lmoe1hhYThhVAbu3SdpH
 Ybd9k05KtF+u4d5eKr9EXpaG27pUPw4KGzCLzniqDtaeVRjaMsbXNPG3bmESEeERPVug/R
 /8jYVMfje7A7VFBLHZnt8wBkAtJc9hGAbq3SSlPIPZCmjq/EPKWOMIXNwjRZeQ==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 17:57:28 +0100
Message-Id: <20220310165735.1102802-1-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 0/7] boot/optee-os: support new optee-os
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
IG9wdGVlLXRlc3Qgd2hpY2ggbmVlc3MgdG8gYmUgYWxpZ25lZCB3aXRoIG9wdGVlLW9zIHZlcnNp
b24uCgotLS0tCgpDaGFuZ2VzIGluIHYyOgotIEJ1bXAgb3B0ZWUtY2xpZW50LCBvcHRlZS1iZW5j
aG1hcmssIG9wdGVlLWV4YW1wbGVzIGFuZCBvcHRlZS10ZXN0CgpDbMOpbWVudCBMw6lnZXIgKDQp
OgogIHBhY2thZ2UvcHl0aG9uLWNyeXB0b2dyYXBoeTogZW5hYmxlIGhvc3QgcGFja2FnZQogIGJv
b3Qvb3B0ZWUtb3M6IGFkZCBzdXBwb3J0IHRvIGJ1aWxkIHdpdGggcHl0aG9uLWNyeXB0b2dyYXBo
eQogIGJvb3Qvb3B0ZWUtb3M6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKICBwYWNrYWdlL29wdGVl
LXRlc3Q6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKCkV0aWVubmUgQ2FycmllcmUgKDMpOgogIHBh
Y2thZ2Uvb3B0ZWUtZXhhbXBsZXM6IGJ1bXAgdG8gdmVyc2lvbiAzLjE2LjAKICBwYWNrYWdlL29w
dGVlLWNsaWVudDogYnVtcCB0byB2ZXJzaW9uIDMuMTYuMAogIHBhY2thZ2Uvb3B0ZWUtYmVuY2ht
YXJrOiBidW1wIHRvIHZlcnNpb24gMy4xNi4wCgogYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxMyArKysrKysrKysrKy0tCiBib290L29wdGVlLW9z
L29wdGVlLW9zLmhhc2ggICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBib290L29wdGVl
LW9zL29wdGVlLW9zLm1rICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKysrKy0KIHBh
Y2thZ2Uvb3B0ZWUtYmVuY2htYXJrL29wdGVlLWJlbmNobWFyay5oYXNoICAgICAgIHwgIDQgKyst
LQogcGFja2FnZS9vcHRlZS1iZW5jaG1hcmsvb3B0ZWUtYmVuY2htYXJrLm1rICAgICAgICAgfCAg
MiArLQogcGFja2FnZS9vcHRlZS1jbGllbnQvb3B0ZWUtY2xpZW50Lmhhc2ggICAgICAgICAgICAg
fCAgNCArKy0tCiBwYWNrYWdlL29wdGVlLWNsaWVudC9vcHRlZS1jbGllbnQubWsgICAgICAgICAg
ICAgICB8ICAyICstCiBwYWNrYWdlL29wdGVlLWV4YW1wbGVzL29wdGVlLWV4YW1wbGVzLmhhc2gg
ICAgICAgICB8ICA0ICsrLS0KIHBhY2thZ2Uvb3B0ZWUtZXhhbXBsZXMvb3B0ZWUtZXhhbXBsZXMu
bWsgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2Uvb3B0ZWUtdGVzdC9vcHRlZS10ZXN0Lmhhc2gg
ICAgICAgICAgICAgICAgIHwgIDQgKystLQogcGFja2FnZS9vcHRlZS10ZXN0L29wdGVlLXRlc3Qu
bWsgICAgICAgICAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9weXRob24tY3J5cHRvZ3JhcGh5
L3B5dGhvbi1jcnlwdG9ncmFwaHkubWsgfCAgNyArKysrKysrCiAxMiBmaWxlcyBjaGFuZ2VkLCAz
NyBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
