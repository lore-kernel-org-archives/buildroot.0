Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760C3C6FD1F
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 05:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BE0E40BDC;
	Wed,  3 Apr 2024 05:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XVGspf_lbaHo; Wed,  3 Apr 2024 05:52:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FDB941468
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FDB941468;
	Wed,  3 Apr 2024 05:52:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA4DD1BF591
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 05:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E465481EE3
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 05:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0zH7Cx6_Yma for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 05:52:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B6765812CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6765812CF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B6765812CF
 for <buildroot@buildroot.org>; Wed,  3 Apr 2024 05:52:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf33.dip0.t-ipconnect.de [79.214.207.51])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B2EE7A4C1A95;
 Wed,  3 Apr 2024 07:51:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55122)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rrtXQ-00000000679-3Oxp;
 Wed, 03 Apr 2024 05:51:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Apr 2024 07:51:57 +0200
Message-Id: <20240403055157.9627-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403055157.9627-1-bernd@kuhls.net>
References: <20240403055157.9627-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712123517;
 bh=pDP7aK0LR1kT1nCSOrazkAUwIGzSANTXtzEM3kVS0m4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SE98apRxt7FVS9vMlx67ku9sxkZn/Y0HJpPdzW8m0yBJaN8DJT5KWEyrXnMn1D1Fv
 PNsZl2SoYcQZcpETQ20ajIBaNKHITibyDiJRNN9BQ5A//QaXfXtvWiWjB4wIQAwJkW
 UOP32F92ZhOSUtaVuq7N+/zX5tvhJsWMjjAI+MrAhXkpyppXAL1H30R7J+d/8Isj1z
 SZwjXJfjZi4vIH5qJmhzji06Ns+zX5zLpj4tLVd3iqB3v+BHdM+fkLJ+2bLS3pUG+v
 R27hTEisK0V7/25brE4har6uBz40EqEjoO3CFOmJ3uqreyePzzn1rZ34iLdOqGQZWk
 RtBZUKDpYJePg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=SE98apRx
Subject: [Buildroot] [PATCH 2/2] package/intel-mediadriver: bump version to
 24.2.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis-Paul Cordier <lpdev@cordier.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/intel-mediadriver/intel-mediadriver.hash | 2 +-
 package/intel-mediadriver/intel-mediadriver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediadriver/intel-mediadriver.hash b/package/intel-mediadriver/intel-mediadriver.hash
index 6bc9549c11..d597d3f32d 100644
--- a/package/intel-mediadriver/intel-mediadriver.hash
+++ b/package/intel-mediadriver/intel-mediadriver.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e23ea37c98d8d4b9d1a3a134b6489256d8f5a7a4ee71967b1db8ade70052654f  intel-media-24.1.5.tar.gz
+sha256  5c03bbb9d7ae12b9c7fe2cb3f4c76f8ac796eccfb998422802e40464264de37c  intel-media-24.2.0.tar.gz
 sha256  74979d5aaee78b8da82e3aafd415a216b6131dfff6d95d6930927c8a4e3bded3  LICENSE.md
diff --git a/package/intel-mediadriver/intel-mediadriver.mk b/package/intel-mediadriver/intel-mediadriver.mk
index 160d4e0454..7d9b074dbe 100644
--- a/package/intel-mediadriver/intel-mediadriver.mk
+++ b/package/intel-mediadriver/intel-mediadriver.mk
@@ -6,7 +6,7 @@
 
 # based on https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
 
-INTEL_MEDIADRIVER_VERSION = 24.1.5
+INTEL_MEDIADRIVER_VERSION = 24.2.0
 INTEL_MEDIADRIVER_SITE = https://github.com/intel/media-driver/archive
 INTEL_MEDIADRIVER_SOURCE= intel-media-$(INTEL_MEDIADRIVER_VERSION).tar.gz
 INTEL_MEDIADRIVER_LICENSE = MIT, BSD-3-Clause
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
