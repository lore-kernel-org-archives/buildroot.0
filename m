Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6680C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:53:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E9806113A
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E9806113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A7D9607D2;
	Sat, 11 Sep 2021 14:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qk8Hvo8bUvHp; Sat, 11 Sep 2021 14:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58F0660624;
	Sat, 11 Sep 2021 14:53:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 990DB1BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87AF340142
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5dkNH21lLdNz for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:53:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64F5A400E8
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:53:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id am9so7273796ejc.7
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 07:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CQrFqWimDvo6XIa+Ug29ybCUVAOqMqRwWzPq6Qc6jrA=;
 b=NtqTWB5JRzDS6DPtdeg7tkBggtmX+T68LSeePjvCHecZD0hbDzLvu2ka6wwoJKvx4g
 GCrFlFqETziUtyOx1rVRb7bM3+JcAg2Nzjl9fgkgxzqTg+8W/OfSopUEDgwzNccdlRMl
 lv4dP9NB996oyg3cQrh3GGDtWyYd9F+2YNQcD5G7474Exw+/JyAQs6x+xEwRoomBn2wl
 OyNamab61dlgFmiEw+9fmUXOYll56J7n6/24YQqW43IoUs//pz1yUDf5tiSJNQQptqSa
 iFuCQ2apDRIVEeoU+pW9t2+FbtOjVprApIN30UHf2t9VUwtsQNnhlFdLfldtvxpf6PJm
 4QtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=CQrFqWimDvo6XIa+Ug29ybCUVAOqMqRwWzPq6Qc6jrA=;
 b=qR1eYdVs55aFI+tLqs5JKIS16YoitIeprPVHUQ5Y4iVpoajxdCZy1JXfy3X6lLJtt9
 pVFF1nE6bF44p6d/iMzh31qyOJGqWV8zY3lc+wnPW5Z5GQ4Bxa7mnq1V2mRMO4a1+9Ap
 5QDmf1s8Vckt8WVI+YVZqfmqTHoyZZtLOiPGmvB0ZrSSy08eKzJuJZLb2OuGyuq0zhpQ
 63gfw2/Ot0CQLysdvoX9NmTOCtyfbE0cxUhkPGoqZIse/HDufX0IsMrUbNEyw9mO3xyx
 2ODbWPE2jAZkPQBAp8kzDZQqpoysYZ1FT2nbobw0aJevGZG+v2uio5knFEYdjHUUU5ix
 u6Pg==
X-Gm-Message-State: AOAM530tzoNLVYlwsM3NzheVk5P62CtqgxszUDOudcIhOrisxl0gPQ1x
 bdmj0jGbRq0AjrNbGPY9+RXRMw==
X-Google-Smtp-Source: ABdhPJxslExh7ig4jFMDQFqDNhpvgs0CTUaK0uowjDuKHlMKKgpGSsI3J5VD2PSdUwaKxtRV8khXKw==
X-Received: by 2002:a17:906:7047:: with SMTP id
 r7mr3136431ejj.342.1631372022634; 
 Sat, 11 Sep 2021 07:53:42 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id e28sm1020204edc.93.2021.09.11.07.53.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 07:53:42 -0700 (PDT)
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
References: <20210901174818.30624-1-petr.vorel@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <efdd7cbc-74f7-d0b9-d60b-316fa82501d4@mind.be>
Date: Sat, 11 Sep 2021 16:53:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210901174818.30624-1-petr.vorel@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] package/modem-manager: bump version to
 1.16.10
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 01/09/2021 19:48, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/modem-manager/modem-manager.hash | 2 +-
>  package/modem-manager/modem-manager.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
> index b840020f38..14597215df 100644
> --- a/package/modem-manager/modem-manager.hash
> +++ b/package/modem-manager/modem-manager.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  2a90b6260f66d3135609d62667ada73416694d717e7fd9b73223e3703a499617  ModemManager-1.16.6.tar.xz
> +sha256  2ccf1f716c2d121e8e6709bcf8af29ee86971a90adacca2e8d6288b30278862e  ModemManager-1.16.10.tar.xz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
> diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
> index 368b8464a5..a881edc272 100644
> --- a/package/modem-manager/modem-manager.mk
> +++ b/package/modem-manager/modem-manager.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MODEM_MANAGER_VERSION = 1.16.6
> +MODEM_MANAGER_VERSION = 1.16.10
>  MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
>  MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
>  MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
