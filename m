Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D399BC44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 15:59:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F006F60705;
	Wed, 15 Jul 2026 15:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xqbjw2S5P9Lk; Wed, 15 Jul 2026 15:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94A1D60678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784131181;
	bh=mCSlsPIXBoXsRgEqMW3p69bJvQ8YAF6LASvLMQQHbPk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UrATMXDLi8gVWBTuMOPxPSASRXXVC+tU6CFuV9OGaywefCQubpr3fWgm5S379JgYi
	 pPIw5643HDZPjwQ0DjI0Dz/uzAcbnvggfr0HqAQzo//xuGn0MjRWpKTnNAvV8LmB7I
	 NpcYsqbeIKc+bt1YFjQ6BbPM4U/BrZ17UaLIblWtmS26nGZNQ1eddx8cex8J7IOY+V
	 0xWpCV7/daU/UDyCPIhuxu3ouVG4rPYfmx9tD0HiHOknNN5vgsiIo77b9Nf/7oxK6v
	 31axCTEyvwyfcP6wz3xCbY9OBU3aJb6itRRGmCr5MMLgkAk/heCRKXpF5fqDuR9Qlm
	 32O0IQuUr2czQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94A1D60678;
	Wed, 15 Jul 2026 15:59:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BE0B49D
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 15:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1834440587
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 15:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dp0R4KjwP3ma for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 15:59:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8E2A74056F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E2A74056F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E2A74056F
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 15:59:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a03c0.dip0.t-ipconnect.de [91.58.3.192])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9A87CA4C3AE3
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 17:59:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35546)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wk21E-00000000882-3FYV
 for buildroot@buildroot.org; Wed, 15 Jul 2026 15:59:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 15 Jul 2026 17:59:32 +0200
Message-ID: <20260715155932.9265-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784131173;
 bh=xbdhmPJ64uakcIFx7kLmPkcMH2HUPZZGP1WB0wSSQDI=;
 h=From:To:Subject:Date:From;
 b=j/LObQToDWW3gbofr6/DN3wnHe8z7lHdSgTcVOvy6aGB8+Sn6CXNVvmSw32ESedG9
 FYmwsNUtwTGh3UGEnPiT0NrpSO8Vleh8dHeTQ9hTal1T6tg4rZYJ4PiZbIM3rGZimt
 VaI3E4f3wbTmtxNCgWf63xG0zR/FJXCY+sxQFHFqzergcptER5A0P5u69fOZEwZvyq
 yRUY1Slv/1jRaDaTXZrdScO+Hgt7hr4ghK0li1U31d0FiL9F2XJ3oDOejxs/L71iH2
 joj1upQboKF0kvGqOL21ztV+5BGcueSe5ql0RDK7C+TWRFhulJPUzHvEZCSqY1sxaI
 k2u6K4kYXQWqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=j/LObQTo
Subject: [Buildroot] [PATCH 1/1] docs/migrating.adoc: document the tarball
 suffix update for Cargo-fetch packages
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

We changed the suffix of tarballs for Cargo-fetched packages, which
affects out-of-tree packages, so it makes sense to document that in
the migration guide.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 docs/manual/migrating.adoc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 230754be76..68f09e1bae 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -258,3 +258,9 @@ from +true+ to +false+, in line with upstream defaults. If you need
 +EnableNetworkConfiguration=true+ to let +iwd+ handle network
 configuration for active wifi connections, adjust +/etc/iwd/main.conf+
 in your build (see xref:rootfs-custom[] for options).
+
+Due to the update of Rust to a version greater than 1.96.1 $comment was
+added to .cargo-checksum.json to clarify that this file is not a
+security mechanism. Tarballs generated by Cargo-fetched packages have
+changed, therefore the suffix of such tarballs has been changed from
++-cargo5+ to +-cargo6+.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
