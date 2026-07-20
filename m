Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5842EC44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 12:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0707B60667;
	Mon, 20 Jul 2026 12:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id If8suSttGIFB; Mon, 20 Jul 2026 12:18:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A8FF6066B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784549914;
	bh=lWgtE8otu2Ma5MaPsn2S+ydKMf6fFtIWVgh66V3Q7fg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dfLZwt/CIDCQxGRQXOMJAsSj8yqrt2eNirXQfPwR+qTQm6EVOpyqPuPSY70r6av18
	 n3ZBdvf9mMPTp1k1WPsd3rYRReHZrdBHjbntHS/K7QXNeSVHm9Z1P5cVijjqlIJuS/
	 6zSv3PDoa8pV2ClWmry7QIfPYiK0iryTcWuI6V6e8Zn9rsM1u/QAbKOJHyrVCfwf4+
	 yerJcwef1k4E616mT+uGcVNd+dlzj1CeXQ8n65iVEYoxd7VFSC9Cgq/EEgviObU/W/
	 3JZmX9reue8xbOQ3f6Zls1GjsKJEjZJDZWEzRia0UqJtwxUJim+dvSmZjbnSdAPvRE
	 MSO9UzVXdaaaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A8FF6066B;
	Mon, 20 Jul 2026 12:18:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0CF94206
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 12:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E742960692
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 12:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfztNgiy0Xs3 for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 12:18:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E7DE60667
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E7DE60667
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E7DE60667
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 12:18:28 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id lmwzwYp7J5gYjlmx0wEvLO; Mon, 20 Jul 2026 14:18:26 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 20 Jul 2026 14:18:23 +0200
Message-ID: <20260720121823.1512301-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJj7A+0eryzHPmJ2iOyTQLjgFgQWzIOH6fCOG2bE0SkfLd77BGLqR6JbdaYmuj7RL7W6Tm1BPIQ4M4pzDHsttBWZ6YKyKId/tMTwCwb4W6dc4LW7tymn
 ErJYaHhuGSIbTKp1OmHNWMnzvMAvl3fK7v2jT2Lh1kJ7dYWgmieoq5cQqb4+l6/katcJ/BN0kCYvb8/rxyTgwG+4+XdoIVtOUrew22B8SQWOeKTDKi7zkXuZ
 X3hJLa0WNhZIMcZcCN6LOZ9gIMuPxKkoFW82hEntofY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1784549906; bh=YZGkvcgRjNiiTDpMXTPG79+XkIrcxivTbls0ievzqxw=;
 h=From:To:Subject:Date:MIME-Version;
 b=Y+dUwi3+yfXqMRoVA6XWtRe9y4pl4jF9dKl+RWpWsfVo1OFO43878APuesdV2n/QM
 elKmH8iUBF2hdOSD3n1NcuiNVNtGVJwH3GpM41P9JvKAGICLfxQIm8+wVA77uSieGT
 9IkWd3pKsxJoZau5JOZG3kE2jaWPCvg8HqXSruTMniU8SPckdhICANV8AVeLOST1FQ
 KXLgtA1Ex7N/9AbfB7YLEkLck2gV+SySXUaGixRLpHkV4jDA0iyZBjNKSk77+dNeLm
 zKWz0js3Ze9kGrVtDpFG+inty3z0/I0OPEpsGJm/IOjT1N2feHmE+Ii7y8Hbp7ICjU
 YE/urMtA/R0Kg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Y+dUwi3+
Subject: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.5
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

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=037bbdfd330017c368caf6242f977974123239b5

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 3fcdb1a5da..8884b55079 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,5 +1,5 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.4.tar.gz.sha512sum
-sha512  383d0ea8316fea3ce523dc535173a94a22e58bfaec2dec3309d3496a864e5e67711965563db82e7e181f8d7b67a25033107b4c9453c3d6b3820c6586d1f99675  dash-0.5.13.4.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.5.tar.gz.sha512sum
+sha512  ae326c110713a9da6b7afb977ca6fd931793b03011f0a7aa2c42e873f116ed09448deea9ef5ca4515fe3afe24e210e0aaa580f7de89934edda9cf31ee44c94dd  dash-0.5.13.5.tar.gz
 # Locally calculated
-sha256  d10dfd41cda59165560db39ca915c2c4a7636fff04281d8d2df77ad92c753e2b  dash-0.5.13.4.tar.gz
+sha256  40090101a2a491f13e901d3d48e90414f26634628b9bfff35ff540363c227a7d  dash-0.5.13.5.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 2b33433813..c2e168c44d 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13.4
+DASH_VERSION = 0.5.13.5
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
