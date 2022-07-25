Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88034CCA48A
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C06661225;
	Mon, 25 Jul 2022 22:22:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C06661225
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DnGe5DCU81U0; Mon, 25 Jul 2022 22:22:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ABBF60E57;
	Mon, 25 Jul 2022 22:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ABBF60E57
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C55F01BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B73741A52
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B73741A52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0gpqbSC84EWv for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:22:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3465F41A4C
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3465F41A4C
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:22:35 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id n185so7679938wmn.4
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:22:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=knNzIHZ7RES+O8tX89Y2G9irA+4FyxS7NLCPats08fU=;
 b=veUhtXg7Qqn3Lg90O4ou34COUhB1NtLiLv+vwdxKYE/2+zQPX4rF4R38srobzFeuRx
 JV0FaxR8TpIaXYYs/9wFsmekmyLPw4D/ZXSbqvDyetv6fprIiFYPrFlVDf+S46CTKwdT
 kmjMkr4Gm9OEtBHHBA6SemRC1eRzz0URJ/QXAhxzx9/dmNcmJEUaFDn3cQgiKHn90Y2X
 z+jYNgTlSETkPuD7Pzo7C8Se6dd8pt9PMnomcaIuX/ZkyL9TD6woaTfDYyr2Yd+v+R7A
 OgkNK091lINn1b+Fi1Dvkitc5E9zk0vpDkjZPLPnagdKOLoB1LY0GQJHKKp74f3vADEd
 +vww==
X-Gm-Message-State: AJIora/WAQ07mWgKZC/C46tCbCHzOxABDNJlcMa00xlj67VxieZ5hzqY
 rX+IEfcKkas5qOrft0S6Lq9yvQ==
X-Google-Smtp-Source: AGRyM1s6NvnDdjHLLIQZhzda03bHL0+LOYVamHYcRpVfZVVnWd1R6EucMvAztPfrEVBtSR8TBgqLTg==
X-Received: by 2002:a05:600c:3845:b0:3a3:227d:c1c6 with SMTP id
 s5-20020a05600c384500b003a3227dc1c6mr22922497wmr.9.1658787753341; 
 Mon, 25 Jul 2022 15:22:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a1c5454000000b003a30c3d0c9csm19979813wmi.8.2022.07.25.15.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:22:32 -0700 (PDT)
Message-ID: <31854085-b1d5-19b6-4c5d-218bd2c74684@mind.be>
Date: Tue, 26 Jul 2022 00:22:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <a4133389-1182-11aa-9edc-215ffd82eb48@smile.fr>
 <20220725123002.2967-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220725123002.2967-1-br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=knNzIHZ7RES+O8tX89Y2G9irA+4FyxS7NLCPats08fU=;
 b=henknC9vb9icF/hdiycZqOHVoF1nYYkEqY7haBazHeYwGhtPJk1jkqDzZ/cC/WMztU
 aWSV4avSYbUtBsFOGWAZvUZBiIG80VRd+PCeQQrPm65FHIdOFRkZJZ9gpq9rVM5c5oRO
 Qmul4vwUoAV3LA8PTGwKDZt+sJLR89jrAzkfkXfTJatRAM82yDSUvKRA0x4S1rodAxO4
 u7iC66aakeEnfclTzKErVANAnStwrlAsaxXWO8H8tj+xVzC3c3ITmEVHITcZP6chbAZd
 +jZyGDTUu7U2gxQMthcXNmspMbWJsbGGOQ7HIGv1vtsZUn9EVRx4P6zu4qoPY/IeIAii
 I7gg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=henknC9v
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mpd: add io_uring optional
 dependency
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
Cc: Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?Q?J=c3=b6rg_Krause?= <joerg.krause@embedded.rocks>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/07/2022 14:30, Andreas Ziegler wrote:
> Since version 0.22 mpd provides an option to use the io_uring kernel interface
> for asynchronous access to local files. Buildroot has the necessary library
> (package/liburing) since commit 03ca6f4e39874583060317e7e15e9e360220877e.
> 
> Add an optional dependency on liburing to enable asynchronous file access using
> the kernel io_uring interface.
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> Reviewed-by: Romain Naour <romain.naour@smile.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>    Commit message (Romain Naour)
>    Dependency comment (Romain Naour)
>    Modify patch description to match commit message
> 
>   package/mpd/Config.in | 10 ++++++++++
>   package/mpd/mpd.mk    |  7 +++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index fc0f409448..8f0af7b2d3 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -347,6 +347,16 @@ config BR2_PACKAGE_MPD_AVAHI_SUPPORT
>   comment "avahi support needs a toolchain w/ dynamic library"
>   	depends on BR2_STATIC_LIBS
>   
> +config BR2_PACKAGE_MPD_IO_URING
> +	bool "io_uring"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
> +	select BR2_PACKAGE_LIBURING
> +	help
> +	  Asynchronous I/O using kernel io_uring subsystem
> +
> +comment "io_uring support needs a toolchain w/ headers >= 5.1"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
> +
>   config BR2_PACKAGE_MPD_LIBMPDCLIENT
>   	bool "libmpdclient"
>   	select BR2_PACKAGE_LIBMPDCLIENT
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index e265a9fc4f..c21426b873 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -119,6 +119,13 @@ else
>   MPD_CONF_OPTS += -Did3tag=disabled
>   endif
>   
> +ifeq ($(BR2_PACKAGE_MPD_IO_URING),y)
> +MPD_DEPENDENCIES += liburing
> +MPD_CONF_OPTS += -Dio_uring=enabled
> +else
> +MPD_CONF_OPTS += -Dio_uring=disabled
> +endif
> +
>   ifeq ($(BR2_PACKAGE_MPD_JACK2),y)
>   MPD_DEPENDENCIES += jack2
>   MPD_CONF_OPTS += -Djack=enabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
