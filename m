Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F8AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:51:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B25AF611EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 19:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B25AF611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embedded.rocks
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9102181CEF;
	Mon, 18 Oct 2021 19:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmcplPlaQIwj; Mon, 18 Oct 2021 19:51:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C82E082435;
	Mon, 18 Oct 2021 19:51:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C86721BF350
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C476160651
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 19:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new); dkim=neutral
 reason="invalid (public key: not available)" header.d=embedded.rocks
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kE6didoQ90Cq for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 19:51:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.142])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97D63605FB
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 19:51:35 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id B1A78240101
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:51:33 +0200 (CEST)
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4HY6vT2Lknz9rxB
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 21:51:32 +0200 (CEST)
Authentication-Results: mail.embedded.rocks (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)" header.d=embedded.rocks
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=embedded.rocks;
 h=content-transfer-encoding:content-type:content-type
 :mime-version:x-mailer:message-id:date:date:subject:subject:from
 :from:received:received; s=default; t=1634586686; x=1635191487;
 bh=uOqx2WATiRBiTCs+1z5vUKt2pyuitulAX/Ue1s9I3Zg=; b=wQ/bP5+694Pk
 MnzpXyEEXCW+3vS4qTVxMO3z/zEmssiKbkVxdUJZMyJwD0d3zV4zKtbp6UaxtzSn
 ZZkAy9WawLXHuioxJ+j+Qtmz4Y3A+81RJusPQt8NZiYWwylys2vjim+QU4KPhyNq
 GUWFE9uW2aU06nfghZk7RnKLl+A+EkGYOjWX7XOGqUapIEifm9VCOJTa44fgAv6h
 wwG/z3QQdYWW4xOctnzJFJsh8ly9PC9fjsZFqCCc/g2cMm0QmdWf3ZDX884whLhE
 8C5Q72LaIW0SufG/Nc7i1Qt9KAz6z6B51K7fG+KofFOUXZuBhgG6IceY0RXbH5l2
 65ncjXJsTQ==
Received: from mail.embedded.rocks ([127.0.0.1])
 by localhost (mail.embedded.rocks [127.0.0.1]) (amavisd-new, port 10025)
 with ESMTP id 55UGQ_xBOuAI; Mon, 18 Oct 2021 21:51:26 +0200 (CEST)
Received: from nzxt.fritz.box (port-92-193-134-170.dynamic.as20676.net
 [92.193.134.170]) (Authenticated sender: joerg.krause@embedded.rocks)
 by mail.embedded.rocks (Postfix) with ESMTPSA;
 Mon, 18 Oct 2021 21:51:26 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 19:51:21 +0000
Message-Id: <20211018195121.184942-1-joerg.krause@embedded.rocks>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libupnp: bump to version 1.14.2
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
Cc: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSsO2cmcgS3JhdXNlIDxqb2VyZy5rcmF1c2VAZW1iZWRkZWQucm9ja3M+
Ci0tLQogcGFja2FnZS9saWJ1cG5wL2xpYnVwbnAuaGFzaCB8IDIgKy0KIHBhY2thZ2UvbGlidXBu
cC9saWJ1cG5wLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnVwbnAvbGlidXBucC5oYXNo
IGIvcGFja2FnZS9saWJ1cG5wL2xpYnVwbnAuaGFzaAppbmRleCAxYzhhMzAyNjgyLi5hZWJkZTA2
NGI4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYnVwbnAvbGlidXBucC5oYXNoCisrKyBiL3BhY2th
Z2UvbGlidXBucC9saWJ1cG5wLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0
ZWQ6Ci1zaGEyNTYgIGRjNDE3ZjVlZjBhOTE4MmQ3NmI2Y2YzOGJkZjg2M2UyZmIxZWUzYzM1M2M1
NmZhODJlMzU0ZWRlZjdiYTUwZjIgIGxpYnVwbnAtMS4xNC4xMC50YXIuYnoyCitzaGEyNTYgIDA5
MWM4MGFhZGExZTkzOWMyMjk0MjQ1YzEyMmJlMmY1ZTMzN2NjOTMyYWY3ZjdkNDA1MDQ3NTE2ODBi
NWI1YWMgIGxpYnVwbnAtMS4xNC4xMi50YXIuYnoyCiBzaGEyNTYgIGM4Yjk5NDIzY2FkNDhiYjQ0
ZTJjZjUyYTQ5NjM2MTQwNDI5MDg2NWVhYzI1OWE4MmRhNmQxZTQzMzFlY2VjYjMgIENPUFlJTkcK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlidXBucC9saWJ1cG5wLm1rIGIvcGFja2FnZS9saWJ1cG5w
L2xpYnVwbnAubWsKaW5kZXggZWYyYjcyNGVmYS4uYTc1NGNhNzZmYyAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9saWJ1cG5wL2xpYnVwbnAubWsKKysrIGIvcGFja2FnZS9saWJ1cG5wL2xpYnVwbnAubWsK
QEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSUJVUE5QX1ZF
UlNJT04gPSAxLjE0LjEwCitMSUJVUE5QX1ZFUlNJT04gPSAxLjE0LjEyCiBMSUJVUE5QX1NPVVJD
RSA9IGxpYnVwbnAtJChMSUJVUE5QX1ZFUlNJT04pLnRhci5iejIKIExJQlVQTlBfU0lURSA9IFwK
IAlodHRwOi8vZG93bmxvYWRzLnNvdXJjZWZvcmdlLm5ldC9wcm9qZWN0L3B1cG5wL3JlbGVhc2Ut
JChMSUJVUE5QX1ZFUlNJT04pCi0tIAoyLjMzLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
