Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B012CCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 08:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F1F685287;
	Sun,  2 Nov 2025 08:46:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M4Wn0yTpyqul; Sun,  2 Nov 2025 08:46:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6928D84862
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6928D84862;
	Sun,  2 Nov 2025 08:46:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AE81436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D27E42071
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swNMM_UvY3x5 for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 08:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2B56F41937
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B56F41937
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B56F41937
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 08:46:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c274.dip0.t-ipconnect.de [79.214.194.116])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E2B7A4C588F;
 Sun,  2 Nov 2025 09:46:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47550)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vFTj4-000000001yE-1DEn;
 Sun, 02 Nov 2025 08:46:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Date: Sun,  2 Nov 2025 09:46:13 +0100
Message-ID: <20251102084613.252867-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762073174;
 bh=H+5YZaQYhMlVdpERuIgRQEQzwMHIdWr02vjeuvWOZDc=;
 h=From:To:Cc:Subject:Date:From;
 b=ZtykoHSYKSlXt8Gz3rv/savs1pwTDh8DZgqJztZwUFMoa/LEuv32xCyrarGQDnMi2
 RGq1voepLiSOxncCGp+5qVgOo7tDNphfYC5RkBmShRwWYGkCFwelMNRDIbBrhOozlK
 UROBuUzyw9WIF/3vuxk7VZsEWRemkd8jrCCs+v/W3S4rZdlvvblFe3naHRHz7WtZmt
 bX4fLbCqK0W+kDQNw+eYECaUW1GHdC9QsmdFgDwwpcAW3XtXvlKbh5LgUCPzVA6xrr
 2IBLWp9M3LnBDpZ6G0wia8yorxdvii6aviR5f9ZepNQGFi2FZlcQeqovA6jsiW/DgM
 T+oAZhbARBbvQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=ZtykoHSY
Subject: [Buildroot] [PATCH 1/1] package/crun: bump version to 1.24
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

Release notes: https://github.com/containers/crun/blob/1.24/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/crun/crun.hash | 2 +-
 package/crun/crun.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/crun/crun.hash b/package/crun/crun.hash
index c2aaab6edc..fcf95f2ba9 100644
--- a/package/crun/crun.hash
+++ b/package/crun/crun.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  5f0c6c10d18569381142f20c4ad7a9a766d26ed8a241933ae9b2af48cbe2efb1  crun-1.22.tar.gz
+sha256  90b6e33a6400ba5355eed6efc46a4c890e48e6c96d99d2bbc7fe92803bdfce52  crun-1.24.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.libcrun
diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index 02d0b3d62f..abdd4a215a 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRUN_VERSION = 1.22
+CRUN_VERSION = 1.24
 CRUN_SITE = https://github.com/containers/crun/releases/download/$(CRUN_VERSION)
 CRUN_DEPENDENCIES = host-pkgconf yajl
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
