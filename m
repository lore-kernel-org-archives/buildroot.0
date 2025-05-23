Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97946C54ED1
	for <buildroot@archiver.kernel.org>; Fri, 23 May 2025 17:50:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58C988402D;
	Fri, 23 May 2025 17:50:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kl9APJ8ORNOu; Fri, 23 May 2025 17:50:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 779D984022
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 779D984022;
	Fri, 23 May 2025 17:50:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02F09CA
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD21340E1D
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cnAdspyCrwC for <buildroot@buildroot.org>;
 Fri, 23 May 2025 17:50:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.99;
 helo=smtp-outgoing-1701.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E41374031D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E41374031D
Received: from smtp-outgoing-1701.laposte.net (smtp-outgoing-1701.laposte.net
 [160.92.124.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E41374031D
 for <buildroot@buildroot.org>; Fri, 23 May 2025 17:50:20 +0000 (UTC)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3t3Y5T0MzKm45","contextId":
 "07e3f271-d188-45b9-8a6a-0d32efe6a6a6"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0115.laposte.net (SMTP Server) with ESMTP id 4b3t3Y5T0MzKm45;
 Fri, 23 May 2025 19:50:17 +0200 (CEST)
X-mail-filterd: {"version":"1.9.1","queueID":"4b3t3Y4RLSzKm43","contextId":
 "4bb0044c-84e6-48b8-8e93-5349b4d0545b"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0115.laposte.net (SMTP Server) with ESMTPSA id 4b3t3Y4RLSzKm43;
 Fri, 23 May 2025 19:50:17 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id DC88A670D668;
 Fri, 23 May 2025 19:42:30 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.98.1)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1uIWQN-0000000022b-0e4L; Fri, 23 May 2025 19:43:15 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 23 May 2025 19:43:10 +0200
Message-ID: <20250523174313.7056-3-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250523174313.7056-1-vincent.stehle@laposte.net>
References: <20250523174313.7056-1-vincent.stehle@laposte.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1748022618;
 bh=6b8iIpQoEy32g1/WnwvN6qSkboXH12pbBNbE24EwBSw=;
 h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=DGskGENuOxEH3na2ITcsPLkoIEwsOaijywL4vv89qNDZ5AKSwMsALu6MqHzWqoRIlA3Y0oHzRcz2eVt2K9JcFK49pW4CR+qjsztYs2BDwnO/1dVmOwHhh33JSFYNsWz81PV5ZXyuQpWDk3udQ92gXJ6iSITKiXb8l08y+4eB5NGxrJu75lswknkGBiyt/eFJ9D/1EWdLW9Td7AX38gIwbJgsTb8YyPmskY4C2Y+tEcdNdamUfZF5ShN65utmSnz6OmEqQpvHcvqj4K9SgfZjUgyX9PIGd3sbSCR5MTleNyEfveOpH/1qI9KDFa+JF6INhH07o3VkCZQmFVjuL35X7w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=DGskGENu
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
