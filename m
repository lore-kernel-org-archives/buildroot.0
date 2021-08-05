Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FA1C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:39:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77645610FF
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77645610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F94440308;
	Thu,  5 Aug 2021 16:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MU81pUYgN1KJ; Thu,  5 Aug 2021 16:39:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C15040309;
	Thu,  5 Aug 2021 16:39:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A3441BF574
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06AFB40309
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:39:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EUn2pifIktAh for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 16:39:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B30E140308
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 16:39:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id go31so10613303ejc.6
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 09:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IJ2iCq69Oq+C8rNrSzLy5C8u46gCQ6/S5lJDbIBbLmo=;
 b=GYAP6cytYTvhOFqlpd4Qjut6RuWYD9xSH+5IOfAYrHCDSBUvcu1latspcGQG1zny7O
 5yVbE5tZQC4jMTF5PakeqzHJodcvate26vVxz7pi7puO46yt4qBNXn9Hw7EeCyq7yZzj
 ctviMi8EWkRBge9YHVdUt+b2c6tv67qAJUKjFaqB50LCffqaAWBc7eqy+xrsSEHpC0ez
 4E1Zd3wADtluPkF4rFSfgLDiNzzidPDp1FmsPAL75PhRBueDTDFtChU+pw/HKGk+hBqD
 FGQrvx4dCgQW0UTeme0SlC3sXg+RmjBcZIrxEarBuosF6pFGj/1g2or9DSwJhK2ikeQW
 ckEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IJ2iCq69Oq+C8rNrSzLy5C8u46gCQ6/S5lJDbIBbLmo=;
 b=sIZ8sw/bKkw/iGTOfAbzbb+pqZg944aZX7tUH90X+IoU8eijSyBoMQYHIXlI2M+7+S
 dl39uIKx+skz0zAWpacrtqSmKg0uttFDyJE0y+ba/fH9hTxmxQOcr1imh/dKG46dDMbk
 MjI2xnDXvZ0xeqaA43uyEP/HUsgZdfILr2xb2GhK06EjLpvUoz1R8921urDAy9yeY/T+
 cH7Q9d/8nhKHniN4TjuxIN3rVjFBq/c8WXgDzCbsGwm4Ruip+eJ0TC0lnu/6BROZGDqK
 ixlCE7XQ7azgDXAgLQjNI6ozhJYQecVZDjrBzq47hh4J3L+5CfB7KyChutB04/4n6tVA
 QKrg==
X-Gm-Message-State: AOAM53282rLcz0zCzmtqB2eC2s4jDxotHi2piaHVnB9LTXrkSufoeU9a
 I8MPojmNzzYQMCS8J+RrDUxgnw==
X-Google-Smtp-Source: ABdhPJw2PolL9BUxO0LgA2dqhRPePg5DSDtiPDZK6k++dNxNl2eUmsodmKdvkN9OGVbNOiRetA5pow==
X-Received: by 2002:a17:906:7e04:: with SMTP id
 e4mr5702677ejr.225.1628181574968; 
 Thu, 05 Aug 2021 09:39:34 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 ([2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id cq15sm2553496edb.62.2021.08.05.09.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 09:39:34 -0700 (PDT)
To: Pascal de Bruijn <p.debruijn@unilogic.nl>, buildroot@buildroot.org
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
 <20210805085353.3457-2-p.debruijn@unilogic.nl>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <29e90253-7562-e1de-4700-74bb07e045d8@mind.be>
Date: Thu, 5 Aug 2021 18:39:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805085353.3457-2-p.debruijn@unilogic.nl>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 2/3] package/php: opcache link against librt
 for shm_unlink
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
Cc: aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 05/08/2021 10:53, Pascal de Bruijn wrote:
> shm_unlink is resolved at runtime, therefore verification needs
> to be done at runtime as well:
> 
> php -dopcache.enable_cli=1 -r 'print "test\n";'
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  ...he-link-against-librt-for-shm_unlink.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/php/0005-opcache-link-against-librt-for-shm_unlink.patch
> 
> diff --git a/package/php/0005-opcache-link-against-librt-for-shm_unlink.patch b/package/php/0005-opcache-link-against-librt-for-shm_unlink.patch
> new file mode 100644
> index 0000000000..177a7a2b0f
> --- /dev/null
> +++ b/package/php/0005-opcache-link-against-librt-for-shm_unlink.patch
> @@ -0,0 +1,26 @@
> +From: Pascal de Bruijn <p.debruijn@unilogic.nl>
> +Date: Wed, 04 Aug 2021 10:01:00 +0200
> +Subject: [PATCH] opcache link against librt for shm_unlink
> +
> +We do this by modifying the fourth parameter of the relevant
> +AC_RUN_IFELSE statement, which is the result if a cross compile
> +is detected.
> +
> +Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> +---
> +
> +diff -Nurpd a/ext/opcache/config.m4 b/ext/opcache/config.m4
> +--- a/ext/opcache/config.m4	2021-07-29 14:53:58.000000000 +0200
> ++++ b/ext/opcache/config.m4	2021-08-04 09:20:16.950350469 +0200
> +@@ -295,7 +295,10 @@ int main() {
> +   ],[
> +     AC_MSG_RESULT([no])
> +   ],[
> +-    AC_MSG_RESULT([no])
> ++    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
> ++    AC_MSG_RESULT([yes])
> ++    have_shm_mmap_posix=yes
> ++    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])

 What's the upstream status of this patch? It looks pretty wrong... Basically,
when cross-compiling, you will assume that shm_mmap is available
unconditionally. At the very least, things should be moved down into the
PHP_CHECK_LIBRARY part (with an action-if-not-found branch that keeps the
original 'no' result). So something like:

PHP_CHECK_LIBRARY(rt, shm_unlink, [
  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
  AC_MSG_RESULT([yes])
  have_shm_mmap_posix=yes
  PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)
],[
  AC_MSG_RESULT([no])
])

Alternatively (probably better), use AC_CHECK_FUNC and keep the original
PHP_CHECK_LIBRARY in the action-if-found branch.

 Also, better check for shm_open instead of shm_unlink - shm_open is the
function mentioned in the AC_MSG_CHECKING() call.



 Regards,
 Arnout


> +   ])
> + 
> +   PHP_NEW_EXTENSION(opcache,
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
