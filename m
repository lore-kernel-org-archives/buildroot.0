Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB60C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:42:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2AAB60EBB
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 11:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C2AAB60EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A08E607C2;
	Sun,  1 Aug 2021 11:42:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SL90r2QQaUlg; Sun,  1 Aug 2021 11:42:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD00B607A4;
	Sun,  1 Aug 2021 11:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AF3F1BF303
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A945835A6
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 11:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63cpTzk2pGdR for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 11:42:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91EF383566
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 11:42:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d8so17910211wrm.4
 for <buildroot@buildroot.org>; Sun, 01 Aug 2021 04:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EW3dDmvRclfbD0d9LSAxy/pmEceyb3jW6+ZX25fY/1k=;
 b=tWN4kAfnppFdomdYpsz5k/mjeiUzSV6aWX5/l0vJcaDh4y+Y0eeYtcnIWOv5g6TVSQ
 j0xbtXJ4PZ1yI7BE120LbUtqG0zTzV/a1HBsEsxJLg9R3zFPSo/TbjQ+xR3nDQMJat+A
 487FC/F7Fxq5r2t1ROe7wiEy61qJDxiLfm4jL3A0SDFgc1Af7Qgf6JfmEg6Vt8B2mskT
 5plhNVyPDcvnf36pBsb7k0i+lIeqtz5xsOERR0vKKDA7oLuAOMgAogjXWTpvhKj1xpcx
 zHmg9Q6eD3nIZvUKHz1ORZSdwTXh7WbJqPMQZF3fm8wAf7F3Gmcpgl5ZZM671rOoaBky
 KNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EW3dDmvRclfbD0d9LSAxy/pmEceyb3jW6+ZX25fY/1k=;
 b=BnNnZzHEH+C/6qoLc5yFli268umEZSIOjBwO677LJCD0oultTd3BJrl/np/QEwKM13
 uL2xHLoWWCKiIPOOzGvVM3C7Qvx4zPlng+23+P7bhkKJhgI3lJDog39wNuI9ghDWZAyH
 UgaQvHrESsO6frTnIX9ylwFTVkJ6TunkimmJ+nDU6ePHL751x6YquEhUiJvEttaM0W6c
 epqO6iB9pi2qT1cdAOx8GcYbgJz/A+ybnA5Dr5PUF8BVNXIsSpwR+Y3yqnrZ+wmCToPT
 sYM3HlkWoCloj7OztWTZA6DiRWs57z+BppXTSDdF6zJKUlHCDiI+q0WMKW/lnkn1N+qg
 DENA==
X-Gm-Message-State: AOAM533vA2eFZt9vLWfXDbQSioKNUdI7nkAB6q2MCKxM89B2Rz+OTLx8
 xvi2ZE8WUAwDo3PjKIUMwRjKw4stVy98pw==
X-Google-Smtp-Source: ABdhPJwWwhY5KDylVNDrDxSO43NgTpzfNC0xxSRSjXOrd3SjFQwtEWc9PQcdBRWV4MFJZcCON7hHBA==
X-Received: by 2002:adf:e90e:: with SMTP id f14mr12234832wrm.191.1627818169115; 
 Sun, 01 Aug 2021 04:42:49 -0700 (PDT)
Received: from kali.home (pop.92-184-116-62.mobile.abo.orange.fr.
 [92.184.116.62])
 by smtp.gmail.com with ESMTPSA id b14sm7800749wrm.43.2021.08.01.04.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 04:42:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 Aug 2021 13:42:44 +0200
Message-Id: <20210801114244.2763110-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rsync: add SELinux module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Support for rsync is added by the services/rsync module in the SELinux
refpolicy.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsync/rsync.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index f57e471ef9..5b51ca1df7 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -9,6 +9,7 @@ RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
 RSYNC_CPE_ID_VENDOR = samba
+RSYNC_SELINUX_MODULES = rsync
 RSYNC_DEPENDENCIES = zlib popt
 RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
