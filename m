Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACD7C3064D
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 12:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13F844057F;
	Fri, 28 Jun 2024 12:53:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 50YeyAGXsJoX; Fri, 28 Jun 2024 12:53:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB23340619
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB23340619;
	Fri, 28 Jun 2024 12:53:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3F431BF41C
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1A1B6079A
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 12:53:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcgUfoVfyqIi for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 12:53:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E6766077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E6766077F
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E6766077F
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 12:53:36 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 14:53:34 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 14:53:33 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 14:53:32 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Fri, 28 Jun 2024 14:53:32 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.09,169,1716242400"; d="scan'208";a="162928623"
Date: Fri, 28 Jun 2024 14:53:32 +0200
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <Zn6yTCXLmZGrsWRI@tl-lnx-nyma7486-2>
References: <20240628085359.1660363-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240628085359.1660363-1-f.fainelli@gmail.com>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1719579217; x=1751115217;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=VYGETMhAHEMJ1Vao1URKObvACUNKsjdC8/gxDcchRas=;
 b=PhX2j2yBwiOcuzgXOZTf0jAlH0t5IfEFp0+a5fSn3+bpDMW7WDa4aKnn
 jNgqwDNds0JYBZ7pRJGK7lQ0QgMLtMsxcZdHLOmxt2wvQGeXBKCYrMRIT
 zSH+o3jEJEQrVjQFU9s19KTy/QfkEaC+LNe6HVUHKVfAkBAlmVRNwrc4/
 wlPsV8mbufnRVoJue3tLObd8gRfQqCODUJhlqAL4aB6YjcFnV1bR6StLG
 HgkD4kvclwZLUkhiOYwzAqa/+Z12Njc6iLGD4xau1FEpcwD24/GJo6OLF
 OCkw7h+9X/clUYbs/iiNf5V7bfzpaO1OMBmyBpIfbtUGrg8Pu/n7vDez/
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=PhX2j2yB
Subject: Re: [Buildroot] [PATCH] package/cpulimit: Refresh patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian, All,

On 2024-06-28 01:53 -0700, Florian Fainelli spake thusly:
> Make sure that
> /0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch applies
> cleanly without any fuzz by refreshing it.
> 
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Tested-by: Yann E. MORIN <yann.morin@orange.com>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>

Regards,
Yann E. MORIN.

> ---
>  ...Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch b/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
> index fa32e3ede22f..c0a457cdfd28 100644
> --- a/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
> +++ b/package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch
> @@ -35,8 +35,8 @@ index 06d73a6f3541..d4f6fab3385c 100644
>   #include <signal.h>
>  +#include <libgen.h>
>   
> - #include <assert.h>
> - 
> + #if defined(__APPLE__) || defined(__FREEBSD__)
> + #include <libgen.h>
>  -- 
>  2.25.1
>  
> -- 
> 2.34.1
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
