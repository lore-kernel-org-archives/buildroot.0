Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C087C5B55D
	for <buildroot@archiver.kernel.org>; Fri, 20 Feb 2026 20:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23F2041955;
	Fri, 20 Feb 2026 20:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCKyLfGQubsK; Fri, 20 Feb 2026 20:23:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE38418FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771619001;
	bh=nsgyp2iwiqAoY3XjqFywaWdXVDXgVcnLClQA8G9AorE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rbOgaGsXk1YDjhAloYpCCKNmx6SDe8rZ0LK6cbUZwn97WfeyOOALCrKkwNKNB/b1z
	 0BKBdda10VKgdzKsJmF2COtcT2F6dwi3ybm9bnwc+vDNTiVaaFoasEQM06XjVgWGTs
	 FRq+4txmK/s7c05oENC6Y8JCOjeEP6p7EAeIdl8876z8w6obaMxqyRH1wAFN8uBHHa
	 Y3sc++oo4NRGSqZR7Z9HKWfAbo8JglS2N1O+dGwG126A4uYhzVG1bKnAWS1y793FuW
	 OGmq55zL8lFM+PLlBw4RJZEGO6uJVScNrbq6FHzK/ZI3r0OaM8Vu87LGMvxZ6zq2ZE
	 tGirSQZd4Xezg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CE38418FE;
	Fri, 20 Feb 2026 20:23:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE371183
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 20:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A396760A65
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 20:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WP4_WOCswW8P for <buildroot@buildroot.org>;
 Fri, 20 Feb 2026 20:23:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F1A2608EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1A2608EF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F1A2608EF
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 20:23:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6B31DA4C108F
 for <buildroot@buildroot.org>; Fri, 20 Feb 2026 21:23:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55524)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vtX1v-000000003Sl-1Xbd
 for buildroot@buildroot.org; Fri, 20 Feb 2026 20:23:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 20 Feb 2026 21:23:14 +0100
Message-ID: <20260220202314.3805964-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771618995;
 bh=OZ+BdrewpcHyJ8kp5J5qWj69vpc5oyC0Iamgb/hxrio=;
 h=From:To:Subject:Date:From;
 b=bqq/JuddwmXv4qmz2JrkBXP7LyYR9ipepaqR3BvZcBICADbK9TrwXK6mWTvnMbSpe
 mcqzuvn8XbAQg17tLdV/Hw9vvmf/tJvRPlcFjaUkgFyNs+YK1YQMBkgDm0QlQnEjCr
 uVfvjf05A2oK3vyGVNn7rP4HT4XOgmrF/gz4XuBLQ5r3N5cQNX9zj6a+s+gqy4zGgo
 D8e1KEeRCQMbl26F5HArm+z6WwnBEReL4eGhjo3M4C2luUJNQnrcqN7Bv/qIfuDmEI
 OuQ9PdIlgCKVeEZQ+6pmxK9Lho/XdIGezKOZ6nPDqu8g60swwVQY/4SK1T43ZuMgji
 6WrkstmzXz3Eg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=bqq/Judd
Subject: [Buildroot] [PATCH 1/1] package/flashbench: update tarball URL
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

Current site is down, switch to Debian.

Fixes:
https://autobuild.buildroot.net/results/eec/eecf2cbaafd8a170b5f5c6c24df552280a530204/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/flashbench/flashbench.hash | 2 +-
 package/flashbench/flashbench.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index 274d890f2d..eecfb23428 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b5f95d2d057270adbce0f1a784b6a88db339b67326b6ca92474edd99f9fd4774  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-git4.tar.gz
+sha256  e0bd6c8cd474b903bf8a58db36f5e04d55cc5138f10199406552528fdeeb76dd  flashbench_62+git20120606.2e30b19.orig.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index f5791c3e95..4e94f22ea0 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
-FLASHBENCH_SITE = https://git.linaro.org/people/arnd/flashbench.git
-FLASHBENCH_SITE_METHOD = git
+FLASHBENCH_VERSION = 62+git20120606.2e30b19
+FLASHBENCH_SOURCE = flashbench_$(FLASHBENCH_VERSION).orig.tar.xz
+FLASHBENCH_SITE = https://snapshot.debian.org/archive/debian/20251007T084504Z/pool/main/f/flashbench
 FLASHBENCH_LICENSE = GPL-2.0
 FLASHBENCH_LICENSE_FILES = COPYING
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
