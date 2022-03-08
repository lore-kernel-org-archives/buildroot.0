Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6824C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 17:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DE4E812EC;
	Tue,  8 Mar 2022 17:49:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JgK-2K6kNKPX; Tue,  8 Mar 2022 17:49:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 727B9812DC;
	Tue,  8 Mar 2022 17:49:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D84631BF86D
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 17:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7FE44152A
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 17:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8rnHzDkVXwR for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 17:49:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24CFB41529
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 17:49:16 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id r65so11657016wma.2
 for <buildroot@buildroot.org>; Tue, 08 Mar 2022 09:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4DfUiBYr+HMqwIsZ6QaNF3CXI6N1TGIM8ocdhlIKuuE=;
 b=iPGXKUbB2quHgaweoBje7Qvv3XNv428VeK3FuXaCZPIuveR4iQmwxDWEOKNYSHZbME
 2IMEZ3C/BXuAy2mN0BWR0+JM4ExGkPkSkEY5Uy+YWnXvdcbc4eiDoNQ0xlHdolaf+I06
 tRgFm8Eb14WsSzBWlcrg6FLt3ihEJ3O9o2w28JvK/WYGh3R6Rq+cPlwBa+neReq3zWdZ
 QaF6c1z1IMpQI94bnCx1JubeiulDA1CHloQfc3yF2xetVHyNAcYXoMTONpwmbFYOlelg
 fo6s5u/0iKH0J1sJ9H1UtA6RdTHlnE2NtvMLIWUbcOP2GrsGNqGTIlnDWajVz3U4hUur
 LMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4DfUiBYr+HMqwIsZ6QaNF3CXI6N1TGIM8ocdhlIKuuE=;
 b=L2J/OlQpjUiiC/b+Gi1kHpql0dqJ0IR28V9QGSGI/pj8LF+TXqG4aFm2lPCnKHXAGU
 wF7blWjDiD6WJ0/GeFZXFf7EU2EvAMligkkTU/FyuNs125zuQJu91TZrkUXPmAAGIS1t
 cM26VvqXegX0ITSEC1LOEOK7/LkjmsdcDaTIjWSW3FltWGlUVo8qyhCGGUoxXxChjfiQ
 vsNv/aQLd5hQo+YarpyQ4Txw/S7XH1DWAzZpon1vOnZ39aIwMFftLAUalRSfe8Grgbi+
 +ecsVdBkryfvRaYR2KKpICc3uXPcVzSbFKol8qvp+HeRfKEjhzmtF3U1IGWD1wvI65Nl
 3nUA==
X-Gm-Message-State: AOAM533Lp3GXIFd7vCUcIPCLdkKiMQjLVTkYCBZYU8uLYoFE9ijw1il6
 VkA6gTtikH5zS8UJonyZyy+cqtErYbg=
X-Google-Smtp-Source: ABdhPJxT/IhgTifoP9L7QijGy97JwhH7U2GhPxOng6Z02leP7DmPfLb6Ru5pFVsvPn0vLuiuM7F0Ow==
X-Received: by 2002:a05:600c:354d:b0:389:cf43:da5b with SMTP id
 i13-20020a05600c354d00b00389cf43da5bmr350555wmq.197.1646761754083; 
 Tue, 08 Mar 2022 09:49:14 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfd18e000000b0020373e5319asm686421wrc.103.2022.03.08.09.49.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 09:49:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Mar 2022 18:48:32 +0100
Message-Id: <20220308174832.1414005-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/oprofile: add s390x support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

s390x is supported since at least 2003 (see ChangeLog-2003)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/oprofile/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index cce2cfdab8..eca43d7ac3 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 	depends on BR2_arceb || BR2_arcle || BR2_arm || BR2_armeb || \
 		BR2_aarch64 || BR2_aarch64_be || BR2_i386 || BR2_mips || \
 		BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc || \
-		BR2_powerpc64 || BR2_powerpc64le || BR2_sh || \
+		BR2_powerpc64 || BR2_powerpc64le || BR2_s390x || BR2_sh || \
 		BR2_sparc || BR2_sparc64 || BR2_x86_64
 
 config BR2_PACKAGE_OPROFILE_NEEDS_LIBPFM4
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
