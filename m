Return-Path: <SRS0=j1wI=N3=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96E3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 08:41:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B83060F90
	for <buildroot@archiver.kernel.org>; Sun,  5 Sep 2021 08:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B83060F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE91480F4B;
	Sun,  5 Sep 2021 08:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JvKjx8mJkMW4; Sun,  5 Sep 2021 08:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F19680F48;
	Sun,  5 Sep 2021 08:41:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38F801BF59B
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 08:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27FA560712
 for <buildroot@lists.busybox.net>; Sun,  5 Sep 2021 08:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPpH2dCRqToA for <buildroot@lists.busybox.net>;
 Sun,  5 Sep 2021 08:40:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 330BD605B5
 for <buildroot@buildroot.org>; Sun,  5 Sep 2021 08:40:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso2545251wmr.1
 for <buildroot@buildroot.org>; Sun, 05 Sep 2021 01:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IC3yBffKfOs3kNBAYsK+jSqIUwZuGHMloA5xDZPJnzs=;
 b=BS0lIcAxc6EQ1reyPafCLLLVy+IPsjbnHTHWfToHtqGUItSIPLFemoQ0Ho8JA976iV
 QIcx3ZrH5M8+p0n8F2+Zy82OXDMBdhgIOo6EZuCC4W1MUedAmxhv6JKHk92SXoLVrQtH
 bc2dFvX6Qnnrpm0UEgNIdiUad9IGbvukVyiiSNYbYPdVUzkYRDdb/MhcW+oEwNYB/0U6
 4+jvKjieQ5idLRtyIWXeNWvxgrIK/vBqcTCYlMb9dX5DJaxkEgzFsvKHOTI5kb++rfVn
 N4Mr80hYGdOwtkCWbZ1nbEKnPumgYnS6z4tJAGDEPZWPApE3/KrfetyNhpKPcJbZDk0i
 5ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IC3yBffKfOs3kNBAYsK+jSqIUwZuGHMloA5xDZPJnzs=;
 b=p85/H/bGYSAj2a/KOGSIavt8j401/Bb5C/PbvoyUGhEFTXvHxLl7vD67I8+U7lwznQ
 lQ7NIp1RK5mVkfqD/3R6SKfLx36zjROPuqOy8SGG16ApyHAN8ZG+vgZ6Y0H/pPUQLuJE
 zQkBKdIfGtUQ6MgLNdO+cx9spAPSnX0bxJmHXfsZy8d2YN5caSnFaMRr1DfzwDlMyVZY
 XIpthmWP4/F0f/A7TjpmuHI3X3S2MwjIenmElg0OuXBR7b4PwFpo0ty9zpA8gWVUO5UT
 e5VTG7BjIFfa4MPcRa45eCGFBwjLJrgqErGBrbt/tBLd0XkpbGgwJlFSRBYSTAF+F1am
 J/4g==
X-Gm-Message-State: AOAM531T7o75BvyThfYFVIlJmnmXLwGjt//LdriyqETHqIIqhsOqq7vZ
 gNqlLfNL9gae/PJJqmluuRdXMWrIkL+ZXQ==
X-Google-Smtp-Source: ABdhPJw0+hoyWeWmzd+L1BoCBNyxbK9x1+lfRLM18UeIA5/JTNod7KcslztnxPc1LnyJ7OLipbl3Vw==
X-Received: by 2002:a1c:2289:: with SMTP id i131mr6180053wmi.113.1630831256214; 
 Sun, 05 Sep 2021 01:40:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id q13sm4356357wrv.79.2021.09.05.01.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 01:40:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 10:40:45 +0200
Message-Id: <20210905084045.557846-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: needs gcc >= 4.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

osm2pgsql needs C++14 since bump to version 1.5.1 in commit
a71661ffb216c7423dcd02ec9e8d703252dbcbad and
https://github.com/openstreetmap/osm2pgsql/commit/d35dd358d6e4a88a792be60c85bf55d2360c1a71
to avoid the following build failure:

/home/buildroot/autobuild/instance-1/output-1/build/osm2pgsql-1.5.1/src/db-copy.cpp: In member function 'void db_copy_thread_t::sync_and_wait()':
/home/buildroot/autobuild/instance-1/output-1/build/osm2pgsql-1.5.1/src/db-copy.cpp:108:16: error: 'make_unique' is not a member of 'std'
     add_buffer(std::make_unique<db_cmd_sync_t>(std::move(barrier)));
                ^

Fixes:
 - http://autobuild.buildroot.org/results/30ae4b9405454919437098d29abbd743638c9423

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/osm2pgsql/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index d31191b3a7..315f496d8e 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OSM2PGSQL
 	bool "osm2pgsql"
 	depends on BR2_INSTALL_LIBSTDCPP # boost, fmt, libosmium, protozero
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, libosmium, protozero
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_USE_WCHAR # boost, fmt, libosmium
@@ -23,10 +23,10 @@ config BR2_PACKAGE_OSM2PGSQL
 
 	  https://osm2pgsql.org
 
-comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
+comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_TOOLCHAIN_HAS_THREADS
 
 comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
