Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3941CC2BBCA
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 05:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 868DE41737;
	Fri, 28 Jun 2024 05:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MyM-_cYfDeO; Fri, 28 Jun 2024 05:50:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD4341762
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD4341762;
	Fri, 28 Jun 2024 05:50:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E6BF1BF3AE
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 05:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F02F060811
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 05:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlzzhbL02C0k for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 05:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.237;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3FB860699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3FB860699
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.237])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3FB860699
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 05:50:15 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 07:50:13 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Jun 2024 07:50:13 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 07:50:11 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Fri, 28 Jun 2024 07:50:11 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.09,168,1716242400"; d="scan'208";a="160105189"
Date: Fri, 28 Jun 2024 07:50:11 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <Zn5PE3lhpd3rYBKs@tl-lnx-nyma7486-2>
References: <20240627220653.3626619-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240627220653.3626619-1-bernd@kuhls.net>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX402.corporate.adroot.infra.ftgroup
 (10.115.26.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1719553817; x=1751089817;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=XFXjRRpaTfl1oXlIzZrwJ44kBLm9UcnjAjPgRsSMNJQ=;
 b=BJ+PphB03EfivymLy0ATK9czNR8Y19gw889kHY80Z9AnSowQp/dRVINk
 ORcDCAUeVAjWZd3QZlW/qFEE6FasXkcnHpg7kFQ2aM35g3Z2qps+lJsfy
 j3koOZy7TpwMhQegV37JX+nFBADBYP2G23m31TLo92fSKeAzjZqVwd6Rj
 0OOEGqCQp1t9Vsv1GYkkR5JiktNqfW/P6rj/reVWwpY2ypy9YMpfdKGW3
 JoU3acvqZVFQixZhAd2emPJL0qlrMHYjvgHlF96T4ahGh7VgoSVOfyaLv
 GniKLmgKb7B/8noENRhsv7+UqGeERwwxHMGFk+iU6x/w1O7BDw6JWMxi2
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=BJ+PphB0
Subject: Re: [Buildroot] [PATCH 1/1] package/rrdtool: fix patch fuzz
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2024-06-28 00:06 +0200, Bernd Kuhls spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, rrdtool fails to build with output:
> 
>     patching file src/rrd_tool.c
>     Hunk #2 FAILED at 42.
>     Hunk #3 succeeded at 435 (offset -8 lines).
>     Hunk #4 succeeded at 518 (offset -8 lines).
>     Hunk #5 succeeded at 564 (offset -8 lines).
>     Hunk #6 succeeded at 879 (offset -8 lines).
>     1 out of 6 hunks FAILED -- saving rejects to file src/rrd_tool.c.rej
> 
> Because this was caused by an upstream patch we do not change it but add
> another upstream patch to be applied before our current patch to avoid
> the problem.
> 
> Fixes:
> http://autobuild.buildroot.net/results/6996dbd764b0066da49dd009f1385196342c89dc/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

To be noted: the new patch touches configure.ac, but that's OK as we
already autoreconf. So, maybe it would be worth a comment in rrdtool.mk,
in addition to the existing one?

Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>

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
