Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F17C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 17:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AF5141286;
	Sun,  6 Jul 2025 17:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U02LvbtWplCR; Sun,  6 Jul 2025 17:14:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8EB4B41242
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EB4B41242;
	Sun,  6 Jul 2025 17:14:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B879012E
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EA804008F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxG0NTjWJH5q for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 17:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.143.188.15;
 helo=sender4-op-o15.zoho.com; envelope-from=dev@matt-silva.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4E544006C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4E544006C
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4E544006C
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 17:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1751822055; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=aC6iSxKmDgOwdC1i3J0YGsWnmmGbb2FBG3Gw3Rvv9iKnfhZYonn4UuohuTKLwfocLHEBm1aMmJ2jTlL6wljTJcRjCjHa8o3hcfZN9xsyaIRCGJqfOA1/U2UK4mufXptnvy6vK9Ky/lbuUOzrb9apx2ZZdfR0AiWrpkUKUqmYGpo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1751822055;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KjPkIBqxMEReDDkeJU/gyTuLQb0dkr6ZW73nPVEPfBE=; 
 b=lX+xCV/9yzhtu2gl8OdsuhweJVt5hFi1Caep2uLvzhWHERWbIljU032fMNFCVjdepf8Y5ZHrvxteVKLD1coFWh0bBBt/2Ou4FRWEPXPdkDNLj+ss8576VfD/o3WoZ1oth815ZPeR5GVMsPWkXsnx7asATe5IPFl/keHrGk4Q5iU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=matt-silva.com;
 spf=pass  smtp.mailfrom=dev@matt-silva.com;
 dmarc=pass header.from=<dev@matt-silva.com>
Received: by mx.zohomail.com with SMTPS id 1751822052709705.8755709771837;
 Sun, 6 Jul 2025 10:14:12 -0700 (PDT)
From: Matt Silva <dev@matt-silva.com>
To: buildroot@buildroot.org
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>,
 Matt Silva <dev@matt-silva.com>
Date: Sun,  6 Jul 2025 13:13:50 -0400
Message-ID: <20250706171350.1385564-1-dev@matt-silva.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1751822054; 
 s=zoho; d=matt-silva.com; i=dev@matt-silva.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=KjPkIBqxMEReDDkeJU/gyTuLQb0dkr6ZW73nPVEPfBE=;
 b=SrAwgXKYX/LYWpTcBiZ1aRS1MFMGqHBItOnf77Xv4Nfwr69SDCTedg90SeHJeX57
 bKbJcoK3v1S5S7Gw5aK9ui+Ykt56ldVMzG+WPWrUbd+8YL5FGYjLfm5s4ybw1gS3ymE
 5GHwXEoGJ63TGmCoWn2jgVGZXuAhPoAqN0gQc1yY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=matt-silva.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=matt-silva.com header.i=dev@matt-silva.com
 header.a=rsa-sha256 header.s=zoho header.b=SrAwgXKY
Subject: [Buildroot] [PATCH 1/1] package/nilfs-utils: install to staging
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

nilfs-utils provides an "nilfs.h" header file that other packages which
depend upon it may require in order to build.

Signed-off-by: Matt Silva <dev@matt-silva.com>
---
Currently, no other packages depend upon nilfs-utils. However, I am in
the process of adding a package for partclone
(github.com/Thomas-Tsai/partclone) that depends upon this fix.

 package/nilfs-utils/nilfs-utils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nilfs-utils/nilfs-utils.mk b/package/nilfs-utils/nilfs-utils.mk
index 1c8b7e245c..a6ad2953e0 100644
--- a/package/nilfs-utils/nilfs-utils.mk
+++ b/package/nilfs-utils/nilfs-utils.mk
@@ -9,6 +9,7 @@ NILFS_UTILS_SOURCE = nilfs-utils-$(NILFS_UTILS_VERSION).tar.bz2
 NILFS_UTILS_SITE = https://nilfs.sourceforge.io/download
 NILFS_UTILS_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 NILFS_UTILS_LICENSE_FILES = COPYING
+NILFS_UTILS_INSTALL_STAGING = YES
 
 # need libuuid, libblkid, libmount
 NILFS_UTILS_DEPENDENCIES = util-linux
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
