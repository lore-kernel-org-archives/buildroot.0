Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CEACD6AAF5
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 16:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24CF380D6F;
	Thu,  2 Apr 2026 16:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnr4XX5oyPvh; Thu,  2 Apr 2026 16:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D9B080D49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775148944;
	bh=XPYehUv/MTeQ87YZ237ASF1TdtGmVJK0eZbXokrZ6A0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JnRCAyBT61WFOGSyT4MAgk8w8t4zDSz8C2gT2e/cANu0S1hrOxM6bsif/VgA/6pGb
	 5anSrez+EVFYTbNGNxi7n4qKXeF0cpSA5pHoR+CvjVaZxu82qCGwRmupLMUL4YZcXY
	 Y5kqfAWXI/kbPVLV2DXhKlMZdAuYj1VnRYNLY2F/DU2KRS++i1UPGemqoYLTyhMua9
	 c8JQe1Vl2c6ZFhefNJqaeGOoyCHjOwGNd9Q2XvbuModxdulvaWhFR+AMjC4OwRqJKx
	 zTWIKqXv/6fE83PMmTOkSi11dtutJJEUQzULyMs6Aeb2kTXPjwqgEyYrr5E1pf/gDt
	 ZKWSvhj+ci/8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D9B080D49;
	Thu,  2 Apr 2026 16:55:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 01ED02E9
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 16:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBFF76080B
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 16:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YnHHshMyliPI for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 16:55:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.146;
 helo=smtpweb146.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A58FD6070A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A58FD6070A
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A58FD6070A
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 16:55:39 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 8LKSwcowVrbJK8LKSwp0SI; Thu, 02 Apr 2026 18:55:36 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  2 Apr 2026 18:55:35 +0200
Message-ID: <20260402165535.1464368-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPcwip41R8947ZDq6PQj9LOhXf9zdX0EGbTBiVS3ryVSZzCcYBIammKX5zZHee/4MV35ed7FD1BioMvzcL7U3IROHfSoCyIUncp7aPMCCCIEazOzLqO5
 lz9xSca6rKOSNRqJ3gPvnwp1bE4eHnLKlB9Avxu/+tokX0VrPvogEtAOHui+cq1nH/J4cBCcC27gGRUIJt31yNuSRCX8ueiCjFUzXmeUowz81RjciihOkSDV
 t/J4KVTm5kyhnOVKbzJXv2Kor96WtJnC/vgrc330vI8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775148936; bh=CaCpwN9cWF7EkU0pBdEVUr+Ggb1yPGSJFM/BMKjxlBU=;
 h=From:To:Subject:Date:MIME-Version;
 b=YH5C88IayzHBcGKIb9tFs983IsTMstTSj/r7+uuzsBIXmHHKc/Jw/A8I10VxuviEn
 ssg0zbNPeoN38BTnPq6uE5caPUzRdlXQ7kjac+fBDo00zQLyUhQDbvb+jmckHtyHib
 wBkM4jaGiinPXpt+c0i16tG5bg2D6hOHqCEXlGqiBA6Sw6vGFDtmdF9bLrq1CIs7uk
 WGh6FOtaIaMy/3PG173ouZVA1Gg5GRK+AWTXWRE5QWZCj1gj3YNiqpYZGDryMaNIQW
 3X3ccJrjCKvNplKzjSvXpwe0QRWwt1kORK8zMHmq+NMM3LVjl9W8CShwFmn3HPEUrx
 Dt/C607M7z+qw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YH5C88Ia
Subject: [Buildroot] [PATCH] package/bind: security bump to version 9.18.48
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

Release notes:
https://ftp.isc.org/isc/bind9/9.18.48/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.48/doc/arm/html/changelog.html

Fixes bugs:
GL #5817
https://gitlab.isc.org/isc-projects/bind9/-/issues/5817
GL #5800
https://gitlab.isc.org/isc-projects/bind9/-/issues/5800
GL #5826
https://gitlab.isc.org/isc-projects/bind9/-/issues/5826

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 09d35a3698..7b268a49b4 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.47/bind-9.18.47.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.48/bind-9.18.48.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  9d544ba013decd1ee60e3c99d5548dd21aaaf5db96205dfc8623f39f061f14be  bind-9.18.47.tar.xz
+sha256  c742a69bff2561c23099d7c70c6984c145bcca1c1e3c67fac1f68a8132e8e7c5  bind-9.18.48.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index b889f922b6..17ea50c5f4 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.47
+BIND_VERSION = 9.18.48
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
