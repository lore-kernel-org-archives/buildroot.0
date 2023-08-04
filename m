Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9676AC001DF
	for <buildroot@archiver.kernel.org>; Fri,  4 Aug 2023 16:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1F20960A97;
	Fri,  4 Aug 2023 16:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F20960A97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z6T9omhnkgAX; Fri,  4 Aug 2023 16:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F1C960E4D;
	Fri,  4 Aug 2023 16:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F1C960E4D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2DC6E1BF271
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 16:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67EB740583
 for <buildroot@lists.busybox.net>; Fri,  4 Aug 2023 16:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67EB740583
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qcVEz_nS_-Oc for <buildroot@lists.busybox.net>;
 Fri,  4 Aug 2023 16:03:05 +0000 (UTC)
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9E13400AB
 for <buildroot@buildroot.org>; Fri,  4 Aug 2023 16:03:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9E13400AB
Received: by mail-lj1-x243.google.com with SMTP id
 38308e7fff4ca-2b9cdba1228so37539101fa.2
 for <buildroot@buildroot.org>; Fri, 04 Aug 2023 09:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691164982; x=1691769782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DYrxWVI9x6BY7uPnyK5EXQX30L7zmAQV+TQxf9SK5GI=;
 b=XyDJa3RbOR+uJuPsk14of2O1M8fzZHE65bD+IBrkzXG5Tm1OPC0wmB+kvvuaHqoaYx
 eTothOkBCXXH3Kuvy3lcSR0AOguecJ3WNgU5Pu5rTOPpTufk49NBOa63Gn2iUGt8RaXP
 7DK4m+W+nY0CcH3/WtPU+mCr5IPX2t5P9bYMEtRRaFkPTaatDTwgvsyss2mzwHbgXgcW
 CfKNAyG+7JASKemDpITu1uXhw1ZImWc1yMLg1d8yAPHbBCurflx2H+iwZ+zVnC6WJvl3
 rQ/9YF3n6k9OXvwuY/4tWWYu7LydX0lcxpy39HMKTisjSIr8IirlpLRSHLEhPMqr3dJA
 S3Ow==
X-Gm-Message-State: AOJu0Yw3wCJmnEBVNKEfmh4Ewqgu414S3iwelOZMqvbZAxtfneJXK91Y
 OkV4V6+FVzlrIM5/JLn4r0SjS60EHRGj1uPPkj666mHU
X-Google-Smtp-Source: AGHT+IHBXgOKpM1OkGOW0vTR6bW89EAUfWk5hda4spau0MXFO7/zwMy78d4LX3KuYXG11MIWNNXb/A==
X-Received: by 2002:a05:651c:1030:b0:2b6:a05a:c5c with SMTP id
 w16-20020a05651c103000b002b6a05a0c5cmr1993940ljm.1.1691164982322; 
 Fri, 04 Aug 2023 09:03:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-82-52-12-96.retail.telecomitalia.it. [82.52.12.96])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a1709067b4800b00992b66e54e9sm1477040ejo.214.2023.08.04.09.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 09:03:01 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  4 Aug 2023 18:02:58 +0200
Message-Id: <20230804160258.3918831-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1691164982; x=1691769782;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DYrxWVI9x6BY7uPnyK5EXQX30L7zmAQV+TQxf9SK5GI=;
 b=SJXaMlp2Rf1cM2EaVqEE0x+XRjxVudLGfdR1PMQNwmr/j+w1X1cy05T6JS27m5BJgq
 jwedaf5etZGAt6B8su8X8F9kJQQql6oiARXDsOUbxxF0EYDedJQZQ6lC+5Ze15nARIE4
 IRVhY8wLO6oMSqoray+9746vtw1PZrQbdUNYk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SJXaMlp2
Subject: [Buildroot] [PATCH 1/1] package/arp-scan: don't install package data
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
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The patch only installs the executables (less than 100kb) saving 1.4Mb
of rootfs data.

The list of what is no longer being installed:
- arp-fingerprint.1 -> /usr/share/man/man1
- arp-scan.1        -> /usr/share/man/man1
- get-oui.1         -> /usr/share/man/man1
- ieee-oui.txt      -> /usr/share/arp-scan
- mac-vendor.txt    -> /etc/arp-scan
- mac-vendor.5      -> /usr/share/man/man5

Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/arp-scan/arp-scan.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index 89644be9d3ef..1c1bd34882ea 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -23,4 +23,6 @@ else
 ARP_SCAN_CONF_OPTS += --without-libcap
 endif
 
+ARP_SCAN_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-exec
+
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
