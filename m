Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8212C36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 14:56:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA22160803;
	Fri, 11 Apr 2025 14:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWl3Oo_8yjCe; Fri, 11 Apr 2025 14:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E04CB607E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E04CB607E0;
	Fri, 11 Apr 2025 14:56:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D6784138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B491180EEA
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nn_cVK5TV4gR for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 14:56:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA16680C38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA16680C38
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA16680C38
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:56:54 +0000 (UTC)
X-CSE-ConnectionGUID: VYcmBf+xTzmPprO7bsdEtw==
X-CSE-MsgGUID: NrWYvUTCS3ieTF+WJqLEMQ==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 16:56:51 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Apr 2025 16:56:52 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Fri, 11 Apr 2025 16:56:50 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 11 Apr 2025 16:56:49 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: ZaoVlE0oQViYRUiAXxEy0g==
X-CSE-MsgGUID: Z12outZ4RT2cQJa5vAzMkg==
X-IronPort-AV: E=Sophos;i="6.15,205,1739833200"; d="scan'208";a="278639200"
Date: Fri, 11 Apr 2025 16:56:49 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
CC: <buildroot@buildroot.org>, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <Z/ktsWj+ng6Z5pyA@yd-6wlzhs3>
References: <20250411113731.4804-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411113731.4804-1-tianyuanhao3@163.com>
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX107.corporate.adroot.infra.ftgroup (10.115.27.4)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1744383415; x=1775919415;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=Nrd4o2P1aFr46kU4p/cYLMn/NDvvo3IIhHKi7tMybWE=;
 b=dEh5hC1iCUpvO+vlp0nxIJvmiTYACa5vdcFwZQ6EgFriiE4v4HuypPrS
 drE+O2lno8GNg1MbCM2qq7/gW35jNM3XaFByTET5yXM8xsOmKF+uVgOM8
 o/oGaOUr+cntb9kTVTwM58nYw/0ccSea+O9DhtKShjveHYfqE67l8Qy9+
 fsmK/cyqDjA2dBjD+dmo2FDTr6hJ+e5eZkB2EhhOULttgoGEHDNXT/iSH
 NrePz9FDonO2jM5UyCOQ/fyynLdzVxrhMTD4PX9qoXk++0XjkSMsjwZO4
 b/scBI0kfzOGkzNk1Rz6Ethh+sJ/308SPyT92pkSRp/un70e+TS+Xk7Nl
 w==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=dEh5hC1i
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: install service files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yuanhao, All,

On 2025-04-11 04:37 -0700, TIAN Yuanhao spake thusly:
> Install tailscaled to /usr/sbin, as the service file references that
> location.
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> ---
[--SNIP--]
> +define TAILSCALE_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 0755 $(@D)/bin/tailscale \
> +		$(TARGET_DIR)/usr/bin/tailscale
> +	$(INSTALL) -D -m 0755 $(@D)/bin/tailscaled \
> +		$(TARGET_DIR)/usr/sbin/tailscaled
> +endef

I would suggest that, rather than override the default _CMDS, you
provide a post-install hook that does a symlink in sbin.

> +define TAILSCALE_INSTALL_INIT_OPENRC
[--SNIP--]
> +define TAILSCALE_INSTALL_INIT_SYSTEMD
[--SNIP--]

What about TAILSCALE_INSTALL_INIT_SYSV ?

Regards,
Yann E. MORIN.

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
