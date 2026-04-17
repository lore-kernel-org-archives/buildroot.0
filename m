Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B288BF8E4B7
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A8484094C;
	Fri, 17 Apr 2026 08:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lWICYNg62RFY; Fri, 17 Apr 2026 08:06:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74D234094D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776413215;
	bh=WBZI1H/Mc5v8SupT9yKDjgqCQU5lNy0LDHNeQPQ5JpU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pl2Bkb8wsq6IrbX4zGG0Uz0svaWcJFDWJba60x8NrC92lycoWbRJceXsyBdRR+j5x
	 yBJmI3UQQV1kpg3zGOPP2ND+epsjF/qBNPnHqpIpM3i4zYhuyFHzlJbfarX09XmuQ4
	 D94BjBxKekvfcrYoRPSyKG8vLsht1NNzMDDhfN7yIRukP7cDWQhutd1BH0wVwMnOe2
	 bE1bbO7E5o8bywFDIllKKNn4gQkNnxnU0vJByB+AAg2f3tQh5m/ue7vbX32ANMLNdi
	 fOW6Ycy9Qs6JBCXz2ks/tDvVRU7rZ6SNrv7zhcMlhiTqSmODxGKPeoRqS//0NnCI5t
	 OkYNs5gUPG3pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74D234094D;
	Fri, 17 Apr 2026 08:06:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3189E396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 168F360D50
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pCYSunyEiZwE for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:06:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E97160D4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E97160D4D
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E97160D4D
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:06:51 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wDeDw-00HLoO-G1; Fri, 17 Apr 2026 10:06:48 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 5505dcca;
 Fri, 17 Apr 2026 08:06:47 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 17 Apr 2026 11:06:45 +0300
Message-ID: <20260417080647.1404627-1-aperez@igalia.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ze/q+uQf32DMWRBn8CSChuTU39T2DhbLD7hfAliPgls=; b=eULGEcmX7nCqC+TiIResr++Dww
 nc8KpGqA4JjGLYDRITSuMj+2PyxgyrGN+Uc/E11W5BOIbiYkVwTj/GVSpgFYbfSex9RM1iCJel2qA
 LC6JPVvK4vShjEr4g4xwJIJlpsWfYAmG0l7LKP2TbwZCbkgGKmnzt36CfKX6it5RsEvtTjMH6lCMh
 em8cHAO0UuKXXGYC5pZCprh/lVbyXe2XdpEmgi8ZzdQgmp03w9co46m68YDZcxvKx9UPOmfjWR4Q3
 /60yOa0p9J4frMScTrpemqUHITcXOY6mUudPF/kHTsoOt58CpkvlUiz2OYcdKpIRWDO4OcDyZAjrV
 GWMYBlKg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=eULGEcmX
Subject: [Buildroot] [PATCH] package/libavif: bump version to 1.4.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Release notes:

  https://github.com/AOMediaCodec/libavif/releases/tag/v1.4.0
  https://github.com/AOMediaCodec/libavif/releases/tag/v1.4.1

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/libavif/libavif.hash | 2 +-
 package/libavif/libavif.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libavif/libavif.hash b/package/libavif/libavif.hash
index c53e0c9f50..4f9d899d27 100644
--- a/package/libavif/libavif.hash
+++ b/package/libavif/libavif.hash
@@ -1,3 +1,3 @@
-sha256  0a545e953cc049bf5bcf4ee467306a2f113a75110edf59e61248873101cd26c1  libavif-1.3.0.tar.gz
+sha256  d4aea31a4becb3273ba7968221be2e48148ba05eb8a68d14e671963e17785648  libavif-1.4.1.tar.gz
 
 sha256  165abf92cc04b39e80d29cadea7a6a7e8fddf59407d4ad2616507a7ebe8216f9  LICENSE
diff --git a/package/libavif/libavif.mk b/package/libavif/libavif.mk
index 4357566ed1..8bd130fd65 100644
--- a/package/libavif/libavif.mk
+++ b/package/libavif/libavif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBAVIF_VERSION = 1.3.0
+LIBAVIF_VERSION = 1.4.1
 LIBAVIF_SITE = $(call github,AOMediaCodec,libavif,v$(LIBAVIF_VERSION))
 LIBAVIF_LICENSE = BSD-2-Clause, IJG, Apache-2.0
 LIBAVIF_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
