Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8763E95399
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 12:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F195E40C24;
	Wed,  4 Feb 2026 12:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2NPJzVJ_mB-W; Wed,  4 Feb 2026 12:57:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A805A409C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770209874;
	bh=GNJmEKOgpVBC9SlYD9Mcu9QFEWM0xErUrovX21Ezp3c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zt1o6dfFHdLOch9jt5JXZLA7KwaocIKMfaZCTT04udd9aLi6CqYlpXgqmTCfjMC12
	 99d/wPU/YPoI+/3NKgIlMDwdnUn15vtl7R3iUHkTlL7m4r7uLRXiGBDIbfdSztDi9Z
	 xdaMHgXx3uq0snLCFRYhA9zpu2r7TpQvbIZwLEMFIv3rRJnPtFAg9Q1ojPpQ5AKCZY
	 IwIToIfNub30ZqqmHuvjQha9AfVM41BxAi/gKvPNg/3y4Bdy1DN2HPIVO22XYiBrVb
	 EOeLUT7T90cO7sHwmYU4J4zT+AG1vuSbM39u482J/NlDw4Z+cGRQChGjGsd/EyR8JX
	 IKFE4aetlEfeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A805A409C8;
	Wed,  4 Feb 2026 12:57:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 560C0F4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 369F283B99
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t4bVKm50ahHq for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 12:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D67283B94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D67283B94
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D67283B94
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 12:57:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 59AB11814B9; Wed,  4 Feb 2026 13:57:49 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed,  4 Feb 2026 13:57:36 +0100
Message-ID: <20260204125739.2116670-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770209869; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Ucy0GD+WVRdhjYkx9NuNE9qZreidJWgyA9ij7rFDMr0=;
 b=F1SP8vQBoGoDsqHRTDBM6tWJUzO6riY5hcZN5cDL5RqqMYi+H12pE6YGek/d5QYa1j2vR9
 kRHeqSVGdK4Aolii4ietJP8k6wavRnh47yH4SV6OM37AT4dYH0CVZpmDH8/y+LDjO4iuJc
 IokuAXhBGAmvIWE3ZpvQZx9vKhjcz6w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=heine.tech header.i=@heine.tech
 header.a=rsa-sha256 header.s=dkim header.b=F1SP8vQB
Subject: [Buildroot] [PATCH] package/reciprocate: drop dependency on
 Boost.System
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

when switching to the CMake build in 79adde0180e834f839c770caa14d5253544d9719
it was missed that the requirement for the Boost.System Library
was silently dropped.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/resiprocate/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
index ba68ad8e59..6aaaf1b9c0 100644
--- a/package/resiprocate/Config.in
+++ b/package/resiprocate/Config.in
@@ -33,7 +33,6 @@ config BR2_PACKAGE_RESIPROCATE_DTLS_SUPPORT
 config BR2_PACKAGE_RESIPROCATE_REND
 	bool "resiprocate-rend"
 	select BR2_PACKAGE_BOOST
-	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
