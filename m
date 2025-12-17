Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F374CD64088
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 08:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9903240DDB;
	Wed, 17 Dec 2025 08:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVAswrs77RiI; Wed, 17 Dec 2025 08:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF8B40CDB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765959506;
	bh=PVp+ytydr3Ewi/EMw2hjy7kvunwbVGVmNPYH+kdgGgg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sSzlbnyCyTdOxrWLlmUpWjWWBRd6fCUbVmC7VcPYAEdZjSIOWZz1nEteDMNbgyXUV
	 K/ie287gOnkf6Syk0GFFKpcZBDWnOBg5FXlsgDt39WEKjDUujVkwf/9r2jcdIpJu+y
	 yoZ/lwJhPYHPR+cEgGiBT8ILkl3jf+ZUBanK+QNrCuB5CrtjxRpEUCVtqZnF75sQKh
	 6Jn0Mdy8inbNwMllcgklveJaSaKUBVG8aGkHzVEmUu2wd4Qs7ixWSzCwFiHMD+6PQM
	 i3EhwdXVcYKn74LXOYZfHmV8iQgOIji1BUE7orVFInOmjVKSxp9vPjC1zUGTvJEEkf
	 9xGIAfYVhZ3lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF8B40CDB;
	Wed, 17 Dec 2025 08:18:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8658A35B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 08:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D6E740CDB
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 08:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o6rXwAzqPaKW for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 08:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 782F140A42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 782F140A42
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 782F140A42
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 08:18:22 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E096DB00548;
 Wed, 17 Dec 2025 09:18:19 +0100 (CET)
To: buildroot@buildroot.org
Cc: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Wed, 17 Dec 2025 09:18:17 +0100
Message-ID: <20251217081817.3779661-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765959501;
 bh=dH5FzrAu0YrmEg/+ywdiJ8Qbu8xaGHpeHW7EMPR6yIs=;
 h=From:To:Cc:Subject:Date:From;
 b=hiJF2RKEqeTEoDSA7t8vmbcVZP6ykBAMB1gmokB4bervxaQjANGSawx2VL6XzmYst
 Gh/dxmYv4dvMLqagn1+n+QUbIbxA7nNVhwYN0RB2hWIH3v/krGFqJQRQkCQ+JueTOP
 fNAN4akvjhuvtdtEBt848HxAIm3/nUjd7daaxUmhA0MmV9yomFnVoSOawF+88VO7ep
 F+o+xhfZku0/HTkJ65xlpTdmEeXz5nIKfxV6WoRmLNJxyMFwuAr0qh5xxA8WO5lgPL
 7fFnyfIM6qEPgyDPj7Io/AchGAPjakTSgMn4eFXvZorqQJDip2eyCo2pLSu5fnxEcQ
 3hPAi65Ef3I7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hiJF2RKE
Subject: [Buildroot] [PATCH 1/1] package/vim: bump package to version
 9.1.1989
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/vim/vim/compare/v9.1.1684...v9.1.1989

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index ae909aaeacbc..95c44234feca 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  4fe4cb284007e26255267338dde1ceac6f8326f78123ae8c96a36ee15a1ea7ba  vim-9.1.1684.tar.gz
+sha256  e150b40bcf593c10afb39378f2594203d94e5d6110ffe242a0b6bedd258d757f  vim-9.1.1989.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 4297bdd198b2..2ecab0652f6f 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.1684
+VIM_VERSION = 9.1.1989
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
