Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913B6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 17:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E63F40C4E;
	Tue, 24 May 2022 17:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vyq8d-soe8Fv; Tue, 24 May 2022 17:07:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 77A1840C3D;
	Tue, 24 May 2022 17:07:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B7A41BF3D5
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 17:07:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26C7B60ABD
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 17:07:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=iki.fi
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ItaKhuY3QnW8 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 17:07:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DF8060AAD
 for <buildroot@buildroot.org>; Tue, 24 May 2022 17:07:28 +0000 (UTC)
Received: from localhost (91-154-92-55.elisa-laajakaista.fi [91.154.92.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: sakkinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id 2E233203DA;
 Tue, 24 May 2022 20:07:21 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1653412041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=C16oxj4S7bOgGlckZukMCsyll8p4XjcNWMkuD4ybffg=;
 b=bSE4/I9+i5VhgLPBlufpeYsaQGnDKnD0uS7kNstQ8BmVYcLoz0HdkxpGeEmcsbbLxi9gmI
 T/VNipFUXBTFjTKux4nXvoj+dc1Bb+ujCDcpDIYCk5o8KowRvPMxXZdDDTnH0Cc94AmnJQ
 B/qXf5TTwjMikuFrR/iAZlkTJlwYl4s=
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 20:05:40 +0300
Message-Id: <20220524170541.93208-1-jarkko.sakkinen@iki.fi>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1653412041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=C16oxj4S7bOgGlckZukMCsyll8p4XjcNWMkuD4ybffg=;
 b=N0SrZ9x++ldEJvasHRFcso+5vRKfm5j3BFPF0Kgxp6VgNBLFGaoL1d2DZWpVlfHWS04+VI
 1+/8x7jwRHDZm8EgFyiqnuL3QCn7Jmi7hsBB/yR2rF/mvVeNFhZ1asxTCbPe81hkteO+6f
 +bZlXaB5izhGCxiQOA7yP2tlTI3qBiU=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1653412041; a=rsa-sha256; cv=none;
 b=R+006cZbgs58UTg5MTZe+YBTpqoNxqHdb0wtC90qfu8k3yAiSRsd/lILtqJXBEpkKxl1rs
 /q7AOGZ3pX8AIbpSEwbmzmC+8tDxmAG9pSlF9aP5MjvQKq8tRK0/7Ej7s1G+/IX2iYiVjN
 Rl0kF+tD4SvdriBjqa9/Bv+Jp0Dn2CU=
Subject: [Buildroot] [PATCH v2] package/linux-tools: openssl dependency for
 x86_64 selftests
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Jarkko Sakkinen <jarkko.sakkinen@iki.fi>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On x86_64, libssl is a dependency for kselftests. selftests/sgx depends on
it.  Thus, select it in "Config.in", and add it as a build dependency in
"linux-tool-selftests.mk.in".

Link: https://lore.kernel.org/buildroot/20220517224809.21f77949@gmx.net/
Suggested-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
---
v2:
Config.in: BR2_PACKAGE_LIBOPENSSL => BR2_PACKAGE_OPENSSL
---
 package/linux-tools/Config.in                  | 1 +
 package/linux-tools/linux-tool-selftests.mk.in | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 791f2c085c..6217fcfb7a 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -98,6 +98,7 @@ config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_SCHEDUTILS # runtime (taskset)
+	select BR2_PACKAGE_OPENSSL if BR2_x86_64
 	help
 	  Build and install (to /usr/lib/kselftests) kernel selftests.
 
diff --git a/package/linux-tools/linux-tool-selftests.mk.in b/package/linux-tools/linux-tool-selftests.mk.in
index b824c11bd6..06158e6147 100644
--- a/package/linux-tools/linux-tool-selftests.mk.in
+++ b/package/linux-tools/linux-tool-selftests.mk.in
@@ -17,6 +17,9 @@ endif
 endif
 
 SELFTESTS_DEPENDENCIES = libcap-ng popt
+ifeq ($(NORMALIZED_ARCH),x86_64)
+SELFTESTS_DEPENDENCIES += openssl
+endif
 
 SELFTESTS_MAKE_FLAGS = \
 	$(LINUX_MAKE_FLAGS) \
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
