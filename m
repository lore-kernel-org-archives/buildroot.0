Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D550C54EE9
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 19:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F152812F2;
	Tue, 20 Sep 2022 19:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F152812F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRktTjT2H2Qd; Tue, 20 Sep 2022 19:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9FD5812D4;
	Tue, 20 Sep 2022 19:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9FD5812D4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C92A1BF2C6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04F1081259
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 19:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 04F1081259
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U_dxdztJmJsu for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 19:03:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E330180BA2
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E330180BA2
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 19:03:27 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x94so5219216ede.11
 for <buildroot@busybox.net>; Tue, 20 Sep 2022 12:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=P4WtgXwY7aheDis0nxzbKOWruxKxqrIN7vSM7FI8xAU=;
 b=KUKWVJF66lKT5q0Pf0SGc7vkKz6XVkvIHC3D8abaLQqOly5oBqZfVHzyyEnidmX6RT
 tQ1MUNohT4cZPlpvtVjzT/PZ5inDmWcr/F4bulxSwzRdHvaZ6o7oOwkUEF1nOWuwKm4i
 uCbR+LcWFZJumi46z142H8w6vYG8/vkJbZujKdKbF3iWc/4FcLh33JlV0E1kJqTJwyKv
 bwQRDRd3tL4QHFvRBJr+2hecG6Vs6BugoVOp0Mppx9BwVRXJ2zSuW0gywrsVwWCezoJO
 k6pOFVSdbcnkjaMuIgwg9DPj1dWGyC1gxIiOsVCxN4Vv+PsteeYfgYCQj69KX98QiuA9
 juQg==
X-Gm-Message-State: ACrzQf0jo9HSztveNOZlITMEfnwu2y+x0q8eCT5KmrwDyoDy6CcpuNtA
 eXWcNYc2Yo0EV7WlhY5p1OVunseM3VE=
X-Google-Smtp-Source: AMsMyM7eZJwTLqbEol0pRyvx6d/LyG9Z4AFkjuVxcsPekwEMx9G4E1VJrBpoSegbbvug03Y14u1Xng==
X-Received: by 2002:a05:6402:11cd:b0:452:199e:7cf6 with SMTP id
 j13-20020a05640211cd00b00452199e7cf6mr21648668edw.366.1663700606219; 
 Tue, 20 Sep 2022 12:03:26 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g2-20020a17090604c200b007415f8ffcbbsm276680eja.98.2022.09.20.12.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 12:03:25 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 20 Sep 2022 21:03:20 +0200
Message-Id: <20220920190320.3688689-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=P4WtgXwY7aheDis0nxzbKOWruxKxqrIN7vSM7FI8xAU=;
 b=L2MPed5F3EMGR4eBTHLUHBBWbWzLizKVGZgs1MpIqvufq+m7yvLRv8Hc7aoL53FbYN
 Y9ODRYaGMZH7kVFHGm8IwSltfjKCtVKfvVwg1lJ26XRy90k1EhLqcSSXHgAmJwOPouzl
 wiec+fTKGEJ8IBtsTNhJZJD0GICk5npkD0wCrHf9IjWc+dHWKuW6w/n6nn/rYzR+vhC2
 FcHqJzJ5l5WgHr0cymDaOkT/H02D3SJXeuBMghcsm8plKMZ/wex2Wat0BBfapku7z74U
 0gKRV89VcjKWAz/bAP/pVhi+GQ9XJ6j+qXqJq75NNWCD3L3kZ9l1xdpBR8fe5AuetGWk
 8dDw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L2MPed5F
Subject: [Buildroot] [PATCH] package/libatomic_ops: bump to version 7.6.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libatomic_ops/libatomic_ops.hash | 4 ++--
 package/libatomic_ops/libatomic_ops.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.hash b/package/libatomic_ops/libatomic_ops.hash
index 991c3fbe8..32a0795a5 100644
--- a/package/libatomic_ops/libatomic_ops.hash
+++ b/package/libatomic_ops/libatomic_ops.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  18091d5f3cb7008b0432016390ff437b9d1d76c10b92c8e63ff63f0c1331b030  libatomic_ops-7.6.12.tar.gz
-sha256  f0e630c0ca489767033da5a0c869fb4231db522c5ff479ce55a853a923a00f69  doc/LICENSING.txt
+sha256  b4b0072bdb6780e2331db4fadba7e423fde25c71b1f0eb04859cc1eba59c2c2c  libatomic_ops-7.6.14.tar.gz
+sha256  636c2bf07975765ab9aff17f7c9b6beb9540378f45b5a1b21691d14ea804f0ff  doc/LICENSING.txt
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index fb1e86f6b..1b34d3b78 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBATOMIC_OPS_VERSION = 7.6.12
+LIBATOMIC_OPS_VERSION = 7.6.14
 LIBATOMIC_OPS_SITE = $(call github,ivmai,libatomic_ops,v$(LIBATOMIC_OPS_VERSION))
 LIBATOMIC_OPS_AUTORECONF = YES
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
