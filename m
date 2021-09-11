Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D566C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:54:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 014E76113A
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 014E76113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4EB0400E8;
	Sat, 11 Sep 2021 14:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFabPYi1USrn; Sat, 11 Sep 2021 14:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8EBF40142;
	Sat, 11 Sep 2021 14:54:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2B011BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1C29607F9
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_Nc4InFGLbO for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:54:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7B73060624
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:54:07 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ho42so10526490ejc.9
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZXQxuHFt+/UoSvgLrnr5MsgiU1KNodxYfy2IXK04Ugo=;
 b=FRa6ZKENaTypIFRL2PolIBDq3tSBai2Bv/IXCpXTxN1RLTMtUX6IoIOFty0jouVbsO
 8wk3I3zDD+pDiIeXmkqfTYzP04fTjsFZe4qqv4/T1zSP5gUQS0uaA4ihtgzmPBLwAo3F
 JpIq5HDHq4DE/hucrCdQWAXSrl160AH9WBmjcMCscXxN3Do4/ClTqLwaSXUCme0Q+P1u
 mgqUfKZZ8N/skCdhB6N4xaaOztWyh750RoCUwWyRllZR45xlX/7Q1YsIvb6VmqnMaMhe
 5Q5cBBwnMaU7pzceVAQyeVyEYAhX9Y3DNK9YnBdTxrvEOixf23OL+lANi3vIMSb0Qk/Q
 k4mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZXQxuHFt+/UoSvgLrnr5MsgiU1KNodxYfy2IXK04Ugo=;
 b=4zUSFSELVHy3u+fDULYb2e+tQbi2wMSTBB5dpaTj91vLDFV95jLEJo3KFl1iAwMvvx
 z6tZLS+7qS/ClPaylJVcBuNypwsUz117NZBm8OrmbpAjiaaqrTpmZtJ39KPdbFbhVZm4
 Vs/goeZpQtTpwYTcqSEFaokXc/gSb09JSXpcg1eBzfHUo1+Podvp40JdS6dl7SV7iam7
 424e3bfmoRMJSu/DyCKf+devH2bSZRSUZfJbc8OM5nZfRvNaB0ELBAXepyJ53QQgXnO/
 jZ025sX4mTMB5tE/Vh71QTbI402l2z9PHx8NWIWxSMA2pKh4WZdjZy3uyofqQhxqXq7d
 ggkg==
X-Gm-Message-State: AOAM533zbS4pSCkWGD/TDxRSIjI0IMkfVaRTRb61n68m/NmEwJxW5Dbs
 FSANfjxNG7tF+CpvzNe408DFwWLMclyaXA==
X-Google-Smtp-Source: ABdhPJzQ1Zcj2Vp1h3S0dCL4rdfKXwW5Hl+dQ+SD6K4br2a4YDSGO7u2TPMcRUxGwjYo7NjRhZEnLw==
X-Received: by 2002:a17:906:95d7:: with SMTP id
 n23mr3054404ejy.479.1631372045548; 
 Sat, 11 Sep 2021 07:54:05 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id n18sm866648ejg.36.2021.09.11.07.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:54:05 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20210901174625.7748-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <065c0586-50eb-36fe-d2df-a278faf7d904@mind.be>
Date: Sat, 11 Sep 2021 16:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901174625.7748-1-petr.vorel@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/iproute2: bump version to 5.14.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 01/09/2021 19:46, Petr Vorel wrote:
> Drop patch from this release.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  ...-when-name-open-_to_handle_at-is-not.patch | 114 ------------------
>  package/iproute2/iproute2.hash                |   2 +-
>  package/iproute2/iproute2.mk                  |   2 +-
>  3 files changed, 2 insertions(+), 116 deletions(-)
>  delete mode 100644 package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch
> 
> diff --git a/package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch b/package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch
> deleted file mode 100644
> index b4e6374874..0000000000
> --- a/package/iproute2/0001-lib-fs-fix-issue-when-name-open-_to_handle_at-is-not.patch
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -From c5b72cc56bf88160bbf477ec8565fed865e7a1c9 Mon Sep 17 00:00:00 2001
> -From: Heiko Thiery <heiko.thiery@gmail.com>
> -Date: Sat, 8 May 2021 08:49:26 +0200
> -Subject: [PATCH] lib/fs: fix issue when {name,open}_to_handle_at() is not
> - implemented
> -
> -With commit d5e6ee0dac64 the usage of functions name_to_handle_at() and
> -open_by_handle_at() are introduced. But these function are not available
> -e.g. in uclibc-ng < 1.0.35. To have a backward compatibility check for the
> -availability in the configure script and in case of absence do a direct
> -syscall.
> -
> -Fixes: d5e6ee0dac64 ("ss: introduce cgroup2 cache and helper functions")
> -Cc: Dmitry Yakunin <zeil@yandex-team.ru>
> -Cc: Petr Vorel <petr.vorel@gmail.com>
> -Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> -Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> -Signed-off-by: David Ahern <dsahern@kernel.org>
> -[ upstream-status: https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git/commit/?id=c5b72cc56bf88160bbf477ec8565fed865e7a1c9 ]
> ----
> - configure | 28 ++++++++++++++++++++++++++++
> - lib/fs.c  | 25 +++++++++++++++++++++++++
> - 2 files changed, 53 insertions(+)
> -
> -diff --git a/configure b/configure
> -index 2c363d3b..179eae08 100755
> ---- a/configure
> -+++ b/configure
> -@@ -202,6 +202,31 @@ EOF
> -     rm -f $TMPDIR/setnstest.c $TMPDIR/setnstest
> - }
> -
> -+check_name_to_handle_at()
> -+{
> -+    cat >$TMPDIR/name_to_handle_at_test.c <<EOF
> -+#define _GNU_SOURCE
> -+#include <sys/types.h>
> -+#include <sys/stat.h>
> -+#include <fcntl.h>
> -+int main(int argc, char **argv)
> -+{
> -+	struct file_handle *fhp;
> -+	int mount_id, flags, dirfd;
> -+	char *pathname;
> -+	name_to_handle_at(dirfd, pathname, fhp, &mount_id, flags);
> -+	return 0;
> -+}
> -+EOF
> -+    if $CC -I$INCLUDE -o $TMPDIR/name_to_handle_at_test $TMPDIR/name_to_handle_at_test.c >/dev/null 2>&1; then
> -+        echo "yes"
> -+        echo "CFLAGS += -DHAVE_HANDLE_AT" >>$CONFIG
> -+    else
> -+        echo "no"
> -+    fi
> -+    rm -f $TMPDIR/name_to_handle_at_test.c $TMPDIR/name_to_handle_at_test
> -+}
> -+
> - check_ipset()
> - {
> -     cat >$TMPDIR/ipsettest.c <<EOF
> -@@ -492,6 +517,9 @@ fi
> - echo -n "libc has setns: "
> - check_setns
> -
> -+echo -n "libc has name_to_handle_at: "
> -+check_name_to_handle_at
> -+
> - echo -n "SELinux support: "
> - check_selinux
> -
> -diff --git a/lib/fs.c b/lib/fs.c
> -index f161d888..05697a7e 100644
> ---- a/lib/fs.c
> -+++ b/lib/fs.c
> -@@ -25,11 +25,36 @@
> -
> - #include "utils.h"
> -
> -+#ifndef HAVE_HANDLE_AT
> -+# include <sys/syscall.h>
> -+#endif
> -+
> - #define CGROUP2_FS_NAME "cgroup2"
> -
> - /* if not already mounted cgroup2 is mounted here for iproute2's use */
> - #define MNT_CGRP2_PATH  "/var/run/cgroup2"
> -
> -+
> -+#ifndef HAVE_HANDLE_AT
> -+struct file_handle {
> -+	unsigned handle_bytes;
> -+	int handle_type;
> -+	unsigned char f_handle[];
> -+};
> -+
> -+static int name_to_handle_at(int dirfd, const char *pathname,
> -+	struct file_handle *handle, int *mount_id, int flags)
> -+{
> -+	return syscall(__NR_name_to_handle_at, dirfd, pathname, handle,
> -+	               mount_id, flags);
> -+}
> -+
> -+static int open_by_handle_at(int mount_fd, struct file_handle *handle, int flags)
> -+{
> -+	return syscall(__NR_open_by_handle_at, mount_fd, handle, flags);
> -+}
> -+#endif
> -+
> - /* return mount path of first occurrence of given fstype */
> - static char *find_fs_mount(const char *fs_to_find)
> - {
> ---
> -2.31.1
> -
> diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
> index de4d09a3c1..2837edb09d 100644
> --- a/package/iproute2/iproute2.hash
> +++ b/package/iproute2/iproute2.hash
> @@ -1,3 +1,3 @@
>  # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> -sha256  72a2e53774cac9e65f7b617deebb2059f87e8960d6e9713e4d788cea966f1b36  iproute2-5.13.0.tar.xz
> +sha256  210fa785a52f3763c4287fd5ae63e246f6311bfaa48c424baab6d383bb7591d4  iproute2-5.14.0.tar.xz
>  sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index 46d3662767..fdf442a429 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IPROUTE2_VERSION = 5.13.0
> +IPROUTE2_VERSION = 5.14.0
>  IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
>  IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
>  IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
