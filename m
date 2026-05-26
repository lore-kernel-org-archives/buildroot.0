Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B03CD5BD0
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 11:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35B9D606F5;
	Tue, 26 May 2026 11:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zEXDiAaKk50Z; Tue, 26 May 2026 11:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FDE660EBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779794884;
	bh=IT+5TftzpEtKMV1M2q7cpHEEkYSpuV/Y7AdHeATyrdo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XOljRKh5AG9JSR+9k16RmFLj3YcXdba3UDqEOZDvakA9WJLCFZZZbPaWzR/6mFmoT
	 tHTCNvFtvhqeFHojAvf6MrMTvg75u8ytfzMsR0BAwhYlx04aLlqiiiNVBQFPxzaG25
	 xACUBnPVx6htDxRAiEULE/5Tki8Wau+cfjoWbuAkVWaAZP1ofnrAKSNEL5lBag/zBd
	 ohMDkTM1FnqbObZu+wOtx536PJRsYyMs3thCeJIVojzN4R3XXCosB6p7wJuZox21p0
	 LN/u5eehE69yTLQIe1+oOgB9MctfLjD+WDp+PdLLN3b8g5jT42hvdaHnbAWW3MDpjF
	 hqtCpYYzAjvvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FDE660EBB;
	Tue, 26 May 2026 11:28:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39822297
 for <buildroot@buildroot.org>; Tue, 26 May 2026 11:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ABDA60EBB
 for <buildroot@buildroot.org>; Tue, 26 May 2026 11:28:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S28RDx22yBKV for <buildroot@buildroot.org>;
 Tue, 26 May 2026 11:28:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 172C7606F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 172C7606F5
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 172C7606F5
 for <buildroot@buildroot.org>; Tue, 26 May 2026 11:28:01 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-45ea19f412aso3002990f8f.3
 for <buildroot@buildroot.org>; Tue, 26 May 2026 04:28:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779794880; x=1780399680;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d1L4qGfzVkIEEYSvqqvUCYGIGh1RjOG00dFJP6uNNr8=;
 b=dkK2dMwVT1jRyzVgCFOf6NkgqhE0oUkvbSsrEO1EQ9LOUyJVPyMZweipMd0dHc7io0
 H08dlrjAamcFrQ1GWBxvciZoQKECk0Bb2tbb9p9bpHt7ph7oUaF/8WGKhN5td+0GOcr6
 xFv6UsCB4gF9xt9lQggBMPExQ5mGwz32UAsF2iOaMqwRd0SglH3RbLqWLDuUJN9KEULP
 XU5Do7+6YmuI4b5oKfdbLSQ5/tjvpiIrmfp4MkBt79wBUXCZCxRFEf1aOyoStkRI3kbk
 DDS9sJ6ymbz4Jv5ujP75HUCtrCc+VFylngQz00d9iIJ+K9UR58GgRV84+LMzvqJpyld5
 zx1A==
X-Gm-Message-State: AOJu0YxGwuOCj55F/3JDlCEbr+MKmdXrnZekpKpdJBog2K/cCCWJswpp
 7iyivcSKTgoix7tWcovl9iD/wRFMRePZGvLrAMcrPBXfR0EypxRQcSARW1Xg
X-Gm-Gg: Acq92OFgnoG7rFYojXrTT4h4UfPTFI1CQgumVn5WpcV/G0J4sP+m5no0aiSWLvJnL8R
 BnanYatZJcobm/8dMJjOKdtgLchNKxncZD0jPCQmHP3txVfNd/g2stZ9qjYGei3CrU0dHJpKc+y
 ciNzsbsksSOmQleMxEGD/5RVhklGSa184pPY5QuI0Z4nP3XuJvQCuUd8XULdU08kC3bTLtYatBB
 kuYjrCkwg24gSQ0kN8/gN2glKNwFMpDIwfhj6a0mnOeTwtzPtTIsG1y/mPRH8xQqGHpMwx3vAfv
 9cO55HaajUN0nuieHeAcD4P2nYLjhiNExMt1WJvbs/6XBCMTGvwgNjzdYOJLwingGqOG2yGwCjE
 0X7zQs6jx749ALKZn542rk2xRNTM/d0Zg54LFpcM9gMycqXkQFrJObRK8V99Xhyi5Cv1cX0qBnw
 I336+/tyBDMqT6pxnjJF47C2haPovNgkn3ZWDzO4lxz0uD0Rjb
X-Received: by 2002:a05:6000:1a87:b0:43f:dd91:b022 with SMTP id
 ffacd0b85a97d-45eb38d7d0emr31183674f8f.35.1779794879769; 
 Tue, 26 May 2026 04:27:59 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45eb6d4903bsm32269437f8f.21.2026.05.26.04.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 04:27:59 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Tue, 26 May 2026 13:27:37 +0200
Message-ID: <20260526112755.317745-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779794880; x=1780399680; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d1L4qGfzVkIEEYSvqqvUCYGIGh1RjOG00dFJP6uNNr8=;
 b=mc5nKT/34aOu1g/Y76UXWUtmFhDX+R1+WI91ZV1M7Ps0hSOlYvXwOBG6r7b09No00o
 tBrez1wCCvCVtfTd43zw1gGnH7tjxN+mT9KyLntHTbbrPRKzoShHMJrBym2H81aUBWX1
 efsg6fJ3E+HXApoyTOQPf8Aa1ZmdyaZZOp9x+HZBCbWaLrYujeYY64oGrlSVkjxrkwYE
 ic2/DuOT82OSfTpa/XPSHhWYJbNcCQe3I7C/5kPMUKvt1B70EHrAmZe4yCK06R2BgSsX
 iWOVy7qGpF7vmFNrvZtX4XcLl0vb5KJ4T/T+RDQ8MWaHLgQBZ7ai3hQOeZsZL8ho3Uhi
 /lqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mc5nKT/3
Subject: [Buildroot] [PATCH 1/1] package/broot: bump to version 1.56.4
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

Changelog: https://github.com/Canop/broot/blob/v1.56.4/CHANGELOG.md

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 package/broot/broot.hash | 2 +-
 package/broot/broot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/broot/broot.hash b/package/broot/broot.hash
index 56168b5a38..b311fb3404 100644
--- a/package/broot/broot.hash
+++ b/package/broot/broot.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  dde0da41fe9ee0f03c7f2895134360a4d2e003ed1ebc726c7394009dd9ad0f07  broot-1.56.2-cargo5.tar.gz
+sha256  ba989fcdc8a939e64c880208f6b491f6202f48b5d003a69f033469af91c37af1  broot-1.56.4-cargo5.tar.gz
 sha256  89461664ce2aee7d80ea8fba7118fe7abd490d76ba435cf1d81d3128e060711f  LICENSE
diff --git a/package/broot/broot.mk b/package/broot/broot.mk
index dfd9629d12..4f21205bf3 100644
--- a/package/broot/broot.mk
+++ b/package/broot/broot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROOT_VERSION = 1.56.2
+BROOT_VERSION = 1.56.4
 BROOT_SITE = $(call github,Canop,broot,v$(BROOT_VERSION))
 BROOT_LICENSE = MIT
 BROOT_LICENSE_FILES = LICENSE
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
