Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2B0FD0060
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 12:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8428841C00;
	Sun,  1 Mar 2026 12:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxVc9GNjpSrE; Sun,  1 Mar 2026 12:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9DBB40DC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772368734;
	bh=OcC8/vmAbg+LAkwO2q8kgND7SJ7q7cdReY46u7LlS1U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iuDFspzECRuTUDdncbbRAkv7G1DCy355NWaWrHc+RXCsXTVVo+kimMsN3Nz/CLBQw
	 phYGxN6/FfyZ5b82Vv28IJ7holmIgUC88lXDIgwHPlILi3cbJouJv94suCd9/4j0EK
	 3enhdXVHMwcqtxFGEyY5DuOv50aXhAyVvBP5RGd/u6ZRZKBI8gYUuNLl7GN+U5UF/Q
	 tSzIq+WbqXI2FzzqNkM8dQ8+zB/p37qW1calnng7yZ4XYXEO8txr2R1SHod/yF1LaP
	 SHCqKCJoDbiyTbEVi0l69vSVwreT/uRd9evz14H/tI+fUpYBfLYHADgy9toIZQp3zd
	 35u92v6ZNRyhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9DBB40DC8;
	Sun,  1 Mar 2026 12:38:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DA2024E
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3EDB560C0F
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vK2R56MwrdqT for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DF6060BF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8DF6060BF8
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 12:38:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E15185C71; Sun,  1 Mar 2026 12:38:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 13:34:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7da7f82307801ecc2c4b972244e9bfab71d54f59
X-Git-Newrev: 2a1e6376c1718bf8a22ee53755d7e5da23babc6c
X-Patchwork-Hint: ignore
Message-Id: <20260301123852.8E15185C71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poco: enable parallel build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a1e6376c1718bf8a22ee53755d7e5da23babc6c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 126162b9159a185ac1897db1a9956f0379fc1428 disabled
parallel builds in Jan 2017 due to a bug which was fixed upstream in
Nov 2017:
https://github.com/pocoproject/poco/commit/1724e8ba53d05ce688dcdb5176b128f116af2682#diff-76ed074a9305c04054cdebb9e9aad2d818052b07091de1f20cad0bbac34ffb52
https://github.com/pocoproject/poco/commit/076dd9679bf2e77f1df219287f0eb42ea36b7371

Building with -j100 worked.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/poco/poco.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index a471a24adf..fe1dd29855 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -77,9 +77,8 @@ define POCO_CONFIGURE_CMDS
 		--no-samples)
 endef
 
-# Use $(MAKE1) to avoid failures on heavilly parallel machines (e.g. -j25)
 define POCO_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
+	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
 		POCO_MYSQL_INCLUDE=$(STAGING_DIR)/usr/include/mysql \
 		POCO_MYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql \
 		POCO_PGSQL_INCLUDE=$(STAGING_DIR)/usr/include/postgresql \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
