Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17190C4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 15:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A0B81C20;
	Sat, 17 Dec 2022 15:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A0B81C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HSMf4FjAt8MC; Sat, 17 Dec 2022 15:37:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAAF181902;
	Sat, 17 Dec 2022 15:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAAF181902
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98B221BF2FC
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 15:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E074818D7
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 15:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E074818D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EHDOH5eGAYXi for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 15:37:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5711381902
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5711381902
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 15:37:36 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 o5-20020a05600c510500b003d21f02fbaaso6001673wms.4
 for <buildroot@buildroot.org>; Sat, 17 Dec 2022 07:37:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P8Q+igVPhbj3kDyyMWpcdtcUAg/P1fZGJdMHN9CdfcU=;
 b=0jXzkupNz+1FPdrREFrbHQr5Hg5Rqw3kPEdcWYDqi0YdLB4ETxpobjcyEPsEBmERM/
 mEVDeFtkuB7LmTDBa8/ZxORCofLwYe+QapB2X10LZHv/9TU3BMqCEzilxSmHVPTtyZ1L
 qbGEfL5W9WwT2yd5MiQNaoZtyGPd2fpNEpDxb2niwCBrTmZwV5ASLhEmRlSDoeOqvsMU
 JMFHzmxwNb6D7EpXWXgwn13x+2PEJt0OLmdhLOdPCttfJUNTzxaSKSZHGHnkn3T2ypbi
 xn3idvJPzhLjxzCk9bTmQiCLdRhRLej+J3+1Z3TlUU5W/c+wP+vr4vKQ9HEwC0QM/BdB
 MSAQ==
X-Gm-Message-State: ANoB5pnxC98AcivLHh165vjVly0ujNpfUsbrWJWJ0Ju2tCXEgWIWQVq8
 QGyE7yv5V+OO8IPaEgM7AEoF/p7HvB4=
X-Google-Smtp-Source: AA0mqf7AVyB//fQ0HefvoCdAd4eT6el6rtfidDEYq+xg5KJ9pPtmX8ZhOxRlAAoWuz+5D9BR65rsnA==
X-Received: by 2002:a05:600c:540c:b0:3d0:57ea:319c with SMTP id
 he12-20020a05600c540c00b003d057ea319cmr29680740wmb.13.1671291454306; 
 Sat, 17 Dec 2022 07:37:34 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c228100b003d23928b654sm12933957wmf.11.2022.12.17.07.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Dec 2022 07:37:33 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 17 Dec 2022 16:37:26 +0100
Message-Id: <20221217153729.545952-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P8Q+igVPhbj3kDyyMWpcdtcUAg/P1fZGJdMHN9CdfcU=;
 b=LQtb99UFzS1Vv+K7m1I/V49ze7Rzip9rBEs1YFUnYhZwi6FaH6BneqiLJK5vnY7GL3
 9DhyQyNtTmIcSjKYFRdNhfcKkQGjSKA0LAmPdlSgXkJDabmRnvUtIiH1lf1LpAhksD1g
 aYghZhki44xtrKUf82XNM8BZeJeHalqclmQh03+mfEU+gokMZZK5BRvhHyPwBg/O+1jD
 w9Gtg09e+sS0VP3L9yPpz6spe1+wdq6M7YdXo8Nkg6LD6ptH6pB7UCWsXkK+oYUwtrw0
 gWJH8pR0c5iw60xK4Y5bu+bPpMb6V2oDmP/YNgimz8Qo6YXCMPJK/5OQZJDatIyOsxhI
 xrPw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LQtb99UF
Subject: [Buildroot] [PATCH 1/4] package/slirp: add host variant for
 host-qemu
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Qemu 7.2 removed the slirp submodule from their sources [1]
so we have to provide slirp library as host package for
host-qemu.

[1] https://wiki.qemu.org/ChangeLog/7.2#GIT_submodules

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/slirp/slirp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/slirp/slirp.mk b/package/slirp/slirp.mk
index 10d367587d..2ad71f13d9 100644
--- a/package/slirp/slirp.mk
+++ b/package/slirp/slirp.mk
@@ -14,4 +14,7 @@ SLIRP_CPE_ID_PRODUCT = libslirp
 SLIRP_INSTALL_STAGING = YES
 SLIRP_DEPENDENCIES = libglib2
 
+HOST_SLIRP_DEPENDENCIES = host-libglib2
+
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
