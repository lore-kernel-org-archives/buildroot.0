Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11135C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 16:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D7CD60AF4;
	Sun,  9 Oct 2022 16:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D7CD60AF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJpfyfrZ2TlH; Sun,  9 Oct 2022 16:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7127460B2A;
	Sun,  9 Oct 2022 16:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7127460B2A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 356A21BF239
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1157060615
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1157060615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OrGtkjQV0eai for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 15:59:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0179F605EC
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0179F605EC
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 15:59:48 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a12so10828112ljr.7
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 08:59:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AqDKktep2hpMPQ9sOzG7PDAVg6GxpzEQ9qDNMXyQNpY=;
 b=g4lgpMHca784VcIY8BK+VCNcbz8xEndDjN8k2K7pbKX9bJo7LLkXLBdEagbYDgEHSf
 o6IPnscQO76466gQ4X9GFtqDFL/DEIjZKwxttyNTOA4Y75M977lggzESWtD1HitDJqt4
 GHLB2a01EQpfAnJoTk8JTBhBFG27Zv7hbjCvpg6KRCgF4KOgYc8LyTYkE0cER0VfI3GN
 Aq0p0UFV7SpAlXgjCDE7eSk/32I3HepKIcU5r99GMikH0jR2kUQKQPHPjYR+rcyOfKEN
 Rx+edOW9W+kpn+FvK5WUpe+Bnpul2GfP3lsqt0WODPm59z4yAqui+eszrWGJnWcrldgX
 QNzA==
X-Gm-Message-State: ACrzQf0pknfkthuKaWJhj9f/JXcZCPBApzbPvkaP2+0B7OajNH2ToJIL
 eU/RViNi5TGVb2rcH3vPavXaqHbrbJQ=
X-Google-Smtp-Source: AMsMyM7LKVrBKcj3Pcf+u41YG5IMtN+Dc+DM/lrxm4DyfeqrfIlC3FfpT852inqV05xJGPvqiRkHAQ==
X-Received: by 2002:a2e:bd8b:0:b0:26d:e6a1:9a41 with SMTP id
 o11-20020a2ebd8b000000b0026de6a19a41mr5182552ljq.204.1665331186640; 
 Sun, 09 Oct 2022 08:59:46 -0700 (PDT)
Received: from luthien.lan ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b004947a12232bsm1057918lfg.275.2022.10.09.08.59.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 08:59:46 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:59:30 +0200
Message-Id: <20221009155938.2041695-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009155938.2041695-1-troglobit@gmail.com>
References: <20221009155938.2041695-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AqDKktep2hpMPQ9sOzG7PDAVg6GxpzEQ9qDNMXyQNpY=;
 b=fxi9Iwg1YQUBPvjeqZrLKvqWEKhs2qhpLUC0PUHnMPxGGER8RIPPHiklCw4+b4b/pi
 HKcU2XW/MqFO4vqdX8gmnAWrP6kGt6YxBJNxxwUa71Q4ye9Imw7dlUj76Lyb/CjlC1kL
 2YRJpgh24gW6m2Ohq574hx35DKWbUqI+MVEn/xOMDcnuNEJxEEIOGbJJihUPvzhiFZQQ
 VgLC19CubZHlhFFOtttD3uu4pbXvyCz/MKBOjJFsG38LRlbEFyiyVEh6NI7JNATwyiVz
 aSz6v/wUH/4v0y+6RtzbPlEyx+3p1sD4YIoDvsT0fwS3Rw3PccRhhxZOcOjMOzT1fsPX
 LF4g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fxi9Iwg1
Subject: [Buildroot] [PATCH 2/9] package/mdevd: bump to v0.1.6.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Summary of changes:

 - skalibs dependency bumped to 2.12.0.1.
 - execline optional dependency bumped to 2.9.0.1.
 - New -O nlgroups option to mdevd, rebroadcasting uevents to the netlink
   after handling them.
 - The * and & action directives are now triggered by all action types.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mdevd/mdevd.hash | 4 ++--
 package/mdevd/mdevd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index 93950304be..dea2f14978 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  ffd3b223b4cf0e51253b4a8f09cb88d70bf22693228ab0818af174a3f099dcd2  mdevd-0.1.4.0.tar.gz
-sha256  31b60c66aba1fa0a7f8847339ac35c28638e25ff96da700d995533ad810e3995  COPYING
+sha256  33cf2b118634538fd24f302b30f52cc8aa28ea68b414916ce482b54a4ee57283  mdevd-0.1.6.0.tar.gz
+sha256  7fe938b5e0fec18848955ca8081c532e24ae77310beb730b301e1f77bad3d390  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index a0cd71e76e..9997cb5275 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDEVD_VERSION = 0.1.4.0
+MDEVD_VERSION = 0.1.6.0
 MDEVD_SITE = http://skarnet.org/software/mdevd
 MDEVD_LICENSE = ISC
 MDEVD_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
