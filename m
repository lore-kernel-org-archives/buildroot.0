Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B004DC4320A
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:54:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6939661037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 20:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6939661037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C9C5608D0;
	Wed,  4 Aug 2021 20:54:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3ooE9ozRHBV; Wed,  4 Aug 2021 20:54:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D8CB608BA;
	Wed,  4 Aug 2021 20:54:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C816C1BF5DC
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3CCF608BA
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 20:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4EaGo5RAxLMR for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 20:54:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BABBA60776
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 20:54:48 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id y7so5240069eda.5
 for <buildroot@buildroot.org>; Wed, 04 Aug 2021 13:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KpmuAr5viBojF6MTOvmnj8hcxnv5OrAsQL0ibSOExCQ=;
 b=Dx1vcMHg5wHOzUIzc6Yp4or4fYK7vThEGPRY0eTUcbB31BTvOWB5R+LuWITB9Hx4tc
 YpGZ34r7mbDFuQFbzFqnXPq4g/ETmCTI6CZLIKFK93W2Y60kdX7GSzgHOK9g/qTE4Qfw
 wUvLEBQe3NMN7RVWoAcQos0QzLTQNvSOgqO0XCTTp0EeF63Lho20Qp8fI49Xsl2AHEtB
 jmPqcIhNhPvfMytJVh/XvE8XiijTxRmJe7ef8j/RpSZlS/rIjnzICyWfs6YJ6aq/gMve
 jDoFu2+n9KfHyAOGRRxMnT+meNFhWrKP4vzxmL9cy3y06cydcu3e+8cGc4Wjvy97UNi+
 zoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KpmuAr5viBojF6MTOvmnj8hcxnv5OrAsQL0ibSOExCQ=;
 b=Ap7Byb+ouaSn7az8Soc2rXwVEmrWR5C+BUJ65B+cQF0zLkCcn3+rdjZ6ETF8Iyyt56
 pN9VLfcFrljOz+AdaEnlqusVA0Tb0VIw5+aZGpbMBNOWXDxLmzaRvDKaqxqonYerIEuV
 +TSgD+r6hfHw/V+9gX3+VUrtu9kAZaTDg9lXy8P9SU10zj8jJpMSd4o4aPO5o6qZ5jCY
 zw2SZZH5HdMs63GreSjmD7Li+rXDZ7tYth0SYamarLEMx0dHsnCHgWm1dodrzFC+Smm0
 bmLKfAd7m1I2LN8EXUlrlTFaLVgERJ/qPpeBQlgI2WG35oCRYJKpvHGzVeGtwPzG3yXZ
 WwVQ==
X-Gm-Message-State: AOAM532BCYpBDZNHKLKKgM7CDyUg9uvf36YC9lJd1/9W6TxnttbYn0lH
 TdrBO1JWWlmhrFwFyOAq3mnF02Pm5tHN1rU2ZNA=
X-Google-Smtp-Source: ABdhPJyVsOJWiRYwiqxVeoCF+iuXVQ3FgRMi75nMZBLijJnqPP6Luqrd/udqVlnq1kZyh0TjoEB45Q==
X-Received: by 2002:a05:6402:1e91:: with SMTP id
 f17mr1891289edf.133.1628110486986; 
 Wed, 04 Aug 2021 13:54:46 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id z16sm1382133edr.51.2021.08.04.13.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Aug 2021 13:54:46 -0700 (PDT)
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210803211956.345316-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <2bad4653-e35a-ef6a-97bc-16d0ea5b42dc@mind.be>
Date: Wed, 4 Aug 2021 22:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210803211956.345316-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/syslog-ng: fix static build
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 03/08/2021 23:19, Fabrice Fontaine wrote:
> Fix static build failure raised since bump to version 3.33.1 in commit
> a9e405b07976815a5b7202a5fe50c8797e754178
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ccd0a954f6e0676db67026f8b8c89823f3e5c510
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ules-diskq-dqtool.c-fix-static-build.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
> 
> diff --git a/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch b/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
> new file mode 100644
> index 0000000000..3332b12e9e
> --- /dev/null
> +++ b/package/syslog-ng/0002-modules-diskq-dqtool.c-fix-static-build.patch
> @@ -0,0 +1,33 @@
> +From 04c8fe720d09bd6e53c4bcea9ad72ff131925ce6 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Fri, 23 Jul 2021 18:41:29 +0200
> +Subject: [PATCH] modules/diskq/dqtool.c: fix static build
> +
> +Fix the following static build failure:
> +
> +/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: ./lib/.libs/libsyslog-ng.a(lib_libsyslog_ng_la-messages.o):(.sbss+0x2c): multiple definition of `verbose_flag'; modules/diskq/dqtool.o:(.sbss+0x4): first defined here
> +/data/buildroot-autobuilder/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/riscv64-buildroot-linux-musl/10.2.0/../../../../riscv64-buildroot-linux-musl/bin/ld: ./lib/.libs/libsyslog-ng.a(lib_libsyslog_ng_la-messages.o):(.sbss+0x30): multiple definition of `debug_flag'; modules/diskq/dqtool.o:(.sbss+0x8): first defined here
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/ccd0a954f6e0676db67026f8b8c89823f3e5c510

 I would expect the commit message to mention why this is the correct solution,
i.e. something like:

debug_flag and verbose_flag are defined on lines xx-xx and again on lines 52-53.
When linking statically, this leads to build failures like:

...


 However, since the patch is already applied upstream, let's take it as is. So
applied to master, thanks.

 Regards,
 Arnout

> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/syslog-ng/syslog-ng/commit/04c8fe720d09bd6e53c4bcea9ad72ff131925ce6]
> +---
> + modules/diskq/dqtool.c | 2 --
> + 1 file changed, 2 deletions(-)
> +
> +diff --git a/modules/diskq/dqtool.c b/modules/diskq/dqtool.c
> +index 6105f2ec68..50be452453 100644
> +--- a/modules/diskq/dqtool.c
> ++++ b/modules/diskq/dqtool.c
> +@@ -49,8 +49,6 @@ gchar *persist_file_path;
> + gchar *assign_persist_name;
> + gboolean relocate_all;
> + gboolean display_version;
> +-gboolean debug_flag;
> +-gboolean verbose_flag;
> + gboolean assign_help;
> + 
> + static GOptionEntry cat_options[] =
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
