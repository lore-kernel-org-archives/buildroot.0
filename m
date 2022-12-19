Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D330C4332F
	for <buildroot@archiver.kernel.org>; Mon, 19 Dec 2022 17:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BDB16405AA;
	Mon, 19 Dec 2022 17:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDB16405AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKzLM1LUzHul; Mon, 19 Dec 2022 17:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50818405A7;
	Mon, 19 Dec 2022 17:39:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50818405A7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C41A51BF293
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 17:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BA5760C15
 for <buildroot@lists.busybox.net>; Mon, 19 Dec 2022 17:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9BA5760C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvEtFGqabK3K for <buildroot@lists.busybox.net>;
 Mon, 19 Dec 2022 17:39:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A32316059C
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A32316059C
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 17:39:40 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h10so9444131wrx.3
 for <buildroot@buildroot.org>; Mon, 19 Dec 2022 09:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UjrTFB4WRR2zWetocFmuE4rEGHM5kscIzrONIfpFyoA=;
 b=7rwUdW7KTekIgtIaziBRF+YJycrQ/xnRLRjycRQ0S7jjXA2CPsO4bBrEPH+V/+pM7n
 0aDuFhnTpMBU8ZRIuD6b8u3A79hfOD8LGTm7AvkKPPPYw1KN+9QleRuw74j8Ld61Z2au
 QbTQY2qiiHedY54VRaskGd7/rSz9u+F4ArgfyfB6bApdzFlHJHEnAKLYz739cHu1Le5g
 Bw9RxgclPIT+lXz1DedvXAKhEVnkkKoNIKH/pvi5p70HPLKsPdVuFpbpywpFMHdlVXEV
 Adsl7yrxguMIHqwJHK1NyaeSAZ+E+bHIDTd0tNz0wmiWktBCeJJ+QqyrG4nGtWXocZm3
 LDBA==
X-Gm-Message-State: AFqh2kpO35HSNFxKLohLFItkLhvQZnA7F99y0/976XMABXqWV4C77y2k
 u10JnS1t/NpEaAcMae7w5otfCXIs7tU=
X-Google-Smtp-Source: AMrXdXtM3eRVES7UylmmZ/y6lsCiSyI2xBl/SrJxAgGwHyeKSuaPP9rfHSf6cdrdA1J/jQdmZw6HGA==
X-Received: by 2002:a5d:6b82:0:b0:254:e300:df10 with SMTP id
 n2-20020a5d6b82000000b00254e300df10mr14860577wrx.0.1671471578433; 
 Mon, 19 Dec 2022 09:39:38 -0800 (PST)
Received: from gleb-linux..
 (cpc76906-dals22-2-0-cust400.20-2.cable.virginm.net. [81.106.81.145])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a5d5607000000b002420fe50322sm10556889wrv.91.2022.12.19.09.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Dec 2022 09:39:37 -0800 (PST)
From: Gleb Mazovetskiy <glex.spb@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Dec 2022 17:39:34 +0000
Message-Id: <20221219173935.3085978-1-glex.spb@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UjrTFB4WRR2zWetocFmuE4rEGHM5kscIzrONIfpFyoA=;
 b=TxTAivmbBKBiZy3ZlsIf7EM2/OF5y2scsSxHJa6zf9vKILbxjuhrV9KNUn2O6Tv/NX
 BWEW3uAoYfgPsP6+dpwFzP7xQjhFL36h6iVXHuyEt6TDHLM6bU/X42Qbqylos3L1Ina4
 +au5DIM+zERBMKnlroZ4SaHSfBahRRaIFS78PAjYfhYlGxOs+yuD95W1asNiG7F7jZ8C
 V6gtzXtDPopBstNH2yVNF/JNIKVe846nqWrA5c+m6NWVWzHWWANtLODo3XwN+8bUpOpf
 +CjdI5pOHI+KgLU8M6yNBYHQ0s5hUFRFo4ACZibF0iv61k48iQ6oIWq14QZBd+by8CCs
 eoKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TxTAivmb
Subject: [Buildroot] [PATCH 1/1] package/libmodplug: update to git version
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
Cc: Gleb Mazovetskiy <glex.spb@gmail.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The libmodplug release has not been updated for over 5 years.
The git version contains many bug fixes, including for OOB
accesses, unaligned reads and writes, etc.

This git repository is the official home of libmodplug (by the original
author), however a new release does not seem likely anytime soon:
there are multiple open issues in the repository asking the author to
tag a release, all without a response.

Update buildroot to the current version of libmodplug from the official
git repository. The build system changed from autotools to cmake since
the last version.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
---
 package/libmodplug/libmodplug.hash | 2 +-
 package/libmodplug/libmodplug.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libmodplug/libmodplug.hash b/package/libmodplug/libmodplug.hash
index e75152e27f..01ff71014c 100644
--- a/package/libmodplug/libmodplug.hash
+++ b/package/libmodplug/libmodplug.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  457ca5a6c179656d66c01505c0d95fafaead4329b9dbaa0f997d00a3508ad9de  libmodplug-0.8.9.0.tar.gz
+sha256  d145910ca10c3ecab0019d45be7e31ea6be1d1ee951ef0e1f747c9752d20f043  libmodplug-d1b97ed.tar.gz
 sha256  49942e7b3b175f549e751feb08b5270ca6f6c5fb7a1be9f9517db275ec32c92e  COPYING
diff --git a/package/libmodplug/libmodplug.mk b/package/libmodplug/libmodplug.mk
index 98c38a3b00..641ad64acb 100644
--- a/package/libmodplug/libmodplug.mk
+++ b/package/libmodplug/libmodplug.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-LIBMODPLUG_VERSION = 0.8.9.0
-LIBMODPLUG_SITE = http://downloads.sourceforge.net/project/modplug-xmms/libmodplug/$(LIBMODPLUG_VERSION)
+LIBMODPLUG_VERSION = d1b97ed
+LIBMODPLUG_SITE = $(call github,Konstanty,libmodplug,$(LIBMODPLUG_VERSION))
 LIBMODPLUG_INSTALL_STAGING = YES
 LIBMODPLUG_LICENSE = Public Domain
 LIBMODPLUG_LICENSE_FILES = COPYING
 LIBMODPLUG_CPE_ID_VENDOR = konstanty_bialkowski
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
