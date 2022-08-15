Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE620C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 452A541505;
	Mon, 15 Aug 2022 09:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 452A541505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siFCMllK_URn; Mon, 15 Aug 2022 09:51:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24425409F7;
	Mon, 15 Aug 2022 09:51:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24425409F7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9AD1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 336936068D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 336936068D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id noxVeFiX-Z-R for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:50:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E32060AF7
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E32060AF7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:50:31 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id b4so5351056wrn.4
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 02:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=LMRNmcO+emKZp/YmmoKTxIZwJEcb5eAnoi03MJk5nbM=;
 b=Wf/l94GAlBkQ7hSgWYVIOMQkE1Hlf6jbILtaCgyavNcjfMI9saRtjvW3F/4wp1akmM
 PbYyKw0QkrvXigCuue+dXtuxkq46wX+eMteDOuIbN3g2ce3oJTqcV4pslv70dd6vrDTa
 ulIzNFk6HNVrfPuDwDYc+uVYBit3mQI6jGfoGKPpSI4VCQiv8FquVx7ZvmmtyE0yRoo2
 t7CY+HWWABWcWGulGuDJAXaZqBm4bebMIspMbcJviK5mT6cIaJFsIE47MkbOa4KoPLtD
 D8+q3pfwajTElApWFoXHuCM8/1atqRRHNOp+l7HwYKiM5dlAUwCcmZFscYW006RP3vTk
 CpAw==
X-Gm-Message-State: ACgBeo0MawNUZK69sStbKvcom8HXQ0q0/LoBLg10MfJUk+ExNwdycEdi
 ax6pzt9TQfRpIkGKSXWsAC4VVltltNg=
X-Google-Smtp-Source: AA6agR7NOY03mVKy1dqFsQq4dS2Ti+cMEtZ9Yinon5ttZV/Ym3L3A9SMuW6TJfg1uChthb65pNXyrQ==
X-Received: by 2002:a5d:6b12:0:b0:21f:1568:c7e1 with SMTP id
 v18-20020a5d6b12000000b0021f1568c7e1mr8226474wrw.532.1660557029216; 
 Mon, 15 Aug 2022 02:50:29 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00a02a978cbcfe81d2.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:a02a:978c:bcfe:81d2])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a1c2706000000b003a511e92abcsm9132932wmn.34.2022.08.15.02.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 02:50:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:50:22 +0200
Message-Id: <20220815095022.297076-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=LMRNmcO+emKZp/YmmoKTxIZwJEcb5eAnoi03MJk5nbM=;
 b=K2rau6COWdxFj1eonDHc/3VwqWYto5HqoepqiywPD2ieK9aD0/KvUkgd0P0OwFSQzJ
 hv3hk5X39ux7+adw5/ciByFPpCnZoLxWhAxwJbtCAFcK09spB/rnt9NA6hBbbyWRLzPh
 9xXYQ4fW7ODXPoki18Fu2w1xii8j/DKRubqiM3hfcLYQ0U32jlZ/XUhbU4P4QfZSL6FW
 +DChf9+KaZo8fbwuKUExRYezIcOIlfsX5qwmEAMeSmcn74ql1T/ODw8hpwCMvC3mPgHc
 juILRz9IPiwZlX3tg5foZAaQ7L6TAm6Y7xdbupZaEDyNZlu4uVaXf6EgUQuPyz3hx4cO
 rzjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=K2rau6CO
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: add mips64 support
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

mips64 is supported since bump to version 1.6.9 in commit
cb648d12fa733788cd2ea8e0fa8b00bb95983c4e and
https://github.com/makedumpfile/makedumpfile/commit/7f185d29aa1794a82a090c748aae2f7bf240fb49

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/makedumpfile/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
index d5af38b598..62549f851f 100644
--- a/package/makedumpfile/Config.in
+++ b/package/makedumpfile/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	default y if BR2_aarch64 || BR2_aarch64_be
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386 || BR2_x86_64
+	default y if BR2_mips64 || BR2_mips64el
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_s390x
 	default y if BR2_sparc64
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
