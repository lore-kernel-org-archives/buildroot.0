Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DC5C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 16:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3A85408EA;
	Sat,  8 Jan 2022 16:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZlyNwysKESHU; Sat,  8 Jan 2022 16:51:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E83840871;
	Sat,  8 Jan 2022 16:51:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E9D41BF599
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3CD4D814BA
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 16:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8pzvp5lh581K for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 16:51:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E7F3814AB
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 16:51:14 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h10so7418504wrb.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 08:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+fI99jghWaGsIRMUmfX+VgaqQ8wkY7LTKSEJrgcmJY=;
 b=aAo6zs5OfFZxHc2B+cvP5mCNpwna4j9k+/iP+USTQV5Nhy+nOftIfVGaNPDVmXN6LP
 qawLo3ik/haiahhjyLiy2flvJm25qM+qvC5SXDAqLcQ5JE9GK8/f6z0wsqbPDoyNkshR
 B9ji7pFaZZsPA542IoSA5mWtccB2J/ZFL37NhGZ/zGAYHkA+6JIK/z6iMJ+Ox2S2bpIH
 S+cpsfk2jhQXImlw3Pt+6GiHSrH+FNsva4Cp5ycAKDRx0IYRZiKiTqLPSF2Q72Y09KP7
 /nA3drc6nO5T6/g/pXpXNjkJ2rOSkRpQaKEjB4CxhGaPqCjwmGu5+a0yEDyQHefXoXLa
 +qQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A+fI99jghWaGsIRMUmfX+VgaqQ8wkY7LTKSEJrgcmJY=;
 b=oQXoaeSlQoVIzFX3EF2QpQeNqn/iboZ8hgSOxzVJYNIfEhX3TrRLpPmX+9w77+45Sx
 v+fE8TeybX9Nk4LYmBqWYjzvwdbs62q48P6A3eaCwpMh8xAy8z1bI3CURkyc+mLBXGQO
 J1TaLrH4gOIHkRWT9V77HJWeKQskj86lfRh+o3/xBvLylkPJ46FYfVGCj+NCDFyeeDsc
 3Nxsb34EnSnbNJBqFUGx3/kfXbZ/wI+xK7DO9Ghv6sRHRpr9EHpb2M37MxidhsaoPSOd
 zUusCp8WsUaVVHzWGOEgwe5/JIaAik7X/6SxQ5AY748qBAqXW+ZPKon4YNwNRoDl0gKW
 FsCw==
X-Gm-Message-State: AOAM532IURQfDOZk/CkbKmZjyvhH/1kUOxzGM3pozFm3R2wbC+K/tG/F
 kWMfu/ffDp+HCQt6RQLBQtdpkG/mZ8Q=
X-Google-Smtp-Source: ABdhPJwQxRl9xx6VyAPABUHraybSQOIgOxJnxJK6h2EmwfB5Xb2tepCglyljdl4IVuyqOnu8wg7pLg==
X-Received: by 2002:adf:9ccf:: with SMTP id h15mr14179674wre.120.1641660673195; 
 Sat, 08 Jan 2022 08:51:13 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id ba18sm2039523wrb.40.2022.01.08.08.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 08:51:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 17:50:03 +0100
Message-Id: <20220108165005.2737902-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/libpri: add Linux in comment
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add "Linux" before kernel in comment to be consistent with other
packages and manual

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpri/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpri/Config.in b/package/libpri/Config.in
index de2d96fcc4..0684d2ac83 100644
--- a/package/libpri/Config.in
+++ b/package/libpri/Config.in
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBPRI
 
 	  http://www.asterisk.org/downloads/libpri
 
-comment "libpri needs a kernel to be built"
+comment "libpri needs a Linux kernel to be built"
 	depends on BR2_USE_MMU
 	depends on !BR2_LINUX_KERNEL
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
