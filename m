Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC55C54ED0
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 17:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93C3D60E47;
	Fri, 23 May 2025 17:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqoojg6MR-UD; Fri, 23 May 2025 17:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD71460EAF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD71460EAF;
	Fri, 23 May 2025 17:42:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8332A179
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6786260E6B
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AF2u7TBAWwoS for <buildroot@buildroot.org>;
 Fri, 23 May 2025 17:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.105;
 helo=smtp-outgoing-1901.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 12EC860E47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12EC860E47
Received: from smtp-outgoing-1901.laposte.net (smtp-outgoing-1901.laposte.net
 [160.92.124.105])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12EC860E47
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:42:24 +0000 (UTC)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3stQ2wsZzKm44","contextId":
 "2e5d0559-3c6e-4f75-9aa1-3e507d5ffb38"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0115.laposte.net (SMTP Server) with ESMTP id 4b3stQ2wsZzKm44;
 Fri, 23 May 2025 19:42:22 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3stQ1jr2zKm43","contextId":
 "dcaf7493-17ac-4885-8a40-51ce039423e1"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mlpnf0115.laposte.net (SMTP Server) with ESMTPSA id 4b3stQ1jr2zKm43;
 Fri, 23 May 2025 19:42:22 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id DEB6A670D66A;
 Fri, 23 May 2025 19:42:30 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.1)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1uIWQN-0000000022j-0o9S; Fri, 23 May 2025 19:43:15 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 23 May 2025 19:43:12 +0200
Message-ID: <20250523174313.7056-5-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523174313.7056-1-vincent.stehle@laposte.net>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1748022143;
 bh=BSFMebtOSc4C+dvFXLNGkGmL3hZAOU7O3zd2P70OtzA=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=LtVrvWc2qkRqY9h2ydQXg8oV7umaJKcush+uBfERFAnsRXAZSeIKJTUzDwZmAXfmKvjIR2FWW98k5KtJYBHm5D3Yx4iiJ9dI8U9CPSipIMUnVqddJvb8JEwXUPMGpzrCcmEk1kzxSgvzf5AmGnD5In3F5gnhW+arBJQqWVl/k7wkWjBA6RXsP1CYYfhRx8iV1Kjbk4shuO6aKxEHAjY7MeQ6OfuJ/Vd0u+t0XXXfiuL5igdobk9wmhx/tsqNefNgZrIgXNg6deseGaApiSpskbEjUgZ3UE0Mf03aDzLnVAxV9WWnyR76cwZuzzpDyNbcjqaH8hWMtkJzjNOfm1evVQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=LtVrvWc2
Subject: [Buildroot] [PATCH 4/5] package/qemu: enable host-qemu hppa support
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIHN1cHBvcnQgaW4gaG9zdC1xZW11IGZvciBIUFBBLgoKU2lnbmVkLW9mZi1ieTogVmluY2Vu
dCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KQ2M6IFJvbWFpbiBOYW91ciA8
cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3Qg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcWVtdS9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdAppbmRl
eCA0ZGIxMTQ0OTBhLi4yYzUyY2MwN2MzIDEwMDY0NAotLS0gYS9wYWNrYWdlL3FlbXUvQ29uZmln
LmluLmhvc3QKKysrIGIvcGFja2FnZS9xZW11L0NvbmZpZy5pbi5ob3N0CkBAIC0zLDYgKzMsNyBA
QCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9RRU1VX0FSQ0hfU1VQUE9SVFMKIAlkZWZhdWx0IHkg
aWYgQlIyX2FybQogCWRlZmF1bHQgeSBpZiBCUjJfYXJtZWIKIAlkZWZhdWx0IHkgaWYgQlIyX2Fh
cmNoNjQKKwlkZWZhdWx0IHkgaWYgQlIyX2hwcGEKIAlkZWZhdWx0IHkgaWYgQlIyX2kzODYKIAlk
ZWZhdWx0IHkgaWYgQlIyX202OGsKIAlkZWZhdWx0IHkgaWYgQlIyX21pY3JvYmxhemVlbAotLSAK
Mi40Ny4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
