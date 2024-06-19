Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2250CC2BA1A
	for <buildroot@archiver.kernel.org>; Wed, 19 Jun 2024 20:16:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C703841563;
	Wed, 19 Jun 2024 20:16:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k38IyHtW9uWv; Wed, 19 Jun 2024 20:16:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CFC24036F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CFC24036F;
	Wed, 19 Jun 2024 20:16:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 626ED1BF846
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:16:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 502796065F
 for <buildroot@lists.busybox.net>; Wed, 19 Jun 2024 20:16:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8shbjhgnRkpB for <buildroot@lists.busybox.net>;
 Wed, 19 Jun 2024 20:16:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14F6D60684
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F6D60684
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14F6D60684
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 20:16:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-421eab59723so1489265e9.3
 for <buildroot@buildroot.org>; Wed, 19 Jun 2024 13:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718828191; x=1719432991;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ll1uwtsR2F26ezFyND0Oi/Eeb736nh3bM1ytsejog7E=;
 b=sQyNqZBfT4XDnbhPCg/PQszShP+B8+JaNGYbIwSrExqKgDdXLRjiXsZoFw98HcE8Xr
 xtZXuXpbtR9OLdZkpwQbfLTtsgbKCagnNkPXYUcO9qUPmDMx6VwTl9pqAOkaQgbM7uwW
 GSGZEjBIGXiMe0R7959pZ3Rf7EzYIda0oJi/kiZ6ltLB44L2jOvdeePUQ8cF5h25611Z
 XDP9zauxJtPgusaCFfxCufJL+Mfa1D1IMfa77MUHcCrJ02zUCxiLgFt7Gini5Wn6c1Q5
 jtRutbVxvXuADUeD0YWoX3xdE+YlkZXNZqlYwTInIQ5y+DdukFWTctMy2CwwxQoaLc0S
 1d4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgu5TLRhtkTv+diYedRcHIeoHkvLLb40sV08Zqc83iYyQAB+MYADnx4wFis1v5WEzI8kcNTIWgR9kdOFcNIJqFUjYlqmVFTQ==
X-Gm-Message-State: AOJu0YzSZ2ocr8qXcFcGb2pCDLzy8+gFNDPnsApGkU/x+ho5qkzHwOb7
 riCMgpoPDWcActS3GIG7Nfg60k58YfkgiVDmndlVV4a/fQbhdLWprQ+q0UobxKIBbkHzEDI4hzD
 Q
X-Google-Smtp-Source: AGHT+IGHmCvY0RqETrqbG6vmZKpe598NQR5EM2n9jBiMjIM3yB3Szaa7BRV80v7avwNZuVLMWE8ETQ==
X-Received: by 2002:a05:600c:6553:b0:421:7f4d:5280 with SMTP id
 5b1f17b1804b1-42475184107mr22498205e9.21.1718828190896; 
 Wed, 19 Jun 2024 13:16:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d208b60sm1191385e9.37.2024.06.19.13.16.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Jun 2024 13:16:30 -0700 (PDT)
Message-ID: <fae50be4-09fa-435f-9700-72286d73dfa0@mind.be>
Date: Wed, 19 Jun 2024 22:16:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20240604170911.2406346-1-ju.o@free.fr>
Content-Language: en-GB
In-Reply-To: <20240604170911.2406346-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1718828191; x=1719432991; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ll1uwtsR2F26ezFyND0Oi/Eeb736nh3bM1ytsejog7E=;
 b=ETy3ci3t0gF/M335qdJ+eM6BUyEv2oxWP38ThDbz3XiUzidwv7px0KzcHSsPcjtwPz
 Qz0WCbC7AYiW844kT0VMO91vvw4GeU9YpPwkHu2RHIx2GDlcrTK6cvFmgMY+wv9MCFrQ
 wzf8zdWa/5fBLWyuSRoG/AwIfpFEhogtIv0CR/1bifcydg6NaD5donqrQ+6wGkcOjEsv
 h4fNFjwe6oV+hA/TMpwRIhIpscYLGyuhLG52P12Gb8/uo+BtLNPW5NOFNy6dkkvcxSnU
 2EDvu8IS5YudSxXL9riUKYglVmtPjNWFpDentTIOQOFt80u+IJ/mKh3Rov46M2M49+j1
 KGDA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ETy3ci3t
Subject: Re: [Buildroot] [PATCH next 1/1] package/pinentry: bump to version
 1.3.0
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



On 04/06/2024 19:09, Julien Olivain wrote:
> For change log, see [1]
> 
> License file hash changed, after updating the FSF address in [2].
> 
> The sha256 hash is moved out the "Locally computed" section in the hash
> file, since it is now published on [3].
> 
> pinentry 1.3.0 updated its gpg-error.m4 macro file in [4] to detect
> gpgrt-config. Its path needs to be forced in _CONF_ENV to make sure it
> will work in all host environments. See the log entry of commit
> d7f2d8403e "package/gnupg2: fix build failure when host provides an
> old gpgrt-config" [5] for a complete explanation.
> 
> [1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=blob;f=NEWS;h=1ea7e76f836fe15fe7c59b954d7aab768bd090e6
> [2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commitdiff;h=66abf7cb1e1bde1ec71e13690dc6d6944c89cae9
> [3] https://www.gnupg.org/download/integrity_check.html
> [4] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=pinentry.git;a=commitdiff;h=21e85333f9669ef369376e83eb80ccd7a8933842
> [5] https://gitlab.com/buildroot.org/buildroot/-/commit/d7f2d8403ec82f3b1772ec17bf1df8c42987a1f8
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks. Especially thanks for th excellent commit log.

  Regards,
  Arnout

> ---
> Patch tested on branch next at commit c489ac4 with commands:
> 
>      make check-package
>      ...
>      0 warnings generated
> 
>      utils/test-pkg -a -p pinentry
>      ...
>      41 builds, 5 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>   package/pinentry/pinentry.hash | 6 +++---
>   package/pinentry/pinentry.mk   | 6 +++++-
>   2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/package/pinentry/pinentry.hash b/package/pinentry/pinentry.hash
> index 187c86f9bd7..9c54520da6c 100644
> --- a/package/pinentry/pinentry.hash
> +++ b/package/pinentry/pinentry.hash
> @@ -1,5 +1,5 @@
>   # From https://www.gnupg.org/download/integrity_check.html
> -sha1  29daaf45f15cb5b8ec9b4a06284343f7a87082fb  pinentry-1.2.1.tar.bz2
> +sha1  28effa1722865786cb984f3099a32db40f96ea26  pinentry-1.3.0.tar.bz2
> +sha256  9b3cd5226e7597f2fded399a3bc659923351536559e9db0826981bca316494de  pinentry-1.3.0.tar.bz2
>   # Locally computed
> -sha256  457a185e5a85238fb945a955dc6352ab962dc8b48720b62fc9fa48c7540a4067  pinentry-1.2.1.tar.bz2
> -sha256  67f82e045cf7acfef853ea0f426575a8359161a0a325e19f02b529a87c4b6c34  COPYING
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/pinentry/pinentry.mk b/package/pinentry/pinentry.mk
> index 338d61af2d7..b49037c91be 100644
> --- a/package/pinentry/pinentry.mk
> +++ b/package/pinentry/pinentry.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -PINENTRY_VERSION = 1.2.1
> +PINENTRY_VERSION = 1.3.0
>   PINENTRY_SOURCE = pinentry-$(PINENTRY_VERSION).tar.bz2
>   PINENTRY_SITE = https://www.gnupg.org/ftp/gcrypt/pinentry
>   PINENTRY_LICENSE = GPL-2.0+
> @@ -18,6 +18,10 @@ PINENTRY_CONF_OPTS += \
>   	--with-libgpg-error-prefix=$(STAGING_DIR)/usr \
>   	--without-libcap       # requires PAM
>   
> +# Force the path to "gpgrt-config" (from the libgpg-error package) to
> +# avoid using the one on host, if present.
> +PINENTRY_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
> +
>   ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>   PINENTRY_CONF_ENV += LIBS=-latomic
>   endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
