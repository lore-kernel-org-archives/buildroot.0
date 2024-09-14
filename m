Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574CEC021BA
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 20:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F164F406E1;
	Sat, 14 Sep 2024 20:45:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xYfYMASrmkQH; Sat, 14 Sep 2024 20:45:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDFE6406E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDFE6406E2;
	Sat, 14 Sep 2024 20:45:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C8701BF3A4
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB9F8840FE
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 20:45:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DrdEgNssFcqR for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 20:45:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6B3681DFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6B3681DFE
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6B3681DFE
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 20:45:48 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a08ca8d45aso10666545ab.0
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 13:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726346747; x=1726951547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tUS0+q5MGMK45pFu6Ja8eYiM2WpMtJbyKh+pzuZ+YEo=;
 b=nQygB7H94ceWqaEiiyBRnKbJETo7fdAxv3wikw3pEtA/ZJtgQkWsIgYzI6OXf+9OXH
 JqPoJym/tRa50hb66J/Fl0ZC7u1BwGc00xx3M/ep9K56rC1zQ5UoVM05Q1pk3TRZF0fx
 3tjrL81XZqIi2PH6yx/WukMMVE4nVkhsHscLIhgFd9+o8A59yVPyiip+zTHENa72+V+d
 xpYQpINBohXoSf6pc2mYj6ii5XuOiwiQlr0mZM/BfKef+vTXCnv7CgEDOAPKDnsVTvIO
 Ws9679+0jI6SgrsvBnE+NqhETSlhRJiJaxAvasj6Hkb6WwrjWvRpvC6FhrqlPef5EADi
 iOQw==
X-Gm-Message-State: AOJu0YyuzrxpRf7RYNNG4vNdhONS8l+aQI3drcvCrhe7TN0LccMFuUVS
 Ur41H38qKrsDHcTXAww7+NiXl2KjOY61F0cnseXJ7x7C4cyODhlbOTuM7xdw
X-Google-Smtp-Source: AGHT+IGUsZwXiwhLXOs3Hb8TM8EE2IWkUOx4eTvDFKF+2i6QVxUOci7dWu2NAP7GumuL9kxKYLHDjA==
X-Received: by 2002:a92:8747:0:b0:3a0:8d60:8ba4 with SMTP id
 e9e14a558f8ab-3a08d608d1cmr45777605ab.16.1726346747177; 
 Sat, 14 Sep 2024 13:45:47 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e722f0sm6135605ab.53.2024.09.14.13.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 13:45:46 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 14:45:18 -0600
Message-Id: <20240914204518.1127592-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726346747; x=1726951547; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tUS0+q5MGMK45pFu6Ja8eYiM2WpMtJbyKh+pzuZ+YEo=;
 b=W+615HL7vgMo/NUz93HtaXEpeCRXwPobyThttE4AJ6NmFvtHtpbkcDPOZ5Am7igwsk
 NcXRZhUKWDaFMGP1WaJs47cnXvNO2Psv1NU2npsUHqDuaNH9UgxYAe62YNA6LqSnFFDz
 TV2efkbIgzfd2nV86WAaxj34//6ADvYl7hogepK9coIXg9//JJ9Zi7JF0fkHJFIRPz38
 hGu2sKx7bs2au7hRPbhviJMgGkdgVUu55icdZUEMzA1ad4hf4uDtj1Dw8vTZ1vPqasj1
 HEzrnB5H6RTr837OkWA942dsAIOrZ9/kwjsHYbBn5tQ5zng+By5jql/k9oIb4WZpQ6Mh
 6nkQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=W+615HL7
Subject: [Buildroot] [PATCH 1/1] package/libdnet: bump to version 1.18.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libdnet/libdnet.hash | 2 +-
 package/libdnet/libdnet.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libdnet/libdnet.hash b/package/libdnet/libdnet.hash
index 0ffeca603a..4d8198de98 100644
--- a/package/libdnet/libdnet.hash
+++ b/package/libdnet/libdnet.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7df1f0a3db9cf03b48cf50ab273fd6a20c1be99eb9344b9663fe3fd9ed9dab65  libdnet-1.16.4.tar.gz
+sha256  a4a82275c7d83b85b1daac6ebac9461352731922161f1dcdcccd46c318f583c9  libdnet-1.18.0.tar.gz
 sha256  6b46ec86e290066c47b6607d322135b3c473566e7225ac23d35a7c0588a82da6  LICENSE
diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index e678565bdf..8eebd1050d 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDNET_VERSION = 1.16.4
+LIBDNET_VERSION = 1.18.0
 LIBDNET_SITE = $(call github,ofalk,libdnet,libdnet-$(LIBDNET_VERSION))
 LIBDNET_LICENSE = BSD-3-Clause
 LIBDNET_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
