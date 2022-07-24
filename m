Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BF9C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 06:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2EF383ED2;
	Sun, 24 Jul 2022 06:33:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2EF383ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2O6G4H4kjPqB; Sun, 24 Jul 2022 06:33:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9E8783E6F;
	Sun, 24 Jul 2022 06:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9E8783E6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 48C331BF588
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 06:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2444683E5D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 06:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2444683E5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EhieTCvfhFgf for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 06:33:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41B9183E6F
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41B9183E6F
 for <buildroot@busybox.net>; Sun, 24 Jul 2022 06:33:09 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id k11so11282011wrx.5
 for <buildroot@busybox.net>; Sat, 23 Jul 2022 23:33:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPI87t/7tZ0oS5FpXXNtr2i3bL/yaQGNkW7wTUej/ME=;
 b=BJBtW2bvqSTB1RHD+LY0JbZ9U9+nljEL6TTviU2sdYt+Tm5rNkhVUNAt81Ho7kphUc
 fasN6oFpFgyVgyLmqEhtDhTgv0mZVKhfuyRKdQrUQEquh/sgCKYNdIeddjz2UZxIGxVb
 YKkp0ratSx5C4bOYZs9AGvK+7BkA7fvgD6+cJdHQnau6LieKDRirk0FEmuAoVkZ+K68X
 EbaSJXB6f6vydoG6udzMlVy0M/PyGYEKuSvpfu0dpt58e06PC+PAF9qx/uAmu+NippKy
 RcZkfke9ETRVC16P7FMFJjC8Qaks4IvgKhWe8T2GKITZyks6/xJvdhaT3CzBYRPozod3
 kRqg==
X-Gm-Message-State: AJIora/YLM0KXcVZ9WONxGOz9nq6N8QohG/mjEbMPRbXN0j5eghoFsyN
 sg2Tjqltfr4ZKNs18S7OL8QE3r9b4eQ=
X-Google-Smtp-Source: AGRyM1vyVx9z5cHkQpcSTbukd6eRXBxgZ73qIDm28aMRAMYBD0fqVCIRwzAr2DMSBzuiKQlWMcO2Kg==
X-Received: by 2002:adf:cd05:0:b0:21d:df26:8db with SMTP id
 w5-20020adfcd05000000b0021ddf2608dbmr4304270wrm.220.1658644387119; 
 Sat, 23 Jul 2022 23:33:07 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 i8-20020adfdec8000000b0021e860f1bd4sm729574wrn.100.2022.07.23.23.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jul 2022 23:33:06 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 24 Jul 2022 08:33:03 +0200
Message-Id: <20220724063303.3305416-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPI87t/7tZ0oS5FpXXNtr2i3bL/yaQGNkW7wTUej/ME=;
 b=UpeWK9IItN6XqSfUvp4b8GANARJ+Xsf9yH7qi2Y5H9ye8Fo6jZrNw39aPNoYJ0sDdt
 b2LCWK3/3Qh389RAx3FMOgNPxz30kUy2rwYvgmYSGWiu5W9N/j2pwLJrW/agMlcCVCDH
 USsFVPTlgU1yBO4jjwt6IHJzgS4CghDiiEYy70XwkrMep8VpMtVGxjmDzbT0wqrYvfcO
 vOuW6YBvJAUu5ROipTn0Fh1zG4NaKHOh+0VmK9CQwg0VbmPkvemMhdsOfXiCx2k03pdK
 hZoIr1SPOOXpH9Mvz8gHVm1OcU/1N3Q+69XLClGgS8Jsq4Q29IjSTsqejwU+qk84r0fp
 BftA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UpeWK9II
Subject: [Buildroot] [PATCH] package/luajit: bump to
 5677985dc1f19cf0a67112f4365c7fb79237fa16
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
 package/luajit/luajit.hash | 2 +-
 package/luajit/luajit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luajit/luajit.hash b/package/luajit/luajit.hash
index cfc00e852..648d6eb18 100644
--- a/package/luajit/luajit.hash
+++ b/package/luajit/luajit.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e3f9c04e82d5c776335dfb4e53ec1532914ab010b60bffbb0176a8390f100666  luajit-f2b37f51f69ba7e9f8defd05e5aca648121f0fe6.tar.gz
+sha256  e0389c7669f8e455383d8f0c9d9354d44cdd1885bbf8fd0d4bcdb8fc6f794063  luajit-5677985dc1f19cf0a67112f4365c7fb79237fa16.tar.gz
 
 # Locally calculated
 sha256  52fc5b15ac968ed81aabb4c1e23ab3bce50f57a5764e9cdca86b463a11072921  COPYRIGHT
diff --git a/package/luajit/luajit.mk b/package/luajit/luajit.mk
index 6155cbba8..2c1e3216e 100644
--- a/package/luajit/luajit.mk
+++ b/package/luajit/luajit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAJIT_VERSION = f2b37f51f69ba7e9f8defd05e5aca648121f0fe6
+LUAJIT_VERSION = 5677985dc1f19cf0a67112f4365c7fb79237fa16
 LUAJIT_SITE = $(call github,LuaJIT,LuaJIT,$(LUAJIT_VERSION))
 LUAJIT_LICENSE = MIT
 LUAJIT_LICENSE_FILES = COPYRIGHT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
