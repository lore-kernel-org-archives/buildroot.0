Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1EBC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 11:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CED781F5E;
	Sun, 18 May 2025 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id auFk7bAGuI5I; Sun, 18 May 2025 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF35C81F5B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF35C81F5B;
	Sun, 18 May 2025 11:58:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F1901BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5561A40BEC
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:58:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tPymeLilWaYP for <buildroot@buildroot.org>;
 Sun, 18 May 2025 11:58:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC119409B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC119409B1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC119409B1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 11:58:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a067b.dip0.t-ipconnect.de [91.58.6.123])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A9081A4C1077;
 Sun, 18 May 2025 13:58:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33652)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uGced-000000000cA-3rsR;
 Sun, 18 May 2025 11:58:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Sun, 18 May 2025 13:58:07 +0200
Message-Id: <20250518115808.3649869-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747569488;
 bh=kzBA/3c1WfvXn6UwzXjujwDF7NNTF8pPmO0isOMeKBc=;
 h=From:To:Cc:Subject:Date:From;
 b=DVxDY7gHHDXWRTKeVihymQH8hFIQ9A3MDTYLzjgH/kt30cJgvOZayc3bwumTBnfVp
 IrdFKYBckKwVvAVqN0LjcId7EfNQ/o9Qn0tEpuYdrR87D7pE0W9OLTK0GZvUGvtO/Y
 r0IC+jc3aBLAKQYjMocl3Y7ixR0+nifrSQ/OdbcwDBVd18xOLROseKjmsYlVvIOcHY
 ToTkp9p8gy8VCiPvXJY7fhY2gA+GJO3qZ7BObWtkcPq7Mq0mtlvqzpOE9qF/mYYuqA
 +JAn6HOX0P4GoBceYG3iOkK06CwzE1nvY+l5xV0FwOcgAMbzixl/Mp5ifT0re+oYBV
 AnqpsrHFLT/KQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202412041019 header.b=DVxDY7gH
Subject: [Buildroot] [PATCH 0/1] package/mesa3d: bump version to 25.1.0
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

This patch depends on the series to bump llvm to 20
https://patchwork.ozlabs.org/project/buildroot/list/?series=457336
due to AMD drivers depending on llvm >= 18:
https://gitlab.freedesktop.org/mesa/mesa/-/commit/82047fa82f1bbbbd4f1a9b05c034f79a00d85e31

Regards, Bernd

Bernd Kuhls (1):
  package/mesa3d: bump version to 25.1.0

 Config.in.legacy                              |  6 +++
 package/mesa3d-headers/mesa3d-headers.mk      |  2 +-
 ...t-proper-value-for-LIBCLC_INCLUDEDIR.patch | 41 -------------------
 ...ion-to-disable-optional-neon-suppor.patch} | 10 ++---
 ...-Include-stddef.h-to-fix-build-erro.patch} |  0
 ...uild.patch => 0003-Fix-uClibc-build.patch} |  0
 package/mesa3d/Config.in                      | 24 ++++++-----
 package/mesa3d/mesa3d.hash                    |  6 +--
 package/mesa3d/mesa3d.mk                      | 35 ++++++++--------
 9 files changed, 46 insertions(+), 78 deletions(-)
 delete mode 100644 package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch
 rename package/mesa3d/{0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch => 0001-vc4-add-meson-option-to-disable-optional-neon-suppor.patch} (93%)
 rename package/mesa3d/{0003-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch => 0002-src-util-rand_xor-Include-stddef.h-to-fix-build-erro.patch} (100%)
 rename package/mesa3d/{0004-Fix-uClibc-build.patch => 0003-Fix-uClibc-build.patch} (100%)

-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
