Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991BEC54EDA
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 17:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 064D98402D;
	Fri, 23 May 2025 17:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_IuIwL8maJT; Fri, 23 May 2025 17:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4775C84025
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4775C84025;
	Fri, 23 May 2025 17:48:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3004B68
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D6F28401D
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQGX5y0IkNOQ for <buildroot@buildroot.org>;
 Fri, 23 May 2025 17:48:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.105;
 helo=smtp-outgoing-1901.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AB20E84014
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB20E84014
Received: from smtp-outgoing-1901.laposte.net (smtp-outgoing-1901.laposte.net
 [160.92.124.105])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB20E84014
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:48:31 +0000 (UTC)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3t1P66hKzKm42","contextId":
 "53ae2584-f3f8-46e8-abbc-3615eb2363be"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0115.laposte.net (SMTP Server) with ESMTP id 4b3t1P66hKzKm42;
 Fri, 23 May 2025 19:48:25 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3t1P5CY1zKm3k","contextId":
 "9aa67049-39ed-454c-a249-11e49eb242aa"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0115.laposte.net (SMTP Server) with ESMTPSA id 4b3t1P5CY1zKm3k;
 Fri, 23 May 2025 19:48:25 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id A0DB8670D6D7;
 Fri, 23 May 2025 19:48:34 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.1)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1uIWWE-000000005iQ-3xiC; Fri, 23 May 2025 19:49:18 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 23 May 2025 19:49:14 +0200
Message-ID: <20250523174914.21556-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523174313.7056-1-vincent.stehle@laposte.net>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1748022509;
 bh=6b8iIpQoEy32g1/WnwvN6qSkboXH12pbBNbE24EwBSw=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=Aja9OYcVAAH1yAPITdCeqfPX/gvQGNXs/YlAHSAukWJWOz4oppwFFx+hX2sUeZLEL1yo2lFyDxuapVR/fGEQHM9NgAEUMYCQWXRPOWjfHNCgQFx2Vditimoksro3XY0cvgrYHGgsvMJYkNokpGfwsWTeGbDAFF9GQRCmt90orTs5CvZVrHxS86gYpL02gyagJBhm1v1EbQUlPwuxqvylx+QWTEQsDwO5TTFdKJDboL9avMgHBvnOaL01B6bz7BA3cU12E4aigW4+GHGPZnFEnAtcL1fJ/d3gDhCLe2zI4OyTdijhdyv2nMQXAXueLcLv+Q54OXR9505jVE11l9p9ag==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=Aja9OYcV
Subject: [Buildroot] [PATCH 2/5] package/gcc: enable hppa support
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
bmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgpDYzogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5l
dHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CkNjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91
ckBnbWFpbC5jb20+CkNjOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3Rs
aW4uY29tPgotLS0KIHBhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0IHwgMSArCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2djYy9Db25maWcuaW4u
aG9zdCBiL3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0CmluZGV4IDEwZmU0YmY2MDkuLmY0ODQy
OWRiOTYgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZ2NjL0NvbmZpZy5pbi5ob3N0CisrKyBiL3BhY2th
Z2UvZ2NjL0NvbmZpZy5pbi5ob3N0CkBAIC02MCw2ICs2MCw3IEBAIGNvbmZpZyBCUjJfR0NDX1NV
UFBPUlRTX0RMQU5HCiAJYm9vbAogCWRlZmF1bHQgeSBpZiBCUjJfYWFyY2g2NAogCWRlZmF1bHQg
eSBpZiBCUjJfYXJtCisJZGVmYXVsdCB5IGlmIEJSMl9ocHBhCiAJZGVmYXVsdCB5IGlmIEJSMl9p
Mzg2CiAJZGVmYXVsdCB5IGlmIEJSMl9taXBzIHx8IEJSMl9taXBzZWwKIAlkZWZhdWx0IHkgaWYg
QlIyX21pcHM2NCB8fCBCUjJfbWlwczY0ZWwKLS0gCjIuNDcuMgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
