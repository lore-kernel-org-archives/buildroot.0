Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2298CC54EE9
	for <buildroot@archiver.kernel.org>; Thu, 22 Sep 2022 20:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A662460B0B;
	Thu, 22 Sep 2022 20:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A662460B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_7G7kZMBgFV; Thu, 22 Sep 2022 20:00:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6285608B7;
	Thu, 22 Sep 2022 20:00:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6285608B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0CE01BF319
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 20:00:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4E6D400A6
 for <buildroot@lists.busybox.net>; Thu, 22 Sep 2022 20:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4E6D400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5mn11SW7rcI6 for <buildroot@lists.busybox.net>;
 Thu, 22 Sep 2022 20:00:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACEC94017E
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACEC94017E
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 20:00:47 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id o64so13732730oib.12
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 13:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=ovPIamOkwAFxFffXyGena+FrKu8DQ59BpmX+GFJ8jp4=;
 b=M8bzetuVfVsyF1TBLgLd2KTIrpiwE9ixGO3qr9hAChgnfJa6A/RSA66NVY5RI2TefL
 s2YuGnwD+n9N4NQB6OrJ1BU/7swMEIgol0r/ZM4/JQEx3Vgf7xS90gH4r9QnxC7GhpQd
 Jm7u2Z75oFvpanbQiUqa6GU9mhS00aQpqFAmokZIV2363s0AvOY8S47RcnL3cqwgdBRB
 8tq9EUs+myQAWVtlQuGzZqmZoM9H4PA8tfZdmB/z22TSgxhhmT5fkw25Hx8sM1Q0mBeU
 5x+G2vbLAlSqvw6AOvGKXi0/cLxDSJxSQuIq7/TDO5wFhiUuQNZvIdexoX2Ld8bliPAT
 kivA==
X-Gm-Message-State: ACrzQf14jmN8CxmSS6/BTY8wWvr6+XlZtO3cLHV2Iifb3+S3mfGlYjMb
 DeBVFM4jUHTJgWUZofeh/kAlxM30g48BWA==
X-Google-Smtp-Source: AMsMyM4jV/C467MzyXAAOkEVOsOlqKvUjTheLl/O2jf9VWzeSkmC9zJptNa6/yVV0PupQlY3NddpkA==
X-Received: by 2002:a05:6808:1a87:b0:34f:67aa:5089 with SMTP id
 bm7-20020a0568081a8700b0034f67aa5089mr7454358oib.108.1663876846436; 
 Thu, 22 Sep 2022 13:00:46 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 w20-20020a056870b39400b0012d939eb0bfsm2687813oap.34.2022.09.22.13.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 13:00:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 14:00:41 -0600
Message-Id: <20220922200041.4982-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=ovPIamOkwAFxFffXyGena+FrKu8DQ59BpmX+GFJ8jp4=;
 b=j2Y2iAjejaUzHB/OVTBv1bm4eLkwdHo/3r64FTiWCG9UClRD1C4+dnyHZ/LVubP++f
 X+plulFYkQwf2ES3Asw98fKK41ackk1n/iJGxaxMqoxmD6tMNBRRHzbeHeQ/FSzyKlCl
 8VgpG3i3K0UjKB4q0sULtnfzpifBuiGWPjIsLFUxwmPcHd32rv5thMp03ALJ8FxlPhoO
 ETJthjQ+Wz1MyQ98cZRt+fGVdaWm6iLEkrBQittPkE5e01n1bRHKBFvQazZZbPb2O/V4
 gvzA3BQC2BQIqbiX7K5PfFbLApwlxVtFhDGHStDoY6fDD4U6S03dSi4miPxd8rx/V/yG
 TXpA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j2Y2iAje
Subject: [Buildroot] [PATCH 1/1] package/wayland-utils: fix build without
 libdrm
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add upstream patch fixing build without libdrm.

Fixes:
 - http://autobuild.buildroot.net/results/a13/a13e5bc4893a2057097aad268152212858c8e966

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...ayland-info-Fix-build-without-libdrm.patch | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch

diff --git a/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch b/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
new file mode 100644
index 0000000000..2d4591f785
--- /dev/null
+++ b/package/wayland-utils/0001-wayland-info-Fix-build-without-libdrm.patch
@@ -0,0 +1,46 @@
+From 3657a11d45f133776b50c716d99f37965eb07ed1 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Wed, 14 Sep 2022 09:07:10 +0200
+Subject: [PATCH] wayland-info: Fix build without libdrm
+
+wayland-info can optionally use libdrm to provide a description of the
+dmabuf format modifiers.
+
+When not using libdrm however, the build fails because "dev_t" is not
+defined.
+
+The definition of "dev_t" comes from <sys/types.h> which is included
+from <libdrm.h>, which is not included without libdrm support, hence the
+build failure.
+
+Simply include <sys/types.h> unconditionally to make sure "dev_t" is
+defined regardless of libdrm support, to fix the build failure.
+
+Closes: https://gitlab.freedesktop.org/wayland/wayland-utils/-/issues/6
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Fixes: 240cb739 - "Add support for linux_dmabuf version 4"
+Reviewed-by: Simon Ser <contact@emersion.fr>
+Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
+(cherry picked from commit baa65ba9f62e6a05c32b9202b524158a21f24245)
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+3657a11d45f133776b50c716d99f37965eb07ed1]
+---
+ wayland-info/wayland-info.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/wayland-info/wayland-info.c b/wayland-info/wayland-info.c
+index 53cd04b..98ff205 100644
+--- a/wayland-info/wayland-info.c
++++ b/wayland-info/wayland-info.c
+@@ -34,6 +34,7 @@
+ #include <ctype.h>
+ #include <unistd.h>
+ #include <sys/mman.h>
++#include <sys/types.h>
+ 
+ #include <wayland-client.h>
+ #if HAVE_HUMAN_FORMAT_MODIFIER
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
