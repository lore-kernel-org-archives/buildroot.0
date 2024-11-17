Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAC2D68BF9
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 12:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D77C848E9;
	Sun, 17 Nov 2024 12:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwPnUyyQQbIh; Sun, 17 Nov 2024 12:30:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E73A848EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E73A848EE;
	Sun, 17 Nov 2024 12:30:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 44478DB2
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25ADA848EC
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Er-JK6xbZllV for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 12:30:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 179BC848E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179BC848E9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 179BC848E9
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:30:39 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2E7EAB00539;
 Sun, 17 Nov 2024 13:30:35 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Sun, 17 Nov 2024 13:30:26 +0100
Message-ID: <20241117123026.532997-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731846636;
 bh=SrnKL0Ksgqmsrk+u9144ulF6JCU+P/rC+7FNv1hdtp8=;
 h=From:To:Cc:Subject:Date:From;
 b=Ux2g162p0/y7Bfw1773VcJkwe2nAQpSk141T5QP7T57j//PXO3paoHLoMdXOrniZU
 UqHtwdsKH0umWGnGCjxDSsckCWFo541hG3rCmHlbtl8O2y3NKGGDn3VuGuyhBknLbC
 Iuuszron2cFEQON4rAvzt0z7OGdrTWSqEFEkrOfo/38JmYLJXIV3iDfnIUy6EsGHPc
 2Kq3gQc50vdZ8gQV/ZuR51FMdMGLpgaXWzc6071GKgVZKqDzCiIErADeQOS7bH0l1s
 8jzdNKVfy/FXaZB53ERKhjXcKDoETSXrLkeFjQJ6jIUEMrq2+RL/D6NTa6v155hazH
 adER7Z3CIKBeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ux2g162p
Subject: [Buildroot] [PATCH next 1/1] package/bc: update _SITE to use
 BR2_GNU_MIRROR
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

The bc package is distributed on the GNU project servers. See [1]
and [2]. Buildroot has the BR2_GNU_MIRROR configuration which can
be used for that purpose. See [3]

For consistency with all other GNU packages, this commit updates
the _SITE to use BR2_GNU_MIRROR.

As a side note, the bc package was introduced long time ago using
BR2_GNU_MIRROR. See [4]. It was then updated to an alpha version
in [5]. When the alpha version was no longer needed, it was switched
to the main GNU download server in [6].

[1] https://www.gnu.org/software/bc/
[2] https://www.gnu.org/prep/ftp.html
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286
[4] https://gitlab.com/buildroot.org/buildroot/-/commit/c95dcd464512ede5ffdef5567558611f05e2e52b
[5] https://gitlab.com/buildroot.org/buildroot/-/commit/1faa7c344e10986a4afd1d17bf6d4265b3c821fc
[6] https://gitlab.com/buildroot.org/buildroot/-/commit/ed7572cc7ff69584116c4e763a608afc225bd0c6

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bc/bc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bc/bc.mk b/package/bc/bc.mk
index 06b6feae4f..5691ca9e67 100644
--- a/package/bc/bc.mk
+++ b/package/bc/bc.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BC_VERSION = 1.07.1
-BC_SITE = http://ftp.gnu.org/gnu/bc
+BC_SITE = $(BR2_GNU_MIRROR)/bc
 BC_DEPENDENCIES = host-flex
 BC_LICENSE = GPL-2.0+, LGPL-2.1+
 BC_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
