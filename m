Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93379CFD640
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 14:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 538FE82051;
	Wed,  7 Jan 2026 14:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kK_8nMTA3bqA; Wed,  7 Jan 2026 14:08:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F0AB81F95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767794934;
	bh=Nll/iND/yCldbO0Gcu7nQEAT4k8xrORgQkrA9093CP4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Haq5HwnUVZPAJuyypHeS1+kaigcfOTksFoMR+/DgShy5EB+Kai24gwJo8FTGKyrfl
	 nDsCYGLA7frb8+ML5mErPdcORrZsyZBAt2bMIoabxI3YbJPeau6aN5vGCqOwkf6qE4
	 ELyYKIE1B86LSYLE3qLFxc4QFovNVcangBkCn7oaUJMYJsAuoIxla7+1+PS0aGtGnP
	 2m8kEppF0HBazFPpOrNVv4Sg3CeN8VOxFRLpUrX4AvtY+ANgGdYtoCeRHPRwjUVpnq
	 /nJz7q9aqH/5Hda0b4UxdCm8xR/OX1i/mnp9UDtB1RulCXXU0LE/Cf+q3Tpr2wHLGp
	 6+ks4jOnR9i5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F0AB81F95;
	Wed,  7 Jan 2026 14:08:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 637F9A3E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4676E60D5E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s3eRTZgGkr5E for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 875F06083E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 875F06083E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75C6B883AE; Wed,  7 Jan 2026 14:08:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Jan 2026 15:03:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3346846a9cda863873bc84a486528af245bc758
X-Git-Newrev: 73772bc5ea4a39b4558226706907ee9a6d4dfc48
X-Patchwork-Hint: ignore
Message-Id: <20260107140851.75C6B883AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nqptp: needs threads
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=73772bc5ea4a39b4558226706907ee9a6d4dfc48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/5b5/5b5eac85ca0221596ee12ea5e23acde46c6b7edb/

checking for pthread_create in -lpthread... no
configure: error: pthread library needed

NPTL support is not needed, this defconfig builds:

BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS=y
BR2_GCC_VERSION_15_X=y
BR2_PACKAGE_NQPTP=y

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nqptp/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/nqptp/Config.in b/package/nqptp/Config.in
index ec5d2ece2e..62742e81fb 100644
--- a/package/nqptp/Config.in
+++ b/package/nqptp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NQPTP
 	bool "nqptp"
 	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBCONFIG
 	help
 	  nqptp is a daemon that monitors timing data from PTP clocks
@@ -11,3 +12,7 @@ config BR2_PACKAGE_NQPTP
 	  timing information for AirPlay 2 operation.
 
 	  https://github.com/mikebrady/nqptp
+
+comment "nqptp needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
