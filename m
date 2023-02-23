Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBF9C64ED6
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AB1040579;
	Thu, 23 Feb 2023 22:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AB1040579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dCD1RFlf82Ap; Thu, 23 Feb 2023 22:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D67A4059F;
	Thu, 23 Feb 2023 22:09:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D67A4059F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 027ED1BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF8B96080B
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:09:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF8B96080B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rdzfvF-seJO for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:09:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86D4260761
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 86D4260761
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:09:53 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id 6so11679319wrb.11
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 14:09:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8L8hGrMAzAOFuWzPInf25vbiV2alZOJZppYC8JUxkLI=;
 b=ca3lnIpPAXB1wEfGxYqbw0Nrt6r6aK0YsQnnfaB55TnkUtQ/lwC7HgV7f9Oo92P1ZS
 tbr59/y1BTPqMTNTwp/MQJMYOOONnfYNimtOvV2Evjg48RGTy/XqSqm7DDirss/lKFGv
 +vWExKxMAQSUTL7MHYGPsdM78OUkHkQCI8VWCMoHiEL4Bk/y3RX4ywY0Sduz05DDxyHs
 x8VSwqE0DtgLccOYhZ2E8ibrIKT/AjuNxYfgmMcDyydm++3XW5N3E1hUDupn/EGPCEAD
 KFPQgR6EZ/s3HGiuZ/ocvlDiHzL9Zu/SLiIAriqBNChBfk1SJS35/qfc+l4YPGC6PVZI
 cU/A==
X-Gm-Message-State: AO0yUKU582LrNYDSdiYxesfAX74IaUm17hEpS+/SKLUMirI/35ITm9kn
 Gtv9WBT3X5AT15sgqETWCrT5jjU2xsQ=
X-Google-Smtp-Source: AK7set9EssIrJEG+7T4cyizARiXhvOhV52hE0BykKjKwnRDzfaWvmhzL+zeTvCyN3k3GsSGzLMBPsQ==
X-Received: by 2002:a5d:595e:0:b0:2c5:8d7c:c144 with SMTP id
 e30-20020a5d595e000000b002c58d7cc144mr11663201wri.39.1677190191098; 
 Thu, 23 Feb 2023 14:09:51 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k24-20020a05600c0b5800b003dc4fd6e624sm589834wmr.19.2023.02.23.14.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 14:09:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 23:09:47 +0100
Message-Id: <20230223220947.8226-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8L8hGrMAzAOFuWzPInf25vbiV2alZOJZppYC8JUxkLI=;
 b=RJ6dmmNOE2dypYd4+PHeFLR3xwPHjZn++MI/+sFyJ9Xk3f40y39eeUkMlfZtVwmjaS
 VW9LRfArCiocCuIN5yhkNtC0oRSkhqKkx1zRtHWMOt5cuO3MakgbGNHtvmg7Fofw4qly
 6SxpR8wf6UO0Ng21K/5IHl9UUjPK6xP1tuuvjJFXCA9GYlmwJJaWMqCEVO0+/97Wlzgj
 tKsJ9HvCKVTiW5vDmD9axN9PW6Fe92+ogIBkEHAvxFEeEpsHXIX7fYFQDdosR8KFe0nS
 ntSZklG7AXXqMa6fRdTKACu6hDRM4MN9T1Vz6PWtEXUehFnYagMFkmHKb58hTAqhG+dW
 U9gA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RJ6dmmNO
Subject: [Buildroot] [PATCH v2,1/1] package/gcc: fix GCC_DL_DIR
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

GCC_DL_DIR is empty as gcc is not a "real" package, as a result, the
following (silent) error is raised when BR2_CCACHE is set:

/home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/bin/ccache /usr/bin/gcc -O2 -I/home/thomas/autobuild/instance-0/output-1/per-package/host-gcc-initial/host/include -DBR_CROSS_PATH_SUFFIX='".br_real"' -DBR_CCACHE_HASH=\"` printf '%s\n'  --target=aarch64_be-buildroot-linux-gnu --with-sysroot=@HOST_DIR@/aarch64_be-buildroot-linux-gnu/sysroot --enable-__cxa_atexit --with-gnu-ld --disable-libssp --disable-multilib --disable-decimal-float --enable-plugins --enable-lto --with-gmp=@HOST_DIR@ --with-mpc=@HOST_DIR@ --with-mpfr=@HOST_DIR@  --with-bugurl="http://bugs.buildroot.net/" --without-zstd --disable-libquadmath --disable-libquadmath-support --enable-tls --enable-threads --without-isl --without-cloog --with-abi="lp64" --with-cpu=cortex-a53 --enable-languages=c --disable-shared --without-headers --disable-threads --with-newlib --disable-largefile  | sha256sum - /gcc-11.3.0.tar.xz package/gcc/11.3.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch package/
 gcc/11.3.0/0002-or1k-Use-cmodel-large-when-building-crtstuff.patch package/gcc/11.3.0/0003-gcc-define-_REENTRANT-for-OpenRISC-when-pthread-is-p.patch package/gcc/11.3.0/0004-disable-split-stack-for-non-thread-builds.patch package/gcc/11.3.0/0005-rs6000-Improve-.machine.patch package/gcc/11.3.0/0006-rs6000-Do-not-use-rs6000_cpu-for-.machine-ppc-and-pp.patch package/gcc/11.3.0/0007-fixinc-don-t-fix-machine-names-in-__has_include-.-PR.patch | cut -c -64 | tr -d '\n'`\" -DBR_SYSROOT='"aarch64_be-buildroot-linux-gnu/sysroot"' -DBR_ADDITIONAL_CFLAGS='"-Wl,-z,max-page-size=65536", "-Wl,-z,common-page-size=65536", "-fstack-protector-strong",' -DBR_CCACHE -DBR2_RELRO_PARTIAL -s -Wl,--hash-style=both toolchain/toolchain-wrapper.c -o /home/thomas/autobuild/instance-0/output-1/build/host-gcc-initial-11.3.0/toolchain-wrapper
sha256sum: /gcc-11.3.0.tar.xz: No such file or directory

This patch replaces GCC_DL_DIR by $($(PKG)_DL_DIR) as suggested by
Arnout Vandecappelle.

Fixes:
 - Found when investigating: http://autobuild.buildroot.org/results/ae75f5cdd4a1fe97359b99b2bcade258097c86dd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Use $($(PKG)_DL_DIR)

 package/gcc/gcc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 6dfd93f2a4..25cb4ce8e2 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -284,7 +284,7 @@ HOST_GCC_COMMON_MAKE_OPTS = \
 	gcc_cv_libc_provides_ssp=$(if $(BR2_TOOLCHAIN_HAS_SSP),yes,no)
 
 ifeq ($(BR2_CCACHE),y)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += $(GCC_DL_DIR)/$(GCC_SOURCE)
+HOST_GCC_COMMON_CCACHE_HASH_FILES += $($(PKG)_DL_DIR)/$(GCC_SOURCE)
 
 # Cfr. PATCH_BASE_DIRS in .stamp_patched, but we catch both versioned
 # and unversioned patches unconditionally. Moreover, to facilitate the
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
