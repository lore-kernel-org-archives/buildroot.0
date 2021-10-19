Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0FDC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:29:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4D7161354
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 17:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4D7161354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B212A401CB;
	Tue, 19 Oct 2021 17:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zEN8wbSqgTve; Tue, 19 Oct 2021 17:29:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E56E0400DF;
	Tue, 19 Oct 2021 17:29:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 047121BF4D8
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E68F6400DF
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 17:29:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ht2pWroIMeX9 for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 17:29:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAA0B400CB
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 17:29:31 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id o24so5830281wms.0
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IFdYuHxhBz0uspcmbp1ADOJXrTxGwYBVkgbiWW/d4Yc=;
 b=lvWrMpfo//N2jfCoOE6XAlPoI8caQtxWhTMsaSBynQhEjae+n5tfmk9ovk6d6eMnvD
 hz9a2uXE8CX3hIrJ7t0ENQ8C/hhUNmdn3sXPuLnka3WkcaqHX5lMWr+yU7EuzBvDGh/L
 D9dScvklwTHZvPvphU/HNcmwRbv/6c8waIOBHPL5WKgpiHLyvOMsuXSo0Y9zd7s3aQ7u
 LRWj2xyp5sle0SWs410H9QXtOGwOudqVG+gjE8ISt8f/yW5Cb5BxwG71DM0uWYudG7c7
 xZ3mxWBiZ4uW/RGzzCulj+aMJ+0fbspvLwQYaafDHgvkdcVcCALQDvSZZdw2iBZAKem1
 g3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IFdYuHxhBz0uspcmbp1ADOJXrTxGwYBVkgbiWW/d4Yc=;
 b=POoVNkB0ah/6z2TRqc1aLirah9Q5J9QbwbGkHaepR5/Vyxh/OntfRCa9bNnt2lst18
 kabQCuT9UL+OzILOxRnNOzVKWZPfrtN4aKbkiHxiolJfMuvItDoFey8+++77qbPN2+gg
 NLzlBbtmD9+0XXiNdRIHhu5+VTZ7Z2fOVdKOMEX7UibTnPSFfsDQZGbB3Lgaor7CFfWb
 5Ur1lo4JxqpdrsYBAQ1TIQQQqlsiKJKFqmPfvEY/14y7zJUjMhGAQxHt/qJTXR+GyyIi
 EevfJp+MJZrK97gu2HODhJxr9tgVh4ZdJHazYnxpsWB7In+QoPi6IzO5/rzRff7yN0mP
 ZS9w==
X-Gm-Message-State: AOAM533lW95k5EhfGuBWFuiUKeQGxh/tsRbj2BoB8sqbeWo+tWjvZ+nl
 5nC00Rp9gMGq+yQ5AluO6C2DY9Uf+FE=
X-Google-Smtp-Source: ABdhPJxHXazlgTJDdT1ATjZfiaXo0oD+IDQ28vsM/5M67UmNeT3VXxEvX5ulpjIq93hHXmibwJ+qDw==
X-Received: by 2002:a1c:98d7:: with SMTP id a206mr7437621wme.68.1634664569809; 
 Tue, 19 Oct 2021 10:29:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id u14sm11031321wrw.91.2021.10.19.10.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 10:29:29 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Oct 2021 19:28:14 +0200
Message-Id: <20211019172814.3455240-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iperf: bump to version 2.1.4
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/iperf/iperf.hash | 4 ++--
 package/iperf/iperf.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iperf/iperf.hash b/package/iperf/iperf.hash
index bce46c6919..35ed2a10c1 100644
--- a/package/iperf/iperf.hash
+++ b/package/iperf/iperf.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/iperf2/files/
-sha1	0c7625c61087b9e6866421abb8bb533658b40a8d	iperf-2.0.13.tar.gz
+sha1  f1b7835eb74094b1a1849faeafe35b7c362f4ab5  iperf-2.1.4.tar.gz
 
 # Locally computed:
-sha256  c88adec966096a81136dda91b4bd19c27aae06df4d45a7f547a8e50d723778ad  iperf-2.0.13.tar.gz
+sha256  062b392e87b8e227aca74fef0a99b04fe0382d4518957041b508a56885b4d4f9  iperf-2.1.4.tar.gz
 sha256  5f9f5c4feca3347c3b3c0ada8b16b4e6b698aac4e6f016a24adf61a5915336d1  COPYING
diff --git a/package/iperf/iperf.mk b/package/iperf/iperf.mk
index 5df94a1f63..34cbe532fd 100644
--- a/package/iperf/iperf.mk
+++ b/package/iperf/iperf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPERF_VERSION = 2.0.13
+IPERF_VERSION = 2.1.4
 IPERF_SITE = http://downloads.sourceforge.net/project/iperf2
 IPERF_LICENSE = MIT-like
 IPERF_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
