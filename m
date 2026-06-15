Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B22CD98C7
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 11:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B6EC6067D;
	Mon, 15 Jun 2026 11:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_R8y8XHWiy3; Mon, 15 Jun 2026 11:17:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABFFC607FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781522245;
	bh=f8OdJr0pTn/50/3oMByNRh3NZ71LCm1Fl+OiI0RwayI=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UteYd8z1d+/zStpfd5PLMppx3d+AxfYzXw0E6QHc2/oB51EcivNxyZomHqCOp5V98
	 Z6GTm6FlOqDB3uca8PlvkD+GrVsxd9KvMHSi7I0m8Y7wz8W83nOwkaJwlJ1+p5abPR
	 xQzQbt124OM3pb1JNXE6/p80EXgfegAPnqoWbCoaEg0mrtee5Q4l2X6eINAIL6DYHU
	 +xYaDoijbZheEh2IM8L0Zbilxa/dwZbuGTEyofiETdEiOtmQzdc7+QLkuOXUvSJETh
	 uSB5qGgKCrYiLsPA1IB4ZDUEFPT5y0b6G/a4DQe6okiv0H3/kkgn2eTvMBSzDs1HhJ
	 8oJ7TIdh2Yz4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABFFC607FB;
	Mon, 15 Jun 2026 11:17:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 47EC1DE
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 11:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3991940F50
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 11:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id we5sGkqR78UP for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 11:17:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F180040F49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F180040F49
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F180040F49
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 11:17:22 +0000 (UTC)
X-CSE-ConnectionGUID: ESWpdIvgTPScsofShgqpqA==
X-CSE-MsgGUID: /I6HEhxORl+hg+ff/vUNHg==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 15 Jun 2026 13:17:19 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 13:17:19 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 15 Jun 2026 13:17:18 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 15 Jun 2026 13:17:17 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: gA3DOzvhTkeAwC9fMMAKvg==
X-CSE-MsgGUID: 9tzgqYIrQNqcqEuOqaKAnA==
X-IronPort-AV: E=Sophos;i="6.24,206,1774306800"; d="scan'208";a="435020120"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Mon, 15 Jun 2026 13:17:17 +0200
To: TIAN Yuanhao <tianyuanhao3@163.com>
CC: <buildroot@buildroot.org>
Message-ID: <ai/fPYAz1VC/uP0Y@yd-6wlzhs3>
References: <20260606024011.4645-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260606024011.4645-1-tianyuanhao3@163.com>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1781522243; x=1813058243;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=O7ao9hn1lOvnY6KCumLG+4+wMvHnLT4lbAttisVKEpQ=;
 b=kBofQDKpL1//jHPW/s+UQOM+bbYetW0Ba0jdINEo3cdmcJLgqRrverDF
 rALKvpvsE8aY9R9sMFn9TLaEO1b32sk1uV5isDGL1XJHE80IPRWf3HXNS
 rKih4B3iWl229y47mXIy5oR57InU97U6siT2dAXK2gn0AolxMf4fz4r5x
 vWSkbUGMuFOgkq+7WCnhluPZvcwH725Szxl5jVlepQshSGLUJdNx5jfz+
 AppvXgiZUtRhpTAo5brj+Wd9oOKSi9o14kCJ84lI9KZKnaGP7+qj9xUnc
 FzFs9xglri6FhPSwd9lXz7vR7y9m8bEIz/2dbLoXli0tbnDjdDzJkHCYD
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=kBofQDKp
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: remove initrd
 specific service files
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

On 2026-06-05 19:40 -0700, TIAN Yuanhao spake thusly:
> NetworkManager upstream added initrd-specific service files in 1.54:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/merge_requests/2089
> 
> These services are intended for use inside an initrd, not a rootfs.
> When present in a rootfs, they conflict with the main NetworkManager
> service since both claim the same D-Bus name
> org.freedesktop.NetworkManager, leading to confusing error messages:
> 
>   systemd[1]: Failed to put bus name to hashmap: File exists
>   systemd[1]: NetworkManager-initrd.service: Two services allocated
>   for the same bus name org.freedesktop.NetworkManager, refusing
>   operation.
> 
> Remove them to avoid these issues.

I've sent another similar patch, which only removes the NM initrd
services when systemd does not have support for initrd; otherwise, the
NM initrd services are left untouched (someone that uses such a setup
will have to test what's appropriate and fix anything as needed):

https://lore.kernel.org/buildroot/27c081656fb5af84e1919390565641af37485d91.1781521565.git.yann.morin@orange.com/T/

Regards,
Yann E. MORIN.

> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/network-manager/network-manager.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 301c1ad43e..2dd40980e7 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -191,4 +191,12 @@ define NETWORK_MANAGER_INSTALL_INIT_SYSTEMD
>  
>  endef
>  
> +define NETWORK_MANAGER_REMOVE_INITRD_SERVICES
> +	$(RM) $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-config-initrd.service
> +	$(RM) $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-initrd.service
> +	$(RM) $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-wait-online-initrd.service
> +endef
> +
> +NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_REMOVE_INITRD_SERVICES
> +
>  $(eval $(meson-package))
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
