Return-Path: <SRS0=2n7N=M5=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6454C4338F
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:11:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D25660F42
	for <buildroot@archiver.kernel.org>; Fri,  6 Aug 2021 21:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D25660F42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E094401B9;
	Fri,  6 Aug 2021 21:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jYTjzg3fxAD; Fri,  6 Aug 2021 21:11:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28ED8401CF;
	Fri,  6 Aug 2021 21:11:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1A521BF5B5
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0543401CF
 for <buildroot@lists.busybox.net>; Fri,  6 Aug 2021 21:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R528DWtGy5I2 for <buildroot@lists.busybox.net>;
 Fri,  6 Aug 2021 21:10:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A591B401B9
 for <buildroot@buildroot.org>; Fri,  6 Aug 2021 21:10:58 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id p5so12663189wro.7
 for <buildroot@buildroot.org>; Fri, 06 Aug 2021 14:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=omlnOrfjRXlSGbhZvMwpJrpntiFj41K1t4gdgOHcxQY=;
 b=DgVwQ78MtzZFEE8Z7bBpg+n0k3J2eNFn9vjEoCuqLlgJSnBxk9uhENrLCfwP4MfRsN
 byHW3gBSXvxsGZU+sHtbebAfKCj+3L6iwHEqCWUjCeGOmVoIHEgB3M2Cig/muA4Bul18
 3wEKo46DUAs25S0p/NNakdlUTFk3/DVvznqWVx9nitg0+p5dMc3pJPpBWYnsy9ZCG0T0
 iXxMpFuk6g9ND9vI0og+knIxr6y2QkEvGNWy0uFVS0JvLt7qWjfQYN6GbE4NAFOYpwEA
 tUTsv8pW0D0SxVbQQC17ee2nRuO/Pd7zGrqwVRv/ccP49WMuIHZ1/bWiSq3he6UBwSZH
 uG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=omlnOrfjRXlSGbhZvMwpJrpntiFj41K1t4gdgOHcxQY=;
 b=JfJvsQQ0JzW8htSXhJN2eqjDo6t3Q0tWWVwWzAN4H7EEUb1OjwXGBiiBeDu+Nbd0JX
 wO7lnWiYRhc5+/xwYsGWlWJMJxmxfytHMjaP2DaFdLITk7qvFKTXTrGWdJ9a5hgYDalS
 1U8xqiI1Rne2vxHcLIHjqZUG1K4aJTPvUArO3aKaEzNx6e+g4JVLJxVrtmV6nJTFF9x9
 KSPLlzCBm6MQIzPoMDKKWpL76xJcATMch3zUIszXM+YKi6G3zXJYmB7wDeKJT942rvsp
 qj6zP0qeT7LVzSC3q+1aqz7EncJoKaJwvxjpzJC2t8yn4Ln/EjFgqXyg+wF9vK07q1YT
 jCkg==
X-Gm-Message-State: AOAM531nsdKXkuXwPzEQm2Nvo3alpx/BJ5pHa/3KwAZxs0JnE3Sf7kpx
 1gJBhO14jCY7Pwtc0R+JjvpYA47TABc29A==
X-Google-Smtp-Source: ABdhPJwCQUkzKqJ0ViRbVHZmZ1tjTfrQdQ+k+Nzio0+b9TOPxJrQr2p4Nf1uIVjgk9ePL3pCefUjNA==
X-Received: by 2002:a5d:4410:: with SMTP id z16mr12665406wrq.173.1628284256631; 
 Fri, 06 Aug 2021 14:10:56 -0700 (PDT)
Received: from kali.home (pop.92-184-97-136.mobile.abo.orange.fr.
 [92.184.97.136])
 by smtp.gmail.com with ESMTPSA id 129sm9482367wmz.26.2021.08.06.14.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:10:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Aug 2021 23:10:48 +0200
Message-Id: <20210806211048.115264-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: disable vhost-user with
 uclibc-ng
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Disable vhost-user on uclibc-ng as it raises build failures since bump
to version 6.0.0 in commit 6b86c9335fc3ff381878156c6243454d4b688df9 and
https://github.com/qemu/qemu/commit/810033be083040591fee2fc09f2f294670ed1930

The issue is that F_ADD_SEALS and F_SEAL_xxx variables are not defined on
uclibc-ng (even if MFD_ALLOW_SEALING is defined) resulting in the
following build failure:

../subprojects/libvhost-user/libvhost-user.c:1637:22: error: 'F_ADD_SEALS' undeclared (first use in this function)
 1637 |     ret = fcntl(*fd, F_ADD_SEALS, flags);
      |                      ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/9f393539931b51191cf7128e5c618c2398fc86c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index b2a9420b21..1854aed201 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -201,6 +201,7 @@ define QEMU_CONFIGURE_CMDS
 			--disable-capstone \
 			--with-git-submodules=ignore \
 			--disable-opengl \
+			$(if $(BR2_TOOLCHAIN_USES_UCLIBC),--disable-vhost-user,--enable-vhost-user) \
 			--disable-vhost-user-blk-server \
 			--disable-virtiofsd \
 			--disable-tests \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
