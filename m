Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3830CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3389408E2;
	Wed, 27 Apr 2022 17:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXSg402vmPv6; Wed, 27 Apr 2022 17:13:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4A8F4049B;
	Wed, 27 Apr 2022 17:12:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B79C1BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8932241A19
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8DfQR59b6g8Y for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:12:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D79641A0A
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:12:53 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id gh6so4800365ejb.0
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hSNaoiJKDhb2auocR7G8jEF7FXHpo1/awFFc5h2Fc+E=;
 b=KGYDX8whMZRIdv7NcLXmEgj077HtgoORogv1OKn3HnaqxpVPH3N0S+8yiRDqnmq86D
 4/BsBP6TdR8WWR18BCQ165JBvl0Cvwn7cT29eR30xA0o3gL6cMVwXNdsNDP4v9RS9bY1
 uKvXw2aaDd1DVabYtzTnerzWwpmOHPayO4dXTBqldVucB+NVhf/czAhVAz2tMBI3Xfg0
 0XJu7+TV3NvS+QZm9Y6CSCPCmopYiGbmoqHLwv11Ig5OgHPQ7VjOtIXl9Xk56iWzI+RE
 qKPJH9AQZe9PJRcThoGfYexshWF1cWU0fh3xYcgP7cOXPWh0Q+ClzzFxc9e3JPieECv0
 3dig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hSNaoiJKDhb2auocR7G8jEF7FXHpo1/awFFc5h2Fc+E=;
 b=mkAUsdIgIdEIhPhv7tcCB9PfaeAbZwmAunQLqUEPR7lBgEULupKyp4x72DlzEK0M/u
 sc5vBEPL3YqQqvMIMKeWjXAgPrwHTldQF+Lurq2oU9dnta5ZNdCHbyHxva8pAasch3Xu
 XjZI13Z3zIFlFxYsC5lCWnKhUtJbbE6AgndORFKKIU6Qi0QpGWYVGTC/KWgH47V7W3IF
 coXrRBWs3PfW9+KKqA1g6zmvRXmTuBCuQQrCxRgJXUFCL0WjePN5jMNbwJOiQOlbC7Qg
 Hsu+gs/ADPyIqe5ublhxvNqP0tDkU5p/Qr4sOFgAttsXXCubqjVftS3b4dDKxjAamKgq
 O36A==
X-Gm-Message-State: AOAM5336za2PDAPNWe3dZrQF+EO7sUvOIp4V30xsiY7M5hWjgfeZc4uM
 PPAAhm0Bh/+LbY3ONjeJDstBqSrZZbLLLA==
X-Google-Smtp-Source: ABdhPJzmdL/JYNGJvSBM69tfjWEV48/3BOg1lZASpTsfkA6LdKf+osbXvC8K9XLOtLbytAHLxhStBA==
X-Received: by 2002:a17:907:9958:b0:6e7:f67a:a1e7 with SMTP id
 kl24-20020a170907995800b006e7f67aa1e7mr26519292ejc.400.1651079571565; 
 Wed, 27 Apr 2022 10:12:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a170906c18c00b006f3b99d29e0sm2686945ejz.223.2022.04.27.10.12.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:12:51 -0700 (PDT)
Message-ID: <cbf4b541-01eb-23c9-b403-ca0e89704f83@mind.be>
Date: Wed, 27 Apr 2022 19:12:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220424191032.3222587-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424191032.3222587-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptsetup: fix build with
 argp-standalone
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2022 21:10, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of argp-standalone to
> version 1.4.1 in commit 0fe85041bc9e0b4ade4d71dd10b61c3b9ec8945d and
> https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043:
> 
> /home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `parse_opt':
> cryptsetup-ssh.c:(.text+0x14c): undefined reference to `argp_state_help'
> /home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `main':
> cryptsetup-ssh.c:(.text+0x7db): undefined reference to `argp_parse'
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/cb3fdae4e0da603f304501f65127800346cb3915
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...onfigure.ac-replace-argp_usage-check.patch | 40 +++++++++++++++++++
>   package/cryptsetup/cryptsetup.mk              |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch
> 
> diff --git a/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch b/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch
> new file mode 100644
> index 0000000000..66e3be350c
> --- /dev/null
> +++ b/package/cryptsetup/0002-configure.ac-replace-argp_usage-check.patch
> @@ -0,0 +1,40 @@
> +From 21515ad7a3b000ee6038f82bbb428ab527002bbd Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 24 Apr 2022 19:47:53 +0200
> +Subject: [PATCH] configure.ac: replace argp_usage check
> +
> +Replace check for argp_usage by argp_parse as argp_usage is not used by
> +cryptsetup. Moreover, this will fix the following build failure raised
> +with argp-standalone in version 1.4.0 and
> +https://github.com/ericonr/argp-standalone/commit/e7ff8d9787d2641e55f6ac4afb777da60ef98043:
> +
> +/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `parse_opt':
> +cryptsetup-ssh.c:(.text+0x14c): undefined reference to `argp_state_help'
> +/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/i686-buildroot-linux-musl/10.3.0/../../../../i686-buildroot-linux-musl/bin/ld: tokens/ssh/cryptsetup_ssh-cryptsetup-ssh.o: in function `main':
> +cryptsetup-ssh.c:(.text+0x7db): undefined reference to `argp_parse'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/cb3fdae4e0da603f304501f65127800346cb3915
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://gitlab.com/cryptsetup/cryptsetup/-/issues/737]
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index d31fb0a7..e47179f2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -413,7 +413,7 @@ if test "x$enable_ssh_token" = "xyes"; then
> + 	AC_CHECK_DECLS([ssh_session_is_known_server], [], [], [#include <libssh/libssh.h>])
> + 	AC_CHECK_HEADER([argp.h], [], AC_MSG_ERROR([You need argp library.]))
> + 	saved_LIBS=$LIBS
> +-	AC_SEARCH_LIBS([argp_usage],[argp])
> ++	AC_SEARCH_LIBS([argp_parse],[argp])
> + 	AC_SUBST(ARGP_LIBS, $LIBS)
> + 	LIBS=$saved_LIBS
> + fi
> +--
> +2.35.1
> +
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index ddb10f1da3..20cf5d6346 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -19,6 +19,7 @@ CRYPTSETUP_CPE_ID_VENDOR = cryptsetup_project
>   CRYPTSETUP_INSTALL_STAGING = YES
>   
>   # 0001-Add-check-program-for-symver-attribute.patch
> +# 0002-configure.ac-replace-argp_usage-check.patch
>   CRYPTSETUP_AUTORECONF = YES
>   
>   CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
