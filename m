Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A048CD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69F79606B0;
	Mon, 18 May 2026 18:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fwZoSaejt7x3; Mon, 18 May 2026 18:12:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BFA46069C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779127951;
	bh=iLLNXrT+uPQFccMD+nU2zG9UX92L1AMycA0gDFHYNVE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hQLokNwmT6QAe6dQRox13Sbq3KoCxp1yNJ1jEHh6pi4SHVbvfWPx7DBpbLU7iY0mE
	 p7Mo0mSaJ8y5fJta8KV/k3tORItW2aI1IX0+S+/O2X01yXFw4849XXHiBy5IaYPRxY
	 VTlhG+zY2S/HL3xxHTuNSkiuqD4Lr7sfTeqL3Rha+VnYpzWglRDMEZ8Hmo4srmraMl
	 fDS15iP6rstFZrmbn2jccAU9QQmhrEDBEKJAK3DRfPXcQObQmwjpJML5ZWmIEMH5Om
	 X+CAYVQyYFjODuwxsRzv9gY7f18YbSEeE4d+VORU/SgqYl3pvPwNapKrzLupyxkjDs
	 blXzURCUYexpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BFA46069C;
	Mon, 18 May 2026 18:12:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A89FF1B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A97B408E0
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M8439HTgDNV7 for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:12:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 981F2408D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 981F2408D7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 981F2408D7
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:12:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b8c8.dip0.t-ipconnect.de [84.161.184.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AAD15A4C02BC;
 Mon, 18 May 2026 20:12:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44964)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wP2S2-000000008Bo-2Fd1;
 Mon, 18 May 2026 18:12:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 18 May 2026 20:12:26 +0200
Message-ID: <20260518181226.112680-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779127946;
 bh=dXNuzsq+6S01DIDC3e7WMW/Knbv8rU0RabYfGPJJgLw=;
 h=From:To:Cc:Subject:Date:From;
 b=WUEuG4a2Ay+Vga2jTEkymx5bxykXiEReZrCQnJJFrF1F+Uf8nOGdkjfPL/7frVDRn
 7Do7Im3CLnH0IMHhUIExDJOsjW2TINODDN/ZMi388OpuBqd5cXwms4I1jW0VkcHgUQ
 UybPdnPpMUAUwLNf7LO5z6biremU/eU6xom+6L/15PLpkPsf+unBNL6IQaWmbtyotP
 BWOxVT7S2P1UmZzQlQwfPBExa20RKR151v8No7quBMjF2gJppc1+vu4NxI6NaQ/TLc
 ir3kiAyJUhbhM/ayyyXFY8j+WzWyM/lAGEVPNNuLOjOdSN4ih5WqBkzTaNO50jCvb1
 vcQpvSeLXJvVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WUEuG4a2
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.19.1
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

https://github.com/mm2/Little-CMS/releases/tag/lcms2.19.1
"lcms2-2.19.1 is a hot-fix release"

https://github.com/mm2/Little-CMS/blob/lcms2.19.1/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lcms2/lcms2.hash | 8 ++++----
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index 0ff881158f..f9a64b9527 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.19
-sha1  bedb39ede32b76bc2cb24ee531d7433cf787b319  lcms2-2.19.tar.gz
-# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.19
-sha256  49e7e134e4299733dd0eda434fa468997a28ab3d33fa397c642b03644f552216  lcms2-2.19.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.19.1/
+sha1  b66f8317db40a775cb46cc465f66eb841c11aebf  lcms2-2.19.1.tar.gz
+# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.19.1
+sha256  bfc54f7bab59fbc921012014a8032e4cba4abd46db47d46b76416a8c0b2815c8  lcms2-2.19.1.tar.gz
 # Locally computed:
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 32a78a4f35..6f99e3b454 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.19
+LCMS2_VERSION = 2.19.1
 LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
