Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC732C41513
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 17:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294D5844E0;
	Fri, 28 Jul 2023 17:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 294D5844E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bQgwNcY_y9yG; Fri, 28 Jul 2023 17:07:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57D25844DC;
	Fri, 28 Jul 2023 17:07:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57D25844DC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 06B211BF239
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 17:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D422F60B92
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 17:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D422F60B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DliSLeWsc36f for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 17:06:52 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67A7760B05
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 17:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67A7760B05
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD93DA4C0C45
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:06:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37886)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qPQvQ-0002fZ-1O
 for buildroot@buildroot.org; Fri, 28 Jul 2023 19:06:48 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 19:06:48 +0200
Message-Id: <20230728170648.2838566-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690564008;
 bh=JSdL88d02ERlvQKMKSTHK4zKaGgyHPFA81fGDqtTb6g=;
 h=From:To:Subject:Date:From;
 b=Sg0vacHvpGz2GxmQZxRFjq/oLIBPyyM6N43+OWpHhjEpRceBTyUf71PnDOsfncVbx
 hHXrJGJTqR94mzsOQsEwHw+XY+vClFJfyFML3WG+Px4exxqvElXe7jULJrPyZvhQNL
 KBW02RPXB8ucZoORpADn2bvJYuU+7XkXLXeDJ1pYh7FXgTHYvpHg/SJU8nPU1tTo8q
 I+VxOjssflVNPnWdNsfuuvgE9arMDFdR4VJVxBYkp9a2qc3hwAkMJH5MQeNPYTzgmV
 17ORKQcwNbaNWIBOAQct6gbDR7WDCqpnBP2cwpS6wx1YTrK134DWytfBopEf5Pwb5s
 s1z6d9Fe8Ej0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Sg0vacHv
Subject: [Buildroot] [PATCH 1/1] package/ntp: needs either mmu or threads
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/f2b466853ed296fdc8b4629f36e5a6447658f82d/

Quoting the first error message:
ntp_io.c:3793:9: error: unknown type name 'blocking_child'

ntp needs either fork or threads:
https://bk.ntp.org/ntp-dev/include/ntp_workimpl.h?PAGE=anno&REV=4d6178063mDeaH-s7PteNqw1DDK-Rw

  #if defined(WORK_FORK) || defined(WORK_THREAD)
  # define WORKER
  #endif

to enable the blocking_child code based on the WORKER define:
https://bk.ntp.org/ntp-dev/include/intreswork.h?PAGE=anno&REV=4d617805zzdW7YeB56-WZ4GbGCcXxw

The build error first occured on April 3rd, 2022:
http://autobuild.buildroot.net/results/31b/31bfdac8411ebf043a39e3277f6d7b008fe337b0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ntp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ntp/Config.in b/package/ntp/Config.in
index 97d933b5a8..78f008a4b8 100644
--- a/package/ntp/Config.in
+++ b/package/ntp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NTP
 	bool "ntp"
+	depends on BR2_USE_MMU || BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  Network Time Protocol suite/programs.
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
