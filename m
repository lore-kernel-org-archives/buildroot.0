Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D74E74916
	for <buildroot@archiver.kernel.org>; Wed, 24 Dec 2025 11:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA648116C;
	Wed, 24 Dec 2025 11:24:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7muwGan0e_i; Wed, 24 Dec 2025 11:24:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D839E813D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766575452;
	bh=PVU5kHTsTIVIta9oDpmtuO1D7zdxdNFQj63sgDdqFFg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MWQDs1G3l+sPq32ObKu8Ms2rG0FgEoCLk2VdQ1iRjyzAJP5/TXl2DZ703c3G8ebi6
	 kK67fjvjKmeiZWSa9vcqRoQrNg5/9Ugyi1P7ojuDcQTAacixlkTPw9GFKwyS+bJYsR
	 1TFPoyw5BKhWNk7lQlj1lSg8OoZSd//oykr5QZj032AyRaSuiyVUB/xMKpFugnGdO5
	 QlqLBdTO/hEfhfpkVpJ2FR9qiyyHvJ9yP2g/hw3aYKXOYVkoR5mw3rjqc+UJt/m35s
	 /aHXVckQ8SBAIlp7YcNmgI0ONTiABpyeUpovdDbv8QrShUADC/3grr8cvRDUgQwi8W
	 QUW72sVwkyi1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D839E813D7;
	Wed, 24 Dec 2025 11:24:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15605BE
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 11:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0CEC40A41
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 11:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 34PhKpy--qGr for <buildroot@buildroot.org>;
 Wed, 24 Dec 2025 11:24:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.102;
 helo=smtpcmd10102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 25C9140A3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25C9140A3D
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 25C9140A3D
 for <buildroot@buildroot.org>; Wed, 24 Dec 2025 11:24:08 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id YMyLvLFGpIfDkYMyLvASuA; Wed, 24 Dec 2025 12:24:05 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 24 Dec 2025 12:24:03 +0100
Message-ID: <20251224112404.3796586-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfN1vO8acxtGyVzwFTWL+6oLM+gpeIOBv0g7bcq8kI/JsubjvAjO6iGTVA8amqyOqFfcJwNcSYy19EmEwgi0g4kaE5I6MT+9ePmXM0/Ji4G3fQc4BTh7E
 CsE9A9kjVcp/odo4+RYflfWU6RN4l8gD5WDFoG1b1LaA9OPCU3S/pfskdabY6Jm/Tonddy7U9FpFmsc83WtrjCBKgfsyfG/STenfaESGWgZjKfAg2Yfpjvl4
 czatWDw5dSsaiM/McIfvQX9bXjWWC5dCciPF6Bhy3q0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766575445; bh=KpNxmSxXd6J2oDogzFl1KSoeAT2k1sWWtGZir98cgQs=;
 h=From:To:Subject:Date:MIME-Version;
 b=ks1CJ3kGrF6vwEFfV4WceKzYQ4a1TiMWXxvmDENteJkW6wUAslERIEDLCP4vOESbq
 2zVpyJyHLdpnhvgf6J8rJCmanupFFOtxhSAaTPU0plzNHw3mEBGIe3ogTAWYHD0o+z
 kKOwOMnv+z8N66xojEzXv+OV2ckZ7/fhIZAlXqWQNketI+Vj2tySC+u2VNsEYyXHur
 PSWvAoqBhZF3Jn9r9o76tatdRzAdtjbnC1VwAIXhayo4aXl+qWZjgPispe31vWGjra
 uHpb6YpxRzW2NfQn87TozuTSQslX/6sxT4W/GbLz8niZn7wLT57I+2CGy8DqRA+tph
 UaW+53T2wgqbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=ks1CJ3kG
Subject: [Buildroot] [PATCH] package/vim: bump package to version 9.1.2017
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

Changelog:
https://github.com/vim/vim/compare/v9.1.1989...v9.1.2017

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 95c44234fe..f7c883b929 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  e150b40bcf593c10afb39378f2594203d94e5d6110ffe242a0b6bedd258d757f  vim-9.1.1989.tar.gz
+sha256  be1d60091d27bbdbc090e0bb19798baeea378aa29645fd47dc4c222dc14efcaf  vim-9.1.2017.tar.gz
 sha256  0b3f1f330cb1b179bb17c7c687d4cec601e0aa3462bc7f890ad4c3888d37d720  LICENSE
 sha256  ee1d0885bbc4a95a24e49873a075391bdf26b69d13758e30f3d9271f8f42bd2d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 4fe8800bea..1e7e1d6a55 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 9.1.1989
+VIM_VERSION = 9.1.2017
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
