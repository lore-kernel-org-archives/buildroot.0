Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CDECA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 16:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D975661683;
	Fri, 29 Aug 2025 16:52:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8Qe64J7Qin2; Fri, 29 Aug 2025 16:52:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA0CE6164F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA0CE6164F;
	Fri, 29 Aug 2025 16:52:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 42411445
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3467A4064E
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eKfaIneGpNFy for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 16:52:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CC8DF4003D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC8DF4003D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CC8DF4003D
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 16:52:44 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -422123893; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 29 Aug 2025 16:52:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1us2L9-00Cvv2-2C;
 Fri, 29 Aug 2025 18:52:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 18:52:38 +0200
Message-Id: <20250829165238.3082564-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=hIebLw5YHZ93SrfOZYEjKcvOfSs+wS11VwDSfrZ52RveA67IA95/OZlgskUsSYrVIC8VdCwGqjC0MmH8ZSBVK+5ey2ozBbZUdTyXs0MSnMeAeBnPdX+TmZsAEhY3sE8gmx1ESRuw6V4XF8uNYFUIlD/R/5Ur5Tl5fIv3Bb0LG+RzvXSrTb0hQaJRXI+p8lU4JV9A+6WcGIzaC3ly05taB5Gxh98dmktNoQrnQmAeIYNWbKBAxgVOQwLpw9sL/Qjn/joWSf1LKJmWHk8ss3ZiFq2a9ernd23cLrByQV6C2iPL/GQoxVYyPn7vYhPo51h+IVTVX4ft59eVQJth2VIzzw==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=nF0gPFsx+uIJCnoGk2N8aiKm0x9G/Usk8/2TyDx22Yw=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=hIebLw5Y
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/mbpfan: fix build on musl / uclibc-ng
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes https://autobuild.buildroot.net/results/9526503fe8e756bd4444f1fb1e9cf1391c461901/

mbpfan uses vsyslog(), which is not in POSIX so only exposed by <syslog.h>
on musl and uclibc-ng if we define _DEFAULT_SOURCE:

https://git.musl-libc.org/cgit/musl/tree/include/syslog.h#n64
https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/include/sys/syslog.h#n200

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mbpfan/mbpfan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mbpfan/mbpfan.mk b/package/mbpfan/mbpfan.mk
index 0ac161b327..bccb3ffc16 100644
--- a/package/mbpfan/mbpfan.mk
+++ b/package/mbpfan/mbpfan.mk
@@ -10,7 +10,7 @@ MBPFAN_LICENSE = GPL-3.0+
 MBPFAN_LICENSE_FILES = COPYING
 
 define MBPFAN_BUILD_CMDS
-	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -D_DEFAULT_SOURCE" \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
 		$(MAKE) CC="$(TARGET_CC)" -C $(@D)
 endef
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
