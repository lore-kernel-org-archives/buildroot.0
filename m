Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F8F0C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:43:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C28861264
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C28861264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E616400ED;
	Mon,  4 Oct 2021 12:43:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SJUARaC1nAmC; Mon,  4 Oct 2021 12:43:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54CE7405FA;
	Mon,  4 Oct 2021 12:43:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE37E1BF330
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:43:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6F7D42719
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:43:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1Fu_GmvgKDn for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 12:43:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B708642717
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 12:43:46 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPA id 33C27240008;
 Mon,  4 Oct 2021 12:43:44 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Mon,  4 Oct 2021 14:43:13 +0200
Message-Id: <20211004124316.355770-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] new libdbi and libdbi-drivers packages
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
Cc: Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpUaGlzIHNlcmllcyBhZGRzIGxpYmRiaSBhbmQgcmVsYXRlZCBsaWJkYmktZHJpdmVycyBw
YWNrYWdlcyAoZmlyc3QgYW5kCnNlY29uZCBwYXRjaGVzKS4KSXQgdGhlbiBhZGRzIHN1cHBvcnQg
Zm9yIGRiaSBpbiBjb2xsZWN0ZCBwYWNrYWdlICh0aGlyZCBwYXRjaCkuCgpCZXN0IHJlZ2FyZHMs
CkhlcnbDqSBDb2RpbmEKCkhlcnZlIENvZGluYSAoMyk6CiAgcGFja2FnZS9saWJkYmk6IG5ldyBw
YWNrYWdlCiAgcGFja2FnZS9saWJkYmktZHJpdmVyczogbmV3IHBhY2thZ2UKICBwYWNrYWdlL2Nv
bGxlY3RkOiBhZGQgZGJpIHN1cHBvcnQKCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNiArKysKIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAyICsKIHBhY2thZ2UvY29sbGVjdGQvQ29uZmlnLmluICAgICAgICAg
ICAgICAgICAgICB8ICA3ICsrKwogcGFja2FnZS9jb2xsZWN0ZC9jb2xsZWN0ZC5tayAgICAgICAg
ICAgICAgICAgIHwgIDQgKy0KIC4uLkNPTkZJRy12YXJpYWJsZS1pbnN0ZWFkLW9mLW15c3FsX2Nv
bi5wYXRjaCB8IDQ3ICsrKysrKysrKysrKysrKysrKwogcGFja2FnZS9saWJkYmktZHJpdmVycy9D
b25maWcuaW4gICAgICAgICAgICAgIHwgIDggKysrKwogcGFja2FnZS9saWJkYmktZHJpdmVycy9s
aWJkYmktZHJpdmVycy5oYXNoICAgIHwgIDMgKysKIHBhY2thZ2UvbGliZGJpLWRyaXZlcnMvbGli
ZGJpLWRyaXZlcnMubWsgICAgICB8IDQ4ICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvbGli
ZGJpL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKwogcGFja2FnZS9saWJk
YmkvbGliZGJpLmhhc2ggICAgICAgICAgICAgICAgICAgIHwgIDMgKysKIHBhY2thZ2UvbGliZGJp
L2xpYmRiaS5tayAgICAgICAgICAgICAgICAgICAgICB8IDE1ICsrKysrKwogMTEgZmlsZXMgY2hh
bmdlZCwgMTQ5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL2xpYmRiaS1kcml2ZXJzLzAwMDEtYnVpbGQtVXNlLU1ZU1FMX0NPTkZJRy12YXJp
YWJsZS1pbnN0ZWFkLW9mLW15c3FsX2Nvbi5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvbGliZGJpLWRyaXZlcnMvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9s
aWJkYmktZHJpdmVycy9saWJkYmktZHJpdmVycy5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFj
a2FnZS9saWJkYmktZHJpdmVycy9saWJkYmktZHJpdmVycy5tawogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvbGliZGJpL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGli
ZGJpL2xpYmRiaS5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJkYmkvbGliZGJp
Lm1rCgotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
