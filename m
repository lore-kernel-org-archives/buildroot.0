Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D253C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 19:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B22AB607EE;
	Fri,  3 Jul 2026 19:48:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7OxHxZ4TX7P; Fri,  3 Jul 2026 19:48:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E79B660757
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783108133;
	bh=Ib43im+DLL1j/CqD1wcIR/yY7plR429iZc9JWbVA1BQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U8ZWaSoLWh5veomuZ7YT60u2ohjZUlpkplzfUpeOy+cYdMdtEgW23mNi3Q018+gQR
	 wE0UyhYBueuhSNwu5gihlXK6GZfBTsbU3ImHv9cNlvxiooFOQ6DpZKyDe3DMFsDld5
	 mv6UJBwZDLZR3FkjeuEt/g4x0XvMqOv7vQpPbmv7O1kweoJiyRGfpqU50EDDifAcLQ
	 SLmen8W++fUoI1XmDzGShOnpOv9awHxjW4Eue6B7GPTWevIF6FmEml9hA2hlhL7vt9
	 rDxP5jmhea5nGwuIdqtQkeEIJ/2cSlZtAXvLGn69reIDayUuvjgTKB6yBtuIIFn1oG
	 agB81E44XCVcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E79B660757;
	Fri,  3 Jul 2026 19:48:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BCC414F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8583981E19
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:48:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cm8MjXwnKzSl for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 19:48:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A523A81B8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A523A81B8A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A523A81B8A
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 19:48:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0df2.dip0.t-ipconnect.de [91.58.13.242])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CD669A4C0A0E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 21:48:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42954)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wfjsW-000000000lD-1zGW
 for buildroot@buildroot.org; Fri, 03 Jul 2026 19:48:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  3 Jul 2026 21:48:48 +0200
Message-ID: <20260703194848.3699100-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783108128;
 bh=YMIWTwyHk0sKPjpJFu8KxAhntNOjfnwjnnBXMI7wVlw=;
 h=From:To:Subject:Date:From;
 b=Ad+Na1vU5KfQ9V7FsuDMdW+wSPpr7/IKt4oagGyNvQ8jb7l+ypOXYET7vXa8IxMyk
 UpBb7KARDFOrD7QkIGwG8sHEAvM8/NLeA8yZZNnXb4qFVzOJ1Q+wehpmQN3q9WvP9s
 7gUDW++w2MQB4O2VBHBmtCh0JVV4nWBQbiZjqwN4uWOy0S5r8/OVlC14UcvaPXvoMT
 fvzg1QnuKZTk8w7w8wBe7jxyqprwGyPa9lq1hQ+CTZLQBF1Kov7aKG2rZ0l1lppJqd
 i1NuHGFql1rxH/wGEXc7I/Uj6XDllPg1hCiP1oSyfQi0trHhv1IEmUS1yyJGl4FOiU
 XwMpH+dZpZSQg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Ad+Na1vU
Subject: [Buildroot] [PATCH 1/1] package/transmission: bump version to 4.1.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/transmission/transmission/releases/tag/4.1.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/dd4c4d10f4774c0771dbd6b9b1c8430fe467b36a

 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 45a3863dca..0e81ec8ec1 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  4c6070bdfae264a629cb2b0f1eaf567cb9c6208f9218aa446c0aee883eb0f1fc  transmission-4.1.2.tar.xz
+sha256  ce7d2d8b101f7eb54bc3cf0bc55f52f7ebd4a25fa48e00bdca9a7e0fc02617da  transmission-4.1.3.tar.xz
 # Locally calculated
 sha256  9715b55d11caa499d34a6e23498c766fe1ece4ace57777553313e27d688dee78  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index c811dcd6e5..0f5ee5d6ac 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.1.2
+TRANSMISSION_VERSION = 4.1.3
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
