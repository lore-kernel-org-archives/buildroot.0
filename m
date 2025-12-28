Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252E4E784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ABCF608D0;
	Sun, 28 Dec 2025 07:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RZEMWjgCmpzt; Sun, 28 Dec 2025 07:56:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B726085F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908563;
	bh=uQyC0RZo7ue029GUHeSFrZ+k1PAnLbBv0QB2Y1ADvqA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oATnnFnWbk6XwHO4yNQw7YjH7ngAOdmLHbKIX1to59D4UJcfC1pF9Km1okMVqvRkm
	 wvioJjnPcyCnGeK57f9sGYsINmEsBN07i14A+5HDOuhSfX+V1TXyUJTabiwNtgGv1i
	 IjOa1NDiDOc/alNPwsD2MAZrf/6nn/QZuCMIhIaKZfJqYj0Ze4A+Iw1fXl0ZmgkEgX
	 pgskj/y4Y0B1tH1jD3pvclwDbUalORSsN3isvjTAkrgvA3zEp6Na5knzcDb7byvD06
	 XwWoZ92gepoIADDB30z7BV20uXr7Byd+4KwGojKvngUICgxyS/rRz8H6LNvjW8z8Nq
	 8ALMa/UbkA6ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6B726085F;
	Sun, 28 Dec 2025 07:56:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4A3A1E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D705E40087
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0VluSml8Y7v for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:56:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D0325400B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0325400B1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D0325400B1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:56:00 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01f5.dip0.t-ipconnect.de [91.58.1.245])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DD641A4C0550
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 08:55:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52334)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlcw-0000000072p-0GST
 for buildroot@buildroot.org; Sun, 28 Dec 2025 07:55:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 08:55:45 +0100
Message-ID: <20251228075546.3372169-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908546;
 bh=rZOUlQrNW6fQLNR/M/tg0COxwqYN2Aey3I6nVvCBptM=;
 h=From:To:Subject:Date:From;
 b=tqrAtkvyXvMRr3HjN+7WLTaJCGpqpyA0G+QofV5Sr+nCCXfmLlQyX71HvwgxGqNbL
 HiuQBnpMW3SWiwWlzpjz3QUWXPNBodI9ib5y+FHj2tKEptLLnM/u/v6cbj+Tb43zxN
 BHV2byeKT96pNtg/082zCtSOmzqr8N78KarSBb/IWMYVwu2AGffOenJvqQyDssco3p
 MIfhIbnXuEOA+zPgauRe+eX+CP1TzIxQPXR/FmrzYpqsSwCCc2siXx6DfY4XB4Ljtt
 bldDAr7X5dKxNEhHnGyQezSyWhwoD8/3IWGoAe95uO8Yn6uf1UWkOAs25axwAZEUXR
 CHX29wv5E/6eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tqrAtkvy
Subject: [Buildroot] [PATCH 1/2] package/intel-mediadriver: bump version to
 25.4.6
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

For release notes, see:
https://github.com/intel/media-driver/releases/tag/intel-media-25.4.6

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index af27309bab..ad742a3af1 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7ba3b1d72286053e0785b7975e7ed2001ba3f6e00a8541aff0c61a6495ef5138  intel-media-25.4.5.tar.gz
+sha256  e5cf57c66e22359d1ec07d766b04e5da43677b9330999ce0dbf686aac60cf6bb  intel-media-25.4.6.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index d8dd5d0c1f..0ee1854259 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 25.4.5
+INTEL_MEDIADRIVER_VERSION = 25.4.6
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
