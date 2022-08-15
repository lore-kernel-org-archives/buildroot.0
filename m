Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24789C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE9841504;
	Mon, 15 Aug 2022 09:49:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FE9841504
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w-ez_t3JoW5v; Mon, 15 Aug 2022 09:49:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E562415FA;
	Mon, 15 Aug 2022 09:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E562415FA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E36AE1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD38740AAB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD38740AAB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dq7qpkBgT8fg for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:49:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6BDF40AA2
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6BDF40AA2
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:49:45 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 s11-20020a1cf20b000000b003a52a0945e8so3669087wmc.1
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 02:49:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=l3W9PaRa0xpYQcdjaI465V5kIg23pg0beyvGyU26GpM=;
 b=OAuVuxPAJEAjNWXQa9Au11cfMDDXPXU899LFd+CM63rXHnGFJmMuy8K0HJ88e+cfui
 /7mvu4yQ906cGfkMoZA6KpFV8h+4IkZ6Z1lZm7FJ7vyhctrWAqBkhd9YQJ7IOVisqh2l
 0NbCDrqzuopl7VdMNJVYaYtTpHpgEiCgYsMzcQ/rYkkvdj4NHb1g065xiytAUlAMDvDh
 7UdJyzZ3lw99Ypq+aXD9JMyc1ECyifX0Uvj/CvIcEKtQbOgujT296feWKiyQz3qp0/wG
 rWXX5zFIotaueq42XRWixRAV91JVzYNo1OtSh48vI7Cb8neEMZcBt2XNVg/fX966nmZj
 /X6g==
X-Gm-Message-State: ACgBeo2b54xXx9Qk8n/wPFLdAEnyRpi+uPzJPqTdHg3OuaCwB0rLbnO/
 8blcQEXBT+je1dTRv0xgz/zJgSJfNtE=
X-Google-Smtp-Source: AA6agR6vZniE2gr1cTRX5kFAVaT5P1KeLl4DVm+ko+hIXYWCVppFXvtLazekT/rUQhsEg/e2/6pCIg==
X-Received: by 2002:a7b:c04c:0:b0:3a5:e442:554 with SMTP id
 u12-20020a7bc04c000000b003a5e4420554mr5076248wmc.130.1660556983435; 
 Mon, 15 Aug 2022 02:49:43 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00a02a978cbcfe81d2.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:a02a:978c:bcfe:81d2])
 by smtp.gmail.com with ESMTPSA id
 k4-20020a5d66c4000000b002217a25ba8dsm6691771wrw.44.2022.08.15.02.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:49:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:49:34 +0200
Message-Id: <20220815094934.296837-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=l3W9PaRa0xpYQcdjaI465V5kIg23pg0beyvGyU26GpM=;
 b=ICX7ZEUuKT8P5NHvNHP9oriBSE1IFSgUmjR4xs24nbKxVFYTnDgbeOT547wUA2v9xP
 EPRdjtPpp1WD4ef0q8KVjYHIaQDI7vzzPDDV6Qq+y842IKlW5W36TfFoR2AE0j/mqOo7
 MIOE5gXtLU7PfMWvcuVHaQQhEaD6WwwPTZAE5ldF/CucFvsOcpAdrY2BK3yIzOdrVDgp
 ICSDuu8rN63ks76lTXYWoesPTpb1rJzL/CDSnJNepXPakzd7o6az396U4R5yKmH0F3E6
 NdOJ6BN+A9Vz2g0LxWufmQuM8CI/8ayr9cfyDiS8iCDnlUlG94bW/ojz8JgW2v6BXP5z
 96DA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ICX7ZEUu
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: add zstd optional
 dependency
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

zstd is an optional dependency since bump to version 1.7.0 in commit
bbc52f3ff382e4c50baea2e1876a3f6ebf77a851 and
https://github.com/makedumpfile/makedumpfile/commit/afd0a6db2a0543217f8e46955a1b44b71f7e7ef3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/makedumpfile/makedumpfile.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 815a159b00..868c681344 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -31,6 +31,11 @@ MAKEDUMPFILE_DEPENDENCIES += snappy
 MAKEDUMPFILE_MAKE_OPTS += USESNAPPY=on
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+MAKEDUMPFILE_DEPENDENCIES += zstd
+MAKEDUMPFILE_MAKE_OPTS += USEZSTD=on
+endif
+
 define MAKEDUMPFILE_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		$(MAKEDUMPFILE_MAKE_OPTS)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
