Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CB6C001DB
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 17:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1CA160B30;
	Sun, 13 Aug 2023 17:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1CA160B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 52lTgzbMBOeI; Sun, 13 Aug 2023 17:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AAB160B2B;
	Sun, 13 Aug 2023 17:17:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AAB160B2B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 69C161BF414
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 17:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29F4C409E3
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 17:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F4C409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id swAY6qpjjNZ0 for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 17:17:44 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8A7A409DF
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 17:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8A7A409DF
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0DD613520C2A; Sun, 13 Aug 2023 19:17:38 +0200 (CEST)
Date: Sun, 13 Aug 2023 19:17:38 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNkQMgmLXTtuItPp@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691947059; bh=reymSxQz9fGbAwk3BWwFnQm39FUw5fODCFhOjA++A64=;
 h=Date:From:To:Cc:Subject:From;
 b=OyrvFcAJBl3LGhyWLWaIJCuDVbZuLy0gjMwGmg0zB3Tls397BAkL8Xj96I05jzIHi
 WEOiL20uo8JbgPbku1IBwZUpNhCAtluxJP0jzT5exV2sKA36YxTG1m94CUCMax+iwS
 hEbSwXqJtrUfhTcGOwNMUqhVIn9peB0Lwdpo6So4s07sWJleq/mgPasQsOeAHyN3Ii
 ZCv7KIC7dIdyIV309qbySBvI3n+7F6QUK8vBX/pzuOog/mQ9PX3g8mpLARsR9pXLUD
 /n0dR1KQk2XM2mNOoNpWbYnSPlg7/L0G4sNdEu8RAFKXqXcljb4R75CeEa04+kBFMg
 yOn3hAK4wVslA==
Subject: [Buildroot] [PATCH] package/f2fs-tools: fix musl compile error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Grzegorz Blach <grzegorz@blach.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

musl 1.2.4 removed the lseek64 function, but kept a definition of lseek64
when _LARGEFILE64_SOURCE is defined.

Overwrite configure logic to always use lseek64 for musl toolchains.

There is no need to backport it to older Buildroot releases, because musl 1.2.4
is not part of any release.

Fixes:
 - http://autobuild.buildroot.net/results/17f/17f4ea7d62581cf8c574deeb98e1785220d5bd3f

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/f2fs-tools/f2fs-tools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/f2fs-tools/f2fs-tools.mk b/package/f2fs-tools/f2fs-tools.mk
index a92ab4fe3e..f9be789940 100644
--- a/package/f2fs-tools/f2fs-tools.mk
+++ b/package/f2fs-tools/f2fs-tools.mk
@@ -16,6 +16,10 @@ F2FS_TOOLS_LICENSE = GPL-2.0
 F2FS_TOOLS_LICENSE_FILES = COPYING
 F2FS_TOOLS_CPE_ID_VENDOR = f2fs-tools_project
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+F2FS_TOOLS_CONF_ENV += ac_cv_func_lseek64=yes
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 F2FS_TOOLS_CONF_OPTS += --with-selinux
 F2FS_TOOLS_DEPENDENCIES += libselinux
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
