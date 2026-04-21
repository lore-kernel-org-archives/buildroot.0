Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55072F94CA0
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 18:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 226E86085D;
	Tue, 21 Apr 2026 18:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtHatew0ejQJ; Tue, 21 Apr 2026 18:55:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69E5960853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776797732;
	bh=RtqJ+7vwquHsqdpWM7No18Uw9sSoccoW3VEKhHIvyII=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GKPeDoeil5I5ai0SyiAfNaF/3jVhbuEdZqThJaf+Sj5PluuxR65EX0I/w77ELGbhA
	 vxus/tXVgntwlk8TC7+u1/1w97qC+fHKnYTdQVKQyZhSmPFtXTpLgrxbM7cPnIcvPO
	 dKQWRrTzg0Ism0gSQHkbIu5D6X6HEgI1o3Tf5wpb3A5CEezEoITObwbGzmA8oHOnuj
	 AojR9U598JA+KesMlp/rOgN7eO/i+mZ6uhDFUxKJK+W1nNMeR0nbiN6VDmDUcwGpZ4
	 zSl5yan4zY1aJRX7pCswvq2/U/pCr8na6nBdO5n9sKmtMkUBVfioQKkx71d9EpNNbl
	 Fe1QgnVHxQaQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69E5960853;
	Tue, 21 Apr 2026 18:55:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2764D257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D33F41201
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EBCIvriOh_ib for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 18:55:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0257E407E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0257E407E9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0257E407E9
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:55:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2EE6AA4C0602
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:55:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41992)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFGFr-000000002RH-3Zk3
 for buildroot@buildroot.org; Tue, 21 Apr 2026 18:55:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 20:55:27 +0200
Message-ID: <20260421185527.2664360-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776797728;
 bh=ys35g7iIBTyYX4roqyd7lhBSkWzymTDSUC77r5qOnW8=;
 h=From:To:Subject:Date:From;
 b=N/374UiiyfwNhqbY7Od5e6+K/uOlHmwJLelR2D0QsKwUpZzgr1/Dhm8FmVDMvxqYy
 jUR5tmW6ipCQ3YMvRph4SRU6Oh8MzwAoJ33zYRWVRhrNNdPGMi2w7WW4026W4dHtmA
 IMbTjOLmvu9kFkzTwjz+lEdhjBX960NLOhPrGS6+6CZ1MJiV2H4IHgwxZiVUht1JFJ
 twxYVcvtjW6mRk4NTaZDjajUmfLUpWGgOGY9WW/z4S+A+N3WypErLX45T/z0UrwnEp
 G8U13wDeXSxe+8mTZQvmvhiIvydYQ1ktnRGkmiInDwiy/ifCHpsQl3NLj3l6VfDDmF
 xEs0SXlk7toqg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=N/374Uii
Subject: [Buildroot] [PATCH 1/1] package/nginx: security bump version to
 1.30.0
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

https://nginx.org/en/CHANGES-1.30

Fixes the following CVEs:

1.29.7: CVE-2026-27654, CVE-2026-27784, CVE-2026-32647, CVE-2026-27651,
CVE-2026-28753 & CVE-2026-28755

1.29.5: CVE-2026-1642

Updated license hash due to copyright year bump:
https://github.com/nginx/nginx/commit/7fa941a55e211ebd57f512fbfb24d59dbb97940d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/nginx/nginx.hash | 4 ++--
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 7b79036b20..85647c517c 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e  nginx-1.28.1.tar.gz
+sha256  058188c64bf22baecaa72b809a6318a4f9ba623889c554feab03f7cb853ab31b  nginx-1.30.0.tar.gz
 # License files, locally calculated
-sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
+sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 41490caee2..a6a57d2d70 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.28.1
+NGINX_VERSION = 1.30.0
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
