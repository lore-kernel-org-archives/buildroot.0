Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6C0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 15:50:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED02B61156
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 15:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED02B61156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9226F60607;
	Sat, 13 Nov 2021 15:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGuk6ge__k6T; Sat, 13 Nov 2021 15:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BAC926062B;
	Sat, 13 Nov 2021 15:50:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 705611BF306
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 15:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E45E40275
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 15:49:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOW6_ZkT5yU2 for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 15:49:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFDFB4010F
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 15:49:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id w29so21080145wra.12
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 07:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wjt2QOme9FPCKZxmphmPNSFPKCROpsIzZXoPeS1up+g=;
 b=HhfFDX4G19+tLFQDPyh5lbTGXbtE88GGVhkHGRHch1nNi8m6ZmzBRIPtvRmx/BJBqU
 gjE+d8i0AxV9cPRxfK3e2P3O8DX2Cmdadt0vYn4/4xmS77ZYfJTRskBhey9OjztQqLnJ
 T/XNltbefDNtxCof8rbS2l39YRUM3YmKyNlkyJWutw33SRkGCcSLwhWnR+jXCYLvEm2d
 rYppNJPvbKrZErpoKhPfR+JLCj1PZY7WgngbI0UTH/Zi4uYySzW7TglYZOxJeLP2VV77
 VO3mu/eAMXpPY+CnKwxokEG9B/jgY/vHV3YhcPFkIceh8HNoTpgnmaOZrp9wk7RSNr/n
 WknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Wjt2QOme9FPCKZxmphmPNSFPKCROpsIzZXoPeS1up+g=;
 b=0b/kqmB8/o2J1d3h25u8Nq7kRtW/DnWrg+6L3L9WSEXUxVznbfYPPVKj5bwP+YFshX
 Aj7XrESPo/nx2BbepEtSvP3WmgL6rkrMVB9aq90UOcGbpKlI/k+Ufdrla6FyjU797UJF
 pO+cgclS9bhtKH13gzo9TO0QPKKkFKEJ/olrUJ51hxtm8QnQgOXO4AJsXpo1Y1C4boft
 WS+w8Dbi89rf5UY/aPe4UlOiL2a8o1EC4BW28CnXWELB4wf2A+sBKAhMq80zSRc3AGyz
 egWHZbYuZDbQhbknLaXPjg2+o+RMJ0KUoDPAaqnnUVQe90YTHb2IT9ib/yxysqhgCTw/
 PmcA==
X-Gm-Message-State: AOAM532vVfwUDRGvGGpzjvZ8S+Bxk3J6sEiWjY3JWQbh+upAZHsvwxzY
 dezj+KvE3TgH69LYgQ3R5kS8OEGJwJ4=
X-Google-Smtp-Source: ABdhPJyq8qpRkbGVou1rDej9Sljtv251R7/SuI8KL9q24uoyDYM4JWZzmfkwHuOBbDQUy84dF8bjbA==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr28642744wrg.433.1636818595573; 
 Sat, 13 Nov 2021 07:49:55 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id w15sm8740169wrk.77.2021.11.13.07.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Nov 2021 07:49:54 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Nov 2021 16:47:46 +0100
Message-Id: <20211113154746.543324-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/diffutils: fix build on or1k
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

Fix the following build failure raised since bump to version 3.8 in
commit 1f89c80417ad03127650b22c41ec4e30d42c549f:

sigsegv.c: In function 'sigsegv_handler':
sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
  979 |                       : vma.is_near_this (addr, &vma))
      |                            ^

Fixes:
 - http://autobuild.buildroot.org/results/5427e52489d29ed4f18b4a70b3c36f0f7bb0ddd9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0002-sigsegv-fix-build-on-or1k.patch      | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/diffutils/0002-sigsegv-fix-build-on-or1k.patch

diff --git a/package/diffutils/0002-sigsegv-fix-build-on-or1k.patch b/package/diffutils/0002-sigsegv-fix-build-on-or1k.patch
new file mode 100644
index 0000000000..73385fe9f7
--- /dev/null
+++ b/package/diffutils/0002-sigsegv-fix-build-on-or1k.patch
@@ -0,0 +1,32 @@
+From 496c1740e5475be85b65fdb2b143771f09ed27cb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 11 Nov 2021 10:06:31 +0100
+Subject: sigsegv: fix build on or1k
+
+Fix the following build failure on or1k with diffutils 3.8
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=e54aa6196947ed22ff66bcd714e4fc7bd0c5c3b4
+sigsegv.c:979:28: error: 'struct vma_struct' has no member named 'is_near_this'
+http://autobuild.buildroot.org/results/5427e52489d29ed4f18b4a70b3c36f0f7bb0ddd9
+
+[Retrieved from:
+https://git.savannah.gnu.org/cgit/gnulib.git/commit/?id=496c1740e5475be85b65fdb2b143771f09ed27cb]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ m4/stack-direction.m4 | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/m4/stack-direction.m4 b/m4/stack-direction.m4
+index 70286c8f5..29e398d77 100644
+--- a/m4/stack-direction.m4
++++ b/m4/stack-direction.m4
+@@ -45,6 +45,7 @@ AC_DEFUN([SV_STACK_DIRECTION],
+       nios2 | \
+       nds32* | \
+       ns32k | \
++      or1k | \
+       pdp11 | \
+       pj* | \
+       powerpc* | rs6000 | \
+-- 
+cgit v1.2.1
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
