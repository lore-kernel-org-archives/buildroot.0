Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A464CD98CE
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 20:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BB3E84506;
	Mon, 15 Jun 2026 20:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYePQAUDPZbV; Mon, 15 Jun 2026 20:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 568C384503
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781555163;
	bh=WryX4V5U0RqgiJVjcfaOxfHpO3ckSAWvPCxsIBZ3NtE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jOA4JybOJ/Z2P1wub+kQlvaM26QDgA3qdH1zkmxaf6NJC9mqgyQMNP+4AB8z+HUlW
	 fDMeLlbQCvFt4IaGrBQvjpboN7pGLJB6zLeejLE+fsxXt/WTKyfXyZNPn1JUPfgYoI
	 qIWOb9G7nuT/fvpj8AHqcPXF9TLO513u9n+psUC5ZD8fRyUZNOHxg4yBYQ09RXcrsg
	 1rQWmU06umBs/Dgroh50cAy64/BSszi4CG/SxXfo16kOFxbZ5S1cMIdBajVgVsxsYB
	 tvXVyHVjGgldCRYAHEOFGMRhALB3oqOt3IBS1lDYdB0edKeBBBtZkxaBMNydtBeiY+
	 9tvpKpmZnBvwg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 568C384503;
	Mon, 15 Jun 2026 20:26:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A6C942B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98397419A3
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCI3WJjF8qq0 for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 20:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 869F8419A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 869F8419A7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 869F8419A7
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:26:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a01c8.dip0.t-ipconnect.de [91.58.1.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A4ECFA4C3120;
 Mon, 15 Jun 2026 22:25:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58352)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZDsd-0000000017U-2WlP;
 Mon, 15 Jun 2026 20:25:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Jun 2026 22:25:56 +0200
Message-ID: <20260615202559.1465158-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615202559.1465158-1-bernd@kuhls.net>
References: <20260615202559.1465158-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781555159;
 bh=QLMFjcrhZJpJUUQp7HPMIGFhpRoXrKbAUKdKSR+Xv2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Q+6fnsItJUFH2zaQAvvv13w5HXVjusb4mLCEbo1qg1OLJ4+y6cHz3H50fHN0xOzV+
 R15rnggXd94LJSVc41nKmdJvutVkbBeTfJLJMMHozdKHOdwlsvnC7Ec+M2B8tUVUED
 e8PmlIUPVC00rfW/HXvT3nyOFrxT9KJJ471rzFLciJR+UwlYjx6zAPSztg1c0Jq+mu
 v05iQCXMwJOtZxmD+EaK8VSPNOwnrbfHMKDHtVtJGNxO6810IIi9q8bLEVYs1ZUW2+
 aZkBw/uVzEDV0jRJKQZ421B7NigbmZLQGKG+ZhY0Ze7mZgkL5w0tH0DQjMys4H9g0G
 pjSB9nRRaqX9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=Q+6fnsIt
Subject: [Buildroot] [PATCH 2/5] linux: select host-openssl for all
 architectures when building latest CIP version
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

This is a follow-up for buildroot commit
bba86304b0ac4ae266cfb52e54a239b0850b10ca to extend the fix to CIP
kernels.

Fixes:
aarch64: https://autobuild.buildroot.net/results/f91/f910c1e0e864055120e2deaf4d56b127cabb89bd/
aarch64_be: https://autobuild.buildroot.net/results/6e6/6e651c586f9b2a1c9b39cafaf5bebc8b501e8369/
arcbe: https://autobuild.buildroot.net/results/9fe/9fe7b4c66ac139926e9a3686bc951af703e78b29/
arm: https://autobuild.buildroot.net/results/288/2888b0b6f5473e9c7ec7c443b02b42e1f5d4c814/
armeb: https://autobuild.buildroot.net/results/d6c/d6cbbfdcbebe985d743232070824779e790aa5a8/
microblazeel: https://autobuild.buildroot.net/results/bf3/bf3b4c61cdaf3527e9e315050bf21456bbb24a48/
mips: https://autobuild.buildroot.net/results/c6b/c6b9c82352be01dd4bab2021a223e72dfaf1f522/
or1k: https://autobuild.buildroot.net/results/231/23144a8108c5837e3a9cf26ad6ac73fa16dc740f/
riscv: https://autobuild.buildroot.net/results/31c/31c3abdb23bfe16e248e094e9b0feafbbb0d6a94/
s390x: https://autobuild.buildroot.net/results/bda/bdaaf6767f8c239bbf22e4619b2d6944ef951b2e/
sparc: https://autobuild.buildroot.net/results/426/42614f77be9fa1b3a596cdcb40cfb81f5496b41b/
sparc64: https://autobuild.buildroot.net/results/1f2/1f226d028d85c085d82f3890e804b39bccd2c2dc/
x86_64: https://autobuild.buildroot.net/results/7be/7be86c261a42e1a16c3d38a640be226b5f51bccb/

Supersedes
https://patchwork.ozlabs.org/project/buildroot/patch/20251101102346.109307-1-bernd@kuhls.net/
and includes Edgar's comment.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/9b6fe0892e0acd8d750f614656648fb51467f668

 linux/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index bbd0e491cd..0baa52de0f 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -187,9 +187,11 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	bool "Use the architecture default configuration"
 	# We know that the default configuration on many architectures
 	# requires host-openssl, so select it for the latest kernel
-	# version. This is mainly needed to fix autobuilder testing.
+	# version and the latest CIP version.
+	# This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
-	       BR2_LINUX_KERNEL_LATEST_VERSION
+	       BR2_LINUX_KERNEL_LATEST_VERSION || \
+	       BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	help
 	  This option will use the default configuration for the
 	  selected architecture. I.e, it is equivalent to running
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
