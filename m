Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738DFC433FE
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 14:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABEF540AD6;
	Tue,  3 May 2022 14:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXMkPMFRPEyl; Tue,  3 May 2022 14:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9599E40AF9;
	Tue,  3 May 2022 14:27:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E6511BF41A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C6F081495
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EuvEtWZ3n2Fr for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 14:27:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp1.osuosl.org (Postfix) with ESMTP id BB59D81427
 for <buildroot@buildroot.org>; Tue,  3 May 2022 14:27:15 +0000 (UTC)
Received: from pwmachine.home (154.pool92-186-13.dynamic.orange.es
 [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id D307E20EAB9D;
 Tue,  3 May 2022 07:27:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D307E20EAB9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1651588035;
 bh=YYr86OlBigIChRmJ0zB9IOUFHNus3lfmeuQ1paY71rM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AxT/8xJLKhmuFiVkO5kdTPFw9sgZ1EcAn7BYpkba6+UKkWo2Bla/4M42pX+4rcU2B
 QHZv5OUHp8+HZU9Tg02CjpaJzl8df92EmvHm4NtBIHYx7PDOAb5QCD0ck3J3YcSE4s
 3XpEk0lUkIJMoQuakpeOtHCInhuKmGZBveurUzCE=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Tue,  3 May 2022 15:27:00 +0100
Message-Id: <20220503142701.14397-2-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503142701.14397-1-flaniel@linux.microsoft.com>
References: <20220503142701.14397-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/sysdig: fix DRIVER_NAME definition
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When I wrote the previous commit, I was not fully focused and wrote:
-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME.)
Which leaded to DRIVER_NAME to be empty.
So, it was not possible to use sysdig due to the following error message:
error opening device /dev/0. Make sure you have root credentials and that the  module is loaded.

Fixes: ea86757e51cf ("package/sysdig: bump to 0.29.1")
Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 package/sysdig/sysdig.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 76cabcaeca..318746d44a 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -28,7 +28,7 @@ SYSDIG_DEPENDENCIES = \
 SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR) \
 	-DBUILD_DRIVER=OFF \
 	-DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin \
-	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME.) \
+	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME) \
 	-DENABLE_DKMS=OFF \
 	-DUSE_BUNDLED_DEPS=OFF \
 	-DWITH_CHISEL=ON \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
