Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5FFC369BA
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 16:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4CFB406DF;
	Tue, 15 Apr 2025 16:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhHomXslOsa5; Tue, 15 Apr 2025 16:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1587440939
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1587440939;
	Tue, 15 Apr 2025 16:55:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B638109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 16:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 41C0940471
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 16:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYnAC3VDwxSr for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 16:55:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=163.172.193.142;
 helo=mail0.insia.net; envelope-from=guillaume.chaye@zeetim.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95C2C4026D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95C2C4026D
Received: from mail0.insia.net (mail0.insia.net [163.172.193.142])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95C2C4026D
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 16:55:38 +0000 (UTC)
Received: from smtp.insia.net (unknown [192.168.1.24])
 by mail0.insia.net (Postfix) with ESMTP id EDA2C1FB5C;
 Tue, 15 Apr 2025 18:55:01 +0200 (CEST)
Received: from UDERZO.insia.net (unknown [192.168.1.35])
 by smtp.insia.net (Postfix) with ESMTP id C9ED75F497;
 Tue, 15 Apr 2025 18:56:45 +0200 (CEST)
From: Guillaume Chaye <guillaume.chaye@zeetim.com>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Guillaume Chaye <guillaume.chaye@zeetim.com>
Date: Tue, 15 Apr 2025 12:50:01 -0400
Message-Id: <20250415164958.213674-1-guillaume.chaye@zeetim.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=zeetim.com; s=mail0; t=1744736102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=cteHC6AMAniX7emcKtGkxOQvxAXKUTyQtgrfDBnPRXY=;
 b=poRtGkEG/rp78fvHsG1hk7+NrvKGiVMawxwUaPc47oIo0OZXBHlTMd+rjUxv2EMJBVcVCL
 ETbU30sSvo/xUyAcjoXAPbR0+z0ERpb22h6t0tujqLzESHNvtGqV8Jmgp07u4KuHqruVCx
 v3rqCtdc1rWP4keyEWBCsAlSV8C4dZr0qtuyIgLX1EmxAOm6M1YtjnyOHHjJ079vn59NEw
 BdqGOt/n6vPQxGsBfFQu6tj6UbXCGD6X8C+hwGBGLFKuoGNpIdISE2rLULT8Dg4icszg1g
 jK2wTeeza98mziGX4uWqzfgRSt5CaBFnrDiZUSgZd2PnIThNe51Q4zU4vsivjQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=zeetim.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=zeetim.com header.i=@zeetim.com header.a=rsa-sha256
 header.s=mail0 header.b=poRtGkEG
Subject: [Buildroot] [PATCH 1/1] support/download/dl-wrapper: add basic
 support for smb file download using curl
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

Hi,

This patch introduces a simpler approach to downloading files over the SMB protocol by using `curl` instead of `smbget`.

Please let me know if you prefer this method, or if you'd prefer the other implementation.

Thanks,
Guillaume

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
---
 package/pkg-generic.mk      | 2 +-
 support/download/dl-wrapper | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index f22b6e981a..95ff9135bd 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1260,7 +1260,7 @@ else ifeq ($$($(2)_SITE_METHOD),hg)
 DL_TOOLS_DEPENDENCIES += hg
 else ifeq ($$($(2)_SITE_METHOD),cvs)
 DL_TOOLS_DEPENDENCIES += cvs
-else ifneq ($(filter ftp ftps,$$($(2)_SITE_METHOD)),)
+else ifneq ($(filter ftp ftps smb,$$($(2)_SITE_METHOD)),)
 DL_TOOLS_DEPENDENCIES += curl
 endif # SITE_METHOD
 
diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 5445aad5a7..b70c8edbd9 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -96,7 +96,7 @@ main() {
         backend="${backend_urlencode%|*}"
         case "${backend}" in
             git|svn|cvs|bzr|file|scp|hg|sftp) ;;
-            ftp|ftps) backend="curl" ;;
+            ftp|ftps|smb) backend="curl" ;;
             *) backend="wget" ;;
         esac
         uri=${uri#*+}
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
