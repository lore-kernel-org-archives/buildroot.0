Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE3CC3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 19:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69B844060B;
	Mon,  5 Aug 2024 19:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2bzOjDGj-slb; Mon,  5 Aug 2024 19:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A2FE40638
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A2FE40638;
	Mon,  5 Aug 2024 19:07:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 462FA1BF34A
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 263924060E
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 19:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GzLLsxilbBSp for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 19:07:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB8E3405FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8E3405FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB8E3405FC
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 19:07:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bad7.dip0.t-ipconnect.de [84.161.186.215])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5DBF6A4C0D83;
 Mon,  5 Aug 2024 21:07:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60792)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sb32x-000000008T0-24rj;
 Mon, 05 Aug 2024 19:07:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  5 Aug 2024 21:07:06 +0200
Message-Id: <20240805190707.3410913-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240805190707.3410913-1-bernd@kuhls.net>
References: <20240805190707.3410913-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722884828;
 bh=BpW2C+IHDyTv1kL5zVYguDtLxZh4pBE2+ndBz2Fsbog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VOKKHcqa9/oWGs5zLhmUuaZQoV/8FrwX7AaGsMEul1QZuWCX2JQIkFHh3CgIt53wL
 vxmz0+CXaZxYy4KC5EO3rVx4ovuOYU+tptW2btsp9TEnEXw4PUnXStC3GITOwyXbHN
 nG/6Vw2ezI9fM9D1nHtoKkJIV73UioqbwdxPx/fA0rSs6HZo29tU1vE4fLZA2Kf1rB
 7pU92o8QRoCww7uqagKG9fGwrmCKi+ueDZUOjzrQ4iAWM4jdIbFJEes7yX4IQio6lk
 roiwtkZlndNIGAmipSjpP/a/9xo1OGsZKWoQvydBANvzOKu1L9finly3qF1cTAKLNt
 Bpw4bDQ9bCl3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=VOKKHcqa
Subject: [Buildroot] [PATCH 2/3] package/intel-vpl-gpu-rt: bump version to
 24.3.1
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
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash | 2 +-
 package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
index 2b42c7b050..ba756af413 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  02b01dd73f7c5a4a46860ec01470b484286709cc13f9333a34a089d7e457295e  intel-vpl-gpu-rt-24.3.0.tar.gz
+sha256  b92594e8e30be3b879526f4ac38bef60ea684cc8e93d2e7f24eb45205d0211b9  intel-vpl-gpu-rt-24.3.1.tar.gz
 sha256  c31c3cc5fd66d1250dbca1c3d9011a9f874537442ac71c8de80f2f0fed13f297  LICENSE
diff --git a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
index 1566b87b49..7d7771aae9 100644
--- a/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
+++ b/package/intel-vpl-gpu-rt/intel-vpl-gpu-rt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-INTEL_VPL_GPU_RT_VERSION = 24.3.0
+INTEL_VPL_GPU_RT_VERSION = 24.3.1
 INTEL_VPL_GPU_RT_SITE = $(call github,intel,vpl-gpu-rt,intel-onevpl-$(INTEL_VPL_GPU_RT_VERSION))
 INTEL_VPL_GPU_RT_LICENSE = MIT
 INTEL_VPL_GPU_RT_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
