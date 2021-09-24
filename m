Return-Path: <SRS0=OK8R=OO=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC1C7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 15:36:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E5A461212
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 15:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E5A461212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DA038437F;
	Fri, 24 Sep 2021 15:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7P0WJxfoToNw; Fri, 24 Sep 2021 15:36:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86D9B8437A;
	Fri, 24 Sep 2021 15:36:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 02FB81BF57F
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 15:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3AF38437A
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 15:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8p3o5cO6FP1 for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 15:36:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C4AA84379
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 15:36:34 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r23so3379633wra.6
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 08:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YITSJY0lwJF9T4stEp+BvyS2n9/WLFeJq2AnmqVb+a4=;
 b=k0uqsw5UHuzHcgkc0Avcdl+IZbXIgV7evD4NYFffGWdOKF0SWXjHUv8F6er8n4rQnS
 pcm1TnJZQjPBZmBEIKMDUR/ECTrHjQ832HFEr8iUSGK3lcKz9wSvdkBwyp3SxVmW5DzS
 tTFDpr6m7y3CU3MwNyO5EPVGyQVJGMvsIwf/CJzouU5HW4uwerprvJQwHPKlzAJirIsi
 Gp4+Eh9jTWuvhtZnyYydocQASstCadl/AdiKL/HxsAKhof+F8TpLFwY1NxaFdAy0fzUI
 2QL6XoXSB0zIja3JFwHTwoktf8y6id6NO521HL9PTUH5k3AlaW4AUwu49rQ96OhKjiSs
 1yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YITSJY0lwJF9T4stEp+BvyS2n9/WLFeJq2AnmqVb+a4=;
 b=st9R2V15rZjwtRQZvz/EeMwA0FEKz/2UrSStn9mylOsiigm0Fx3lHXxo4JXw8MKyhe
 dzzVam3siymG74eW1olD+tlRjfHpM5rvc4If82IO8Xr5QvyBPTJ3VHW46GZGCInO8iIs
 P0spBZGjHXK+YZFJr8Mf/hzZHdnJvK2eZhjraomOMTMRq8SagwrNhMXWWSgGFMp0d5nN
 ZBxr3yro3mk2RYXPMccUqNcCTMVQILeOFx9KqI6WAH7K1fNU4jxnldZ3ba7rBPs7CYN5
 urrh2R+igYEEkdNIqZg/Op4jeai1Upb2b0h7JQKlyOUSAJOhqe8cJfOu5w8imXzIdMIy
 OwSA==
X-Gm-Message-State: AOAM530XjGhmR+xrr8AnZvy7+/v/Vx0e122cfrcx+Iwu89oyC3Yn0Bbv
 0HmzsxogFPc/g4vUG7QxJ4uxvEnAhFE=
X-Google-Smtp-Source: ABdhPJzM69UuL4H6DbLCiGUHyj4/EKRA75KPYeNjJJxEBiJPTpnd/cTjHVgbiBdusBY4JGalomaUxw==
X-Received: by 2002:a5d:53c8:: with SMTP id a8mr12438852wrw.168.1632497791948; 
 Fri, 24 Sep 2021 08:36:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id v17sm6708048wro.62.2021.09.24.08.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:36:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 17:36:06 +0200
Message-Id: <20210924153606.1800512-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/usbredir: fix build without
 stack-protector
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following build failure without stack-protector raised since
bump to version 0.11.0 in commit
c3a907a770b88529ea5a93c77cf001096799c556:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: usbredirparser/libusbredirparser.so.1.1.0.p/usbredirparser.c.o: in function `va_log':
usbredirparser.c:(.text+0x1c4): undefined reference to `__stack_chk_guard'

Fixes:
 - http://autobuild.buildroot.org/results/40de5443e98157ad50c6841ea70a835cd5ad4fe9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...002-meson-add-stack_protector-option.patch | 60 +++++++++++++++++++
 package/usbredir/usbredir.mk                  |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 package/usbredir/0002-meson-add-stack_protector-option.patch

diff --git a/package/usbredir/0002-meson-add-stack_protector-option.patch b/package/usbredir/0002-meson-add-stack_protector-option.patch
new file mode 100644
index 0000000000..613e2714e3
--- /dev/null
+++ b/package/usbredir/0002-meson-add-stack_protector-option.patch
@@ -0,0 +1,60 @@
+From 54cf1897ef3aa4d0a35b5f4eb1f5c6928b033af5 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 24 Sep 2021 17:24:43 +0200
+Subject: [PATCH] meson: add stack_protector option
+
+Add stack_protector option to allow the user to disable it as some
+embedded toolchains don't support it which will result in the following
+build failure:
+
+/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: usbredirparser/libusbredirparser.so.1.1.0.p/usbredirparser.c.o: in function `va_log':
+usbredirparser.c:(.text+0x1c4): undefined reference to `__stack_chk_guard'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/40de5443e98157ad50c6841ea70a835cd5ad4fe9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/spice/usbredir/-/merge_requests/53]
+---
+ meson.build       | 6 +++++-
+ meson_options.txt | 5 +++++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index a6d21b8..4350f53 100644
+--- a/meson.build
++++ b/meson.build
+@@ -17,8 +17,12 @@ cc_flags = [
+ if host_machine.system() != 'windows'
+     cc_flags += [
+ 	'-Wp,-D_FORTIFY_SOURCE=2',
+-	'-fstack-protector',
+     ]
++    if get_option('stack_protector').enabled()
++        cc_flags += [
++	    '-fstack-protector',
++        ]
++    endif
+ endif
+ 
+ # Check if we are building from .git
+diff --git a/meson_options.txt b/meson_options.txt
+index 63e8c85..34dd392 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -17,6 +17,11 @@ option('fuzzing-install-dir',
+     type : 'string',
+     description : 'Installation directory for fuzzing binaries')
+ 
++option('stack_protector',
++    type : 'feature',
++    value : 'enabled',
++    description : 'Build usbredir\'s with stack-protector')
++
+ option('tools',
+     type : 'feature',
+     value : 'enabled',
+-- 
+2.33.0
+
diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index 25c4bb382e..0a8dbf012d 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -13,6 +13,7 @@ USBREDIR_INSTALL_STAGING = YES
 USBREDIR_DEPENDENCIES = host-pkgconf libusb
 USBREDIR_CONF_OPTS = \
 	-Dgit_werror=disabled \
+	-Dstack_protector=disabled \
 	-Dtests=disabled \
 	-Dtools=disabled
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
