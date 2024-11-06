Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958EED44D42
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 10:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 484FD608D6;
	Wed,  6 Nov 2024 10:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unF6SckS7NIn; Wed,  6 Nov 2024 10:12:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42766608D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42766608D9;
	Wed,  6 Nov 2024 10:12:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BED2EB8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 10:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACD82811E7
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 10:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DU-FBtVjQiw3 for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 10:12:44 +0000 (UTC)
X-Greylist: delayed 581 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 06 Nov 2024 10:12:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82D14811E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D14811E4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.204.228.163;
 helo=mail.bitwise.fi; envelope-from=anssi.hannula@bitwise.fi;
 receiver=<UNKNOWN> 
Received: from mail.bitwise.fi (mail.bitwise.fi [109.204.228.163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82D14811E4
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 10:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.bitwise.fi (Postfix) with ESMTP id F380D46000C;
 Wed,  6 Nov 2024 12:02:58 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at 
Received: from mail.bitwise.fi ([127.0.0.1])
 by localhost (mustetatti.dmz.bitwise.fi [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kGzHnhVenSbi; Wed,  6 Nov 2024 12:02:56 +0200 (EET)
Received: from localhost.localdomain (fw1.dmz.bitwise.fi [192.168.69.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: anssiha)
 by mail.bitwise.fi (Postfix) with ESMTPSA id D9019460006;
 Wed,  6 Nov 2024 12:02:56 +0200 (EET)
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed,  6 Nov 2024 12:02:10 +0200
Message-ID: <20241106100210.1547916-1-anssi.hannula@bitwise.fi>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=bitwise.fi; s=mail; 
 t=1730887376; bh=H7Gr/gn8sGf7evxvWFRU+lDQJBXLYaK6TO5IM0qINO0=;
 h=From:To:Cc:Subject:Date:From;
 b=F6RmEXAtOmPcmXVpPtAzclULdmCEqvpcW1G9jHSBSGIbsZp7GaCJQI5T2uLycnNEM
 h/VubnKwmxEJQ9ACMOIZkVMDfBjc3/oG0uqr6EuTEe0iFc8eFF3OWjTA4mcVbrOVCX
 86G27bzyHNo9HIYoQB9Fmb1FMeSOmbI8GAJIzHTo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=bitwise.fi
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=bitwise.fi header.i=@bitwise.fi header.a=rsa-sha256
 header.s=mail header.b=F6RmEXAt
X-Mailman-Original-Authentication-Results: mustetatti.dmz.bitwise.fi
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=bitwise.fi
Subject: [Buildroot] [PATCH 1/1] package/nfs-utils: fix unit dependencies
 without systemd on build host
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
From: Anssi Hannula via buildroot <buildroot@buildroot.org>
Reply-To: Anssi Hannula <anssi.hannula@bitwise.fi>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

nfs-utils configure script uses "systemd-escape" to determine the
rpc_pipefs mount point unit name in the non-default case.

If the host build system has no systemd this will silently result in an
empty name, causing rpc_pipefs.target to incorrectly depend on ".mount".

Fix that by depending on host-systemd for build.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
---
 package/nfs-utils/nfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index b757e3e51d..9ea3bae79d 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -79,7 +79,7 @@ NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 NFS_UTILS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system
-NFS_UTILS_DEPENDENCIES += systemd
+NFS_UTILS_DEPENDENCIES += systemd host-systemd
 else
 NFS_UTILS_CONF_OPTS += --without-systemd
 endif
-- 
2.46.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
