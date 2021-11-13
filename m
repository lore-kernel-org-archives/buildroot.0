Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B651C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:30:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C52461152
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 17:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C52461152
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4C9F60651;
	Sat, 13 Nov 2021 17:30:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sjt0EnX_Mzfu; Sat, 13 Nov 2021 17:30:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F3360607;
	Sat, 13 Nov 2021 17:30:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3179A1BF370
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E9E580E21
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 17:30:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Psn7wHYAwH9 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 17:30:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 133B080CED
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 17:30:02 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so9085948wmb.5
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 09:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VwohXBkkMa8K+Bh2CnXaUbX2iwf1A6CIBznJb8h9trg=;
 b=n65jKBnvHIIXJOI2v1825Hr2ZQToJmZn1CxDRsokM4DiYN9hY+e8zAuYRMSaNqmmmM
 f6qOkOIC2PEYwtdjwaJXRH6ldmaOJZ8ke1yp8566iURai3w9a2tRDHSaKgGUvRx9gh0R
 dtTdZvcKcEEoAhZmvhdpc5vEBivmMaV3WuUSEOA5EswztSN38N7LejnYgy7K+sQqtXt0
 cRRpsiUbevEw4Mxl+OF40W6kQXI7128FoK9NUdUbAysqFGQRPgndW1jVfrL5mTWIUpqH
 4a5Behz8DqNCcV3KmHDUycsCRdwU4IRq5JLjw+G3xCzHKLmXY1Qp/DlehP9rxycmb5M2
 zP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VwohXBkkMa8K+Bh2CnXaUbX2iwf1A6CIBznJb8h9trg=;
 b=a1wGxX+UUm0TJt6I4T3YRy7e1QzE3dzINjUh2jP3FCb0kPe0V2vvQs3DaihF1HRB58
 V/cpevEfLA9F7DOLoUs+t6etfLWrglZJiqSjc5q3v/fIK1GR0qTKrQU+2v9FTBpZ52mm
 LsUUuguzIRoZoTeMnvgAgS2FIQaddRrORXrI4y4om5fINcMqxY0B+WATF89GVWExHC6e
 tNdj3/7X/7yVUJHrKWhs7Oqe6M2LDdCq1V4j03kdVI2S7DNBe1P+U8DWGAQYx9TWE7LJ
 ObWNY+d5/g7KQiwS+++VoXazC1gOEfDCMSNigXf/QMGeeaJCWcnzuvZsMxDuzux0s2b5
 4FvQ==
X-Gm-Message-State: AOAM532iD5Te0OHD1H6vM5Echu4HUwHEMalwHmlcmuRgD6qGIWHsj7S2
 akpccAw8Oh4a9peoyC3JZyxXPbUqYWk=
X-Google-Smtp-Source: ABdhPJwNstXYs7UHRBUmHO4ypKA5JoAhemJQQhbUp4taqPQhp5pYCc8USZjXpDzQOzo5/cy4agKv/w==
X-Received: by 2002:a05:600c:290b:: with SMTP id
 i11mr44944924wmd.137.1636824601012; 
 Sat, 13 Nov 2021 09:30:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id e12sm10963484wrq.20.2021.11.13.09.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 09:30:00 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 18:28:01 +0100
Message-Id: <20211113172801.596096-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/memcached: bump to version
 1.6.12
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/memcached/memcached/wiki/ReleaseNotes1610
https://github.com/memcached/memcached/wiki/ReleaseNotes1611
https://github.com/memcached/memcached/wiki/ReleaseNotes1612

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index a86a6f9f73..22c794d07b 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.9.tar.gz.sha1
-sha1  42ae062094fdf083cfe7b21ff377c781011c2be1  memcached-1.6.9.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.12.tar.gz.sha1
+sha1  40d43e98f149e13e6c81eee813e6734f23413a01  memcached-1.6.12.tar.gz
 
 # Locally computed
-sha256  d5a62ce377314dbffdb37c4467e7763e3abae376a16171e613cbe69956f092d1  memcached-1.6.9.tar.gz
+sha256  f291a35f82ef9756ed1d952879ef5f4be870f932bdfcb2ab61356609abf82346  memcached-1.6.12.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index f233e11806..8f3506f9d4 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.9
+MEMCACHED_VERSION = 1.6.12
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
