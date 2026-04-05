Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF61E64018
	for <buildroot@archiver.kernel.org>; Sun,  5 Apr 2026 10:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2529E8120F;
	Sun,  5 Apr 2026 10:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88bzAkYL2nso; Sun,  5 Apr 2026 10:39:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45B6181216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775385563;
	bh=ilYFXjiNnlnWhIxuJibBYvlhmiK5LY6F/GRKAm1FJjw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G+Fiee3+4GtCO5P4EcPvufW0LEoTbNiOhoW1C4vbDkWg0ofetSX3LJv5TON6/5d98
	 8urwVvwbb8hNzrS7l9q6yvQcXxvU32av/FreKHPU3hVlRv2YJBSdEOXjS7as7GwaMI
	 v0HCe0kZlojYdTnDwIfykxjDv6oJn2zAIyojaT6FUx2qnZ3LurpgZSrP9FwPEB3J+O
	 g4T5OnRI3LlX2EzdZCl5DRy48W+ubRD1PiEPO08w6oFUpr0lg9FPMWaH+BqwVWbuYo
	 nj9EQgvEKI+0v3pegfOMXhsh9n+s7nn4JLW61BwvvgHPqIji9zX7e88HPLDVH5Ik7w
	 lMO7MNbwb6qqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45B6181216;
	Sun,  5 Apr 2026 10:39:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 10E2C2EF
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB74F40A85
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i59QUXmLzdFX for <buildroot@buildroot.org>;
 Sun,  5 Apr 2026 10:39:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B990540A4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B990540A4F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B990540A4F
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 10:39:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a012a.dip0.t-ipconnect.de [91.58.1.42])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE3E9A4C38EB
 for <buildroot@buildroot.org>; Sun,  5 Apr 2026 12:38:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53282)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w9KsV-000000007LA-28y5
 for buildroot@buildroot.org; Sun, 05 Apr 2026 10:38:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  5 Apr 2026 12:38:49 +0200
Message-ID: <20260405103851.2855053-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260405103851.2855053-1-bernd@kuhls.net>
References: <20260405103851.2855053-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775385531;
 bh=t0vj6aIRfhqn9cVx1gIJi9hkBhsG8INZnnkhHais/o8=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=YXXSremDrl8zCED2x6cPQx0JmEoSxuNkVjr4ZyXW2CObnLo1BdRoRt6a2qMTtW4l6
 X6hnQjmNIG7nkofKNzxi379Fv7l6rq36xgXyIwKiic+zqbFhXsEitL0Av/SeCS05Or
 eaPEgBWCVHBaFEZsx94Lvf+HhEScmuSqlPxGIse2WEV5RzC5x6tovgeuGP7t0u8iR8
 INTeKYb220jEyLWGEnqyF3zAk+8T3l0bp4fzE5Kp5PxQZuOFZTIfXK1a3MKQ9X09sj
 IPiDQ3ih6rBk/frNwQlAbhx2PZ2Djgvzw80vL0XXe5Yzc8tPAiPj+Yt0Af8ptUNvU0
 0yVAuR+ztiapw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YXXSremD
Subject: [Buildroot] [PATCH 3/4] package/c-icap-modules: bump version to
 0.5.7
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

0.5.7: https://sourceforge.net/p/c-icap/mailman/message/58723534/
"The newer c-icap-0.5.12 or c-icap-0.6.2 c-icap release is also
 required."
0.5.6: https://sourceforge.net/p/c-icap/mailman/message/40461114/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/c-icap-modules/c-icap-modules.hash | 6 +++---
 package/c-icap-modules/c-icap-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-icap-modules/c-icap-modules.hash b/package/c-icap-modules/c-icap-modules.hash
index 110ffd4de3..278b3efdbb 100644
--- a/package/c-icap-modules/c-icap-modules.hash
+++ b/package/c-icap-modules/c-icap-modules.hash
@@ -1,7 +1,7 @@
 # From http://sourceforge.net/projects/c-icap/files/c-icap-modules/0.5.x/
-md5  ca6d5d124a4668d63affcaa5ab083e57  c_icap_modules-0.5.5.tar.gz
-sha1  67be484a93fe662a7735ee06e1d34d82b54469a8  c_icap_modules-0.5.5.tar.gz
+md5  08c4721a26840bb0ff95fcaa64b686c3  c_icap_modules-0.5.7.tar.gz
+sha1  839b79bc53e9048680309a7cd31ad3c1e2cf44b5  c_icap_modules-0.5.7.tar.gz
 
 # Locally calculated
-sha256  6a42f1fdd8c35ad38d29f7d3c10f925471977f217086352e146cf95e45f2b5b5  c_icap_modules-0.5.5.tar.gz
+sha256  80bc0af10be171c0c73cd5886533a397c4d55211756fb6279f245ee7e5dd3814  c_icap_modules-0.5.7.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index e9bbbdb284..5ef0fa3256 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_MODULES_VERSION = 0.5.5
+C_ICAP_MODULES_VERSION = 0.5.7
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_MODULES_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
