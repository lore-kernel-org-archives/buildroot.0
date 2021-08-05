Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36460C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:44:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C137F610FC
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 16:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C137F610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89A3C81D3D;
	Thu,  5 Aug 2021 16:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id En4yo2-HdFX5; Thu,  5 Aug 2021 16:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8B6281CA5;
	Thu,  5 Aug 2021 16:44:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E49501BF574
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D324D404B4
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 16:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVyp3FSyQHeu for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 16:44:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BEB8040003
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 16:44:12 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y12so9286543edo.6
 for <buildroot@buildroot.org>; Thu, 05 Aug 2021 09:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T+4pP+hceTxwdOu9jkTn7tj7IPM04mNoehnu2IkZZ28=;
 b=F/fbDpkOTMMa2+3GwXWK9CbsmQmpxYKMhcjqB+8mzjW/dIKhAmlEKapy5dND4MXWV7
 lifJLrZsMGI91zj/+jPgugvxoY2sbjqbJSvA+6Wdn06AMn8hzif62GGJMhA9/hyILoYU
 vF//Gs+a8wMBYB31TPO/VdY5+cJ5NF5r9XGQX8SFarTJLWw1pX8PUPkBsMtGtijctE7E
 T8FXNy1ZwEWpqZOcUwNmw4IGtxYrahg2EV+9IW/2hVIvb8xctwgdjJZAt6+J9aII5lRz
 HEmwVWk03caIc/Xf9ViXadfluOFcnfn5KU8ooyMO04X51TqHHrltifr83mrpNR1ulJ6w
 ZYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=T+4pP+hceTxwdOu9jkTn7tj7IPM04mNoehnu2IkZZ28=;
 b=V+Fql2x+jj3SC55i3pfac6vpb+SqkhkCbkiEJgSmAp78N+Phlya/uEhl8uLGsMmNwx
 HYmXsK4swjEhpMpuOqj3dhhLPd52OaAt02IncFBcGA9yLYVWEaWz3tlkx0k2QWQmgHO+
 WKeFHkqEu3VjN9jJHQw1J6d9C+/VcHiLXgJq0BfBLNpkDgQ48U3XWCEcXJ3Ku/n6uKAa
 SOgPk969MZzqw6XWHOqU/m1E+55E+s6KU3HcZEj+6SrGIeEe5r+k5Z0BQ059SOJ2CGdK
 x7+fHinlkxP6FRwprFDNRAwyatrwWIO3KEi7xWl8C5R+wuD+pE8GbjStdP9bVx0ioIwB
 8Q3A==
X-Gm-Message-State: AOAM533Zp27ryyorReVgo+l1aiBg47aF0wtZJwyTa257XIyUv66T17OO
 TPdtTGFlNVdblWe/MKVGYciUOBTC2xl5rNMSZQY=
X-Google-Smtp-Source: ABdhPJz8bpQ3yFmsI1HGQ3Kn1XndYTuS2Z3uY/q3y8dw+g0x6809rxp7U7YqHuL560lfjMge2SB9/g==
X-Received: by 2002:a50:fb18:: with SMTP id d24mr7747693edq.225.1628181850878; 
 Thu, 05 Aug 2021 09:44:10 -0700 (PDT)
Received: from ?IPv6:2001:1c01:3101:8300:5100:9bb9:68ea:c9f3?
 (2001-1c01-3101-8300-5100-9bb9-68ea-c9f3.cable.dynamic.v6.ziggo.nl.
 [2001:1c01:3101:8300:5100:9bb9:68ea:c9f3])
 by smtp.gmail.com with ESMTPSA id cw9sm1875008ejc.59.2021.08.05.09.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 09:44:10 -0700 (PDT)
To: Pascal de Bruijn <p.debruijn@unilogic.nl>, buildroot@buildroot.org
References: <20210805085353.3457-1-p.debruijn@unilogic.nl>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <26a50a3f-b68a-1884-6df2-ee562668b189@mind.be>
Date: Thu, 5 Aug 2021 18:44:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805085353.3457-1-p.debruijn@unilogic.nl>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/3] package/php: remove ineffective opcache
 patch
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
> Current opcache builds compile, but fail at runtime due to shm_unlink not
> being resolvable.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  .../0005-allow-opcache-cross-compiling.patch  | 37 -------------------
>  1 file changed, 37 deletions(-)
>  delete mode 100644 package/php/0005-allow-opcache-cross-compiling.patch
> 
> diff --git a/package/php/0005-allow-opcache-cross-compiling.patch b/package/php/0005-allow-opcache-cross-compiling.patch
> deleted file mode 100644
> index d168f71892..0000000000
> --- a/package/php/0005-allow-opcache-cross-compiling.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 9bb316c41a69935ee2072626467241889594bed4 Mon Sep 17 00:00:00 2001
> -From: Adam Duskett <aduskett@gmail.com>
> -Date: Mon, 28 Jun 2021 11:12:36 -0700
> -Subject: [PATCH] allow opcache cross-compiling
> -
> -Remove the check at the end of ext/opcache/config.m4 that prevents opcache from
> -being enabled in a cross-compiled environment. We pass the following as a
> -CFLAGS when opcache is enabled:
> -  -DHAVE_SHM_IPC
> -  -DHAVE_SHM_MMAP_ANON
> -  -DHAVE_SHM_MMAP_ZERO
> -  -DHAVE_SHM_MMAP_POSIX
> -  -DHAVE_SHM_MMAP_FILE
> -
> -Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ----
> - ext/opcache/config.m4 | 4 ----
> - 1 file changed, 4 deletions(-)
> -
> -diff --git a/ext/opcache/config.m4 b/ext/opcache/config.m4
> -index 5492fd92..10c150ff 100644
> ---- a/ext/opcache/config.m4
> -+++ b/ext/opcache/config.m4
> -@@ -339,10 +339,6 @@ int main() {
> -   PHP_ADD_BUILD_DIR([$ext_builddir/Optimizer], 1)
> -   PHP_ADD_EXTENSION_DEP(opcache, pcre)
> - 
> --  if test "$have_shm_ipc" != "yes" && test "$have_shm_mmap_posix" != "yes" && test "$have_shm_mmap_anon" != "yes"; then

 I don't understand how opcache can work at all if you remove this patch.
have_shm_mmap_anon is still no after patch 2/3, so opcache won't work, right?

 Regards,
 Arnout

> --    AC_MSG_ERROR([No supported shared memory caching support was found when configuring opcache. Check config.log for any errors or missing dependencies.])
> --  fi
> --
> -   if test "$PHP_OPCACHE_JIT" = "yes"; then
> -     PHP_ADD_BUILD_DIR([$ext_builddir/jit], 1)
> -     PHP_ADD_MAKEFILE_FRAGMENT($ext_srcdir/jit/Makefile.frag)
> --- 
> -2.31.1
> -
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
