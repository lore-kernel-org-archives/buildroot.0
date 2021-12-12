Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D942C433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 15:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55FF78547D;
	Sun, 12 Dec 2021 15:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kdo1bW-KKVgF; Sun, 12 Dec 2021 15:11:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 908D585476;
	Sun, 12 Dec 2021 15:11:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B86471BF3EC
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B425260E87
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 15:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 30N24OSGfw09 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 15:11:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3391D60A8E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 15:11:35 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id o20so44941252eds.10
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 07:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=yENALNSGwm7kjvNfbvT0TTxASByUKsqT5S0mFw2T8pI=;
 b=MwrFZJrblnItJ5UnMBrnw9zXQ9gylkK4EM0kQrk2O8KyUj4HwA9S4ytS/J1YbXr1Po
 fAANcfgo968IqlCzTWaaiFcSqRoUBvgdh4M2QLLiMdi8t9UndDPfa6NiEyT253FcexDU
 KAEGSzKCGIqi5WF8TBW0394lS4E25OE5CHeTLfbc3w0r/FfAfl7Ss7J4SgK7PkrkCEhV
 mOGRPJ33Lzw8oo55j5hc31MR0QKcoAw9s4yWAyhfxdTdRDm8r8M44YxP2hp2cLw7C57g
 Pd9w0PQtrx43GCWGLPsIMCvYwCSTbUsRuklMpVtGLA6VN4as7afPjhCt81mmVvlB9yqi
 yH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yENALNSGwm7kjvNfbvT0TTxASByUKsqT5S0mFw2T8pI=;
 b=tT5ews52J+llhDEzHkAmrc7BpunmD32IwBVSG9pVhnvrJniRX5Eiry7KunA6fn3+KO
 0qB/OToJpXFk0aiovAdkHb8hyiIcvMcUbjaXfF2SFf4Gum5i18UzCMfeEndW4AuiTW7T
 wBR7qahCKSSTx3o7UIQLpYWFI7Snv5/02dF98Md+5MmF57uQFj9+hZNqGcVyL7uxo4zp
 x3UD3GLFi0m9oDklJVfMro5OyrHLvHjhqCBJlWf0AaT/G9GDLSObStN0C+hUHCSLVV4R
 g6mqjJkswE90Z93JanrGlBm2GUNQEh71oOmwtxd16OBaq3FwUapPJE2ovB3wcgtPTAcL
 K4kA==
X-Gm-Message-State: AOAM5338RcL2LxWqVEFeZ9LTfnW8BbB1zI4GRLZGPxr7PqUzYaa85RFh
 c6ONBPN8ZYJGnWmNrxQ3iHt8Ig==
X-Google-Smtp-Source: ABdhPJw/amc62aqKOIfMrj3w/Ft1H8h88koqaS1/MOSqLkfOlsX1pcQHcAyA6xTUrRsHc6UW9kPXqQ==
X-Received: by 2002:a17:907:2d0e:: with SMTP id
 gs14mr38062445ejc.249.1639321893410; 
 Sun, 12 Dec 2021 07:11:33 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c8sm4656446edu.60.2021.12.12.07.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 07:11:33 -0800 (PST)
Message-ID: <54843277-cacb-beda-f25a-02a8510f9a11@mind.be>
Date: Sun, 12 Dec 2021 16:11:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211211213904.562446-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211211213904.562446-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/chrony: bump to version 4.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/12/2021 22:39, Fabrice Fontaine wrote:
> Drop patch (already in version)
> 
> https://git.tuxfamily.org/chrony/chrony.git/tree/NEWS?id=4.1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-fix-build-with-older-kernel-headers.patch | 33 -------------------
>   package/chrony/chrony.hash                    |  4 +--
>   package/chrony/chrony.mk                      |  2 +-
>   3 files changed, 3 insertions(+), 36 deletions(-)
>   delete mode 100644 package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch
> 
> diff --git a/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch b/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch
> deleted file mode 100644
> index 892664f494..0000000000
> --- a/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 5dab78341bd515692f1b9ff8716a911c3ebf9ee1 Mon Sep 17 00:00:00 2001
> -Message-Id: <5dab78341bd515692f1b9ff8716a911c3ebf9ee1.1611839550.git.baruch@tkos.co.il>
> -From: Baruch Siach <baruch@tkos.co.il>
> -Date: Thu, 28 Jan 2021 15:02:40 +0200
> -Subject: [PATCH] sys_linux: fix build with older kernel headers
> -
> -The renameat2 system call was introduced in kernel version 3.15. Fix
> -build against older headers.
> -
> -Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ----
> -Upstream status: commit a2372b0c3abfc85d11c1684c0fb6370cc329e5c4
> -
> - sys_linux.c | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/sys_linux.c b/sys_linux.c
> -index 0b24445e173d..202da845edac 100644
> ---- a/sys_linux.c
> -+++ b/sys_linux.c
> -@@ -547,7 +547,9 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
> -     SCMP_SYS(readlinkat),
> -     SCMP_SYS(rename),
> -     SCMP_SYS(renameat),
> -+#ifdef __NR_renameat2
> -     SCMP_SYS(renameat2),
> -+#endif
> -     SCMP_SYS(stat),
> -     SCMP_SYS(stat64),
> -     SCMP_SYS(statfs),
> ---
> -2.29.2
> -
> diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
> index 87e0cf8ea0..f8dd1438bc 100644
> --- a/package/chrony/chrony.hash
> +++ b/package/chrony/chrony.hash
> @@ -1,4 +1,4 @@
> -# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2020/10/msg00000.html
> -sha256  be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625  chrony-4.0.tar.gz
> +# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2021/05/msg00000.html
> +sha256  ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c  chrony-4.1.tar.gz
>   # Locally calculated
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
> index dc162a6c40..5a34f70e1e 100644
> --- a/package/chrony/chrony.mk
> +++ b/package/chrony/chrony.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CHRONY_VERSION = 4.0
> +CHRONY_VERSION = 4.1
>   CHRONY_SITE = http://download.tuxfamily.org/chrony
>   CHRONY_LICENSE = GPL-2.0
>   CHRONY_LICENSE_FILES = COPYING
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
