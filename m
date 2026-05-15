Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5D0CD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 14:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E857783EF0;
	Fri, 15 May 2026 14:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sQiDLrp_LVg; Fri, 15 May 2026 14:13:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C8F983ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778854395;
	bh=oeKs0Rgj9LcJ937yjcKHisBCce3ngPHOlnzIz2Yo7ks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TuCNIwY/lYu6hD3owANmIrddTsyMjE88p4bbETs1VZncTKuHBZCrSbisEcDZH2QMc
	 GVJQ83e9MT2WykfgTK3cQcNABuB65cU9lLafgY/4bP4eyx9lycWHu41Wtv41dxOQ4/
	 /j17006ofVy5Z3qx4R7wcnynsQ/FQ52V5WekXwfg78ybYvNwCN8Hhfo1sFeRgPeaFj
	 eyTZixYdrZaXsT5vGwmQilqERkHV1VJjlG/cVIxkYvzXFtdTS5yJPXVwbGNwgsH0Ja
	 RTbVXxVrW+70gcGEEEsUSRmBC+dZgLKGjUOV9cAkM7cUKLSuCFO7KX6pGZGWoSBrzP
	 CPA5twM6674iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C8F983ED7;
	Fri, 15 May 2026 14:13:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1482336E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:13:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 116CD40E49
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:13:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHmpcQ7eGzzn for <buildroot@buildroot.org>;
 Fri, 15 May 2026 14:13:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D7F540E24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D7F540E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 14:13:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5CEAA86324; Fri, 15 May 2026 14:13:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:04:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0a9836fcbe9b7a423a1b5bbdae75a97f52eb74e6
X-Git-Newrev: 89609ad586bc8ff387899c2733e668e7f96973f6
X-Patchwork-Hint: ignore
Message-Id: <20260515141307.5CEAA86324@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libblockdev: fix build failure due
 to missing dependency json-glib
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89609ad586bc8ff387899c2733e668e7f96973f6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When BR2_PACKAGE_LIBBLOCKDEV_LVM2 is enabled it requires package
json-glib to be enabled starting from libblockdev version 3.5.0
so let's enable it accordingly.

Fixes:
https://autobuild.buildroot.org/results/fceb64bb7fcfced61ef900b580b458135baa3713/

Fixes: c03745d7de627e70b1142a6f212fe7e5f060cdd7

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Romain: add the commit hash introducing the build issue]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/libblockdev/Config.in      | 1 +
 package/libblockdev/libblockdev.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libblockdev/Config.in b/package/libblockdev/Config.in
index 08d618945b..e9e9faaa05 100644
--- a/package/libblockdev/Config.in
+++ b/package/libblockdev/Config.in
@@ -47,6 +47,7 @@ config BR2_PACKAGE_LIBBLOCKDEV_LVM2
 	bool "lvm2"
 	depends on BR2_ENABLE_LOCALE # parted
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # parted
+	select BR2_PACKAGE_JSON_GLIB
 	select BR2_PACKAGE_PARTED
 	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_LVM2
diff --git a/package/libblockdev/libblockdev.mk b/package/libblockdev/libblockdev.mk
index e5cbe45b93..89a398c6e5 100644
--- a/package/libblockdev/libblockdev.mk
+++ b/package/libblockdev/libblockdev.mk
@@ -47,7 +47,7 @@ LIBBLOCKDEV_CONF_OPTS += --without-loop
 endif
 
 ifeq ($(BR2_PACKAGE_LIBBLOCKDEV_LVM2),y)
-LIBBLOCKDEV_DEPENDENCIES += libyaml lvm2 parted
+LIBBLOCKDEV_DEPENDENCIES += json-glib libyaml lvm2 parted
 LIBBLOCKDEV_CONF_OPTS += --with-lvm
 else
 LIBBLOCKDEV_CONF_OPTS += --without-lvm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
