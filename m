Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D89C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B673040880;
	Tue, 15 Mar 2022 21:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XyvorctxuhMc; Tue, 15 Mar 2022 21:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A796E4086A;
	Tue, 15 Mar 2022 21:19:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8FA01BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E5B558419E
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iOme8P-0ney2 for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:19:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCEFD8413B
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:19:17 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id b15so446406edn.4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zA02cNHKHXfitFrDaGcD2EbrMh6/KbSkvSilGNdMu3s=;
 b=TZmAnTz7fBojJNNGFsX5cpybWGLTp8PHBOY80hTioLf8WioECdAPKgOlp+SNyKNWAv
 yWBogVpLwQduZpgt9J0+8mHsimRsQPp7OChh6yX3ALzDuJ0Tbez4InJTlJDqA7M4y9UC
 caff4TJnCeQOD1YUgSoQoY1zAVb5ezbOnKnTVB9BQS7lrItXdwxz59Og+Re+0imtqjCo
 S9cB6XMQyIHM35dtT6pYupHUSnJDjz6cAemUNxsNyLfj9J015l4bPHEe6NknbYtGadZG
 REvcLD8R626pjRr4Ne5KMLY6IoKVk7mjy5iqJ+FiOrYAk3mreSgSOiZOksqA76pUsSiJ
 fw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=zA02cNHKHXfitFrDaGcD2EbrMh6/KbSkvSilGNdMu3s=;
 b=k/kEtfo9EYcKTx1t9c1yau31eAd+IiBzqV+dohRQFCsNQ/OwVxmE7UPfriGesoSVGc
 zVezVjIUTBZUVBfoXJQxfQguoPm04CDKvC0DLggjczGbWX++2FnFUvGPRHKpde2rxfEc
 qLxW7NvMR88edsIv4oe65l59OotMQDRhcFbew1x/KG/Ujjy65XVPSe9HZ1d/MtUIpa6a
 ltE9v+K/BF1Yg8Tk7vkk9wC/nKnRh20JiX0BzkmTqjHAIWM34wkPVKV0/vvZDdCOToa9
 ZPORQ+XqRYBxT8mz7kdcU1gsEfZZ027DVUkDQP4NI7OCURa9anlcjPekzMdrVSWqPOL+
 6wPg==
X-Gm-Message-State: AOAM533ZqKinsjkMKVhQIwnU56cuEJhPhLaVnGpIiItz5mq6swXuRJ2x
 oe2JKMNm3UhlqqC/G3Yc7kmhVQ==
X-Google-Smtp-Source: ABdhPJyu6pRLdRksJoGBtDIRvPl+GWfJSyS8rC4pGth2BUyBCuV65oo3JOs2b//YLH6of96WwoVVsg==
X-Received: by 2002:a05:6402:187:b0:415:c784:abe0 with SMTP id
 r7-20020a056402018700b00415c784abe0mr27220027edv.168.1647379155958; 
 Tue, 15 Mar 2022 14:19:15 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a170906728500b006db8b630ebdsm55275ejl.209.2022.03.15.14.19.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:19:15 -0700 (PDT)
Message-ID: <5424d33f-c1db-f3ed-ff87-b3cfb061be33@mind.be>
Date: Tue, 15 Mar 2022 22:19:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220302210150.33658-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220302210150.33658-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/{gnupg,
 gnupg2}: use gnupg2 by default
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/03/2022 22:01, Julien Olivain wrote:
> This patch reverses the logic to select gnupg2 by default, while still
> allowing to select gnupg (v1).
> 
> Quoting: https://gnupg.org/download/index.html
> """
> GnuPG 1.4 is the old, single binary version which still support the
> unsafe PGP-2 keys. This branch has no dependencies on the above listed
> libraries or the Pinentry. However, it lacks many modern features and
> will receive only important updates.
> """
> 
> gnupg 1.4 is kept in Buildroot for now, as the package is still
> maintained upstream. It might still be useful is some specific cases:
> - it has a smaller footprint (compared to v2),
> - it has less dependencies (only zlib),
> - it has less build dependencies (can build static, no need for
> MMU/threads, ...)
> 
> Most Linux distributions are now shipping gnupg2 by default. gnupg v1
> is now more for legacy/compatibility/specific cases.
> 
> There is currently only two packages selecting gnupg in Buildroot:
> gpgme and python-gnupg
> This commit also reverses the logic for those packages.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Tested with:
> 
>      support/testing/run-tests \
>          -d dl -o output_folder \
>          -k tests.package.test_python_gnupg.TestPythonPy3GnuPG

  You should also test such changes in Config.in dependency handling with:
while true; do make randconfig; done

There are still a few errors that come out of that, but you can check that you 
don't introduce new ones. Which you did :-)

> 
> Note: this change was quickly discussed in:
> https://lists.buildroot.org/pipermail/buildroot/2022-January/634021.html
> ---
>   package/gnupg/Config.in        | 1 -
>   package/gnupg2/Config.in       | 1 +
>   package/libgpgme/Config.in     | 2 +-
>   package/python-gnupg/Config.in | 2 +-
>   4 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg/Config.in b/package/gnupg/Config.in
> index 2db46318f1..e92fca709d 100644
> --- a/package/gnupg/Config.in
> +++ b/package/gnupg/Config.in
> @@ -1,6 +1,5 @@
>   config BR2_PACKAGE_GNUPG
>   	bool "gnupg"
> -	depends on !BR2_PACKAGE_GNUPG2
>   	select BR2_PACKAGE_ZLIB
>   	help
>   	  GnuPG is the GNU project's complete and free implementation
> diff --git a/package/gnupg2/Config.in b/package/gnupg2/Config.in
> index ef1817ef02..9438cf69f6 100644
> --- a/package/gnupg2/Config.in
> +++ b/package/gnupg2/Config.in
> @@ -8,6 +8,7 @@ config BR2_PACKAGE_GNUPG2
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # libnpth
>   	depends on BR2_USE_MMU # libassuan, libnpth
>   	depends on !BR2_STATIC_LIBS

  I could fix those by moving all the dependencies to a new blind symbol 
BR2_PACKAGE_GNUPG2_DEPENDS...

> +	depends on !BR2_PACKAGE_GNUPG
>   	select BR2_PACKAGE_ZLIB
>   	select BR2_PACKAGE_LIBGPG_ERROR
>   	select BR2_PACKAGE_LIBGCRYPT
> diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
> index 4aabd06367..20f491b664 100644
> --- a/package/libgpgme/Config.in
> +++ b/package/libgpgme/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_LIBGPGME
>   	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgpg-error
>   	depends on BR2_USE_MMU # libassuan
>   	#gnupg is not needed to build, but at runtime.
> -	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2
> +	select BR2_PACKAGE_GNUPG2 if !BR2_PACKAGE_GNUPG

  And changing this into
  	select BR2_PACKAGE_GNUPG2 if BR2_PACKAGE_GNUPG2_DEPENDS && !BR2_PACKAGE_GNUPG 
# runtime
  	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2_DEPENDS # runtime

  See what got committed for the full context.

  Also, there's package/gcr that had some missing dependencies, so I fixed that 
in a separate commit as well.

  Applied to master, thanks.

  Regards,
  Arnout


>   	select BR2_PACKAGE_LIBGPG_ERROR
>   	select BR2_PACKAGE_LIBASSUAN
>   	help
> diff --git a/package/python-gnupg/Config.in b/package/python-gnupg/Config.in
> index 038a940778..54f8fb6a29 100644
> --- a/package/python-gnupg/Config.in
> +++ b/package/python-gnupg/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_PYTHON_GNUPG
>   	bool "python-gnupg"
> -	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2 # runtime
> +	select BR2_PACKAGE_GNUPG2 if !BR2_PACKAGE_GNUPG # runtime
>   	help
>   	  A wrapper for the Gnu Privacy Guard (GPG or GnuPG).
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
