Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1C8FD9E3A
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 20:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4288F4177D;
	Fri, 27 Feb 2026 20:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DejVeAjbZliE; Fri, 27 Feb 2026 20:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB23041190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772223382;
	bh=dCsqhtkQAbxQzZyGtdmH0lQCiZx/oj3NiSLT0mBrs9k=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oMpvDRU4Rbr8BzgMnXDndVwifbAfX7WkfQqoDLSa6+JPFbG871JAtaA8pIcf0Q0Zx
	 4x45uEVjiVjeltgV7TIKwW0j3w/Og/5J/1oeSfwSM7dFbdv+nPqPhKafOgXNSbl6Dn
	 EiqShT9mIq7L3gw3Gx7ApAdP4UQUIHh3FvcYqG02HzHD0RylGYZ42iqBCmCvW41n5n
	 u4wI2hY0nTymLpMnI+XDOZwqucl4PPm3fVymShGEO8xiI9/kAQcI5ODkuopm+ngz3w
	 XYp38ChkQ6b8zYG5mutsmbYMvi50rrLOgAlZONzacyBwLdhw3PWW5eGpr6QTPobvi6
	 l/E9XO6zdNMSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB23041190;
	Fri, 27 Feb 2026 20:16:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C635B1F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC1AA81DF4
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEHh_JkrIIcH for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 20:16:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC05681DE3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC05681DE3
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC05681DE3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:16:18 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id w4FvvUmZk5Stew4FxvT7s4; Fri, 27 Feb 2026 21:16:14 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 27 Feb 2026 21:16:07 +0100
Message-ID: <20260227201607.3701906-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEeqakaVirBPLIV1k5EEo7ec7fbniIGbyorxI3zSaiFTc/EPSknzmdM619+x+b7cM3ORVK6JuoE2SGD2BftDrC44Kz637gg7NPG3eJ91GAVmvGU1rxjF
 JPA2gIXDbIjpUxV5KA5RX2F7TXZFKVNZR/ygP4bEij88w1x23am/gN659kjj05EPIyemFi3CJ/CPlmMS9IEC+IQ9+6e3CkkGV99iNiQmxwCCeeaMfzq8QPUR
 pkTrUsUInGPZUvpjqMkqSRtgHWvG/O3utX6zBEc/xXs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1772223374; bh=HPRey5mFZ8RY6KVoRzVdDOquhsCFVEs6zs2me/aRePU=;
 h=From:To:Subject:Date:MIME-Version;
 b=eMXRI4LkbUWn8vndOn2L9l2QkIoiJPYysaq5wQGaDMVLxOv2iA4tJyYJ4vwNbNnmX
 PyfZqX8NmiGz6DWIlMNc+N4U/7doVcJmsIPZDz4xA08CjyL7W0k3TJ1/Y8xzOp/hZ4
 KccmfSeTjUhgbhurX6+GjAJqLBhNbfpicB6qp1eqFbjioUQfEQD6lMBBnu4FuNMoF4
 2wjO0e3Ldmys3GxNl9+P7sJWchxiFdM6Nta3fUZgpmgYhH9pfu1gcV/4u5kctKiYvs
 1hi3SqtkysaoHdfCaX/VIfnrA05zhMqQi9DRwTW7h2tFcSrVZqck+WM5IgpK3xrL2r
 mWc/HXdeV5nTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=eMXRI4Lk
Subject: [Buildroot] [PATCH] package/bind: security bump to version 9.18.46
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
https://ftp.isc.org/isc/bind9/9.18.46/doc/arm/html/notes.html

Changelog:
https://ftp.isc.org/isc/bind9/9.18.46/doc/arm/html/changelog.html

Fixes bug:
GL #5751
https://gitlab.isc.org/isc-projects/bind9/-/issues/5751

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 2e6ab4e043..4671eab985 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.18.45/bind-9.18.45.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.18.46/bind-9.18.46.tar.xz.asc
 # with key D99CCEAF879747014F038D63182E23579462EFAA
-sha256  096ec94c10bc9d2ba686325660a615962d0fd6529429149acfcfb7daefaf2421  bind-9.18.45.tar.xz
+sha256  6b59f0de30c6901cce783007d06f7dd717ec3aa74b5bb5cc5159f93f0be4fc1d  bind-9.18.46.tar.xz
 sha256  9734825d67a3ac967b2c2f7c9a83c9e5db1c2474dbe9599157c3a4188749ebd4  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 1b71bcbf66..e58dcda34d 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.18.45
+BIND_VERSION = 9.18.46
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
