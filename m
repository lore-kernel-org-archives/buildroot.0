Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FD5CAC59A
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 14:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1917D80F67;
	Sun, 21 Sep 2025 14:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X5LgyiZ9Cj9I; Sun, 21 Sep 2025 14:54:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CE7183E1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CE7183E1C;
	Sun, 21 Sep 2025 14:54:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 94123D3
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A1B5400E0
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id no-33NNkK3Rk for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 14:54:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.110;
 helo=smtp-outgoing-2003.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 956A040071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 956A040071
Received: from smtp-outgoing-2003.laposte.net (smtp-outgoing-2003.laposte.net
 [160.92.124.110])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 956A040071
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:54:07 +0000 (UTC)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5lL5HTjzdZLZ","contextId":
 "b296b3f4-6d66-4298-8496-9f0418c24128"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4cV5lL5HTjzdZLZ;
 Sun, 21 Sep 2025 14:53:34 +0200 (CEST)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5lL4b7GzdZLM","contextId":
 "835a308f-f3aa-4033-8b29-177d16ecfd9b"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4cV5lL4b7GzdZLM;
 Sun, 21 Sep 2025 14:53:34 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id F0C5E6A1890D;
 Sun, 21 Sep 2025 14:53:39 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.2)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1v0JaX-000000002HJ-1avl; Sun, 21 Sep 2025 14:54:45 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 21 Sep 2025 14:54:19 +0200
Message-ID: <20250921125422.7944-4-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921125422.7944-1-vincent.stehle@laposte.net>
References: <20250921125422.7944-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1758466445;
 bh=Y8dRwbjx/C6wcrbtc9Oiy9b36DPEgVye9yYL9y1f10A=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=B8otnihvkP0ChwmPrvDr/wmixJSDrlTXBfOk/mwCSYwVTfS36Lh8V0CLmVT6Np82gD555lFxzJ/6Rap9oyHiAb8cAPbCq/hfFarZLWil4e+aehupfhZ8zUavUVWMvq8MZ/hboOShn3qPUqGKHToUR8x16AMWk7pLOewBDbU5y1oYRXeOzOqCIwPZXcXcWjtBk2R8NV/58kMC4Zz/3w9AFUyRTdJgjqXwr7oNq9aGKkWRLaV0Ost4XL8DSyRO3Z+dsLJKtJtxWgR704SyZ56UNnykESdq22epYymL/XpfMkLn2YNNipAa58tu+sRtrGki1m+R13CuGRBOwU73P90cVg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net
 header.a=rsa-sha256 header.s=lpn-wlmd header.b=B8otnihv
Subject: [Buildroot] [PATCH 3/6 v2] package/qemu: enable host-qemu hppa
 support
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
cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KLS0tCgpDaGFuZ2VzIHYxIC0+IHYyOgogIC0gVXBkYXRl
IGNvbW1lbnQgaW4gcWVtdS5tayBhYm91dCBCUiBBUkNIIHZzIHFlbXUKICAgIChzdWdnZXN0ZWQg
YnkgUm9tYWluKQoKIHBhY2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdCB8IDEgKwogcGFja2FnZS9x
ZW11L3FlbXUubWsgICAgICAgIHwgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdCBiL3BhY2thZ2UvcWVt
dS9Db25maWcuaW4uaG9zdAppbmRleCAwOTAyMDRkOTBjLi5jN2RkNTg3NmU1IDEwMDY0NAotLS0g
YS9wYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QKKysrIGIvcGFja2FnZS9xZW11L0NvbmZpZy5p
bi5ob3N0CkBAIC0zLDYgKzMsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVF9RRU1VX0FSQ0hf
U1VQUE9SVFMKIAlkZWZhdWx0IHkgaWYgQlIyX2FybQogCWRlZmF1bHQgeSBpZiBCUjJfYXJtZWIK
IAlkZWZhdWx0IHkgaWYgQlIyX2FhcmNoNjQKKwlkZWZhdWx0IHkgaWYgQlIyX2hwcGEKIAlkZWZh
dWx0IHkgaWYgQlIyX2kzODYKIAlkZWZhdWx0IHkgaWYgQlIyX2xvb25nYXJjaDY0CiAJZGVmYXVs
dCB5IGlmIEJSMl9tNjhrCmRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvcWVtdS5tayBiL3BhY2th
Z2UvcWVtdS9xZW11Lm1rCmluZGV4IDBkMWQxNTQzNzEuLmUzNzIyYTk4ZDQgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvcWVtdS9xZW11Lm1rCisrKyBiL3BhY2thZ2UvcWVtdS9xZW11Lm1rCkBAIC0zNjIs
NiArMzYyLDcgQEAgSE9TVF9RRU1VX0RFUEVOREVOQ0lFUyA9IFwKICMgICAgICAgLS0tLS0tLSAg
ICAgICAgIC0tLS0KICMgICAgICAgYXJtICAgICAgICAgICAgIGFybQogIyAgICAgICBhcm1lYiAg
ICAgICAgICAgYXJtZWIKKyMgICAgICAgaHBwYSAgICAgICAgICAgIGhwcGEKICMgICAgICAgaTQ4
NiAgICAgICAgICAgIGkzODYKICMgICAgICAgaTU4NiAgICAgICAgICAgIGkzODYKICMgICAgICAg
aTY4NiAgICAgICAgICAgIGkzODYKLS0gCjIuNTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
