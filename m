Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51922EF5871
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 10:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6243660902;
	Sun, 15 Feb 2026 10:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBzfwKuLitSx; Sun, 15 Feb 2026 10:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 903F1608F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771152851;
	bh=1cY3rFj/slkcsaMeC0G5lHl7sJ5QkEpPCy8ATfZjdUg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=BJuR8mW+L98tfyTQcSPfIG50p4r3zOdi8AU0XVp3nISY/sUXkOvueyRfGhTMeGWyk
	 QSTLtLKINwBIaY+4jIDm72XlgqPjjja9D8Hu5wHyPc0kD/vSbEWnVPRng+il8E7mzc
	 gf99pRnqzKgoXvh295ARl7tkvwkrUeN1qmWwplchbGXNiSj8mXi89FfAMu5mOjfoJn
	 gdQFq0yU+cOTKXlyxQKLqDXTZTQiCNnz04LF+wqEVnQIfUkzB9IfofBC084Fny0qdF
	 fKADRbFfXv2+vaIohK2SFqWafB3EeI1He261f4ZkRCaqhmbbEevSu3vjSGBZwk8ZpY
	 36vp+fIxdABtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 903F1608F3;
	Sun, 15 Feb 2026 10:54:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66E28391
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 10:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51A8C608B9
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 10:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nu0rqan02W22 for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 10:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2C8560788
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C8560788
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2C8560788
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 10:54:06 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1410194305; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 10:54:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vrZlI-00000008lfj-17Et;
 Sun, 15 Feb 2026 11:54:00 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 11:53:53 +0100
Message-ID: <20260215105358.2089856-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=RjkIM2wSMe87YZubsM96TIVo45ce8CmT9/UaTi9Ub0SfvXJ31FNp3diMbCZg9DoSA3KOMHRzkJuhOGw6cCuM2+S78/ovjO399FUylJ4gLyA/59shxfKTVvaFLjwj+Jbe1WQcNtVNUPBsOxczI+vv9mZs3WGonpwve+jm8Oet5uVC0ny+A0GjdVzTP1DXECPqTBGePF5BSM/7cEiz4ogzmPxCHTmCQ/xGA56pwlEFhv7SrE4zacZr582GWWJBUreXpfhEcyWQnfghEb6zd36jsTbgIogbJbJpwTvYX7M9SRV9hlIPtxV6Jrn9Uaczg1lG2/SrrYVrWisRd+kELM2oKA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=trsmOvoPzUpU71MJgGC5sV/0VtRm0IJXOcXVKADlOz8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=RjkIM2wS
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH 1/3] linux: make license option visible for
 _CUSTOM_VERSION as well
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

Commit 50958bcdac ("linux: Add support for custom license files") added a
default value for the license files and made the option visible (E.G.
editable) when a custom VCS or tarball version is used, but it is also
needed for users of an older _CUSTOM_VERSION (E.G.  mainline release), as
the referenced files were only added in Linux 4.16 with commit e00a844aca
("LICENSES: Add Linux syscall note exception"), so change that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/Config.in b/linux/Config.in
index 9d96b346d5..c136084afd 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -152,7 +152,7 @@ config BR2_LINUX_KERNEL_VERSION
 
 config BR2_LINUX_KERNEL_LICENSE_FILES
 	string "Kernel license files" if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
-		BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
+		BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_VERSION || BR2_LINUX_KERNEL_CUSTOM_TARBALL
 	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
 	help
 	  A space-separated list of license files related to the Linux
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
