Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A06EA795E
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 09:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B28C4419C3;
	Fri,  6 Feb 2026 09:54:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqZSG4o6cf2F; Fri,  6 Feb 2026 09:54:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DCE341A50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770371680;
	bh=wWdc2o9jLCXa+Utg/DFCz45+vVsdXUppX7yUMJeHSJ4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rXpVT0eHcvFn6DIPuxLLRHisP2B3FN7DbfANm47fqxeF2375sNgl6C1eQ3SBT96D+
	 QxNKq5WAwJaT3OzAhICdsa3Q62AWO1x6F+aREpXa1BS4Mi6trSfjlSRsMTveJLdqFw
	 fcL5U9V+s5pBP8LlJk/1OIo7E5Qd7pjqKgx3IGBdDltU8F9Ki1F3tf1vwa2Qk3WTFn
	 3vGbFXG4mBISYOa9DotkocMVvaV2u85L/X1Jlk5IOMPP+3UCda5xu7SmJmghMAKbAQ
	 DlYo3u8PkmxX9TRuc0QIgpJ8vsgNmm3AGT7CE+b+9v1Sufr+K508NFakhsdQIDvn6G
	 6rnZVHkKX+2XA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DCE341A50;
	Fri,  6 Feb 2026 09:54:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 25A7D173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 09:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A24E40F1A
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 09:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6ETkjXhHy2GD for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 09:54:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 72AE740EF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72AE740EF8
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72AE740EF8
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 09:54:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 984341814B9; Fri,  6 Feb 2026 10:54:33 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  6 Feb 2026 10:54:19 +0100
Message-ID: <20260206095423.3550198-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770371673; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=/ijPRgVs6SdcbvXULYa4Dxrft4rA9QMOxqB0MKP3fWM=;
 b=P4h+xStwggDIzcsycabvvV+pc+ct8rEVTWdp5VN9cgthrBhFNVwb7PbZq+MPxlwzZDx8vs
 GwbMgBUecaCkktS6Yu645wh+HOletvJqPk7CQ0TIhPS2Yx1AYgn2pJQspgu6qGLJATlw3M
 GcQAmpyztm6eZaukqI1fXfJNNufNh8U=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=P4h+xStw
Subject: [Buildroot] [PATCH v2] package/resiprocate: drop dependency on
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
V2: fix name in commit title
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
