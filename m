Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148C1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:20:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A99E8611EE
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A99E8611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6D0EC400CC;
	Sat,  6 Nov 2021 10:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kxI8kTWlowBB; Sat,  6 Nov 2021 10:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A6C6401A3;
	Sat,  6 Nov 2021 10:20:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC5841BF2AE
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B188B401A3
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8J0vvi8cR1Xs for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:20:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86D21400CC
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:20:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id 71so9033598wma.4
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 03:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HYQauOYOFHMTL9fLZfM05jpexzwYRe0plsvCu+p4ucM=;
 b=WjdlJzFqeJrlpUrz+0zH+itB7BvdWpEInhj2ThZfFfUMSjA1ebi+c+i+8s7LiGJywd
 8N/R4Hg6b5CRVwZRz01uC4KGkSQ5eHE5ohACzeUs1oLorkXc1I37SCjsKhwZ/n6aBClH
 Ox2GuUf71uPD3uop8d0ibzjesqgylPxJxr6nN3/CHgJXkgfjuQ4JbiZehEmbPsBWZ7mN
 6/f5dIZ5utd8mIAGeXUE7UV4uMOJRykkRfYA+2iuXNG8FLt9EQqgu+I6DQER/5hhCD5l
 Ky3fCJY3RwvZZJ3AiSVcfXvr0+92xBDAnenQ4wyOXcfw6SJ7tXOZYk3Mj7XOh5IUVC8j
 f9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HYQauOYOFHMTL9fLZfM05jpexzwYRe0plsvCu+p4ucM=;
 b=DCzhVJr/vK4rmV3oJaFXMzITjkLArH/wQMouo4c4dts+6ECsSomKLt8K9PcrFCTKUo
 1V/e2pA7HCPJVMlJ70xDm+seX94Lpd3I4taZQV/ODQ3fmY+RMPQfRbrVvbVLaIqWxwrm
 9kLhJlSMpzkWsIe1Bki1+ZyO/GiRY2x7IpswmJCHR44SakQfmQSKcsmhDjacrHWv2wmS
 VNuCQjThjGnCfM0tvQk2lsoe+hZSwoWVMVwNFzWDK3zAvljH06Yul+O1I0NVxwjyYGyY
 ncEsOMmRokCUr9MNyBjbSri9p8bNcgLZ+Y1JB3oy4qGlc9R32AfCkGlGobsu1acfCRLp
 VuKg==
X-Gm-Message-State: AOAM5339Fo6hRXAgyw+zgM6D/9XrRQV1/ZceMZmZwmX21sTM9QZ4MrwY
 x6qbMvBCLZhOAfTmeC4cfr7qe5UWOBQ=
X-Google-Smtp-Source: ABdhPJxotrR5nKhFbJlSGC5KrgfZqMer3wP/kubJx+eSWTMwxTlHERoQQkPUds2bGrLeLHcdKlUHSQ==
X-Received: by 2002:a1c:9a89:: with SMTP id c131mr29345644wme.80.1636194052502; 
 Sat, 06 Nov 2021 03:20:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id x1sm9837682wmc.22.2021.11.06.03.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 03:20:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 11:18:58 +0100
Message-Id: <20211106101858.2813798-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: fix build on powerpc
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 0.3.39 in
commit d9796f2db9866060b916487784b046bb6b76f9b6:

In file included from /home/giuliobenetti/autobuild/run/instance-1/output-1/host/powerpc-buildroot-linux-uclibc/sysroot/usr/include/signal.h:318,
                 from ../spa/include/spa/utils/defs.h:34,
                 from ../spa/include/spa/utils/type.h:32,
                 from ../spa/include/spa/support/log.h:34,
                 from ../spa/plugins/support/cpu.c:37:
../spa/plugins/support/cpu.c: In function 'impl_init':
../spa/plugins/support/cpu.c:88:33: error: called object is not a function or function pointer
   88 | #define impl_cpu_zero_denormals NULL
      |                                 ^~~~

Fixes:
 - http://autobuild.buildroot.org/results/eaf255c46b10cbb6b8a629bc15acf7772d5e274b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ix-compilation-on-some-architectures.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch

diff --git a/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch b/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
new file mode 100644
index 0000000000..4465523610
--- /dev/null
+++ b/package/pipewire/0001-cpu-fix-compilation-on-some-architectures.patch
@@ -0,0 +1,28 @@
+From 651f0decea5f83730c271e9bed03cdd0048fcd49 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Thu, 21 Oct 2021 11:09:48 +0200
+Subject: [PATCH] cpu: fix compilation on some architectures
+
+[Retrieved from:
+https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/651f0decea5f83730c271e9bed03cdd0048fcd49]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ spa/plugins/support/cpu.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spa/plugins/support/cpu.c b/spa/plugins/support/cpu.c
+index ee1816512..01cff4854 100644
+--- a/spa/plugins/support/cpu.c
++++ b/spa/plugins/support/cpu.c
+@@ -270,7 +270,7 @@ impl_init(const struct spa_handle_factory *factory,
+ 		if ((str = spa_dict_lookup(info, SPA_KEY_CPU_VM_TYPE)) != NULL)
+ 			this->vm_type = atoi(str);
+ 		if ((str = spa_dict_lookup(info, SPA_KEY_CPU_ZERO_DENORMALS)) != NULL)
+-			impl_cpu_zero_denormals(this, spa_atob(str));
++			spa_cpu_zero_denormals(&this->cpu, spa_atob(str));
+ 	}
+ 
+ 	spa_log_debug(this->log, "%p: count:%d align:%d flags:%08x",
+-- 
+GitLab
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
