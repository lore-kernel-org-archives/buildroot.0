Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF33DE9E30D
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 14:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1315822C5;
	Wed, 11 Feb 2026 14:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvheTk3tUzFW; Wed, 11 Feb 2026 14:33:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7ABA820B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770820401;
	bh=M3VphqvZGqzbhAwCvhxE2FUDFsvFABnmKNoaLhFHkMM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=XL0S7n0r/RNiKyoEADz/dBrwUAM8MrAkHl5IcerNTcncD5UV7jvKsCzLcuzUCc53K
	 bQxjJZmrPW6vJY46drZ8yuahcto8fpAYCT2FH3eSRo0GUE77W3jzl8ehZQAQWj4XuZ
	 FxCw5BFrLYF7coF++BzqmB9JU8baOeSVWvRKoFa4SE8JWvOEjKJCqTzMGkxxZFqWeW
	 gMeXBjgu1vBvm8tX5n7I9M5P2Y8ecYXgdaxiOuAELI7kIgqY+kYpy7HPR8/yM+HWix
	 NgXcfVVk+PdcKcECcosmXDQI1KPs117xNqrk1zHNKvc8CCpx7et9uUT2DB0d2sKshV
	 W8PV0d2oML6jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7ABA820B8;
	Wed, 11 Feb 2026 14:33:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A41021F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 913E54052F
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:33:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IkVMhcR7hffP for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 14:33:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2DDA2404F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DDA2404F2
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2DDA2404F2
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 14:33:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2669E1814B9; Wed, 11 Feb 2026 15:33:16 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 15:32:34 +0100
Message-ID: <20260211143236.4018275-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1770820396; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=aGPuCbCdAbelPbO3VA5Rzu+fuiaD1VhODNTBRX4R4M0=;
 b=KqQWunZPVPRuyrimyFmbK0CtZ+djMAy6n2Ja3aZrwcKOIrkxRcFrUjOb4TMZjNNxT0oL7n
 r2TV3HjsEpFNI0XzhptF0go/VZm+ZnNEHHcjAQY70aNr6i7bNSH3LQHo+DpZNf5+osXrsP
 lbZ3k55zCGifdSO7SXOAYnkmarJ7NRc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=KqQWunZP
Subject: [Buildroot] [PATCH v2] package/log4cxx: fix ENABLE_ESMTP flag
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit cf686670b99ae0388b27867db64516c09b2de91f introduced a patch that
was later included in a release which made the usage of libesmtp
configurable. Later the switch was moved to the main CMakeLists.mk [0].

while the patch introduced the build flag LOG4CXX_ENABLE_ESMTP the
change to the .mk file used LOG4CXX_ENABLE_LIBESMTP.

So correct this.

Fixes:
CMake Warning:
  Manually-specified variables were not used by the project:
  LOG4CXX_ENABLE_LIBESMTP

[0] https://github.com/apache/logging-log4cxx/blob/rel/v1.3.1/CMakeLists.txt#L93

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

---

V2:
- use correct param name in commit message
- add reference to current CMakeLists.mk
---
 package/log4cxx/log4cxx.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index f4fb3854f3..57f9b1e844 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -23,10 +23,10 @@ LOG4CXX_DEPENDENCIES += boost
 endif
 
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
-LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=ON
+LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ESMTP=ON
 LOG4CXX_DEPENDENCIES += libesmtp
 else
-LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_LIBESMTP=OFF
+LOG4CXX_CONF_OPTS += -DLOG4CXX_ENABLE_ESMTP=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_UNIXODBC),y)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
