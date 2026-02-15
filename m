Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DA0EF587B
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 14:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16DD881B35;
	Sun, 15 Feb 2026 14:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RARBlzLEA5Qe; Sun, 15 Feb 2026 14:13:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28F5081B70
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771164803;
	bh=myaQ25IwEcc+z5AClY3n3S8iE/MtecTaS7pBdXduPtA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XC2wlCPOAv/giWpLCfdGy+lTX4TpQuFauTMSvSS8BjuQS/bId5O+DRNaNLuRusdal
	 SLaPQFB1TjRg4BK2NRxCbAhq+wBegN9brDzkY9hpJcAHA+XCHe6d76/WOVnIJLkZMS
	 x1TdM9IRak14Z2qU5Fvjg9X6enGgZ0GLgapo954/HIvwf+63ur2NxsjaL9RvUGCrgs
	 4NBpvgE6ItvjOey5v1cgziG5LigHkt9ZPbTd6vR1ouSQ3vm3V0OOM+Gj3SXhKHk8+P
	 T0wSdF6oqB8o/MkJbFoAPRLo0s28JLvMJWGFHF+MqOp7prAZzBujj/m1GSe0Rthyuj
	 lycIC+eAd0Xew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28F5081B70;
	Sun, 15 Feb 2026 14:13:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 038C9270
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:13:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E92F860708
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:13:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cavDx4MAYf5q for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 14:13:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 894AB606E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 894AB606E0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 894AB606E0
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 14:13:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 249CEA4C0EC2
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 15:13:18 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50924)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vrcs9-000000005iw-25tk
 for buildroot@buildroot.org; Sun, 15 Feb 2026 14:13:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 15:13:16 +0100
Message-ID: <20260215141317.503620-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771164798;
 bh=dlNbBu3zUZacMWPQgrvfy+9ElCZAj9jH9lXDvxwX7ss=;
 h=From:To:Subject:Date:From;
 b=S47gW/Ub8d3aGExm1ydbdNl5VlWfJSbuTSHRpLx2bqQ23xThtP2eZW8B2SoUNnxc5
 O+3pzzr5svMk1Pl/6OaekwVnsCpZGv82WdyUM2PwWKb/wX9MZ3XuVjYj+V4vHmVMy5
 D5gS+dr6qJ7htlwVNuapBGVTaYy1EmHRGX7cpMKGhzT0HDb93JFMF1jMufavXW6XBE
 RsgyPrCDHe5TAg2uqyeEufBrbLPANRWPQenCTuf1v+zfXxmpic8e30HkPqPDZEaDDZ
 o6txdM1OmLf2YqIymWBzA63y4qtVcvd0HbQOE7SINvuICklRn5ZIR8/kNDTFmfWN15
 2Ft7ox7rJY2hQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=S47gW/Ub
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 26.1.2
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

https://github.com/intel/media-driver/releases/tag/intel-media-26.1.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index ca7993be23..bf3a8a2c5e 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c59cbef1de138bcda45b93ad2b7f3db65619756d5c126fb32a30076ba5bb71b0  intel-media-26.1.1.tar.gz
+sha256  e2eea3df18d766059d6667a187ae47d0ea986fa0502d8ba8fdf92183e65e9871  intel-media-26.1.2.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index cb142d3220..551e506d5b 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 26.1.1
+INTEL_MEDIADRIVER_VERSION = 26.1.2
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
