Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C8AE6FE41
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBBB060657;
	Fri,  6 Sep 2024 18:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7NJF0-XnDGFB; Fri,  6 Sep 2024 18:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE64B6065D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE64B6065D;
	Fri,  6 Sep 2024 18:10:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 48F571BF309
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 422DE409EA
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:10:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cNwxBJEHzYOv for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6364A409AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6364A409AE
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6364A409AE
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:10:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EA95913F86E;
 Fri,  6 Sep 2024 20:10:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 06 Sep 2024 20:10:16 +0200
Date: Fri, 6 Sep 2024 20:10:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <ZttFiFByaiEckB1X@landeda>
References: <20240906171503.3495498-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240906171503.3495498-1-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725646223;
 bh=rdhOl1WmI7ows9XsAYIumS7d4TUcQM8XijVnYxYaTvc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pMn7UIHD65wR6S91qQbO3puNHICrM+o45m/1258Pn8J7yfdnle2cwWNbMV268qy0A
 rm48Y3/9OeWYeflRLS/vCZlfxCljE67kS41ga29oBhSimVw8cReQXthkkD4RV4/JMB
 Rpg3lo3cy8Gwf5ujXD+CWHU6Jhrd6LF3mMf0YUpVDH3NRoJP9M9mQMNpEOvbBmtvJC
 eKb+IqzHvYn8arL1BQ+E9hvdDnbVf/YQ9R8KiBMGLXvkZYCw6MhmesIpAeTD8uQCEr
 D0UiD5IK4NC6ECETge72a89pgwRT7chjc8XGC8WNJggg2SCFMGueHIpYsApYJhvRbo
 MZcFmgnoDSzHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pMn7UIHD
Subject: Re: [Buildroot] [PATCH v3 1/2] package/iana-assignments: new package
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 linux-amarula@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2024-09-06 19:15 +0200, Dario Binacchi spake thusly:
> The fixing of [1] and related code reviews [2] and [3] highlighted the
> need for a package providing a versioned PEN (Enterprise Numbers)
> registry file from IANA (Internet Assigned Numbers Authority).
> The GitHub repository from which this package originates is a mirror of
> the IANA registries periodically updated from https://www.iana.org/protocols.
> 
> [1] http://autobuild.buildroot.org/results/5ae5ee948d99679cd50d1115a7d46f4368347b4f
> [2] https://patchwork.ozlabs.org/project/buildroot/patch/20240902210055.239859-1-dario.binacchi@amarulasolutions.com
> [3] https://patchwork.ozlabs.org/project/buildroot/patch/20240904174021.2670289-1-dario.binacchi@amarulasolutions.com/
> Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Co-Developed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
[--SNIP--]
> diff --git a/package/iana-assignments/Config.in b/package/iana-assignments/Config.in
> new file mode 100644
> index 000000000000..b7bd52abd2d1
> --- /dev/null
> +++ b/package/iana-assignments/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_IANA_ASSIGNMENTS
> +	bool "IANA assignments"

As I suggested, we should 'select PEN' here, otherwise, when the user
enables the iana-assignements package alone, nothing will be done; it
does not make much sense.

Agreed, one may argue that having a single option that is always
selected does not make much sense either. However, in that case, a
dependent package (like ipmitool) can appropriately depend on the PEN
option, and be future-proof in case iana-assignments installs something
else in the future.

Regards,
Yann E. MORIN.

> +	help
> +	  Mirror of the IANA registries periodically updated
> +	  from https://www.iana.org/protocols.
> +
> +	  https://github.com/larseggert/iana-assignments
> +
> +if BR2_PACKAGE_IANA_ASSIGNMENTS
> +
> +config BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG
> +	bool "PEN (Enterprise Numbers) registry"
> +
> +endif
> diff --git a/package/iana-assignments/iana-assignments.hash b/package/iana-assignments/iana-assignments.hash
> new file mode 100644
> index 000000000000..c58fb61df292
> --- /dev/null
> +++ b/package/iana-assignments/iana-assignments.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  e7a1f8153715fa9e0f4c5d102f9271bce425a468f58a445e7c5ecdf7105fd460  iana-assignments-bf358dc8d89b7939557220b8055699b42a4133e9.tar.gz
> diff --git a/package/iana-assignments/iana-assignments.mk b/package/iana-assignments/iana-assignments.mk
> new file mode 100644
> index 000000000000..824b26d4ecf6
> --- /dev/null
> +++ b/package/iana-assignments/iana-assignments.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# iana-assignments
> +#
> +################################################################################
> +
> +IANA_ASSIGNMENTS_VERSION = bf358dc8d89b7939557220b8055699b42a4133e9
> +IANA_ASSIGNMENTS_SITE = $(call github,larseggert,iana-assignments,$(IANA_ASSIGNMENTS_VERSION))
> +
> +ifeq ($(BR2_PACKAGE_IANA_ASSIGNMENTS_PEN_REG),y)
> +define IANA_ASSIGNMENTS_INSTALL_PEN_REG
> +	$(INSTALL) -D -m 0644 $(@D)/enterprise-numbers/enterprise-numbers \
> +		$(TARGET_DIR)/usr/share/misc/iana/enterprise-numbers
> +endef
> +IANA_ASSIGNMENTS_POST_INSTALL_TARGET_HOOKS += IANA_ASSIGNMENTS_INSTALL_PEN_REG
> +endif
> +
> +$(eval $(generic-package))
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
