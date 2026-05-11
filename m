Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A8B4CD484E
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 19:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16AE6407F8;
	Mon, 11 May 2026 19:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DoIcG213YNFU; Mon, 11 May 2026 19:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AACA407F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778527537;
	bh=F64WCycKkynCNz4PmdlZN5qB6kjYbbr1s7iw3wyDn6w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kZemAXKdybgDPBRbSMCftcfVMsGttcEYzS7psXFdBdQdJBMPR1HdqitVhY8druc/Z
	 xQj7L4bkJx3C2Z8gXAJkfmiJ7smVJJK0k5+GbOtRIAUfvcXwUf1UrRxTeSZ3nZT46L
	 ktUQEz2mjwCeKDOQh1y0IMKUoga8zClxWlPpxPftutDYSiqlPjUIF67rzybuVtvzYZ
	 iY+oeE07+6BIP0RT33BJVoHMyMFfNdu28dO5tCon/axNFSnicp94lFpaig4vi+laXm
	 fPa/NS6MnmocWYf84zR80/cDf5iX2NaNgYy5C7MVdqFuBvFzJgGlkvpNmAan/KEktC
	 b5HG5E09+tdBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AACA407F9;
	Mon, 11 May 2026 19:25:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B6EB173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0CC940094
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEZwdaqHz0Pc for <buildroot@buildroot.org>;
 Mon, 11 May 2026 19:25:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AC2AA40093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC2AA40093
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC2AA40093
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:25:31 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id MWFrwaJ7SEZ9tMWFswwkzR; Mon, 11 May 2026 21:25:28 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 11 May 2026 21:25:27 +0200
Message-ID: <20260511192527.3886468-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMgGuwMlbqjaNtTbAqbx6VyBzvGpCABd58NA8nrBhboNrq3P35k4g/P54I61fZzLaAbrziNEXmc6wTGij9yDYlO53IDlzKVDBRDMYcF/noF7ptJZkjKf
 AwtdKVjZMsDHfJPl2vcVUqfrqKm7AgNt5WEJrFRjUHl3kbn9GYEsByX8zrcLqN6xUFXZ5RNhnox3CJJcjw10u0xX+NYhfGTGY7y33q8DCYQmXsyLHxg2zI4/
 ghqWtQlsA7DJv1bGGAM6Q/DrA9hppB3jWYcbBDhUlJ4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1778527528; bh=rErrzo9y+1QM59uIzPrftQ6bTceK29zu3/HX2dVil/4=;
 h=From:To:Subject:Date:MIME-Version;
 b=Rjxc7K0CaARC+PiXM/OyUJ5NhbHt7laYJX9n02wRxEZfw6WPgp09lJ6FzGNtaMmN+
 kcYFJLfzzpo+39D6LLwfFR2Wqfsolm8RpndW3Dgu3VUu3iaFsusr9XH7yLvxYYP4AK
 Ynhxrwje833pI3UmzghXQbGGeDOyJv+u2I/JfWTOz3PzU3lsVwbFBVO4k9WlH98lJw
 CXiNv4xgtP23tE9gwJATAqeA1+BhpV/W/9igSkZue5q7KKuNQ0MgevpfOgZjc/aDkI
 DeVFq2E2RWbdJfczE7wT+6KEDPxSMCFuo01Pu0YWyIkkWFnnWNnpg/oDxr8Me3oqPv
 l+otPSYFKIx7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Rjxc7K0C
Subject: [Buildroot] [PATCH] package/libblockdev: fix build failure due to
 missing dependency json-glib
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

When BR2_PACKAGE_LIBBLOCKDEV_LVM2 is enabled it requires package
json-glib to be enabled starting from libblockdev version 3.5.0
so let's enable it accordingly.

Fixes:
https://autobuild.buildroot.org/results/fceb64bb7fcfced61ef900b580b458135baa3713/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
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
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
