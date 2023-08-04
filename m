Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D23C001DB
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 20:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C7D400AC;
	Fri,  4 Aug 2023 20:55:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C7D400AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lRLklJBrGmsK; Fri,  4 Aug 2023 20:55:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B76740308;
	Fri,  4 Aug 2023 20:55:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B76740308
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CFB61BF328
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43CF660FF3
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 20:54:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43CF660FF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yM5oOb8SkWAS for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 20:54:11 +0000 (UTC)
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB50C61341
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 20:54:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB50C61341
Received: by mail-lj1-x241.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso39323731fa.0
 for <buildroot@buildroot.org>; Fri, 04 Aug 2023 13:54:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691182448; x=1691787248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bTst3k6RVh/LdXDD9uNJW5kwCgOSVbhULAALIhjFoEQ=;
 b=GCvW5a4RMfze7NpKAgLYUnbce9s8/pSixstw0y0uI7Vm3P5Cf1ZVVUaDhF6ZhWYtc8
 RhZzR7obB6C7EFDMa3t45yVD9BInQILkRf+ghgmwsMlji+rN596AG6dBqx3oJdaBXU5J
 TIv9qeMYyHpQK6Z3FkLepeBvCam54bYx33W5ezWkr7uDWoAsn7rOD0sl1Rsu0zOHZzyF
 Z95xfE3WlM6LfJ76Xpoj8uaa8UDBg1zSC6S73yhSvUkazs+20CQwIf0dQkMbidMY+8XU
 uJx2fESNwVnhhU0ycWYb+M6WRL/1aX4+WMZ30lRDZ6wJabf87F7gu2NQkz9SMBsDy1WH
 mDhA==
X-Gm-Message-State: AOJu0Yxl6S92CNVwGBh1vDLDP+ZOb6brH3N+gIvKlTtW3tALnAUPdakI
 XlXTouI3NoDZw1DBkKLEWDKa6vHtyA5qbFpc7MO30tHY
X-Google-Smtp-Source: AGHT+IF10EJZ7y4GS0992xGq5r0AxScvOIvcioJIRaDJqS8f5JP6plSStOyJtUYOZgx1z6dmG7IfUg==
X-Received: by 2002:a2e:9a9a:0:b0:2b6:bb08:91c4 with SMTP id
 p26-20020a2e9a9a000000b002b6bb0891c4mr2864689lji.42.1691182448446; 
 Fri, 04 Aug 2023 13:54:08 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-12-96.retail.telecomitalia.it. [82.52.12.96])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a1709063e9700b00993150e5325sm1802624ejj.60.2023.08.04.13.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 13:54:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 22:54:01 +0200
Message-Id: <20230804205401.3975960-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691182448; x=1691787248;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bTst3k6RVh/LdXDD9uNJW5kwCgOSVbhULAALIhjFoEQ=;
 b=rXuqQ/8ITCG3a0jtyj91nh9KZBZSiM7PmOx3UG8td52FVqr/e16x0y9zFWo+wfWgmV
 owe/BYlbrEdP0xeGEKq5UD+NBi+AUcGjd/t2BpIjEKekkNJDAN86XSMNRtPtBOSAbXLO
 166gUP/xIInudJ4hjCyQrX7GhrsO6G0V/zATE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=rXuqQ/8I
Subject: [Buildroot] [PATCH v2 1/1] package/arp-scan: allow to not install
 package data
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
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch adds an option that allows you to not install the data along
with the binaries (less than 100kb), saving 1.4Mb of rootfs data.

By default, the data is installed for backward compatibility.

Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- add the option to ensure backward compatibility.
- update the commit message

package/arp-scan/Config.in   | 11 +++++++++++
 package/arp-scan/arp-scan.mk |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/package/arp-scan/Config.in b/package/arp-scan/Config.in
index ed70b3958610..cf7377d2f9b6 100644
--- a/package/arp-scan/Config.in
+++ b/package/arp-scan/Config.in
@@ -8,3 +8,14 @@ config BR2_PACKAGE_ARP_SCAN
 	  discover and fingerprint IP hosts on the local network.
 
 	  https://github.com/royhills/arp-scan
+
+if BR2_PACKAGE_ARP_SCAN
+
+config BR2_PACKAGE_ARP_SCAN_DATA
+	bool "install data (OUI)"
+	default y  # legacy
+	help
+	  Say 'y' here (the default) to install the data along the
+	  binaries.
+
+endif # BR2_PACKAGE_ARP_SCAN
diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index 89644be9d3ef..67eb1881dba2 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -23,4 +23,8 @@ else
 ARP_SCAN_CONF_OPTS += --without-libcap
 endif
 
+ifeq ($(BR2_PACKAGE_ARP_SCAN_DATA),)
+ARP_SCAN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
+endif
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
