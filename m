Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D69C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55F9F4066E;
	Thu,  7 Aug 2025 18:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yaVU36l-EtY; Thu,  7 Aug 2025 18:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C4F14065D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C4F14065D;
	Thu,  7 Aug 2025 18:25:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 495F410A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4246540576
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y67-SEMDOc32 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:25:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 162B440583
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 162B440583
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 162B440583
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:25:11 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-459e210bd2dso8386465e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:25:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591110; x=1755195910;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6a2SWd4fepvdI4AL6GBHWzylPBsczxHTUgkxFUfLKDs=;
 b=sFmhJbdIwHNJlnmNWva+PfNnPjrrHYBHeUfTlVJ+UUPc1EruizA7OJ5jw1bspbeukV
 +eAhUNsKt72M+S1qTFSFSAsn2tio/RM0JlbXrq/Ocavdokp8dR2vn0a3j5s/nIMkMGDd
 NcOsvZgkonM6xYLB0Zt3GrxcQb64RI8DvUgTDLdg3sXGPjNF34jYvP9sqvVi9zOLX8rl
 XGNVfAQx8rnwZj2j2DtV7/fJAXJuR01ZLFpGsbyaRZYprYyNxJMSw/hEhLdePmr3MHYr
 ws94TFBNvSBZzSm6gD/f7AKE5A5+WwWYnMENpw1UpeRa8+KFmNMCWGBtXag/g1leL4PX
 Upsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOPN3anzoL/qJB3nzV7KHgNbXqG/cCDSFwdJFPn9TRtEbfmJuMxHyjQ7W9RJ6uZci9MCuroJjkD9M=@buildroot.org
X-Gm-Message-State: AOJu0YxYB5NAys0mMjfz3g1p1Qd0N4HatfJyAitLr1L8hpnhl+2/JFfN
 rS+u8Vzufw7QwyOxjRyOnFmrFU4nS5Isk3T2cWj41Xxy2yTuUFr65lFZWGFpAxMchpw=
X-Gm-Gg: ASbGncs05WIIHPRl7AR70i33uXARKQzPIfYqJLbDys+s0N47F0dZP6qYIHYezgO3LLP
 yxjsAVH6lUD536rnb03cJnYD3pdms/G9DzaMeKmexoam0buFy+uRqBOmOw6j0nwIczjqSqwYvRS
 znOeBPo5BfuH998duRIe9/YSbxk0b9W9NFqYniFdNZHOGUN3C9Y1cD5qxlLkErdHhz7Ke2mmrCF
 b7pxUKqf2KkDLr3VSa34nf8G8+nsHfzMQTGeVXfJQtPJeKSsW7w6oP2qTbAUeVlB324rrzPLovH
 xaNgR3pwwl3fcjUnBoQZZ19KgYE7Dayyk54B2SYDL5C4UBHdCneTaVy3cTs4LeCwyAapwmpc4Mp
 bQ4HzID1bGDqlaA==
X-Google-Smtp-Source: AGHT+IF6bnlve6lrCTFPeZOaAuMk3Awy3dJTYrXb0wIOa9OQm5Gs3lHvRB6a3OkmOcm5QtJpXxGV2g==
X-Received: by 2002:a05:6000:40e1:b0:3b7:8842:89f5 with SMTP id
 ffacd0b85a97d-3b8f97bbfa9mr4132035f8f.1.1754591110111; 
 Thu, 07 Aug 2025 11:25:10 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c4532c4sm27437908f8f.36.2025.08.07.11.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:25:09 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:25:09 +0200
Message-ID: <20250807182509.726830-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250720143047.1447676-1-petr.vorel@gmail.com>
References: <20250720143047.1447676-1-petr.vorel@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591110; x=1755195910; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6a2SWd4fepvdI4AL6GBHWzylPBsczxHTUgkxFUfLKDs=;
 b=MS4Fta2AcY1axsf86OB0aINlHLU37LCiSGMrLXrE3IMqjbx5DXyWa++Jl01uWlcxda
 oikA9oCay4Pzimd3X3U9X4Ce3jgehammCM6jPmIWEeDmWRWspKqDFKoyIVjFONfzzBKV
 20SuQhsTEGWwTahbKQWBAxZLcJvn3ECVESkGLLzVRmN6PSpJl7d/DX8TXdMv7A9B1eTN
 OiBPdNJLWBylBsY9dAomUSFrRTCM1FZelD2nIaNq0IcGlKeUQYgiaErTkmuc5MJJAjsq
 q/NAL/QC05yxnBxuC1gHJGvbwpecrCegipwgnR/kEE3UJv/K15ZmD5WjPf+c/JGMQIbB
 ViDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MS4Fta2A
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: backport musl
 build fixes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Backport 2 commits from upstream which fixes LTP on musl on kernel >= 6.14.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

Applied to 2025.05.x. Thanks

> ---
> v1: https://lore.kernel.org/buildroot/20250718040903.1386179-1-petr.vorel@gmail.com/
> 
> Changes v1->v2:
> Add LTP_TESTSUITE_AUTORECONF = YES (Julien)
> 
> Hi Julien, all,
> 
> Yes, the following command reproduce the problem:
> 
>     cat >.config <<EOF
>     BR2_aarch64=y
>     BR2_TOOLCHAIN_BUILDROOT_MUSL=y
>     BR2_LINUX_KERNEL=y
>     BR2_LINUX_KERNEL_LATEST_VERSION=y
>     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
>     BR2_PACKAGE_LTP_TESTSUITE=y
>     EOF
>     make olddefconfig
>     make ltp-testsuite
> 
> which got fixed by this patch.
> 
> Kind regards,
> Petr
> 
>  ...ure-Fix-build-on-kernel-6.14-headers.patch | 51 ++++++++++++++++++
>  ...002-statmount02-Remove-linux-btrfs.h.patch | 52 +++++++++++++++++++
>  package/ltp-testsuite/ltp-testsuite.mk        |  3 ++
>  3 files changed, 106 insertions(+)
>  create mode 100644 package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
>  create mode 100644 package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
> 
> diff --git a/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch b/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
> new file mode 100644
> index 0000000000..6638ee2ccd
> --- /dev/null
> +++ b/package/ltp-testsuite/0001-configure-Fix-build-on-kernel-6.14-headers.patch
> @@ -0,0 +1,51 @@
> +From 3ef4bac1dd253628dfdb8a823b51ae0d24fa0616 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Mon, 2 Jun 2025 19:08:30 +0200
> +Subject: [PATCH] configure: Fix build on kernel 6.14 headers
> +
> +We decided in a2300dc0f5 to remove <linux/mount.h> in lapi/mount.h and
> +use only <sys/mount.h>. But later in 5c5411ea8e we add autotools checks
> +in configure.ac which use <linux/mount.h> for detection, but kept using
> +lapi/mount.h. This worked until now, because no toolchain used new
> +header enough. Recent Alpine update broke that.
> +
> +This fixes CI build on Alpine v3.22 (the default Alpine version in
> +GitHub action), which uses 6.14.2 kernel headers, which already define
> +struct mnt_id_req (configure.ac detect it but lapi/mount.h was not using
> +a correct header):
> +
> +    listmount.h: In function 'listmount':
> +    listmount.h:18:16: error: variable 'req' has initializer but incomplete type
> +       18 |         struct mnt_id_req req = {
> +	  |                ^~~~~~~~~~
> +
> +Link: https://lore.kernel.org/ltp/20250602170831.404641-1-pvorel@suse.cz/
> +Fixes: 5c5411ea8e ("Add listmount/statmount fallback declarations")
> +Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
> +Acked-by: Jan Stancek <jstancek@redhat.com>
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +Upstream: https://github.com/linux-test-project/ltp/commit/3ef4bac1dd253628dfdb8a823b51ae0d24fa0616
> +---
> + configure.ac | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9ff098b273..69c5be7362 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -254,8 +254,10 @@ AC_CHECK_TYPES([struct mount_attr],,,[
> + 
> + AC_CHECK_TYPES([struct cachestat_range],,,[#include <sys/mman.h>])
> + AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
> +-AC_CHECK_TYPES([struct mnt_id_req],,,[#include <linux/mount.h>])
> +-AC_CHECK_TYPES([struct statmount],,,[#include <linux/mount.h>])
> ++
> ++# Defined in <linux/mount.h>, but include/lapi/mount.h includes <sys/mount.h> */
> ++AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
> ++AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
> + 
> + # Tools knobs
> + 
> +-- 
> +2.50.0
> +
> diff --git a/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch b/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
> new file mode 100644
> index 0000000000..c82c422000
> --- /dev/null
> +++ b/package/ltp-testsuite/0002-statmount02-Remove-linux-btrfs.h.patch
> @@ -0,0 +1,52 @@
> +From fe8c0dac5ab4aa49c4f977d14f8a8d24cefa6435 Mon Sep 17 00:00:00 2001
> +From: Petr Vorel <pvorel@suse.cz>
> +Date: Wed, 4 Jun 2025 16:13:18 +0200
> +Subject: [PATCH] statmount02: Remove <linux/btrfs.h>
> +
> +statmount02.c does not need <linux/btrfs.h> because it's skipped.
> +
> +Avoid using it fixes the problem due the old problem of indirect include
> +<linux/mount.h> by <linux/fs.h> on Alpine v3.22 (the default Alpine
> +version in GitHub action), which uses 6.14.2 kernel headers:
> +
> +    In file included from /usr/include/linux/fs.h:19,
> +                     from /usr/include/linux/btrfs.h:29,
> +                     from statmount02.c:23:
> +    /usr/include/linux/mount.h:155:8: error: redefinition of 'struct statmount'
> +      155 | struct statmount {
> +          |        ^~~~~~~~~
> +    In file included from statmount.h:12,
> +                     from statmount02.c:20:
> +    ../../../../include/lapi/mount.h:58:8: note: originally defined here
> +       58 | struct statmount {
> +          |        ^~~~~~~~~
> +    /usr/include/linux/mount.h:193:8: error: redefinition of 'struct mnt_id_req'
> +      193 | struct mnt_id_req {
> +          |        ^~~~~~~~~~
> +    ../../../../include/lapi/mount.h:49:8: note: originally defined here
> +       49 | struct mnt_id_req {
> +          |        ^~~~~~~~~~
> +
> +Fixes: 5f9942dffe ("Add statmount02 test")
> +Suggested-by: Jan Stancek <jstancek@redhat.com>
> +Signed-off-by: Petr Vorel <pvorel@suse.cz>
> +Upstream: https://github.com/linux-test-project/ltp/commit/fe8c0dac5ab4aa49c4f977d14f8a8d24cefa6435
> +---
> + testcases/kernel/syscalls/statmount/statmount02.c | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/testcases/kernel/syscalls/statmount/statmount02.c b/testcases/kernel/syscalls/statmount/statmount02.c
> +index 504c558a11..07f877e040 100644
> +--- a/testcases/kernel/syscalls/statmount/statmount02.c
> ++++ b/testcases/kernel/syscalls/statmount/statmount02.c
> +@@ -20,7 +20,6 @@
> + #include "statmount.h"
> + #include "lapi/stat.h"
> + #include "lapi/sched.h"
> +-#include <linux/btrfs.h>
> + 
> + #define MNTPOINT "mntpoint"
> + 
> +-- 
> +2.50.0
> +
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index 1a401c0421..265b7eda70 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -92,4 +92,7 @@ endef
>  
>  LTP_TESTSUITE_POST_PATCH_HOOKS += LTP_TESTSUITE_REMOVE_UNSUPPORTED_TESTCASES
>  
> +# 0001-configure-Fix-build-on-kernel-6.14-headers.patch
> +LTP_TESTSUITE_AUTORECONF = YES
> +
>  $(eval $(autotools-package))
> -- 
> 2.50.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
