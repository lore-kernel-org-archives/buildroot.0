Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9BCEB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 22:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52D58415C2;
	Thu,  6 Jul 2023 22:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52D58415C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nTR_FIuxXRmT; Thu,  6 Jul 2023 22:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 957D2415BD;
	Thu,  6 Jul 2023 22:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 957D2415BD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E45651BF4D5
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 22:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE05D6113E
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 22:26:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE05D6113E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EhI0kJcxOXOV for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 22:26:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 966CA60AE6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 966CA60AE6
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 22:26:33 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-98934f000a5so154779666b.2
 for <buildroot@buildroot.org>; Thu, 06 Jul 2023 15:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688682392; x=1691274392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dJvIMnlQeob3EoczLS8gnxMJzcR0Hq9tQ6V8geapPyc=;
 b=CGQXJC0Snkkmd46MyssfeXVMN0Cl5jpGaXQqE5v0jaRPok9PNnM2xI10HO+qd/3Hdq
 fqBMImV5UqE+Gqxhny73K4evPM7YLOtg4fpV3VbJUJVmOb2t09+cUo5sKM1xk5+IJny0
 NXYHypuRGJmtcktr/cvG3dhfoI94qVyGwWIgNMNvgPISjzXjVdQI0/e062etgvCqGS32
 K0XWfPwhnjI+tsYfwXQWE0u4BRuGIxfa5D1bAMSOyjT4n1q3S8xLMhobLj7VIegKac4v
 lw6TQn2fS2pev6YS46uxobdBfVX/d+tDVPcWzZS0RE9Lqx/nsjdNA1P8zBpcAuhaqk+9
 COKw==
X-Gm-Message-State: ABy/qLbbP8d1XeayITn8W190eaZyaVLXv7MZ9oJPlE6u1C+gNMoYEawM
 FhAjjUvmAGh+N1BaMcLTV7lAWpCNfl4=
X-Google-Smtp-Source: APBJJlHzFkaxu1ZTRkycP+fuwpCX70g4WacEQBk/DtM0vWJCZa3Zh+AomIe31uuSOAtEgvIhzAwutw==
X-Received: by 2002:a17:906:2205:b0:973:ff8d:2a46 with SMTP id
 s5-20020a170906220500b00973ff8d2a46mr2308401ejs.3.1688682391517; 
 Thu, 06 Jul 2023 15:26:31 -0700 (PDT)
Received: from localhost ([2a02:1210:8629:800:82ee:73ff:feb8:99e3])
 by smtp.gmail.com with UTF8SMTPSA id
 mb8-20020a170906eb0800b009737b8d47b6sm1311022ejb.203.2023.07.06.15.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 15:26:31 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jul 2023 00:26:07 +0200
Message-ID: <20230706222607.287386-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688682392; x=1691274392;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dJvIMnlQeob3EoczLS8gnxMJzcR0Hq9tQ6V8geapPyc=;
 b=jsn2AeT4/W4cKjIJLkFNhPh+UNFNoFEhokd1sztrrooHvNP16WhWLFrlD08WM5UoIe
 BvH9n9GkKx8t7+jWSklrEjZRWqIRquR+EQRDxnZ9cfQPhflt3YOrYOb0h8axIflPUUk2
 uruqabSIXX0GGWs2tqJ1ViuPOcZrL5NDU7oVjxCS1bclR8osNxWvMGc/oN6+bidwqbYE
 LNjAJdjoF5zLty+2zCWNaBZSIbLkn97O1PdJ//FKoAC8WK1ncJbHbyc96Yy06YgODAx5
 Pj8HklpcnkwxDFdYydtLr8tXm0gkSounTxqHa+TGegNg4tWTyVPqHzVGD5CIQvbMpiL3
 yjCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=jsn2AeT4
Subject: [Buildroot] [PATCH] linux: add support for vendor dirs for appended
 DTBs
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Take the basename of the appended DTBs to workaround the following problem:

(cd .../arch/arm/boot; for dtb in cirrus/ep93xx-edb9302
 do if test -e ${dtb}.dtb ; then dtbpath=${dtb}.dtb
 else dtbpath=dts/${dtb}.dtb ; fi
 cat zImage ${dtbpath} > zImage.${dtb} || exit 1; done)
/bin/sh: line 1: zImage.cirrus/ep93xx-edb9302: No such file or directory

Necessary to support ARM Linux starting from commit 724ba6751532
("ARM: dts: Move .dts files to vendor sub-directories"), i.e. Linux v6.4+.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 1c4fe45ac9..1db5c6046d 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -468,7 +468,7 @@ define LINUX_APPEND_DTB
 			else \
 				dtbpath=dts/$${dtb}.dtb ; \
 			fi ; \
-			cat zImage $${dtbpath} > zImage.$${dtb} || exit 1; \
+			cat zImage $${dtbpath} > zImage.$$(basename $${dtb}) || exit 1; \
 		done)
 endef
 ifeq ($(BR2_LINUX_KERNEL_APPENDED_UIMAGE),y)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
