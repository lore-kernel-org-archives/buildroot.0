Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DB8C5AD69
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 20:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1728B40CD6;
	Fri, 20 Feb 2026 20:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4G2U1deaen7; Fri, 20 Feb 2026 20:18:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14B8A41912
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771618703;
	bh=7xq3ZxgargoJ1JqFg7/7xYNciQSdY0Ox5X0zVLHvEEY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=s0fgfTtbox75muxa6K03Ik9OBvnpU9SbKYkW/gfAEHcLOTepVsM/cUtMDWDHr4KgD
	 dRTlQsmEwMu9bzKpcTESYelQzfcHjT2Nt5fnKbQ5ahksNdwYlBj2XVZss3dVPKApin
	 3G/sOPpfHHaGLekd4DKM2kTtpROBLz08zoHY5Srg+yIb9IslKJSPf1cuRoLDupDiBx
	 J/XdlnH84xmgcx6ZnQ1eTkU2pXbe6HSsj3YTE6n0CMcUAJMOxkgnaoXzb/jiksauIr
	 g6ntaR8ZbMBppP5DvLSygPjCdD/vPFk1/ulD34ni/lH/zOfswEHZ8Bf0+iSWF1H276
	 L+BhtYWNmkmXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B8A41912;
	Fri, 20 Feb 2026 20:18:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B66B1CE
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 20:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D46C417D6
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 20:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ht3SsgA8qtY for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 20:18:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BD23A404CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD23A404CD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD23A404CD
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 20:18:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 64C65A4C11DE;
 Fri, 20 Feb 2026 21:18:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55686)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vtWx8-000000002a4-1OOO;
 Fri, 20 Feb 2026 20:18:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Fri, 20 Feb 2026 21:18:17 +0100
Message-ID: <20260220201818.3578573-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771618698;
 bh=2yM9l5VLgmf/RkiNElobJWYjs4DlChFUuzi/D/87kqI=;
 h=From:To:Cc:Subject:Date:From;
 b=Vo/uGwF1wUgCnT/zSCI2/KoyKe5NEfLHtQRH/j42bs19RX6pqNY96mDIZH9d5mfzz
 5Y8AsWjF4k2pGhMfSne59b3EtSxxDxJ3Ix89XvfNQelDO56ihNZbdOtqkD2VEhxsSo
 D2krkzbqd3acbU2kxzPtsG+Sn1qfR0JfI7kc3YTnqLIsi43/fZF1bwaeIiFs4lQBX+
 K4SZPD0v3TOOb79ZYKO++k2ZcvWIE67QtICYHJJxMiZ/FNk+RRiB/jftE7/mCD1i1R
 fP4/nf+I4YjJ1gaBaTQMRjF04c5g52uQOepKImSKraO0falXRBnxO3s15R0qKz8sT1
 KGAr9tdt5mrRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Vo/uGwF1
Subject: [Buildroot] [PATCH 1/1] package/sphinxbase: fix tarball hash
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

The oldest autobuilder entry dates back to 2024:
https://autobuild.buildroot.net/results/804/804f64a208b4737d1c1a2462d1cb213a2b8fd18f/

but the tarball was updated upstream already back in Sep 2016:
https://sourceforge.net/projects/cmusphinx/files/sphinxbase/5prealpha/
with changes like an added license file:
https://github.com/cmusphinx/sphinxbase/commit/7c64b5fd140d5625d501a1bd54e3ee27e847f33e

The current hash was committed in July 2016 with buildroot commit
63ee560d2f5113f325f05697d2fb0fdc61448859 using a patch from March 2016.
Even back then the tarball was updated multiple times:
https://lists.buildroot.org/pipermail/buildroot/2016-March/142505.html
"The upstream developers respun the tarball at least twice in the past
 month."

Fixes:
https://autobuild.buildroot.net/results/b45/b45eebbcc86f33741053bb6f9b89e16c7041c470/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Please note that the upstream github repo
https://github.com/cmusphinx/sphinxbase
"was archived by the owner on Jun 9, 2022."

What about removing the package from buildroot?
No other package depends on it.

 package/sphinxbase/sphinxbase.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sphinxbase/sphinxbase.hash b/package/sphinxbase/sphinxbase.hash
index 433fba685d..9a619d2854 100644
--- a/package/sphinxbase/sphinxbase.hash
+++ b/package/sphinxbase/sphinxbase.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06971dbe272d2f73bde0ef7b3538c0c8f8ea885cb171fd6b17a5975bced66e64  sphinxbase-5prealpha.tar.gz
+sha256  f72bdb59e50b558bed47cc2105777200d2b246a0f328e913de16a9b22f9a246f  sphinxbase-5prealpha.tar.gz
 sha256  26f12e0152a5d58c69904e439761a1b2fbb9267b5f04674dbf93667e3e6dd043  src/libsphinxbase/util/bio.c
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
