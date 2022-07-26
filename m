Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9E4C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 14:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C19B419D9;
	Tue, 26 Jul 2022 14:47:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C19B419D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 187PKZchHdZA; Tue, 26 Jul 2022 14:47:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551B24196A;
	Tue, 26 Jul 2022 14:47:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 551B24196A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8E5B1BF276
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D165D40169
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 14:47:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D165D40169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fN9i1TXElrMg for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 14:47:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02B1D4015F
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02B1D4015F
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 14:47:41 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id b6so8889385wmq.5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 07:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oTygugz7rcgwIwtoPChut8CGTVRUoPRX057PD37E6Ek=;
 b=RGgRX5aWXevFLz+Lb+KNTroBomD7emOboSB2oQE1G8lMFfIqe0Siir+VHEzLiwazfX
 mi+CKXFsN/nGTd4hsk7GEsGaGltZw4fQ8feAtsU0i8/6K5gSC4fuImnmQbRnEJC8pGai
 l5EwMOSyE3dFlQ0CtV9mm485my+vIKsVeuc4F0qFKKei4lQKeDkBl3HpLi6nWmpYqW/p
 Qnnz0uJo9KKL2ybYn5LX/boWYTXFNBwPQwrLdTLReEL4hJ7HkZwBFY/zfjBI4DkT7rCB
 7pqq0logCkY1xzzUdiqwID181yHBQzonykp0t8m7Rd3NZwJkJjv7qhTYvHrs83gi5GQt
 22dA==
X-Gm-Message-State: AJIora8e0w5ycmwPBa1bCQu+hHnSKI/7jEfIxBHp/oIA5fqFn8HsBIZJ
 Jp2V734Io+E8KkGEjTrbW6v5SvUlzGhN1A==
X-Google-Smtp-Source: AGRyM1tOXxkhV92AdsAduMOrqEBYFm8+DrKQoFxx/MsHKZHR8FeZvudmabpU015lNARtRzRPLFh0Lg==
X-Received: by 2002:a05:600c:3845:b0:3a3:19e8:829e with SMTP id
 s5-20020a05600c384500b003a319e8829emr24703034wmr.11.1658846859898; 
 Tue, 26 Jul 2022 07:47:39 -0700 (PDT)
Received: from P-NTS-Evian.home ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a05600c1c9300b003a31fd05e0fsm3820462wms.2.2022.07.26.07.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 07:47:39 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 16:47:37 +0200
Message-Id: <20220726144737.694203-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oTygugz7rcgwIwtoPChut8CGTVRUoPRX057PD37E6Ek=;
 b=vqhADqYQD3NPqCJXgk2WyiWhoWiu5vvEvk1zwQQxfJJkJPqXHfnDtO70Nq8Giwxkgq
 jYlsXCnyJmPlapDpeJZvTzKBBJo0W/y39eVG7qJG+romL1nTTklBjemtz0cm4P6q1BmG
 J6MKl1zdzauipsdzzAV5n5aU1BPhbDUQdf2tkSAsZNazpWnI6hWOapUMUKbPGHuPGZb9
 GRapOky58H1rGON5rvCbX7l5L4GGpcGJe1FmnccSyAEShLEThGc7B9ZBOAfgj3AWQvR8
 r6Q4CcTnmlaybk/tOipSNsqcjmedvzNjqlzzNn6tb7SWyG9yXFo4fkIgRp99jWX1T9Hx
 HNzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=vqhADqYQ
Subject: [Buildroot] [PATCH] arch/Config.in: BR2_BINFMT_FLAT remove
 architecture dependencies
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit [1] removed the Config.in.host file and moved
the arm, sh, sparc, xtensa and riscv-64 architectures dependencies.
But this list doesn't contains all elf2flt supported architecture
and break the host-gcc-initial build for m68k.

Since BR2_BINFMT_FLAT is only available on no MMU case, we can
rely on BR2_USE_MMU option and remove the architecture list.

Note: SH without MMU support has been removed by [2], sparc requires
an MMU since at least [3].

[1] 9db5eb258cf492567bac33a33cb606f14045639d
[2] 04ea3d38dd76f4e96f4961143d674aff59b13d3f
[3] 29563047e074a7c0b73c9e6b629d08bac1e07cb5

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 arch/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 442d6b0075..9135df9def 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -388,7 +388,6 @@ config BR2_BINFMT_ELF
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
-	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
 	depends on !BR2_USE_MMU
 	help
 	  FLAT binary is a relatively simple and lightweight executable
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
