Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A539C0218F
	for <buildroot@archiver.kernel.org>; Sun,  2 Feb 2025 08:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E15A56088D;
	Sun,  2 Feb 2025 08:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnIU3DWi7rfi; Sun,  2 Feb 2025 08:45:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07B4D60ABF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07B4D60ABF;
	Sun,  2 Feb 2025 08:45:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7E8A12A
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACB0442F2D
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcBgLUhlQ9jG for <buildroot@buildroot.org>;
 Sun,  2 Feb 2025 08:45:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C310742F23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C310742F23
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C310742F23
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 08:45:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b087.dip0.t-ipconnect.de [84.161.176.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7D987A4C4873
 for <buildroot@buildroot.org>; Sun,  2 Feb 2025 09:44:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34316)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1teVaf-0000000066t-3p8L
 for buildroot@buildroot.org; Sun, 02 Feb 2025 08:44:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Feb 2025 09:44:29 +0100
Message-Id: <20250202084429.259494-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250202084429.259494-1-bernd@kuhls.net>
References: <20250202084429.259494-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1738485870;
 bh=mLI+weWk5ivd04LKLt8HMLQom+oo3TIHacDDYCSbEBU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HVr3aVpyOWTmHHRLbn6Wi72Nu6EeFnCfIgNXFOJTtmrUYfAiwQKcjf+I3ZMGBKokW
 R937gPQmpbrnNtIliNXMwTZK3IjvpKehzWfyLPnRjiopW4IgiDOtcE//xIBtOZ/gqw
 RR9pW+oiNCYcrC2UJzqoGjWdztykdgaajTnHGZHaQOx+5alL/CX48mwNwScfGpQsLg
 c/Glg0wkhUkEBI30JDgJQmeHXyGYJs/l9GCObxMoARp2x8m5xeyfMydvD1DsBYE3Vo
 rESES+7+6LrkxSgKLDzfagVmMGDSP87NtLYGY8VeuHTRpR0d399a3BCgCaTxAvpGHJ
 biSQMLfLj7E1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=HVr3aVpy
Subject: [Buildroot] [PATCH 6/6] package/libbroadvoice: bump version
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libbroadvoice/libbroadvoice.hash | 2 +-
 package/libbroadvoice/libbroadvoice.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbroadvoice/libbroadvoice.hash b/package/libbroadvoice/libbroadvoice.hash
index 9115a38e07..b07bcce0c9 100644
--- a/package/libbroadvoice/libbroadvoice.hash
+++ b/package/libbroadvoice/libbroadvoice.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  39fd8a5f76598f2cb23b759bcd458a45a99e6ff830471576a2485c98b2ab1e48  libbroadvoice-f65b0f50c8c767229fbf1758370880abc0d78564.tar.gz
+sha256  28a97b96ceb5e290184d8b6169fddc15fe37df34c75a87c2b0d03076e475e353  libbroadvoice-03dd05df52f093bbf7820e68707f3a3668e73507.tar.gz
 sha256  2550586c993ce4a8c23c8b11968ea36192116a896a2504799cc65307d769c094  COPYING
diff --git a/package/libbroadvoice/libbroadvoice.mk b/package/libbroadvoice/libbroadvoice.mk
index 69e235e84e..77bc85786c 100644
--- a/package/libbroadvoice/libbroadvoice.mk
+++ b/package/libbroadvoice/libbroadvoice.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBROADVOICE_VERSION = f65b0f50c8c767229fbf1758370880abc0d78564
+LIBBROADVOICE_VERSION = 03dd05df52f093bbf7820e68707f3a3668e73507
 # we use the FreeSwitch fork because (quoting README):
 # "This library is based on the Broadcom reference code, but has been
 # heavily modified so that it builds into a proper library, with a clean
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
