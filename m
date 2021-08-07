Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB85EC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:17:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E63D61057
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5E63D61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15EF283843;
	Sat,  7 Aug 2021 20:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id APUAv29osa49; Sat,  7 Aug 2021 20:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C866837C4;
	Sat,  7 Aug 2021 20:17:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9BB571BF3F7
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8369540144
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:17:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mP0cEv-Dt6tt for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 20:17:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 635AC400CC
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 20:17:25 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k4so2668268wrc.0
 for <buildroot@buildroot.org>; Sat, 07 Aug 2021 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PKV+il36tZYsajFY5BMX3l1I3t+b4mKDuU1uk2Z35vM=;
 b=IZ44qtNQA9GqX9c/vT24Hp39QbI6YH/d5Ka8JXB+EArkvGcFqZuL+QLFPJNvTOFknl
 ys2AB9r022mXAUAcfxIVryok1cSU6xD3ZnqW2vPrZvsE2Vfs2aeG5I5+tdZ1fli45Qjg
 5VJFIP8xS7gNK0PpO/6uIe+8l9JmSJirtlQgNFUISexX3hA0Mt9WjtLkysPgEWGz8jY9
 /9rrvEERFbXhAJLKXotHmiqEKTfgQ3ipag2VoxCxoJ0EcQkcOzD5sJPkjyXLQTjBT3zP
 M+R6dOV7mOBp+EuQ5i8CRMKhDyAkxRJco07BsnxEaxS06rqGj3vee94lxK+XSw8vPhHC
 mjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PKV+il36tZYsajFY5BMX3l1I3t+b4mKDuU1uk2Z35vM=;
 b=RSyTocYqWe8NKKFemNSD79ghvtpQxKZYNB+qJpDngrvaxW2pKx1cm44staEaeU+h9y
 tyIbLywrZ0uofYharEMFxxrjdtnAotT3UaNYPGQpZF4vl6ePwKN/+xHxhRXh9R4cZgdp
 /VraPrWatPVjpYIYMnd6y4LP2oFU8Ey5ak/IBgG9EhlqxG1GtLmkaHsfmtOYEnsmwIYm
 ElZ7W6g/cQ0bvdiqW/4NEumXKUNKxMzjZDgoUSQc8OvFjMb9p30uecfIeUd09f1AxFJs
 fGUNMHymfEmhCsbrwqHOl//CqMoabqOxecyR6VSKfTvVzlumjtyDCYrOkB6vhj2xhhZk
 auWQ==
X-Gm-Message-State: AOAM531Rdd34//6Q8bAQamwNiA3VIBtS4mn+JJH0/VnTlJHPdw/Qxz71
 j+t/eAhNmvReWDVXEg6yDF94qPpCea52QQ==
X-Google-Smtp-Source: ABdhPJzbuc6dcgI+splHoVpcgYWghAfZk7eQjs/oFiri3FiT3deZhV7NOyp/FfNuCh2Eg6R1Rwhjvw==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr17132087wrr.373.1628367443253; 
 Sat, 07 Aug 2021 13:17:23 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id f74sm12732283wmf.16.2021.08.07.13.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 13:17:22 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Aug 2021 22:14:28 +0200
Message-Id: <20210807201428.1796318-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/guile: fix build on riscv32
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

Fix the following build failure on riscv32:

system/base/target.scm:132:16: In procedure triplet-pointer-size:
unknown CPU word size "riscv32"

Fixes:
 - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Yann E. Morin):
 - Set wordsize to 4 instead of 8

 ...stem-base-target.scm-support-riscv32.patch | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/guile/0004-module-system-base-target.scm-support-riscv32.patch

diff --git a/package/guile/0004-module-system-base-target.scm-support-riscv32.patch b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
new file mode 100644
index 0000000000..a988d2d995
--- /dev/null
+++ b/package/guile/0004-module-system-base-target.scm-support-riscv32.patch
@@ -0,0 +1,33 @@
+From 6142350d7c0562b0525462abdd41309ae0faa2eb Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 6 Aug 2021 19:49:37 +0200
+Subject: [PATCH] module/system/base/target.scm: support riscv32
+
+Fix the following build failure on riscv32:
+
+system/base/target.scm:132:16: In procedure triplet-pointer-size:
+unknown CPU word size "riscv32"
+
+Fixes:
+ - http://autobuild.buildroot.org/results/6705630c1484239ec8b73d57ebc2e2570fbfc8f8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ module/system/base/target.scm | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/module/system/base/target.scm b/module/system/base/target.scm
+index 2088cd866..dba46664d 100644
+--- a/module/system/base/target.scm
++++ b/module/system/base/target.scm
+@@ -116,6 +116,7 @@
+ 
+           ((string-match "^x86_64-.*-gnux32" triplet) 4)  ; x32
+ 
++          ((string-match "32$" cpu) 4)
+           ((string-match "64$" cpu) 8)
+           ((string-match "64_?[lbe][lbe]$" cpu) 8)
+           ((member cpu '("sparc" "powerpc" "mips" "mipsel" "nios2" "m68k" "sh3" "sh4")) 4)
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
