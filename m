Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B891FC00140
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 01:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECDD360BC3;
	Wed,  3 Aug 2022 01:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECDD360BC3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Jipzx3O6u2c; Wed,  3 Aug 2022 01:52:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B842607F4;
	Wed,  3 Aug 2022 01:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B842607F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EF2231BF3D0
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 01:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA2E0607F4
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 01:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA2E0607F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRBzhTEMF1eT for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 01:52:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E5F6607A1
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E5F6607A1
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 01:52:29 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id q14so12024253iod.3
 for <buildroot@buildroot.org>; Tue, 02 Aug 2022 18:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=U2a6PWPx+uXhPx7RIekrYur/IkS1UP5jrHLAEBlTlbI=;
 b=HB1Eg3o//af1syNyMa0nsm9vQwWm8VdjE10z93mLuDzwQi9sZI1v4Z+uVz+/ZDSyDU
 1DihWiMpZYP61QqvTg1MyAP2FdwqUa5/10y4I01Oby6NZI4yiLS/pS6YbxmarlPZ7P6/
 TdVxQg6f2bG2faMyWXqAo3rA3Wi6jt2xF4fcuxfLbjjjGEcVWffRjOsqW5x6KBYyzJV1
 v5xz9zE4lFTqhSYXXq5K93GlD2VvaHsXczDkYurQ+OFbU+Adp6ZH9X4OxpweIcOtZWtW
 +B5mlrFQ3bIOIXEGixmepnZyuw1fsDeQ/wi9y60AY1zp1P3LvPVAnt94RQ3bRscCEPnx
 kpHg==
X-Gm-Message-State: AJIora+1HNIRfrbY8/ZjiNyP/lWHbS7pUkVv1qk44myof3VKs8IH9wZR
 E/NHBvDZ9JuGV3g7yLb6idLyweUrQxwS6bjF
X-Google-Smtp-Source: AGRyM1smOQrmkInUVtIeHL63l1KErm9swX4YI9qUC0vrxfUcFae5ZhCn0LESiyu7vJe6wpdBk1H3MQ==
X-Received: by 2002:a05:6638:2103:b0:341:4a1b:c551 with SMTP id
 n3-20020a056638210300b003414a1bc551mr9594350jaj.87.1659491548192; 
 Tue, 02 Aug 2022 18:52:28 -0700 (PDT)
Received: from jupiter.lan (24-212-229-25.cable.teksavvy.com. [24.212.229.25])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a02a159000000b003427967df49sm2678494jah.19.2022.08.02.18.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 18:52:27 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  2 Aug 2022 21:51:59 -0400
Message-Id: <20220803015159.1659573-1-kyle@balena.io>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=balena.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=U2a6PWPx+uXhPx7RIekrYur/IkS1UP5jrHLAEBlTlbI=;
 b=VUsGDNlSNGqgKJwmKxVNFUoUb0gE2Fv9Blcx5VcEyYpmdjernvc2926uHGKWTc2xhf
 Culxe2mMa9E5gtUM5IlsiB6VXqLJvueA3LrRFeMHDsMUMbvoWHIeCk9GYjrGQHctZM72
 Y7GDH2NgGKRS6cisZq9vL4taDLMKKrnOplp2tWK3cRNzD+LfbGQlC2/gRsvSrGNAe4k4
 2BhcSYH4DlwhdbTVHPuNuDAX4LfP3GoC5O0zx7Vs88kZvGgDLJb2jt/o/shtZqXvLayE
 gZ3cnht1VWgpBr7qgYY91OSzRSYF9CWAfa8Oip6v61sX8sz5l7CxRtHukFmky7ZMUqF1
 H/SQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=balena.io header.i=@balena.io
 header.a=rsa-sha256 header.s=google header.b=VUsGDNlS
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.16.2
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
From: Kyle Harding via buildroot <buildroot@buildroot.org>
Reply-To: Kyle Harding <kyle@balena.io>
Cc: Kyle Harding <kyle@balena.io>, Stefan Ott <stefan@ott.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Kyle Harding <kyle@balena.io>
---
 package/unbound/unbound.hash | 4 ++--
 package/unbound/unbound.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unbound/unbound.hash b/package/unbound/unbound.hash
index 68087cc28e..8bfe48df9f 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.0.tar.gz.sha256
-sha256  6701534c938eb019626601191edc6d012fc534c09d2418d5b92827db0cbe48a5  unbound-1.16.0.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.2.tar.gz.sha256
+sha256  2e32f283820c24c51ca1dd8afecfdb747c7385a137abe865c99db4b257403581  unbound-1.16.2.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 8863d039bb..a3c3ddc8e3 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.16.0
+UNBOUND_VERSION = 1.16.2
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
-- 
2.37.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
