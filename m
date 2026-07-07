Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCF9C43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 06:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 450B180EB4;
	Tue,  7 Jul 2026 06:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiCK6zcAWmuT; Tue,  7 Jul 2026 06:04:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07EAE80EB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783404243;
	bh=PsTAC4gZCnl79u0T374WF0aRNf+ve7egHUQa5nUg1rQ=;
	h=From:Date:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rRp2hHGoN0VekJZOUNPOb0wF0ZXiVJtsuPGWm9F0Q+Udhv7TBoJ1UWUw2Zmeb8U1N
	 x/yYUXMcknRvOrLnh6989b7KdELbN0ZwMX/eKR9OcuU2ULgTm6TaLEN03piWuzCL4v
	 hZtNbEaCcuDTn5HBLUFPJ67/97ThDmwSQzjdiwxcWC1fVxyPiKjCV0GaoUYH5GqI5M
	 kMjlm5RFhtiRqNu+EATARiHGPIYwGZZoO4jMRsKi29C0j95pDwGaP0RqaGJyTI8tNc
	 qOJyLQFK2AM87yzLnmHg1hioiMDDijFJpO+wNPzM55x0jfAm6uvBuL6wpwm7T/YkIq
	 x98c6qyi3ylQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07EAE80EB8;
	Tue,  7 Jul 2026 06:04:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 838DC2A8
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 06:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D33C4077C
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 06:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evc5dNMbuaX6 for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 06:04:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA20C40764
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA20C40764
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA20C40764
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 06:04:00 +0000 (UTC)
X-CSE-ConnectionGUID: T94fDCOaTnKHPH2sZ/76sA==
X-CSE-MsgGUID: lnxtSnbDS/y7nCP2oLDgpQ==
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 07 Jul 2026 08:03:57 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 08:03:57 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43;
 Tue, 7 Jul 2026 08:03:55 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 07 Jul 2026 08:03:54 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: AAc8aVcqRgedOjKFi3ecSw==
X-CSE-MsgGUID: zlBXV2PiQIu5uEo+ilB9ng==
X-IronPort-AV: E=Sophos;i="6.25,151,1779141600"; d="scan'208";a="450778164"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Tue, 7 Jul 2026 08:03:54 +0200
To: <buildroot@buildroot.org>
Message-ID: <akyWylX0rDN1XX6N@yd-6wlzhs3>
References: <cb306363cbe59e1e5cdf9d50921e06a23590cd48.1780473097.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb306363cbe59e1e5cdf9d50921e06a23590cd48.1780473097.git.yann.morin@orange.com>
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1783404241; x=1814940241;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=3W9mKRqxpSgHfVTCeQEVkThsjTlxuW5ZqmfPLnw2OlQ=;
 b=Gu4vDsvcihhoEymZyQ0rDkzfV9oE/pXAJyJIolnX1hc85311m9iZYTHu
 2huf5A6m4cDdD9umHEnVx1urCoNN1NyNO3csrZyATta7+ZqJzgYcuYI5R
 1xny8TZBu8jFZM0o9BKGGsnAPWjckM7pU7D74seJuqrS/liroKzfSG09N
 EZlHH+8u+jET2pGX6OebLKCuWzWD3wKOx7w4WBBp8FFcmqlfs6w3MQIb9
 MCkKtILZk4+X2hgYRI4KcIKFiZWfdyoMp49U1s5oDA5aQAyNLiKrCVKos
 AvB06MwCIOX8KMGjAVisDm9iE3NGMXfTtmgSv/Nq8+S34nw2XKJisY0Ya
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Gu4vDsvc
Subject: Re: [Buildroot] [PATCH] support/docker: make the image reproducible
 again
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All!

On 2026-06-03 09:51 +0200, yann.morin@orange.com spake thusly:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The Debian 12 Bookworm snapshot we use, 20250203, uses the new deb822
> format [0] for source list files; it carries a source list file that
> points to the current repository, not to the snapshot.
> 
> Even though we do inject an old-style source list that points to the
> snaphot repository, the packages in the current repository are more

*snapshot

Otherwise, any feedback on this one?

Regards,
Yann E. MORIN.

> recent than the one in the snapshot, so when we install our packages,
> they get retrieved mostly from the current repository rather than from
> the snapshot. The image is not reproducible.
> 
> Switch to using the new deb822-style source list file.
> 
> Note: we do not need to carry the "Latest just before" trick: the
> snapshot repository will use the most recent actual snapshot before the
> requested dated, so we can just use the date of the image we use (stuck
> at midnight because we don't have better).
> 
> Since the snapshot repository can be really slow, while at the same time
> the remote http server not dropping connections, it can take a very long
> while to build the image; add a timeout so that stale connections are
> detected and re-attemped early-ish (the timeout applies to both the
> connect and the actual download, so it should be large enough to
> accomodate slowish network connections).
> 
> Fixes: c95d5b8e1eb9 (support/docker: move to current bookworm (Debian
> 12) snapshot)
> 
> [0] https://manpages.debian.org/trixie/apt/sources.list.5.en.html#DEB822-STYLE_FORMAT
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Romain Naour <romain.naour@smile.fr>
> ---
>  support/docker/Dockerfile       | 11 +++++++----
>  support/docker/apt-sources.list |  4 ----
>  support/docker/debian.sources   | 13 +++++++++++++
>  3 files changed, 20 insertions(+), 8 deletions(-)
>  delete mode 100644 support/docker/apt-sources.list
>  create mode 100644 support/docker/debian.sources
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index e7677ac6a9..687eee8110 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -24,7 +24,7 @@ ARG TAR_VERSION="1.35"
>  ENV DEBIAN_FRONTEND=noninteractive
>  
>  # This repository can be a bit slow at times. Don't panic...
> -COPY apt-sources.list /etc/apt/sources.list
> +COPY debian.sources /etc/apt/sources.list.d/debian.sources
>  
>  # Install 32bit variant on x86_64 image.
>  RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
> @@ -32,15 +32,18 @@ RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
>  fi
>  
>  # The container has no package lists, so need to update first
> -RUN apt-get -o APT::Retries=3 update -y
> +RUN apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
> +        update -y
>  
>  RUN if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
> -    apt-get -o APT::Retries=3 install -y --no-install-recommends \
> +    apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
> +        install -y --no-install-recommends \
>          g++-multilib \
>          libc6:i386; \
>  fi
>  
> -RUN apt-get -o APT::Retries=3 install -y --no-install-recommends \
> +RUN apt-get -o APT::Retries=3 -o APT::Acquire::http::Timeout=60 \
> +        install -y --no-install-recommends \
>          bc \
>          build-essential \
>          bzr \
> diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
> deleted file mode 100644
> index d6fbf85270..0000000000
> --- a/support/docker/apt-sources.list
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Latest just before 20250218211000Z:
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm main
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20250218T144938Z/ bookworm-security main
> -deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20250218T144938Z/ bookworm-updates main
> diff --git a/support/docker/debian.sources b/support/docker/debian.sources
> new file mode 100644
> index 0000000000..36e1eeb3e7
> --- /dev/null
> +++ b/support/docker/debian.sources
> @@ -0,0 +1,13 @@
> +Types: deb
> +URIs: http://snapshot.debian.org/archive/debian/20250203T000000Z
> +Suites: bookworm bookworm-updates
> +Components: main
> +Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
> +Check-Valid-Until: no
> +
> +Types: deb
> +URIs: http://snapshot.debian.org/archive/debian-security/20250203T000000Z
> +Suites: bookworm-security
> +Components: main
> +Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
> +Check-Valid-Until: no
> -- 
> 2.34.1
> 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
