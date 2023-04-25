Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A506C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29021614A3;
	Tue, 25 Apr 2023 17:16:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29021614A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVwHVqyB514w; Tue, 25 Apr 2023 17:16:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E1176147F;
	Tue, 25 Apr 2023 17:16:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E1176147F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94BB61BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EAA441175
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EAA441175
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DjrMkTaqbaYh for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9132A40CAA
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9132A40CAA
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:07 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-63b5c4c76aaso4423110b3a.2
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442906; x=1685034906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bX5IttuWel1vJ7Xg+YV1ofHH0JZysQYbNR9Hox3ZS4k=;
 b=Up3FVjdTtjjR0GKnvmFdKXSXWWvfLKmEcoy2IhwZe1mbUpFGdAE0R1F9qZVmtkUMso
 7NsIqMRX5uLcgXr+nOmVhbBQRuwBr9+eiS01fhqYQ9pujiWo6mmT9Zujs3trxhk9IVEl
 gz8HCk6CKsmBHmSPLyTpP6O0e20yaUGzCPyYHIREZ28zms8mjRPRAyCHrMRcZ9HwHpW3
 vVMMvEFDX2jRqlGl21R8hzCayildn8VPoQ2kZTtmUHpKaxI0fAGmXKfOD0qUiauO0IAY
 /sPyWX2vw8331MaI9hX6+DaoOgVcI/GvyHFYxWcAou417tqUUW2yxBlCjMjvmFUqxlMb
 fAgg==
X-Gm-Message-State: AAQBX9come/x1VBuqZojYGunaaKBy1eG1NMKQdLkuL7EfFa99QA4aeCn
 QqzA8vsEKhHgA682ef+mg4jXNfthd5kABw==
X-Google-Smtp-Source: AKy350Zbnq2bZcP97GNfPXiMmnkW5jSB0PP46TGwEVXdpsbC7XNHzoexYW3EfuyXDUoo25qqq+z+tQ==
X-Received: by 2002:a05:6a21:1506:b0:ef:53b6:8fda with SMTP id
 nq6-20020a056a21150600b000ef53b68fdamr19309512pzb.48.1682442906493; 
 Tue, 25 Apr 2023 10:15:06 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.15.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:15:06 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:48 -0700
Message-Id: <20230425171454.48802-8-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442906; x=1685034906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bX5IttuWel1vJ7Xg+YV1ofHH0JZysQYbNR9Hox3ZS4k=;
 b=sHMFbfyhigss0Fo1DtcSGWpDTG3FdXV/GmQcqchh4OU3tqvNlG3n9t66f8nLthQKgI
 7F56yvh2eMq14RtRqn6QZT8lTwgoYFNmW+mr++gaC1vKiI/XPbPumcozymDt1Cd/T6LK
 U+ejnoNZLOFacUdIYNqvOorBk21hHKGaTJAEJXgkPMJGChmAliuH5LepoIGRin2cAA4Y
 sLn1M+hyH7u/tVTi0xpP+hwy8GTimferYU7ckkus6Q43qAdskRUGaPxlGGNJ7UM277t7
 93j1ImMeM+AphEzsqd8X+RI79OF57h4//H4KGiBTjGywahfCc7Rw0w8ZfLvGyfXf0KgS
 GIGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sHMFbfyh
Subject: [Buildroot] [PATCH v2 07/13] package/checkpolicy: bump to version
 3.5
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Change the license file to LICENSE. The hash remains the same.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/checkpolicy/checkpolicy.hash | 4 ++--
 package/checkpolicy/checkpolicy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/checkpolicy/checkpolicy.hash b/package/checkpolicy/checkpolicy.hash
index 3586389047..fcfd81c554 100644
--- a/package/checkpolicy/checkpolicy.hash
+++ b/package/checkpolicy/checkpolicy.hash
@@ -1,5 +1,5 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  25c84edfa3a10ab8cb073b97bc55cb66377532d54a2723da9accdabd05431485  checkpolicy-3.3.tar.gz
+sha256  7aa48ab2222a0b9881111d6d7f70c3014d3d9338827d9e02df105a68c0df5dbc  checkpolicy-3.5.tar.gz
 
 # Hash for license file
-sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/checkpolicy/checkpolicy.mk b/package/checkpolicy/checkpolicy.mk
index baf16fb802..024d306233 100644
--- a/package/checkpolicy/checkpolicy.mk
+++ b/package/checkpolicy/checkpolicy.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-CHECKPOLICY_VERSION = 3.3
+CHECKPOLICY_VERSION = 3.5
 CHECKPOLICY_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(CHECKPOLICY_VERSION)
 CHECKPOLICY_LICENSE = GPL-2.0
-CHECKPOLICY_LICENSE_FILES = COPYING
+CHECKPOLICY_LICENSE_FILES = LICENSE
 
 CHECKPOLICY_DEPENDENCIES = libselinux flex host-flex host-bison
 
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
