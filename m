Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C512CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7960940B4B;
	Thu, 16 Dec 2021 18:23:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DyoZcj7zKjUP; Thu, 16 Dec 2021 18:23:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D9F340B46;
	Thu, 16 Dec 2021 18:23:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 629911BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EEDC8330B
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3t3b9FWeGXnC for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:23:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBF9E83280
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:23:02 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x15so91084814edv.1
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yriCBQ2EHsjFZmbdvuz4oQlVCFDvKbfGvKxS+1sybQE=;
 b=U8lJDtREEfe4T9UOOTvAIvWezuM1of0JEvTExyt4kODk5ezhRlFBU2J4CScNj0v+mW
 2HIc8V9m2y6gfLGPdIZbVoaL6RfqZKl1zoDm/JHSL0Sf+1BOllHmLQGs3xoja5iwAPqA
 pn7RmdGPs2JJWjcMfu9w+tn/rmm8SoerVHOyJIhso7YhDeDzUsGeTQRT5VcUV/2ddQvx
 Ir7CoIEcKDWoO08IlxHcYx7v5509HODmfuZK+F19Y/D7qgBcEAX2sS2nBHIK4MDDH9ih
 PCz1pKWdcksltEddgEaJhACIt1G0SxzbnY7M/r83OeSnT3Qtc8JWxIC9imb00YjfgJq1
 ir1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=yriCBQ2EHsjFZmbdvuz4oQlVCFDvKbfGvKxS+1sybQE=;
 b=c4w4kzbpjo0Ym6DPXbtNvFl5CmmVNulBFDUZp9MdQRwgl38fbwHSqdrv0nv8Owbwez
 bz3MBcbXk/pBj3v5BLviTB8nyGzbtLM6cIIYSY+ABF1Vs7QFN2GAmzgDS7ge+ArJteha
 pNqfuWHiJZF5C4nK4Zjia1sTXM287YjlRVqEjftMWhDgGd5b1/wPVlvRfX+DfN8q01+g
 srBgZtlN6i5qPyOJDy5H9QKOvf8tjq8Y3F5Aa0Ji+O7kznlXP6N+dz9LmtEjR1ORSXJ7
 FTL9z30f0I1HSvoGiibzjaV4P4KxqOO3NBhCZAPu2zMeIey0saMYGBV3wJzNhbh2OIPJ
 RL6w==
X-Gm-Message-State: AOAM532B1+0PDY3cwzj/sLvozGEJfOCbeCpjIz+iMZ8ch4z4ruSt9zkd
 2P5JUTZeDdc6tqKrbwL5bpFXwA==
X-Google-Smtp-Source: ABdhPJyRUPRVixv1QyXKN/HRx+z+Ffxs2PgG9T6DAL9OmP1yhXrm++LhHVDfHd8BK7+JKM1RUbpC0g==
X-Received: by 2002:a17:906:2f97:: with SMTP id
 w23mr16653587eji.739.1639678981048; 
 Thu, 16 Dec 2021 10:23:01 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o8sm2800395edc.25.2021.12.16.10.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:23:00 -0800 (PST)
Message-ID: <361b6ca5-85a6-a975-b29c-4cb92b363f93@mind.be>
Date: Thu, 16 Dec 2021 19:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211214231457.3281409-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211214231457.3281409-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/haveged: bump to version 1.9.15
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 00:14, Fabrice Fontaine wrote:
> Drop patch (already in version) and so autoreconf
> 
> https://github.com/jirka-h/haveged/releases/tag/v1.9.15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...Check-for-sys-auxv.h-before-using-it.patch | 60 -------------------
>   package/haveged/haveged.hash                  |  2 +-
>   package/haveged/haveged.mk                    |  4 +-
>   3 files changed, 2 insertions(+), 64 deletions(-)
>   delete mode 100644 package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
> 
> diff --git a/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch b/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
> deleted file mode 100644
> index 042135f127..0000000000
> --- a/package/haveged/0001-Check-for-sys-auxv.h-before-using-it.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 676abde95bab10e1d26e91682772514010143343 Mon Sep 17 00:00:00 2001
> -From: Peter Seiderer <ps.report@gmx.net>
> -Date: Sun, 21 Mar 2021 17:00:08 +0100
> -Subject: [PATCH] Check for sys/auxv.h before using it.
> -
> -- fixes uclibc-ng compile (does not provide sys/auxv.h header file)
> -
> -Fixes:
> -
> -  haveged.c:22:10: fatal error: sys/auxv.h: No such file or directory
> -     22 | #include <sys/auxv.h>
> -        |          ^~~~~~~~~~~~
> -
> -[Upstream: https://github.com/jirka-h/haveged/pull/59]
> -Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ----
> - configure.ac  | 1 +
> - src/haveged.c | 4 ++++
> - 2 files changed, 5 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index c172a10..a0263f5 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -125,6 +125,7 @@ AC_CHECK_HEADERS(stdio.h)
> - AC_CHECK_HEADERS(stdlib.h)
> - AC_CHECK_HEADERS(string.h)
> - AC_CHECK_HEADERS(sys/ioctl.h)
> -+AC_CHECK_HEADERS(sys/auxv.h)
> - AC_CHECK_HEADERS(sys/mman.h)
> - AC_CHECK_HEADERS(sys/types.h)
> - AC_CHECK_HEADERS(sys/socket.h)
> -diff --git a/src/haveged.c b/src/haveged.c
> -index b9cb77b..dad3072 100644
> ---- a/src/haveged.c
> -+++ b/src/haveged.c
> -@@ -19,7 +19,9 @@
> -  ** along with this program.  If not, see <http://www.gnu.org/licenses/>.
> -  */
> - #include "config.h"
> -+#if defined(HAVE_SYS_AUXV_H)
> - #include <sys/auxv.h>
> -+#endif
> - #include <stdlib.h>
> - #include <stdio.h>
> - #include <getopt.h>
> -@@ -135,8 +137,10 @@ int main(int argc, char **argv)
> - {
> -    volatile char *path = strdup(argv[0]);
> -    volatile char *arg0 = argv[0];
> -+#if defined(HAVE_SYS_AUXV_H)
> -    if (path[0] != '/')
> -       path = (char*)getauxval(AT_EXECFN);
> -+#endif
> -    static const char* cmds[] = {
> -       "b", "buffer",      "1", SETTINGR("Buffer size [KW], default: ",COLLECT_BUFSIZE),
> -       "d", "data",        "1", SETTINGR("Data cache size [KB], with fallback to: ", GENERIC_DCACHE ),
> ---
> -2.30.2
> -
> diff --git a/package/haveged/haveged.hash b/package/haveged/haveged.hash
> index f55e004923..8c62ead7c3 100644
> --- a/package/haveged/haveged.hash
> +++ b/package/haveged/haveged.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  938cb494bcad7e4f24e61eb50fab4aa0acbc3240c80f3ad5c6cf7e6e922618c3  haveged-1.9.14.tar.gz
> +sha256  f882919ccead07ad6687a4784c0c501e617321e96dd0118403464969359cf6ad  haveged-1.9.15.tar.gz
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
> index 5d76bdc3c9..7035142aee 100644
> --- a/package/haveged/haveged.mk
> +++ b/package/haveged/haveged.mk
> @@ -4,13 +4,11 @@
>   #
>   ################################################################################
>   
> -HAVEGED_VERSION = 1.9.14
> +HAVEGED_VERSION = 1.9.15
>   HAVEGED_SITE = $(call github,jirka-h,haveged,v$(HAVEGED_VERSION))
>   HAVEGED_LICENSE = GPL-3.0+
>   HAVEGED_LICENSE_FILES = COPYING
>   HAVEGED_SELINUX_MODULES = entropyd
> -# patch touching configure.ac
> -HAVEGED_AUTORECONF = YES
>   
>   # '--disable-init' as buildroot ships its own sysv/systemd init files
>   HAVEGED_CONF_OPTS = \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
