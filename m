Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3717C7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E1A241575;
	Mon, 24 Apr 2023 20:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E1A241575
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2sOOxgjYlCR; Mon, 24 Apr 2023 20:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E356B4151C;
	Mon, 24 Apr 2023 20:26:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E356B4151C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1657F1BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3F2F41755
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3F2F41755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PBeSBAwzyCUs for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14DA54116B
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14DA54116B
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:25 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63b5c4c76aaso3669466b3a.2
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367925; x=1684959925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bX5IttuWel1vJ7Xg+YV1ofHH0JZysQYbNR9Hox3ZS4k=;
 b=LqC5AP0Z71kB4L/mjijxOD6qD2V89jAtg1n/SYjeQ0qSOy6o2TNvvuvPqAATMiEiF3
 IyZkvF1pkjKSjtQfdo0DCEReVHvAfKLe6IlVYBmStf/1JliNVvJQy3O0ws8WZ/toLzRZ
 Qs8auUlQ5Wd3R1jQcCttdnl6UOZF2Dgb3kRyUshg4G78TAdSTgqr/zR1IYGvW+7fvAOP
 680oik1Cp9ZlQaUQxk6FYubaMFhHPIbtuQuTtoexEoCIuMNTD3KJcQ3fj3B2sfpHCNji
 jnyzfRAEQiooimhcJdIbaodCvaIqSCaa18NZt2l5F9uAoo52OqvZE+R+nFsGK2h3ZOJM
 xzKg==
X-Gm-Message-State: AAQBX9df460xt7OWgiAf8M2HoyaiCAinEetNCkVhNM0mF5aKupEqDzAG
 9sw92OUxGnLTMQ/U6/XuKQ8Z+9FH8KII7g==
X-Google-Smtp-Source: AKy350az/r/6JLRcomBmUNJTFOagBszUxzehMEO73k5brMiZaBx4jBqFtUFuL7AOPE9pXatxM0T6XQ==
X-Received: by 2002:a05:6a20:9151:b0:f3:2885:d3b7 with SMTP id
 x17-20020a056a20915100b000f32885d3b7mr9787820pzc.60.1682367924947; 
 Mon, 24 Apr 2023 13:25:24 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:24 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:08 -0700
Message-Id: <20230424202514.1546092-8-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367925; x=1684959925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bX5IttuWel1vJ7Xg+YV1ofHH0JZysQYbNR9Hox3ZS4k=;
 b=Ooq4Me2+X7Rn9kPS7DUeDtqX8n5olzQcBLSrl1UlcXMpE++iXbyWYuvzO3JYauFUvb
 dBx9pMfhUE4kIHnWGW4E0t2BFQY4i8EV8Hg8HvdOdpfx49FhCdqwlDu6v7wEWOB1zZ0i
 NBonrMTkoq6zM58M7fmYCgRZS6dqVBXlKo4FsaaQ5ZmS2xdAeRrPBx+DQAW4izoyO6vf
 S5F0j+s06bYfZDA0VC6eyjXAIK0isc60b21C+I3mZctvUb9HEztKs+jme3ryClxNziDe
 10U1Myoc/3srUxSvI/45D3VuhW8nUdH80wdzBso1kZ3TLcWl5OorQpnHVpOxicJLl1Vl
 4VNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Ooq4Me2+
Subject: [Buildroot] [PATCH 07/13] package/checkpolicy: bump to version 3.5
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
