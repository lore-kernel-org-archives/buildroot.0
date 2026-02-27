Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35EDFD530A
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:08:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C29A882F3D;
	Fri, 27 Feb 2026 19:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RWJGe76usbv5; Fri, 27 Feb 2026 19:07:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C1238274F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772219277;
	bh=uNkugMpYn69YKRdaNJ5uHmSs2/V/pVIDn/0Ja2Py4B0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pc6fqL4++1coub8dk3EEIeZ34Nwh+KBWG79nrLM9VYlz9yLJFwZn5prDUcGNcyWQc
	 9duTzrxfbxQQg6fD+YUlNHbtfPpGHdEJiTN/UsU4XJ05A7FUDXjwlD0knwyqSbTQYA
	 ig+prbcMz+apBsMYv4RqFt2XlXK6fJ0MnmrdzkTubtr4hqaVXp5zxiqLZX9ReLqGuB
	 QF0S99Cz/VNxWqwgAh6sDzWlskGRV1H14FN0iisOY97YtU+uA8ZIXOVhL5KItINBmc
	 aGP4elrjmUeFMXVsFWQb3nc1L1zJRwqPSD7fIaXBp/9HBVCZV0zAG+zEm/trk8oiQq
	 TNpOgav71QkFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C1238274F;
	Fri, 27 Feb 2026 19:07:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D904D204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAA2140AAD
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7RQXNzuB84Vy for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:07:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BAEFD40864
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAEFD40864
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAEFD40864
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:07:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F187DA4C2FD5
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 20:07:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55624)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vw3Bo-000000001Tz-3sbi
 for buildroot@buildroot.org; Fri, 27 Feb 2026 19:07:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 20:07:51 +0100
Message-ID: <20260227190752.2041167-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772219273;
 bh=caUx5CXVc0BgSeo6YI+CejjEc+q3t52rNqud9WMy/BY=;
 h=From:To:Subject:Date:From;
 b=lC/r8EyVGBvKHIANHKFY+6XbN3tb4vX9Q0zjmIAXaqgAE/97S/qLlwEMWv00JlUq4
 FE7emkpJ4ar9jUIKLAh3fFpO5EVsF6TgV4lSpZjE2qNP+M/Dq5Euet7yLCIaGbo/0w
 oo4dOkdEq2yrl4VTLmx8bStOAgVevlJisfExRrucU7tyHDrin/ACxKG+9HsztwcGf4
 FTZsr7enetjY9M5yWFi6ICqksj0dr5wsfH4sxb0DVhxdFx9IyOwBl7tH82+X5jHKVN
 FBEW6icBklOfUkCONEgKeX1nOAoe1YH2uJOLkbsTGe6Qp7OBZi0G61wuXJNnPYVfu7
 SUVHsFacJG6gA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lC/r8EyV
Subject: [Buildroot] [PATCH/next 1/2] package/flashbench: fix download URL
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

The original source is offline, switch to forked repo and use the same
tree as before to only fix the download error.

Fixes:
https://autobuild.buildroot.net/results/eec/eecf2cbaafd8a170b5f5c6c24df552280a530204/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/flashbench/Config.in       | 2 +-
 package/flashbench/flashbench.hash | 2 +-
 package/flashbench/flashbench.mk   | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/flashbench/Config.in b/package/flashbench/Config.in
index a50f482ac3..8f64275745 100644
--- a/package/flashbench/Config.in
+++ b/package/flashbench/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_FLASHBENCH
 	  SD cards and other media for the Linaro flash memory
 	  survey.
 
-	  https://git.linaro.org/people/arnd.bergmann/flashbench.git
+	  https://github.com/bradfa/flashbench
diff --git a/package/flashbench/flashbench.hash b/package/flashbench/flashbench.hash
index 274d890f2d..8b087c2a10 100644
--- a/package/flashbench/flashbench.hash
+++ b/package/flashbench/flashbench.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b5f95d2d057270adbce0f1a784b6a88db339b67326b6ca92474edd99f9fd4774  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0-git4.tar.gz
+sha256  408a2642700b7f8daf4356a49948b921137ad15bb6e0fd05b1cb8dc700c154dc  flashbench-2e30b1968a66147412f21002ea844122a0d5e2f0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/flashbench/flashbench.mk b/package/flashbench/flashbench.mk
index f5791c3e95..28ce7f7dd1 100644
--- a/package/flashbench/flashbench.mk
+++ b/package/flashbench/flashbench.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 FLASHBENCH_VERSION = 2e30b1968a66147412f21002ea844122a0d5e2f0
-FLASHBENCH_SITE = https://git.linaro.org/people/arnd/flashbench.git
-FLASHBENCH_SITE_METHOD = git
+FLASHBENCH_SITE = $(call github,bradfa,flashbench,$(FLASHBENCH_VERSION))
 FLASHBENCH_LICENSE = GPL-2.0
 FLASHBENCH_LICENSE_FILES = COPYING
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
