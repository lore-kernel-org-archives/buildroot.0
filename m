Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E3DE7AD44
	for <buildroot@archiver.kernel.org>; Thu, 25 Dec 2025 12:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2014D80EB3;
	Thu, 25 Dec 2025 12:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rp5JIjh9u31C; Thu, 25 Dec 2025 12:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7498A80E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766666771;
	bh=SSNK1n4J87P+UaLJyoiexhdeoO90H7QTG0UWeiveJAM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hJw0dr9uJG0YOsM4WG3DNOmEFRiJl9Nax5gWJWkYvic+W6d01Izbw23KG0Jf4VrKc
	 r0vA/2keNIVFqyKgrVI7HnR7Zf99dk0cYZT5IaVikdQmYcJ6mNb2SK0tNXCHO8Mjg1
	 z+ah/u/8zCSVZSkOz1v+TfM9kZj911JIvH+tyOuOA24fCsG+1E/XkvVmupn5QQk1/S
	 JzihAjma9c6wE/oTmzTwFZYqN1Ds08qrA91inA1DfktCUm/aPIlX7JPfXDRRKuxqJo
	 Flz3vVSMwXKYOslnhJMgnZhN8VwL9JLXjV9A6svDnUtN3r66RZlN+FaKbO5JljIX0S
	 eo2KVJCSt5nHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7498A80E0F;
	Thu, 25 Dec 2025 12:46:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84D51EC
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 12:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69FCC80E0F
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 12:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0mB3hJOo9Hk for <buildroot@buildroot.org>;
 Thu, 25 Dec 2025 12:46:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC43E80E0A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC43E80E0A
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC43E80E0A
 for <buildroot@buildroot.org>; Thu, 25 Dec 2025 12:46:05 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1972492459; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 25 Dec 2025 12:46:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vYkjB-00000000RqC-0csU;
 Thu, 25 Dec 2025 13:46:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 25 Dec 2025 13:45:58 +0100
Message-ID: <20251225124559.107007-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=nmoIiHpyoj1qgto2WdC4Yfl4IjRrngrB0A0hYN9AXGOebIPZA9+zknrmPLTTvBd9coyzNckZQw5+21uG17beLwrRJUNh+sZ9rukJcGFJDeovCWjb3xGPjUG99IbVsqtQzhkX2PMikdtHGOGnFgYoNcb3LyxvDrNY0KMIWY29+/eXb1wlxLeN7LW0HuzHgEi54nmd0qZuq6gH3octN22HpQzhm53hWpsbQlr0Egn9glrHbG4TJvfXkdY6Mwv6AeZuAOnsX5UUuFc5ZqUbmqhAnJQkcAe2B7ogRwXaOiKny7rqgoxQQM04SN5W5JZby2ZiVDOdjZZJGNRFcJNlu5l/ag==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=0ShDzZHXKqmF45eCObDIcdGZY85SOshbSX5Ne6apBZg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=nmoIiHpy
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/bats-core: bump version to 1.13.0
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

Mainly bugfixes:
https://github.com/bats-core/bats-core/releases/tag/v1.13.0

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bats-core/bats-core.hash | 2 +-
 package/bats-core/bats-core.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bats-core/bats-core.hash b/package/bats-core/bats-core.hash
index 60e52e9214..26f21d3b29 100644
--- a/package/bats-core/bats-core.hash
+++ b/package/bats-core/bats-core.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  e36b020436228262731e3319ed013d84fcd7c4bd97a1b34dee33d170e9ae6bab  bats-core-1.12.0.tar.gz
+sha256  a85e12b8828271a152b338ca8109aa23493b57950987c8e6dff97ba492772ff3  bats-core-1.13.0.tar.gz
 
 # License files
 sha256  55074b2b3b87809105034e1468e59076554d76a80c67bcc592000cc3d929852d  LICENSE.md
diff --git a/package/bats-core/bats-core.mk b/package/bats-core/bats-core.mk
index 53d3b5405b..ad2cfd80fe 100644
--- a/package/bats-core/bats-core.mk
+++ b/package/bats-core/bats-core.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BATS_CORE_VERSION = 1.12.0
+BATS_CORE_VERSION = 1.13.0
 BATS_CORE_SITE = $(call github,bats-core,bats-core,v$(BATS_CORE_VERSION))
 BATS_CORE_LICENSE = MIT
 BATS_CORE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
