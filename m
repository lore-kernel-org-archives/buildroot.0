Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9FBC4332F
	for <buildroot@archiver.kernel.org>; Thu, 13 Oct 2022 16:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4418683F3D;
	Thu, 13 Oct 2022 16:43:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4418683F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJ1XVloT28Xr; Thu, 13 Oct 2022 16:43:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5967D83F3A;
	Thu, 13 Oct 2022 16:43:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5967D83F3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A43C1BF28B
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 16:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 026B983F3A
 for <buildroot@lists.busybox.net>; Thu, 13 Oct 2022 16:43:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 026B983F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQXkBFquVU5k for <buildroot@lists.busybox.net>;
 Thu, 13 Oct 2022 16:43:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A806783F34
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A806783F34
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 16:43:08 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id s3so1807845qtn.12
 for <buildroot@buildroot.org>; Thu, 13 Oct 2022 09:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TxbzTEAM2MhM2tddROz5HzXcTagYvnw/nG6sSXa8rMY=;
 b=54KPp6w9AsXT1LLqGztz606Yyod8WNfl8p9MsSTXxFFSO7599QtrL7+hL/2nGEGcbH
 enup6CYN04qz4OjS5ovyUpwSBQ6c9vYupi/5rpz22z1GXiSs+lWm5kPu6B++zS0ER7so
 z5s1cv7iblR+gfHDiN0WrqvnCRlErBvTe2JrCFSSBAf5ErWLjj/Ow6tirsomx4mFSfh5
 6DBHthKsPFwngRFozRShBgOS5xh2721xqAOUX8EZsxRzXsdqzxjjTPT0pPce157pqG2Z
 pgpJPe3zsVock8aiTRg7cRv8K8baoY40vnzppBKRv0/o/wwl2OF+cX8DRyimXW2eqSJP
 N+hQ==
X-Gm-Message-State: ACrzQf1B28J9n6WwKdHet87oU2Ihq9PhVxpq2lup9tm81Xu8yUb06je3
 66bxlSytv/ZgfDjEyxxeT1ttpHu+VQt5zu0gWAM=
X-Google-Smtp-Source: AMsMyM6KfKstZm/uAmlTb0pwg1e+MnSLgqfZNYcD7yHuA3fqniN0GmR9xBLZNyJ+OyM9F9e6XROYUg==
X-Received: by 2002:a05:620a:2591:b0:6c9:cc85:87e3 with SMTP id
 x17-20020a05620a259100b006c9cc8587e3mr588536qko.577.1665679387193; 
 Thu, 13 Oct 2022 09:43:07 -0700 (PDT)
Received: from neptune.lan (24-212-229-25.cable.teksavvy.com. [24.212.229.25])
 by smtp.gmail.com with ESMTPSA id
 v6-20020ac87286000000b0038b684a1642sm279025qto.32.2022.10.13.09.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Oct 2022 09:43:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 13 Oct 2022 12:42:44 -0400
Message-Id: <20221013164244.150039-1-kyle@balena.io>
X-Mailer: git-send-email 2.36.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=balena.io; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TxbzTEAM2MhM2tddROz5HzXcTagYvnw/nG6sSXa8rMY=;
 b=ZM/5UiQgE4zQagFYUcIMjUM4g5SbBsHWtpK0/S7Ebdmj4MtQnN9hY1tidKtbEktwit
 /1KhBj6qaJ0ioMzYyXRR8YVW+Pm7F4HIYkRCGcAjYh1YL0ksulh4xwdKq1iIrNCsoIP0
 Cfk+hwyTCcIJ48V5hYXA4r5SVHJGf+sTpyd/jD8Mz5X2NZCMElwDWOTzD1SPw8YyzAqQ
 0HcSTztxVquQ0JA4R/VWf0ggyfLJ8ub4hR4bQDR7YlD7/OjomENzNnUTF4DvO8LbunCq
 cwKC1m63u1xUgHsj/OnpWFdYFiWeKpMWnGLoUVP0Dhgn5zSuC1M4qvcssK/DynVPLdZM
 nILg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=balena.io header.i=@balena.io
 header.a=rsa-sha256 header.s=google header.b=ZM/5UiQg
Subject: [Buildroot] [PATCH 1/1] package/unbound: bump version to 1.17.0
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
index cef8edc4a2..147ac7b13a 100644
--- a/package/unbound/unbound.hash
+++ b/package/unbound/unbound.hash
@@ -1,5 +1,5 @@
-# From https://nlnetlabs.nl/downloads/unbound/unbound-1.16.3.tar.gz.sha256
-sha256  ea0c6665e2c3325b769eac1dfccd60fe1828d5fcf662650039eccb3f67edb28e  unbound-1.16.3.tar.gz
+# From https://nlnetlabs.nl/downloads/unbound/unbound-1.17.0.tar.gz.sha256
+sha256  dcbc95d7891d9f910c66e4edc9f1f2fde4dea2eec18e3af9f75aed44a02f1341  unbound-1.17.0.tar.gz
 
 # Locally calculated
 sha256  8eb9a16cbfb8703090bbfa3a2028fd46bb351509a2f90dc1001e51fbe6fd45db  LICENSE
diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 73a460d103..d86d9c2067 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNBOUND_VERSION = 1.16.3
+UNBOUND_VERSION = 1.17.0
 UNBOUND_SITE = https://www.unbound.net/downloads
 UNBOUND_DEPENDENCIES = host-pkgconf expat libevent openssl
 UNBOUND_LICENSE = BSD-3-Clause
-- 
2.36.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
