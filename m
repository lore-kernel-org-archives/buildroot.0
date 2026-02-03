Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578AFE87834
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 177466088B;
	Tue,  3 Feb 2026 14:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqgKnFkKSPJV; Tue,  3 Feb 2026 14:14:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFC1F61080
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770128051;
	bh=s6kPV1Q65G7K9ZhyUH/IP+AdvdG9wyc8p0gP9NuLFfw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=o7FoFqP4B1gWEPYQ+lpiDj1FgpJt/GQRD0YW3lBzxJagGjv+aGeSyv9cUG6MXhvp4
	 wECIgLpHrR+F0KxZdu7RGFafjyDn1wRIIJfXGsEpseDLKuDFr1Si+aAntmjTIZVP3M
	 /jauYnpFNwLYsjTW5zT24xU7YzIDMU997IkIjXEMUjczR+jPmGYrEIbEBWrgPVEEaN
	 MyLMLxfp+4997gh/li9J/jkiWkA21alX33BEGhiC6ZfAPbjGgHCqzTy2EW7ZXsTls5
	 oP6KWo1GRCk12cejqi1Xd0kvdKEmbL2OyBR5HDe1+KIQ5wkRIO5D6fdI6oZ3dqZY2w
	 8Bmr/f1lXPCew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFC1F61080;
	Tue,  3 Feb 2026 14:14:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC737F4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C98DF822E4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJMvx3Lsfql2 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:14:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E6ACC822C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6ACC822C6
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6ACC822C6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:14:07 +0000 (UTC)
Received: from home.juju.sh (unknown [109.89.232.55])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0569119F5C3;
 Tue,  3 Feb 2026 15:14:03 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Tue,  3 Feb 2026 15:13:57 +0100
Message-ID: <20260203141357.790411-1-ju.o@free.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770128045;
 bh=jkRFODG3PMJq4zmWHIvbeJR2o3U7/EvDESY8tBKHBHU=;
 h=From:To:Cc:Subject:Date:From;
 b=Jvst5c/t7FDDy1sLurXC1dL+Jz+zM1YmgfVHEep5bb2oMdL+SMZvrSMAWyE00Ql/F
 zud31Q/03OynsHhDpxOgHOUqv5nAmyAoMvYDxyVENlJU3wn7aZo8oWhtXr1XqiZ+yY
 upM2VDaRPnswvzK2PuiWDMebU+AAOelEfielrAJdYrU/BDiW96z55o/MWD1DpP/CRt
 Kv6De86/HH67Q+vWoGTI//aVHB8k2iHXjrDGXYa2FiNFKKN743Z7YPD0Cx7V1tn1XO
 Mdo2W8vC/XeJko8NWxw2BU+7rAhD52PBTWk9BezskV/TMXyMNjWeYXJ1OgUO7mlyXg
 +IBcvVZy9sbFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Jvst5c/t
Subject: [Buildroot] [PATCH 1/1] package/efl: fix check-package error
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] added the "Upstream:" package patch tag, but forgot to
remove the corresponding .checkpackageignore entry.

This commit fixes that.

Fixes:

    package/efl/0001-ecore_fb-fix-build-with-tslib.patch:0: lib_patch.Upstream was expected to fail, did you fix the file and forget to update .checkpackageignore?

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/bac34296bfed5282df07496c845d74924beb5da6

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0bf57b8ac2..16a0d5b511 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -326,7 +326,6 @@ package/ebtables/0001-replace-ebtables-save-perl-script-with-bash.patch lib_patc
 package/ecryptfs-utils/0001-musl.patch lib_patch.Upstream
 package/ecryptfs-utils/0002-openssl110.patch lib_patch.Upstream
 package/ecryptfs-utils/0003-fix-parallel-build-issue.patch lib_patch.Upstream
-package/efl/0001-ecore_fb-fix-build-with-tslib.patch lib_patch.Upstream
 package/eigen/0001-Adds-new-CMake-Options-for-controlling-build-compone.patch lib_patch.Upstream
 package/elftosb/0001-fixes-includes.patch lib_patch.Upstream
 package/elftosb/0002-force-cxx-compiler.patch lib_patch.Upstream
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
