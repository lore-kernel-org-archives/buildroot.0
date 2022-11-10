Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330C2C433FE
	for <buildroot@archiver.kernel.org>; Thu, 10 Nov 2022 22:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 75EE9416EA;
	Thu, 10 Nov 2022 22:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75EE9416EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPDbM2xFso7X; Thu, 10 Nov 2022 22:06:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B030941679;
	Thu, 10 Nov 2022 22:06:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B030941679
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFD351BF360
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 22:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A815F40B8C
 for <buildroot@lists.busybox.net>; Thu, 10 Nov 2022 22:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A815F40B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WG7RXjhIiwvn for <buildroot@lists.busybox.net>;
 Thu, 10 Nov 2022 22:06:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9740E40111
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9740E40111
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 22:06:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 187-20020a1c02c4000000b003cf9c3f3b80so4443257wmc.0
 for <buildroot@buildroot.org>; Thu, 10 Nov 2022 14:06:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2VCwj1+jcn5KOqj48M/so5kz+xQwJYePjUGhqIddJWs=;
 b=CW2nuRonf7NuVHqU2e4/yOKYGfIxlR95HEEEFJ0OSHpUcLQ6gzSm7x3MK2ayARn2FD
 mLdbyu3257/zLxS4wNzaDARTBEOglXiWmkPnK4cEs1kz6W5/trqUwcCk1U/FQs4lVx1/
 rAHtV9fhW1KTBXdvriZ6VDsaE7OlQJTIg+pv9NFN30iyf82NdPqBhf8p/yXQ/bordXe2
 AUQsm4RyNGS9GhlfeyGnFJfn8mhRFJMo9boelhGtz4ZmDL18GpATrbrkvoFGcSgyaJWG
 CNdykOdRpUKb6xv2Ct7evZJiA/xSI2dzlS2dVVqeracrQmsXEZogs1Rmxl/2LL4eKv1m
 bj8A==
X-Gm-Message-State: ANoB5plwScRYtCO/kv/QJkuWlnyDqe0hXhOkoSPWVpqsHtEAZ1Gg33zA
 MhAaSn7wwJdw/ifTfIB1fR2zOQkNmxg=
X-Google-Smtp-Source: AA0mqf5ZDKS0rnR1u1A/8tf2mAdPZCg3Hhdt+pXi5efRzALBSlIkj1W/U9SbyqdlBoZTZafd21urjQ==
X-Received: by 2002:a1c:38c7:0:b0:3cf:ceb9:350 with SMTP id
 f190-20020a1c38c7000000b003cfceb90350mr695598wma.197.1668117984179; 
 Thu, 10 Nov 2022 14:06:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfe948000000b002366553eca7sm231504wrn.83.2022.11.10.14.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Nov 2022 14:06:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 10 Nov 2022 23:06:20 +0100
Message-Id: <20221110220620.89736-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2VCwj1+jcn5KOqj48M/so5kz+xQwJYePjUGhqIddJWs=;
 b=ktmx9O4xebVZfyrL3gRGdM0J/Zjxlax3nb2zwt/XdKitgxo6eTb832Z+K/EephU2/s
 OqXfr4kbflLMJynyCdfaQ9Zn+4IQvYWl3sdOJeNtu4J3T+DaFAr4oye33oY4gHhJkc1q
 +mo95YNdcSyfW9FQG5jNSqfB49Ebe8mNbCO/4H5JjRLi/d4hiuoTdh2vd6HDmUQMPKJI
 YW1l1iUY/xNiqjXFeCw7w0UpoN8Y0lDuYM9w3Cs67oeWVfPzPOX4JMlHLtyoitgzqztV
 oEOb+kG11iO/Qz7mape/qvLwPS01BV7a8/6NTZ/hFmUWLko9IR84199jGns/2nag303z
 WJIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ktmx9O4x
Subject: [Buildroot] [PATCH 1/1] package/wavemon: fix kernel header collision
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

Fix the following build failure raised since bump to version 0.9.4 in
commit 5cae1a0d675eca41125b6430157d3d0d78d1220c:

In file included from iw_if.h:26:0,
                 from conf.c:19:
/home/buildroot/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/linux/if.h:71:2: error: redeclaration of enumerator 'IFF_UP'
  IFF_UP    = 1<<0,  /* sysfs */
  ^
/home/buildroot/autobuild/instance-1/output-1/host/mips-buildroot-linux-gnu/sysroot/usr/include/net/if.h:44:5: note: previous definition of 'IFF_UP' was here
     IFF_UP = 0x1,  /* Interface is up.  */
     ^

Fixes:
 - http://autobuild.buildroot.org/results/cbdf3e0cf0bee8f1b076581768c24155afc320d9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-iw_if.h-don-t-include-linux-if.h.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch

diff --git a/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch b/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch
new file mode 100644
index 0000000000..95f54e4b7f
--- /dev/null
+++ b/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch
@@ -0,0 +1,41 @@
+From 4ac1482bb40376e47805c3737dfed60abb1dd3b4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 22 Dec 2021 00:39:35 +0100
+Subject: [PATCH] iw_if.h: don't include linux/if.h (#109)
+
+Don't include linux/if.h to avoid the following build failure:
+
+In file included from iw_if.h:31:0,
+                 from conf.c:19:
+/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h: At top level:
+/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:143:8: error: redefinition of 'struct ifmap'
+ struct ifmap {
+        ^
+In file included from iw_if.h:26:0,
+                 from conf.c:19:
+/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/net/if.h:111:8: note: originally defined here
+ struct ifmap
+        ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/a6ee162cf04b70b144b54e1ca4b7b2421071c50c
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/uoaerg/wavemon/commit/4ac1482bb40376e47805c3737dfed60abb1dd3b4]
+---
+ iw_if.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/iw_if.h b/iw_if.h
+index 9e7fa89..6607e0b 100644
+--- a/iw_if.h
++++ b/iw_if.h
+@@ -28,7 +28,6 @@
+ #include <net/ethernet.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
+-#include <linux/if.h>
+ 
+ /* Definitions from linux/ieee80211.h (not necessarily part of distro headers) */
+ #define WLAN_CAPABILITY_ESS		(1<<0)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
