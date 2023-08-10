Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76532C001DB
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 04:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 227384012E;
	Thu, 10 Aug 2023 04:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 227384012E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCilBRZEU-v0; Thu, 10 Aug 2023 04:32:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C9B640332;
	Thu, 10 Aug 2023 04:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C9B640332
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A9C3A1BF2AB
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 04:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E0F140332
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 04:32:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E0F140332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHcQEQkVsQah for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 04:32:55 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3703B4012E
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 04:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3703B4012E
Received: by helium.openadk.org (Postfix, from userid 1000)
 id AD497352BD86; Thu, 10 Aug 2023 06:32:52 +0200 (CEST)
Date: Thu, 10 Aug 2023 06:32:52 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNRodM7hgvo2nT4T@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691641972; bh=wLvN9R+7+G8Z1/emiCbFyRJYsIrKjMczhNvl5ksw9N4=;
 h=Date:From:To:Subject:From;
 b=hOvKXehymPvOQglIm/FGz68oNKUp+y9CdU9GVTVd1//VCaV/gqQjYeTQEWZtwNZbY
 btXkNMOGCZTSZm+OtsmOeP4BPajj8TQ4h5B6J23papGLGJvg9xO6PnX5ynl7bEEX6r
 fCdT9InJVVwOPcMQM78kDL3NHR8uBFCkJkUjZ2+H3//JBNzJMvun+zeoh3GKmLsbZG
 JOvZ0fliL/Hx218iaGSOItmWcWPqFfZyWr1iMD9UIIBDbGnuuTThEHbqrY6Sv8Dk8i
 mM94mY4RhLs8HEVTQ4u3O0yETsnr706WEmqnNTbEiX5pyprAPGsM0vjMCJ9NPMwucO
 Ztv5cvQDr7ckA==
Subject: [Buildroot] [PATCH] package/gcc: fix powerpc toolchain issues
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some of the powerpc CPU's supported by Buildroot are dual mode CPU's,
which means 32 Bit and 64 Bit mode is supported.

See here the gcc documentation for details about --with-cpu-32:
https://gcc.gnu.org/install/configure.html

See here for a discussion on the musl mailinglist about the error:
https://inbox.vuxu.org/musl/20220722162900.GB1320090@port70.net/

Fixes:
 - http://autobuild.buildroot.net/results/450/4509d8cfb7d99beb4ef023f170490def1d90f92c
 - http://autobuild.buildroot.net/results/654/6545a464d49f9f3c6740a5208cfad7f09ec4cb8b
 - http://autobuild.buildroot.net/results/cf8/cf866d5320b069eb1e8b4f05e8e58de0ad2ec7b5

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---

Thanks to Thomas Petazzoni for pointing me to the gcc docs and the
--with-cpu-32 option via IRC. 

---
 package/gcc/gcc.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 1ecbf7e9b4..3050229176 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -225,9 +225,17 @@ endif
 ifneq ($(GCC_TARGET_FP32_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-fp-32="$(GCC_TARGET_FP32_MODE)"
 endif
+
+# musl/uClibc-ng does not work with biarch powerpc toolchains, we
+# need to configure gcc explicitely for 32 Bit for CPU's supporting
+# 64 Bit and 32 Bit
 ifneq ($(GCC_TARGET_CPU),)
+ifeq ($(BR2_powerpc),y)
+HOST_GCC_COMMON_CONF_OPTS += --with-cpu-32=$(GCC_TARGET_CPU)
+else
 HOST_GCC_COMMON_CONF_OPTS += --with-cpu=$(GCC_TARGET_CPU)
 endif
+endif
 
 ifneq ($(GCC_TARGET_FPU),)
 HOST_GCC_COMMON_CONF_OPTS += --with-fpu=$(GCC_TARGET_FPU)
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
