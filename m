Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43113CD4F3C
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 18:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C60E60B6B;
	Tue, 19 May 2026 18:21:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6swFnrr-lWw; Tue, 19 May 2026 18:21:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC8160B58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779214896;
	bh=5Cq1LHHGCxSAgYBgs5vyLMzgvIEeGQwlkurm1Wax+9Y=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J0gPWEc7NL4K3X1qPV0TQMYkwDR2O60dlKyQ7Ndr7377ygcKZerddP1Af06nQjwZY
	 93fiZJKvEPz7YK1xTtoVyH4ml1JhBxkXaLTF1XCSsn0ell1RrkbmldbibQnBWzlcXp
	 gUzGU9RbMD8paJSAeagN98wb4vYdu+xXLpwim8tF5DCG1X5HXDqQpMoxec6AAdInFh
	 reLJ9bT4BrTy+sJtz5xF0V1WhI5zLDMjX8rMsC38XMcCfsQ/NYoBM1JRJfoPRV4Ho2
	 fuoHsjTIXvihhliSRegN1PTdaLIObOJelXtoZ2f7cdi9jh+EVyNdsSM/O6r7UK0y6C
	 KTWkcpXSQLjuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC8160B58;
	Tue, 19 May 2026 18:21:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A43265
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 272B3404BB
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:21:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogvY8e52jMdM for <buildroot@buildroot.org>;
 Tue, 19 May 2026 18:21:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C974F404B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C974F404B8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C974F404B8
 for <buildroot@buildroot.org>; Tue, 19 May 2026 18:21:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0431.dip0.t-ipconnect.de [91.58.4.49])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2CEDEA4C0886;
 Tue, 19 May 2026 20:21:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wPP4M-000000005Is-41Zy;
 Tue, 19 May 2026 18:21:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Date: Tue, 19 May 2026 20:21:30 +0200
Message-ID: <20260519182130.890979-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779214891;
 bh=6mU78y33Q3qunWQf7dH3DTTM/hAQcUmRBwN3q0ZHEmY=;
 h=From:To:Cc:Subject:Date:From;
 b=Wm6tME7uz58U7m4fI6eA5CRyxKGrDN6S6eTNA5WO5WWrKWl/6lWnnwocssHkhxLCk
 DZi8qMpkILhj2gDrOC27mOBlAN4/JT3X7XiVOXFBIiNtJnSx2UtpLITzsfEpCO7ctK
 Mojg3u3fi9sr82KrVC1fNTPiIliZvaMjYLGjzDe1iHHnPZf4Mia6IuyzBwhYX9czXS
 GtxKyEhMZzxmlw5knWeK4YhqtuGoIg+JfEc2jXJSo3+ACcylclHpQHH3kaeyEdWQEc
 RRFU/t9NkghEQ9ydNvTEyZdklssUkZO02TUUhkPWq7H5B9zyaf9INHp3A4yH6TU1Vv
 GWN7HIqms9Dsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Wm6tME7u
Subject: [Buildroot] [PATCH 1/1] package/haveged: security bump version to
 1.9.21
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

https://github.com/jirka-h/haveged/blob/v1.9.21/ChangeLog

Fixes CVE-2026-41054: https://seclists.org/oss-sec/2026/q2/575
"The bug was added in 1.9.3."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/haveged/haveged.hash | 2 +-
 package/haveged/haveged.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
index 066e21c132..0aee4d5e0c 100644
--- a/package/haveged/haveged.hash
+++ b/package/haveged/haveged.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  acbb05776668657012273be9bb3310e3140b79959aa4538e4cca8d30d40c0b8f  haveged-1.9.19.tar.gz
+sha256  14e711975401ad03fdb29d2dcc20a501596ee752d92affdf43dcb3ad61cf20ff  haveged-1.9.21.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 0e377d36ce..e22712f016 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.9.19
+HAVEGED_VERSION = 1.9.21
 HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
 HAVEGED_LICENSE = GPL-3.0+
 HAVEGED_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
