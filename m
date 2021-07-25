Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E48BC4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:58:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE1060F26
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 07:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AE1060F26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3043740122;
	Sun, 25 Jul 2021 07:58:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9HSgICtrKCSr; Sun, 25 Jul 2021 07:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D55640116;
	Sun, 25 Jul 2021 07:58:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E4D21BF48C
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F199D403D7
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 07:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fd-Z-SMT0qay for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 07:58:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ECC26403CF
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 07:58:52 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id r2so7165372wrl.1
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 00:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CJtGu0fpfkruR0ohJZjjUvb6lod8Ifv4cD6C0Y4rpg=;
 b=N0n3RCD5ZcyeWTV5uZG2m8XtoXP6x31vhVwUhTbXbfooIvodb70R0jxQ4wNNApv88f
 T8cQ35ZpGIhe/+lePhvCHn1EXDxo1Q0YsBj7q7t2Ng0QVSOJ0cdHDNpus4mRZs56j0x7
 45EQefnnKcqHjMYFyZCDMfpCbp3mHMZGms979+WmuElYcKMkQzNuyDGKe2f/IM3Xese+
 7JCJBrmrAFQtKcTXEtupDHXjeHGETsScw127IJoibIlBBdurw4pEwwoRCUUMTLcF6TSq
 Xz9HcsE0365UWcBNO5+QafhhzdAqk+plammqmUii/PJXwVy445EI4h4JE+mgvU3QdrC8
 gtaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6CJtGu0fpfkruR0ohJZjjUvb6lod8Ifv4cD6C0Y4rpg=;
 b=J8NzKUA+TnH4KArrXf87MZfM9sWThUGkGhCMIDQTygfrE3XIqsTS3r9aQlACUdk11A
 Ka0fpsPrH1d6XvaKPXEHyCTXzGgMIrLENtx7D30xXCbpQ+iJEms+Zwn0PHhTsWSjozz/
 AIHKCTEu/zyMpvpbyFUp786pQ6917jIDJ1k+j73I/Dwr9r6KNmoiLBjAILA6/bTK8RWq
 7PLbPvBG2k5bwl/KvEKmOt5tIaD1FfTzIqVNI+Y5F0qzPQuc4on3dXBClSvLgEkMnBAd
 uC+dmRa00ctEVeXjNsbBF0uTVMXeGFQvoz+Mn/otETLTE+bU6Mrg/FIYFQ8YE3ucOhEs
 SKvA==
X-Gm-Message-State: AOAM533MsxVd4Z3gL+hmC/V/pmcTkoufYCBAxRnfeyMZ4tzZyqSxJwZd
 NThj54hbKHfLzfm807XXh3+OdhP+o/eiWQ==
X-Google-Smtp-Source: ABdhPJybkMRMVhpvCeJYnmc71b55Pm4qBTsyzXxds918muPDCMLhvSd99UpwEe24YM8gBxly9q8IfQ==
X-Received: by 2002:a5d:640d:: with SMTP id z13mr13496231wru.24.1627199930968; 
 Sun, 25 Jul 2021 00:58:50 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id f2sm37852964wrq.69.2021.07.25.00.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 00:58:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 09:58:41 +0200
Message-Id: <20210725075841.855929-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/minissdpd: add SELinux refpolicy
 module
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SELinux support for minissdpd is added by the services/minissdpd
refpolicy module.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/minissdpd/minissdpd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/minissdpd/minissdpd.mk b/package/minissdpd/minissdpd.mk
index 214af76387..159c5855c1 100644
--- a/package/minissdpd/minissdpd.mk
+++ b/package/minissdpd/minissdpd.mk
@@ -9,6 +9,7 @@ MINISSDPD_SITE = http://miniupnp.free.fr/files
 MINISSDPD_LICENSE = BSD-3-Clause
 MINISSDPD_LICENSE_FILES = LICENSE
 MINISSDPD_CPE_ID_VENDOR = miniupnp_project
+MINISSDPD_SELINUX_MODULES = minissdpd
 MINISSDPD_DEPENDENCIES = libnfnetlink
 
 define MINISSDPD_BUILD_CMDS
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
