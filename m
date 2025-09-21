Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF17CAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 14:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 509C383F84;
	Sun, 21 Sep 2025 14:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ft-nBJLbRWmF; Sun, 21 Sep 2025 14:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9313A83E0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9313A83E0C;
	Sun, 21 Sep 2025 14:53:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31701E7
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2292B60A7C
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7yL3ASIjEKl for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 14:53:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.96;
 helo=smtp-outgoing-1601.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3F70C60A6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F70C60A6A
Received: from smtp-outgoing-1601.laposte.net (smtp-outgoing-1601.laposte.net
 [160.92.124.96])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F70C60A6A
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 14:53:48 +0000 (UTC)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5lH0T6dzdZLg","contextId":
 "4ff7d7aa-0adc-4573-b672-8c77ff74bd87"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0106.laposte.net (SMTP Server) with ESMTP id 4cV5lH0T6dzdZLg;
 Sun, 21 Sep 2025 14:53:31 +0200 (CEST)
X-mail-filterd: {"version":"1.9.4","queueID":"4cV5lG6phTzdZLZ","contextId":
 "d6ccb62f-64df-4333-a832-f145c8353a61"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0106.laposte.net (SMTP Server) with ESMTPSA id 4cV5lG6phTzdZLZ;
 Sun, 21 Sep 2025 14:53:30 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id 2D8D06A1890C;
 Sun, 21 Sep 2025 14:53:36 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.2)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1v0JaT-000000002HE-2ba4; Sun, 21 Sep 2025 14:54:41 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 21 Sep 2025 14:54:18 +0200
Message-ID: <20250921125422.7944-3-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921125422.7944-1-vincent.stehle@laposte.net>
References: <20250921125422.7944-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1758466426;
 bh=dDq8vFa6CDBeTcqp63HD59f4mbMG+cqpX0pinK4RmK0=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=XOiAfW53bOHDc1Wo+ShoRay5MeD1VtpqfNDLnvNGQl62LJhQL3Y1uxjn0s+5avSUPneXv4vpST0g4m62Q2N8gyIfNoo76X7HaGZ7S0n1Q/a1N0yOtq7hnMJcDio8Eq5/+f9qn6EulO45nF4rO4dOLaXVt9JI0u+253hG+yYbr8Uqjpoh2shckz2d5EHTI4bHSZaDpMTDcBxCcPOHw8jluMX1QRX5tKliF4fKOMnK0svGrXuAR81VyPAVlZMexS/MH0f7PPR4aOxFBvicKx78NgulnMHfaNiSru1mfOK7LSxuGTrc3b1yCfF4xesV2A3cl2AuF9UJid4Kp3eW2QhvSQ==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=XOiAfW53
Subject: [Buildroot] [PATCH 2/6 v2] package/glibc: enable hppa support
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

QWRkIHN1cHBvcnQgZm9yIEhQUEEuCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZp
bmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgpDYzogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
Z21haWwuY29tPgotLS0KCkNoYW5nZXMgdjEgLT4gdjI6CiAgLSBSZW1vdmUgQlIyX0FSQ0hfSEFT
X05PX1RPT0xDSEFJTl9CVUlMRFJPT1QgYWRkZWQgaW4gdGhlIGZpcnN0IHBhdGNoCiAgICAoc3Vn
Z2VzdGVkIGJ5IFJvbWFpbikKCiBhcmNoL0NvbmZpZy5pbiAgICAgICAgICB8IDEgLQogcGFja2Fn
ZS9nbGliYy9Db25maWcuaW4gfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL0NvbmZpZy5pbiBiL2FyY2gvQ29uZmln
LmluCmluZGV4IGIxYzVhNWU3NjMuLjIzYzNjNmRkZDYgMTAwNjQ0Ci0tLSBhL2FyY2gvQ29uZmln
LmluCisrKyBiL2FyY2gvQ29uZmlnLmluCkBAIC03Niw3ICs3Niw2IEBAIGNvbmZpZyBCUjJfYWFy
Y2g2NF9iZQogY29uZmlnIEJSMl9ocHBhCiAJYm9vbCAiSFBQQSIKIAlzZWxlY3QgQlIyX1VTRV9N
TVUKLQlzZWxlY3QgQlIyX0FSQ0hfSEFTX05PX1RPT0xDSEFJTl9CVUlMRFJPT1QKIAloZWxwCiAJ
ICBQcmVjaXNpb24gQXJjaGl0ZWN0dXJlIChhLmsuYS4gUEEtUklTQykgaXMgYSAzMi1iaXQKIAkg
IChiaWcgZW5kaWFuKSBhcmNoaXRlY3R1cmUgZGV2ZWxvcGVkIGJ5IEhld2xldHQgUGFja2FyZC4K
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2xpYmMvQ29uZmlnLmluIGIvcGFja2FnZS9nbGliYy9Db25m
aWcuaW4KaW5kZXggOWE0ZmU2ZjNkYi4uMmE5NzY4ODk5YSAxMDA2NDQKLS0tIGEvcGFja2FnZS9n
bGliYy9Db25maWcuaW4KKysrIGIvcGFja2FnZS9nbGliYy9Db25maWcuaW4KQEAgLTQsNiArNCw3
IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9HTElCQ19BUkNIX1NVUFBPUlRTCiAJZGVmYXVsdCB5IGlm
IEJSMl9hcm1lYgogCWRlZmF1bHQgeSBpZiBCUjJfYWFyY2g2NAogCWRlZmF1bHQgeSBpZiBCUjJf
YWFyY2g2NF9iZQorCWRlZmF1bHQgeSBpZiBCUjJfaHBwYQogCWRlZmF1bHQgeSBpZiBCUjJfaTM4
NgogCWRlZmF1bHQgeSBpZiBCUjJfbG9vbmdhcmNoNjQKIAlkZWZhdWx0IHkgaWYgQlIyX202OGtf
bTY4awotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
