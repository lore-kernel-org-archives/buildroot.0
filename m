Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6EFD59F67
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 21:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A9EA407C6;
	Wed,  6 Nov 2024 21:19:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2y-ILMcsEja6; Wed,  6 Nov 2024 21:19:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FEC840945
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FEC840945;
	Wed,  6 Nov 2024 21:19:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 767123B
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 601EC407C6
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kQN5Wje-xVTz for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 21:19:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6560A40956
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6560A40956
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6560A40956
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 21:19:42 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 8nRDtJWxUgIuB8nREtksUp; Wed, 06 Nov 2024 22:19:40 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  6 Nov 2024 22:19:39 +0100
Message-Id: <20241106211939.826163-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOkmspUyvzihwmZ9cy0Q+hJJSwCQeFzGed42HYPDarE82fDQCFOlLGZRcsnCAiU5yCMG9E4A+P8fv8yptsUgc7XkTVuzJw56ThutPWw67512etJfjZCt
 Osd/mjwXZtpRCto6R2YIQMnSMqDAnJmlaBFboMcPX21bNjxCBgxoXdlG7itbqcdVb44fo3jLAUXVbmLmFdtNC3uNNADoz3c2zOHCOsIfl7+23gbpi9QAuYvQ
 IWROLCfFUkt7yibZs0QP3tWyyaZoQBC/Jbk5KjLPKqQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1730927980; bh=CT5Fuux9tSkd/hbNRfsibqB1RR8UMJruOEvx9A3mTEA=;
 h=From:To:Subject:Date:MIME-Version;
 b=K+327QEFMdCUWKalxNk4bkH+lkIqabd8hhOveAUzMYLeBr/RR4qfXODd5aQgU4kUT
 J7o/r1N+BpoX74bbo8d1lgym3VRHqsFtLKrkyQB28JVl1AZbEWt/00Us6BtcSFTQ8q
 hFaUWYjjj85sfDpNBvmfcSHGTfLFt67pdWAbTGHUY7g8F8PAJxzH/6rTm6wSKLSeR4
 duPdvZRJilSpuImezQG+olQwhulcXjTmW7xmc1eyC+6znRKCGdFeQ59Rl6r+jO+q2i
 RsHXWMCCf/D79hQ4fhCDUKxKK4zG6UWGVPz1nEXfamfqsQsuwhWBYWup6sA95GNkQm
 nKUqls5iwCHPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=K+327QEF
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 10.1.0
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

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 562727d3df..ebc26ac5bf 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b2cb13bd351904cb9038f907dc0dee0ae07127061242fe3556b2795c4e9748fc  harfbuzz-10.0.1.tar.xz
+sha256  6ce3520f2d089a33cef0fc48321334b8e0b72141f6a763719aaaecd2779ecb82  harfbuzz-10.1.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 510c0a946c..2a89c48225 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 10.0.1
+HARFBUZZ_VERSION = 10.1.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
