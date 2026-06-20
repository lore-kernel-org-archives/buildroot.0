Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB857CD4F26
	for <buildroot@archiver.kernel.org>; Sat, 20 Jun 2026 15:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0F4F6086A;
	Sat, 20 Jun 2026 15:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8J5AVSE9FpKi; Sat, 20 Jun 2026 15:02:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C57CC6F99F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781967742;
	bh=Fxvsr1SGd5EIP0yNdfI/5k84Oe3ZLYA4Y0VCZKi3mmU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rnzWSTi7j1qWlwsZmuqKTQ6jXAq4jWRfdCeiKx31D3b7Q+kkAaknJF3LswvSwXu2G
	 JOBz6OsNcrsP0JWG4iBXp4gAQkJXaimSgm3Cjh4lpD+HlIZlqh0rRN9enCRhserST6
	 Kynn9YM+iB5VH1C8E3Vy7zbSUXOWXaDxuPp8+s0dPh9hFkq8VvV7VfFmRUrdgTCZ5E
	 +ZrVRvvmRugoiU2DALdMBHqDbDLWfw6as/XikRQK0aykxdxF9gxDeu7mUD4rDRmKLg
	 Np6WWCP40fY//WcQs+WJoT44/iJ7rQWmO/DDzQKxVcB1z0p7LL1/c8a+CWiPSaEl0c
	 tcthKLNw4JwqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C57CC6F99F;
	Sat, 20 Jun 2026 15:02:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5C63E367
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59E7C42A3B
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vvUT70Q5CGm for <buildroot@buildroot.org>;
 Sat, 20 Jun 2026 15:02:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DBC942A33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DBC942A33
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DBC942A33
 for <buildroot@buildroot.org>; Sat, 20 Jun 2026 15:02:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c132.dip0.t-ipconnect.de [79.214.193.50])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DCEEAA4C10F6;
 Sat, 20 Jun 2026 17:02:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54672)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1waxCt-000000000Fk-2Fsd;
 Sat, 20 Jun 2026 15:02:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2026 17:02:02 +0200
Message-ID: <20260620150203.4036943-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781967723;
 bh=wWvsTWsxW3bybD/uTNN+d5gKjtrx/5QwzshuWFSgsq0=;
 h=From:To:Cc:Subject:Date:From;
 b=QX1e15fIu34AqZLUNCLEzBmVIMUPTaC7qXYAsrmEDPqkNDFAOZSWqU4R5yM6q+R4a
 L8YTl0Vt0L1yIR0vfusAjz8zojLbTQ+o/I/L5xDk05ERJtsyBCY4nxgkky3rI1syyn
 A0KpTpT49HwSaNBuL5qVZ8QEGMjIQJIVaQD+Zm19TRQ134KE+EWXoq5CqySmn1jAcf
 eysAmKhDq+j3mpAOdmVlRLtURflR+YtWzbDax2G4IUOPQgPfj8hQ9LGF28wB9R55Qx
 NJGG7kh8HFIIIboBGIb1USml6AQNuhZ0fhxAxyCINjS8Vw4Af9cl1ACbHceCq5UQ7p
 LHZaEiZjWj/mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QX1e15fI
Subject: [Buildroot] [PATCH 1/2] package/cifs-utils: remove NO_WERROR hook
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

Buildroot commit 18bd541dd02b153427fb4f010a6426c8e91bef1b added the hook
to remove -Werror after upstream added it to CFLAGS in version 5.4:
https://git.samba.org/?p=cifs-utils.git;a=commitdiff;h=dc0dd017a856185422d2f3691062737a9e93ecae

Upstream however removed -Werror again in version 5.6
https://git.samba.org/?p=cifs-utils.git;a=commitdiff;h=74edf24d9780900f3ce15d2403c6e331b031d454
This version was bumped in buildroot with commit
839546dd3aaff56f26536ea7373978e32563c473 but the NO_WERROR hook was not
removed until now.

The tarball of version 7.6 does not include Makefile.in anymore which
broke the build of the package. As this hook is not needed anymore it is
removed.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/f73f3d6fa47e362d38c258e823b6bbaaa559e616

 package/cifs-utils/cifs-utils.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 9e1e822c4c..58ac594b20 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -25,12 +25,6 @@ ifeq ($(BR2_PACKAGE_KEYUTILS),y)
 CIFS_UTILS_DEPENDENCIES += keyutils
 endif
 
-define CIFS_UTILS_NO_WERROR
-	$(SED) 's/-Werror//' $(@D)/Makefile.in
-endef
-
-CIFS_UTILS_POST_PATCH_HOOKS += CIFS_UTILS_NO_WERROR
-
 ifeq ($(BR2_PACKAGE_CIFS_UTILS_SMBTOOLS),)
 define CIFS_UTILS_REMOVE_SMBTOOLS
 	rm -f $(TARGET_DIR)/usr/bin/smbinfo
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
