Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD50C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 13:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 648ED83A75;
	Fri, 11 Jul 2025 13:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqdsQ6SeJrM4; Fri, 11 Jul 2025 13:42:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E39D483C51
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E39D483C51;
	Fri, 11 Jul 2025 13:42:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C958114
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DD7D40A4C
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCnAVVfqJXbK for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 13:42:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B456D40A10
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B456D40A10
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B456D40A10
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 13:42:00 +0000 (UTC)
X-CSE-ConnectionGUID: dmUbcvFTRW6f+8pjJgJtXQ==
X-CSE-MsgGUID: Uj4J6kCFRciOi1ah5OXK0Q==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 15:41:58 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 11 Jul 2025 15:41:57 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57;
 Fri, 11 Jul 2025 15:41:56 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 11 Jul 2025 15:41:56 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: SurAGXL+RmKmDvPqE6XJvQ==
X-CSE-MsgGUID: 4/8GXFTTTAqCB+Afi5fdRA==
X-IronPort-AV: E=Sophos;i="6.16,303,1744063200"; d="scan'208";a="312662737"
Date: Fri, 11 Jul 2025 15:41:56 +0200
To: Daniel Lang <dalang@gmx.at>
CC: <buildroot@buildroot.org>, Julien Grossholtz
 <julien.grossholtz@openest.io>, Refik Tuzakli <tuzakli.refik@gmail.com>
Message-ID: <aHEUpPI69u41yIM3@yd-6wlzhs3>
References: <20250711132237.76597-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711132237.76597-1-dalang@gmx.at>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX207.corporate.adroot.infra.ftgroup (10.115.27.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1752241321; x=1783777321;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=0vSPiJhZIoCJpAhj+c+hlxdFB+UNFQ1ZqWNvStb+1sA=;
 b=ohqsR6ipO85dR+kuZI6WLeTP9CO59/xx4oJh3oDF0coBiA0A4MSzMPCY
 Icl+Elj0pCuK0+mRFi8iKaSaxk8neIDfBDfz+XRUYK+FyWl/FUl8r7T8I
 i81Mzx7b0cNowgXmJgBpnScdeIhmhtvoaIWnVsln8yfYU+OQvuKzb5dzR
 c378bPcsMMrUfug4pu5e4TH8jJvDxea8b1zEbJzk/5WxlazCLHVVX7f+5
 A8kU2QEdTxbipd1F3Cq1/FD5VQFeAngpiHVHIEyVsFG3VDb0/uTGJkiNG
 i+NDKtj5SUmIl4ZvOmojIhQCE7VA9HgJ62u6BwjUD3czavM2YtQj82heX
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=ohqsR6ip
Subject: Re: [Buildroot] [PATCH] package/paho-mqtt-cpp: bump to version 1.5.3
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

Daniel, All,

On 2025-07-11 15:22 +0200, Daniel Lang via buildroot spake thusly:
> C++17 is required since 1.5.0.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
[--SNIP--]
> diff --git a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
> index 2e0f409b96..0562cb0eb5 100644
> --- a/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
> +++ b/package/paho-mqtt-cpp/paho-mqtt-cpp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PAHO_MQTT_CPP_VERSION = 1.3.2
> +PAHO_MQTT_CPP_VERSION = 1.5.3

The version history is a bit of a mess:

  - Tag 1.5.2 is dated 2025-06-25; points to a commit dated 2025-03-11;
    annotated tag;

  - Tag 1.5.3 is dated 2025-05-16; points to a commit dated 2025-05-15;
    un-annotated tag;

  - Graph-wise, commit 1.5.2 is before 1.5.3, though.

  - Commit 55833eb9fb1bf (Bumped version to v1.5.4) is dated 2025-06-25,
    the same day the 1.5.2 tag was comitted, but it contains a Changelog
    for "unrelased", not for 1.5.4, and porperly points to the current
    HEAD of master.

It all looks like a bit of a mess. Could you see with upstream that they
clarify the situation?

Regards,
Yann E. MORIN.

>  PAHO_MQTT_CPP_SITE = $(call github,eclipse,paho.mqtt.cpp,v$(PAHO_MQTT_CPP_VERSION))
>  PAHO_MQTT_CPP_LICENSE = EPL-2.0 or BSD-3-Clause
>  PAHO_MQTT_CPP_LICENSE_FILES = epl-v20 edl-v10
> -- 
> 2.50.1
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
