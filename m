Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CCCC021A6
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 16:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EF9181334;
	Sat, 14 Sep 2024 16:25:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7hZdIOeX1Kcc; Sat, 14 Sep 2024 16:25:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73EA48199D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73EA48199D;
	Sat, 14 Sep 2024 16:25:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 033DC1BF83A
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E619040436
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 16:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F4leCP5f1E3t for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 16:25:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 602F84010C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 602F84010C
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 602F84010C
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 16:25:09 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42cae6bb895so30349295e9.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:25:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726331107; x=1726935907;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mf9Ur+uFhhFn4n7feqJOC5EktuxLbxYO0blugspv/dE=;
 b=MkqImD01vs0dypl9tISLD3/dREKI+Z5wvm+gDgCM9BF41+W4hRWaYZ6AD9s0T/RGLq
 AhQQW0KphzcOAijoQSNAmtX+JHhNkrdNdsCPjvFCJN9UhY1TDw5wMA5SS8QtnpgQ4ZZL
 j/dGYi/Bj0yjc0quqGUt24Jdv/oWEHtQC4e6ryu3XrerG7WfFglij03Yqep9jrGx0Wl0
 zyDwc1gDiIIPxqk8sbT16QGkZ9xiHKpMdLTpIqjXnMJgkZE3TywKTTn5H+K0IircDHJc
 +LpM2el6VeQndlCcb08K2g49+tDmOrnPbZRkH5L022XtH9Hjk0Zkz5YCOdsI9QHfMQcE
 IVqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiynCvjMgj2vnjND68xDEjlYZgKT81KXjvEdccGKAcSsc4KeuFTEHMPpn4pMOFUGavhB5+P02KvfY=@buildroot.org
X-Gm-Message-State: AOJu0Yy24ENGezqsMZI7CI8ig7Ouuk6KhGbkLR0gC1vo21fgHB4sCN0i
 6LcP/r8REPr+isQZJHjulVH1Qj2VHukFpoxl0aLPohCXD6qBQ1SPOgdP6sVnpMbFwfAactkJy/e
 iabBL9A==
X-Google-Smtp-Source: AGHT+IFKCsTM2Am+RaJ38brEzQge2HyU4dqUIOs1fs/nWeHrMKFFKNV3/3TL9ezKzcgzPd7NnXYIyQ==
X-Received: by 2002:a05:600c:45cf:b0:42c:bad0:6c1c with SMTP id
 5b1f17b1804b1-42cdb54e480mr70717365e9.18.1726331106916; 
 Sat, 14 Sep 2024 09:25:06 -0700 (PDT)
Received: from ?IPV6:2a02:61:a2::9b5? ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b15c435sm57638865e9.23.2024.09.14.09.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Sep 2024 09:25:06 -0700 (PDT)
Message-ID: <c7a62004-10ab-4351-a3f5-7fd3ab157551@mind.be>
Date: Sat, 14 Sep 2024 18:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Hugo Cornelis <hugo.cornelis@essensium.com>, buildroot@buildroot.org
References: <20240914154748.2289155-1-hugo.cornelis@essensium.com>
Content-Language: en-GB
In-Reply-To: <20240914154748.2289155-1-hugo.cornelis@essensium.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726331107; x=1726935907; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Mf9Ur+uFhhFn4n7feqJOC5EktuxLbxYO0blugspv/dE=;
 b=WQEYAJWE0DIbJmsu/K3nwMv52m91F97tJfQJAG+ILF9x7mSUy0fEEaenDR61qB9QEZ
 cILUxt4Vln2mwOFWM48aQSgKyse6/1FbPt1BIVTq+Dt4ypL9eDE/jof41ZahSLlfbaTW
 5clDMKEl8CI4XcuzR8WOCZ5W0UOYSarnCDDYLNqP+sU1u8ETkOYfD9idA942VnZg0nbD
 scwyBhUcrHELAf3J++s/wDBknwjJxFBh8bQLDLfJ1TfwIqjdT8DveC/U8oF/zOtC5vQh
 Vts9a7Y/rr8Tr3bX6vJJa27A59W0Xf2vVjTHJS3Cb+YfAoA2ZLaftsJGZoX8JhaDE2cr
 p9dQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WQEYAJWE
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: link the w command
 with systemd or elogin libs.
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/09/2024 17:47, Hugo Cornelis via buildroot wrote:
> The build of procps-ng was broken when systemd was enabled.  The

  If you know since when (which commit) it was broken, that's useful to include 
here as well.

> solution was to apply commit ca004d46 of procps-ng upstream.

  Since this fixes something, please add:

Fixes: <URL of autobuild failure>

(that's a strong hint that it should be included in the stable branches).

  If it only _partially_ fixes that autobuild failure, you should still have the 
Fixes tag, but with a remark after or before it that it doesn't completely fix it.

> Signed-off-by: Hugo Cornelis <hugo.cornelis@essensium.com>
> ---
>   ...1-build-sys-Add-systemd-elogind-to-w.patch | 46 +++++++++++++++++++
>   package/procps-ng/procps-ng.mk                |  3 ++
>   2 files changed, 49 insertions(+)
>   create mode 100644 package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
> 
> diff --git a/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
> new file mode 100644
> index 0000000000..e778b5f14d
> --- /dev/null
> +++ b/package/procps-ng/0001-build-sys-Add-systemd-elogind-to-w.patch
> @@ -0,0 +1,46 @@
> +From ca004d4657d5e8b468a4552ede429be53193a3a9 Mon Sep 17 00:00:00 2001
> +From: Craig Small <csmall@dropbear.xyz>
> +Date: Thu, 31 Aug 2023 22:24:23 +1000
> +Subject: [PATCH] build-sys: Add systemd/elogind to w
> +
> +Depending on the compiler flags, w needs to be explictly linked
> +to libsystemd or elogind even though libproc2 is linked to it.
> +
> +Signed-off-by: Craig Small <csmall@dropbear.xyz>

  You need a Signed-off-by here as well. This is a short way for you to
assert that you are entitled to contribute the patch under the package's
license. This is separate from the signoff on the commit itself, because both 
the license and the provenance are different.

  You also need an Upstream: tag here, which in this case is the URL to the 
upstream commit.

So:

Upstream: https://sourceforge.net/...
Signed-off-by: Hugo


  I have marked your patch as Changes Requested in patchwork, so unless you 
resend it (with the fixes mentioned above), we will forget about it.

  Thank you!

  Regards,
  Arnout

> +---
> + Makefile.am | 7 +++++++
> + NEWS        | 3 +++
> + 2 files changed, 10 insertions(+)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index f70c8fb1..ddfc0141 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -149,6 +149,13 @@ endif
> +
> + dist_man_MANS += man/w.1
> + src_w_SOURCES = src/w.c local/fileutils.c
> ++src_w_LDADD = $(LDADD)
> ++if WITH_SYSTEMD
> ++src_w_LDADD += @SYSTEMD_LIBS@
> ++endif
> ++if WITH_ELOGIND
> ++src_w_LDADD += @ELOGIND_LIBS@
> ++endif
> + else
> +   EXTRA_DIST += man/w.1
> + endif
> +diff --git a/NEWS b/NEWS
> +index 3f2158d4..4ad9f74e 100644
> +--- a/NEWS
> ++++ b/NEWS
> +@@ -1,3 +1,6 @@
> ++procps-ng-NEXT
> ++---------------
> ++
> + procps-ng-4.0.4
> + ---------------
> +   * library (API & ABI unchanged)
> +--
> +2.34.1
> +
> diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
> index 2f28e3571e..1002d6340f 100644
> --- a/package/procps-ng/procps-ng.mk
> +++ b/package/procps-ng/procps-ng.mk
> @@ -14,6 +14,9 @@ PROCPS_NG_INSTALL_STAGING = YES
>   PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>   PROCPS_NG_CONF_OPTS = LIBS=$(TARGET_NLS_LIBS)
>   
> +# Applying 0001-build-sys-Add-systemd-elogind-to-w.patch touches Makefile.am
> +PROCPS_NG_AUTORECONF = YES
> +
>   ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>   PROCPS_NG_DEPENDENCIES += systemd
>   PROCPS_NG_CONF_OPTS += --with-systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
