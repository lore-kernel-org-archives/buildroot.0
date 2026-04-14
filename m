Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4B7F9D0CA
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2E6242A3D;
	Tue, 14 Apr 2026 13:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h95Q0uAh7K81; Tue, 14 Apr 2026 13:23:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D9BC42A33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776173027;
	bh=I3VJ9py5xj7gTatzYxJUCt4ilcTLlB12+Pl3WR0IJ50=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=poUNL3HAw1PKBHDmCg4huaLhVDIiYIfPIRc+2W/9kF/dLVk1f1S9IcJqHE0ETHhkA
	 PBjWQxchZI/AUe2Vb/IdoCj/UJGdHLqPh/DHn7GXTpQjasBjcEaPAHDzytbdShGK+p
	 4tqHoDQgDj8SYtT3zxiwie7rcOjO9izVLQipxTPl+tsnMO2TKzFQW3OoLL0HvVbBwI
	 BxboZJHu7WLVuFuVX+OUaL3s1E+OUdv6hdvqepYllw5oRCoLJ/DBP8L60o/hX4rNYk
	 YsZiLfjt5uPu0jlq6Pw6Y1lK+TM8SJ9s24aTfNeMGOOp1WgUdrNRHnD+5gZf/opRzB
	 +70QrfXzKjElQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D9BC42A33;
	Tue, 14 Apr 2026 13:23:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C7BF283
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E666403CC
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_mAkT9EgTTC for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 13:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1F9F40266
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1F9F40266
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1F9F40266
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 13:23:44 +0000 (UTC)
Received: from bubutux.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5D2F72C88C8A;
 Tue, 14 Apr 2026 15:23:42 +0200 (CEST)
To: buildroot@buildroot.org
Cc: David Pierret <david.pierret@smile.fr>
Date: Tue, 14 Apr 2026 15:20:52 +0200
Message-ID: <20260414132055.3263118-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414132055.3263118-1-buildroot@bubu1.eu>
References: <20260414132055.3263118-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776173022; bh=NZW3OjHsBghLCbckt/4FnVC/wOMvCwEE7p3oWd6Y/hs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Wzmnt4qcoemXhTEnoGyQ1MXdJhbjz5eKEEHFRT2j2sj8su84A3dSJXEPiqjb6xzya
 oIlerCn+JqE/l0+jaYBQ1rUJoECKf+cKr4e6M0eFXXVvr0FEpQHlPVliPA1LcQi5dM
 Dv/ewkxYeFoHZrMZiRZvGfUJdKAKdOdhyOUArpCFh0Leib6p6fMzqdpV8nPBXbewMN
 2AEvbNcDwYrciaXFVI8E9p27xuWuOMJ7XV1V/9N/i8Cqxs7GLM/1zmMcoEYSIJMoi/
 csq+oghpU4MoFZXZTShNWc73bdT6I7pvClgV7VvOM1lc/Yq6aQUshNi7ejlxYrEr7g
 zcxIx5H/fk1QA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=Wzmnt4qc
Subject: [Buildroot] [PATCH 2/2] package/bat: bump to 0.26.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/sharkdp/bat/releases/tag/v0.26.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/bat/bat.hash | 2 +-
 package/bat/bat.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bat/bat.hash b/package/bat/bat.hash
index 78bd1de394..16dfd2c5ab 100644
--- a/package/bat/bat.hash
+++ b/package/bat/bat.hash
@@ -1,4 +1,4 @@
 # Locally generated
-sha256  e23db7a34f860d425cf0bb6f13505606024ab81035327262963d8395b4a6f3b5  bat-0.26.0-cargo5.tar.gz
+sha256  688fe9a308dc6024f8d9516b33f6f8e293087023c0a75628ad36c8e04e36a824  bat-0.26.1-cargo5.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  dccda9eb9533f5c65624a1106536c6cfde46008d58e60b3faf154e8b9fd5b46e  LICENSE-MIT
diff --git a/package/bat/bat.mk b/package/bat/bat.mk
index 8084e6c2c3..d72c9395d7 100644
--- a/package/bat/bat.mk
+++ b/package/bat/bat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BAT_VERSION = 0.26.0
+BAT_VERSION = 0.26.1
 BAT_SITE = $(call github,sharkdp,bat,v$(BAT_VERSION))
 BAT_LICENSE = Apache-2.0 or MIT
 BAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
