Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7864CC71136
	for <buildroot@archiver.kernel.org>; Mon, 16 Jun 2025 19:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43CC1605A7;
	Mon, 16 Jun 2025 19:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFWIay0llRKe; Mon, 16 Jun 2025 19:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CFD060809
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CFD060809;
	Mon, 16 Jun 2025 19:15:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 83F1FD79
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A77F40447
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WlGD0aBsCMGj for <buildroot@buildroot.org>;
 Mon, 16 Jun 2025 19:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 88B2C4041E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88B2C4041E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 88B2C4041E
 for <buildroot@buildroot.org>; Mon, 16 Jun 2025 19:14:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01bf.dip0.t-ipconnect.de [91.58.1.191])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C54D5A4C059A;
 Mon, 16 Jun 2025 21:14:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50780)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uRFIG-0000000050g-0ym0;
 Mon, 16 Jun 2025 19:14:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 16 Jun 2025 21:14:56 +0200
Message-Id: <20250616191456.3479677-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1750101296;
 bh=xL+IlegX/8Z2vnnNqtTrQoT5y7TEvfRst32DWBkLdwY=;
 h=From:To:Cc:Subject:Date:From;
 b=0Qzz1A67fE58K5sc+dlN4UkTfCAtjJOVHk6uFKXjztbEffj02Xigca+pshd9EFtcx
 2b+Y7gQ3sUK0T2OtFZNowiNpu2/UboPjaKNGqigldB5QfsTskN6YViIO1/ACn7DZTd
 g6akZV6hUdA8dZBqiuFDc1eJYhArF2v+ot0IgWRC02xYR7I74d/bnsh1X0N28Dcl9c
 Fjeiyn5AxKooymx/ud2n/Q6318OaG0wIbkUgHo6cD3UD9VMqfT9dfZCPivxrxTXxa8
 AbkVcuF91k/d+HAzEReJDAfIpA3b0sdouBxF1rhwlT7DfAAQ7wqNla1pjEz0ONqRep
 RM2JH9rpUGujg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=0Qzz1A67
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.17
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

Release notes: https://littlecms.com/blog/2025/02/08/lcms2-2.17/

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lcms2/lcms2.hash | 6 +++---
 package/lcms2/lcms2.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 362412e3c4..eef8229eef 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.16
-sha1  751d32ba11809e3591c118be9aae8ac2dbd41cb7  lcms2-2.16.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.17
+sha1  213382ca260cf761f264f185407f75bb1c6e2ce8  lcms2-2.17.tar.gz
 # Locally computed:
-sha256  d873d34ad8b9b4cea010631f1a6228d2087475e4dc5e763eb81acc23d9d45a51  lcms2-2.16.tar.gz
+sha256  d11af569e42a1baa1650d20ad61d12e41af4fead4aa7964a01f93b08b53ab074  lcms2-2.17.tar.gz
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 92aeff8890..5137c7ea20 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.16
-LCMS2_SITE = http://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
+LCMS2_VERSION = 2.17
+LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
 LCMS2_CPE_ID_VENDOR = littlecms
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
