Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1740BC3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2B21405F4;
	Fri, 12 Jul 2024 14:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnaF8mEqnH2g; Fri, 12 Jul 2024 14:08:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47AE540632
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47AE540632;
	Fri, 12 Jul 2024 14:08:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 514831BF424
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4536C606F0
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qAngVQx3XQcY for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:08:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EDA186064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDA186064A
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EDA186064A
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:08:53 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-42565670e20so18818445e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720793332; x=1721398132;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cCWWoLWT9Yv3u6GYTFmPbKXH9mf1BpkIZrHjBgGdzlI=;
 b=swAsNiykurhluNOSXPvmqlh7Ons4TJFbqpIQcoKF3CG5hqe8Bl5B7tiukdCVwMVolw
 M3J6pCytm6VfI96mnoh5G+RTiy9pm8uIMAxT9jFMQ9ZVlirDdKcdFrBlNAIQ/7yGA8di
 pq+1KD5rHzIh37hRSmhoCZxWm2/mfL20aHcrIeu0sBBl4UpuXJmsE2V2r2XWtTnjrtZK
 1yF7KuzN/nWk0EUS2EOb3kMtrXlH2Ofbc5ro+gK2zoW67hQ2T3mZa+ffvQdI7c6EJ/fW
 hQZjKBan7Ewe8uRP6YXqVhZvnaC4r1lx0j3lK/rskZ2zPSZlHfUQjJLawPvy8Lk3Iidi
 xdvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZDN0VaGFfjDdT/vpy0rNLVw/ArMfatipuRxKSp7ueUzAYuyTRhZ/vBwrPeHTPZjnM88B54RMjrYVJn7ouqSWfwOoe9S25XQ==
X-Gm-Message-State: AOJu0YzJAKFuDaka8Hx4U9GJyzz3LC3B+42Nyx7bForZTSMNQE/yiYl2
 1DJBfnsuwOFVCOiPlSgmi1DVc7Rpl4pEbzAenCNsbRAl/7Hhjh3+PqMk2vkwBtRfseS0rfA3auz
 3QME=
X-Google-Smtp-Source: AGHT+IEryJ8g8pWe2zl5UJI0rKi/MGGf3wgrBzJdg5e7p4tn0jQYyMXJ34TSIKibEqzM+fiUIfWPEw==
X-Received: by 2002:a05:600c:3204:b0:424:7871:2e9e with SMTP id
 5b1f17b1804b1-4279dacf793mr24255265e9.6.1720793331743; 
 Fri, 12 Jul 2024 07:08:51 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:b481:98b5:611f:e783?
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f2d7c9csm24679975e9.48.2024.07.12.07.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:08:51 -0700 (PDT)
Message-ID: <9d578028-a6e5-4006-8ead-c3f608ac08d8@mind.be>
Date: Fri, 12 Jul 2024 16:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20240709101841.1145134-1-fiona.klute@gmx.de>
 <20240709101841.1145134-4-fiona.klute@gmx.de>
Content-Language: en-GB
In-Reply-To: <20240709101841.1145134-4-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720793332; x=1721398132; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cCWWoLWT9Yv3u6GYTFmPbKXH9mf1BpkIZrHjBgGdzlI=;
 b=U1URa0zhSrH7qqxNKalRUxO5MrNgG2sqJ44BdqJFh9qzHBedE1ukXwocFnRuWcm2q1
 tf3ZPIQKTJj5uyVZGVvz3WB4zrXatesWlIwsWFrWwhc1j4jRQFfocUikuJ17Ykfo3VQN
 CDaSAiAs/3+i+CNw4ANEynO9AIhhe8djF1WMEoKLRIqPeCB20i83+iugToOCEuSPVuP1
 wU3zJBFAIqKjbPrXuVFItXQyMFrbn/OR4McA+jFKY5Bj2f58l3glAX9kb6HiMj/TTazj
 dgdBaVy4Tk+gbfzW9HC9Qggu74p973m9oBJ8Fy2cLSCwwDyAc6nZo/kW7lKx3FWcUtan
 +mYQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=U1URa0zh
Subject: Re: [Buildroot] [PATCH v3 3/4] package/fail2ban: bump version to
 1.1.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 09/07/2024 12:18, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Fail2ban 1.1.0 brings Python 3.12 compatibility, and removes support
> for 2.x. This means 2to3 handling can be dropped.
> 
> Unfortunately fail2ban 1.1.0 still relies on asynchat and asyncore,
> which have been removed from the Python standard library in
> 3.12. Depend on the compatibility package python-pyasynchat (which
> pulls in python-pyasyncore) and remove copies bundled in upstream
> code.
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v2 -> v3:
> * Add "# runtime" comment for pyasynchat dependency, drop
>    FAIL2BAN_DEPENDENCIES in fail2ban.mk
> 
>   package/fail2ban/Config.in     |  1 +
>   package/fail2ban/fail2ban.hash |  2 +-
>   package/fail2ban/fail2ban.mk   | 14 +++++++-------
>   3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
> index 8a48a8c1d0..4c2c56440d 100644
> --- a/package/fail2ban/Config.in
> +++ b/package/fail2ban/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_FAIL2BAN
>   	bool "fail2ban"
>   	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_PYASYNCHAT # runtime
>   	select BR2_PACKAGE_PYTHON_SYSTEMD if BR2_PACKAGE_SYSTEMD
>   	help
>   	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and
> diff --git a/package/fail2ban/fail2ban.hash b/package/fail2ban/fail2ban.hash
> index b40922e70a..8627e01f05 100644
> --- a/package/fail2ban/fail2ban.hash
> +++ b/package/fail2ban/fail2ban.hash
> @@ -1,3 +1,3 @@
>   # sha256 locally computed
> -sha256  ae8b0b41f27a7be12d40488789d6c258029b23a01168e3c0d347ee80b325ac23  fail2ban-1.0.2.tar.gz
> +sha256  474fcc25afdaf929c74329d1e4d24420caabeea1ef2e041a267ce19269570bae  fail2ban-1.1.0.tar.gz
>   sha256  a75fec0260742fe6275d63ff6a5d97b924b28766558306b3fa4069763096929b  COPYING
> diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
> index 0c1208c6fe..a77e5fad6c 100644
> --- a/package/fail2ban/fail2ban.mk
> +++ b/package/fail2ban/fail2ban.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
> 
> -FAIL2BAN_VERSION = 1.0.2
> +FAIL2BAN_VERSION = 1.1.0
>   FAIL2BAN_SITE = $(call github,fail2ban,fail2ban,$(FAIL2BAN_VERSION))
>   FAIL2BAN_LICENSE = GPL-2.0+
>   FAIL2BAN_LICENSE_FILES = COPYING
> @@ -12,13 +12,13 @@ FAIL2BAN_CPE_ID_VENDOR = fail2ban
>   FAIL2BAN_SELINUX_MODULES = fail2ban
>   FAIL2BAN_SETUP_TYPE = setuptools
> 
> -define FAIL2BAN_PYTHON_2TO3
> -	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
> +# fail2ban contains bundled copies of pyasyncore and pyasynchat,
> +# remove them so only the packaged versions are installed.
> +define FAIL2BAN_REMOVE_BUNDLED_COMPAT
> +	$(SED) '/fail2ban\.compat/d' $(@D)/setup.py
> +	rm -rf $(@D)/fail2ban/compat
>   endef
> -FAIL2BAN_DEPENDENCIES = host-python3
> -# We can't use _POST_PATCH_HOOKS because dependencies are not guaranteed
> -# to build and install before _POST_PATCH_HOOKS run.
> -FAIL2BAN_PRE_CONFIGURE_HOOKS += FAIL2BAN_PYTHON_2TO3
> +FAIL2BAN_POST_PATCH_HOOKS += FAIL2BAN_REMOVE_BUNDLED_COMPAT
> 
>   define FAIL2BAN_FIX_DEFAULT_CONFIG
>   	$(SED) '/^socket/c\socket = /run/fail2ban.sock' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
