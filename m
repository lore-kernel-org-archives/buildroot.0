Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15BFC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 20:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C67040992;
	Sun,  9 Oct 2022 20:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C67040992
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8RB8HhbB3PSj; Sun,  9 Oct 2022 20:14:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 785474097E;
	Sun,  9 Oct 2022 20:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 785474097E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B9F31BF359
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 20:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 504C5608A5
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 20:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 504C5608A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqosNc_SCr9S for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 20:14:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D628607AA
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D628607AA
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 20:14:43 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id ay36so5773295wmb.0
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 13:14:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PIdtPMxdQgV2nju+p4JSN+5O0W8SV0vXRJtTUkC92GU=;
 b=P/0BzMZqgSnaexMSYG2EcwlDNYHwe3m2FUR2jmGHtR6JtZCowiKGAz3qIgRqoMvXNN
 SYGyi6DUZqyZm0MEXqNG7EI5vnvzmyRfd1Lw8Zc6IIcJJcpT1nVytdtBwe9lJlZaqhSv
 kkJBH2MoNxdxi+X5t+HuVB4dO3MWXoJoZltF4CtsrmuLONUAHCcgcmuDKPdop0RA9yVB
 GTqNUKBynruicf91YDP9tMouEno5Kezwn4hFmVWg/y83BcqPeh8UFpuwArqT1hW0H5y1
 PlFgGWxdYqueUrtl6JW12JTUQ1PFSuv/vI6uJ+BAe3corCKCrS6IREUgID9s2tz5unI+
 anyg==
X-Gm-Message-State: ACrzQf2l3Bt5qbXjhA2yIygmhNbOEG2B4O8zEBzedY2iFOsph8mnnecv
 0Cef/msx4nuGlP5pn4lRCxQgXrOCmvo=
X-Google-Smtp-Source: AMsMyM4DOb7MrRvD0bBOVCUfD+bWXwUxo+Ez5Pdoc3eOxZ6eWo0yVUqyDjySIgmBRzr9VDV4M8o3ZQ==
X-Received: by 2002:a05:600c:6007:b0:3c1:81b9:9bcb with SMTP id
 az7-20020a05600c600700b003c181b99bcbmr10476111wmb.10.1665346480749; 
 Sun, 09 Oct 2022 13:14:40 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q8-20020adffec8000000b0022afce9ea93sm7195980wrs.40.2022.10.09.13.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 13:14:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 22:14:32 +0200
Message-Id: <20221009201432.16067-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PIdtPMxdQgV2nju+p4JSN+5O0W8SV0vXRJtTUkC92GU=;
 b=G9Cqw+BOzBZ5oRR/nQuBrGByEUTAr5ivGhxzR5Vs5qcPViZDnmX9MatiorzqarZ3VC
 S7Q7FPqdHuSjKrR4ONRBOuqV40ao7rnHxRb5aM5a47BpjPv9FdvCDzbqHLm5Q9TNHpeo
 mDAPTmwP9wlOPVVsXkIjDkohohbSUZ0dN/aHF1yGEQuNH5SNV1psbMocJ8XXmuzt/MNH
 3WGK5rHfPEAl3nCxHQwYaYnY4+3g3qzNgOJZnc1kTHI4ABnBOBIH3xZ5eR7YXqOCIu6P
 8Cj04vm2/zF0cULi/ThrjwR8FQbKABjcttBS8wewbVTHCEXz89HfFg2RcPD0b+XjYgVY
 EBjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G9Cqw+BO
Subject: [Buildroot] [PATCH 1/1] package/libmaxminddb: bump to version 1.7.1
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

https://github.com/maxmind/libmaxminddb/blob/1.7.1/Changes.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmaxminddb/libmaxminddb.hash | 2 +-
 package/libmaxminddb/libmaxminddb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmaxminddb/libmaxminddb.hash b/package/libmaxminddb/libmaxminddb.hash
index cfe838f7e5..7e56351c0f 100644
--- a/package/libmaxminddb/libmaxminddb.hash
+++ b/package/libmaxminddb/libmaxminddb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7620ac187c591ce21bcd7bf352376a3c56a933e684558a1f6bef4bd4f3f98267  libmaxminddb-1.6.0.tar.gz
+sha256  e8414f0dedcecbc1f6c31cb65cd81650952ab0677a4d8c49cab603b3b8fb083e  libmaxminddb-1.7.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libmaxminddb/libmaxminddb.mk b/package/libmaxminddb/libmaxminddb.mk
index 4037f89a15..993b4aec9d 100644
--- a/package/libmaxminddb/libmaxminddb.mk
+++ b/package/libmaxminddb/libmaxminddb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMAXMINDDB_VERSION = 1.6.0
+LIBMAXMINDDB_VERSION = 1.7.1
 LIBMAXMINDDB_SITE = \
 	https://github.com/maxmind/libmaxminddb/releases/download/$(LIBMAXMINDDB_VERSION)
 LIBMAXMINDDB_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
