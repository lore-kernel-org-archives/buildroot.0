Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DA5C55838
	for <buildroot@archiver.kernel.org>; Thu,  6 Aug 2026 05:13:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 83743606E1;
	Thu,  6 Aug 2026 05:13:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRgzfHP78eFt; Thu,  6 Aug 2026 05:13:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 649A1606CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785993225;
	bh=Qn6PomUanFbMXx5KrhQFrsZ4lAkyocEm4mN9zaSxqRo=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qONW5jnAMN7KfBq22QcfNx5CD1Sq9qWtXoC81taRzPBdld4EiiObpQX2WQdkDrWQu
	 JXXf4s2RjfLcdvn4qgHaYk3dPEqQC8hA7Q/AEeJNUATTsR+LVHCnKCbJUBKnpAfZDB
	 Zg+ykz+PqArWzB1qcGYogBSlTr3EibA0dwviwSzDo1GcYWsCI/X2Gfqesj0RPaT/m4
	 k9fcy+W6qQZaF1h0jpkWRY6wkby3RxDPDXL5e/mNzCrQ0/TrNKbU6yIDmz94pIHIhH
	 b0nlZzPu5zUJ6+wqGwGVfzxtfsM9dCh6evl+qiI+Q7Qg4bN1Air6OLwvBwWkfCNqCZ
	 b+la9mWZf4qxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 649A1606CE;
	Thu,  6 Aug 2026 05:13:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC8BB2B6
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 05:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E10D80D39
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 05:13:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxbo5CEopHnf for <buildroot@buildroot.org>;
 Thu,  6 Aug 2026 05:13:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DB0E80989
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DB0E80989
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DB0E80989
 for <buildroot@buildroot.org>; Thu,  6 Aug 2026 05:13:41 +0000 (UTC)
X-CSE-ConnectionGUID: 5ppPag9bTnmb6Cjli4+c1Q==
X-CSE-MsgGUID: ocTi6mOdR8KltFOJitUi8Q==
Received: from unknown (HELO opfedv1rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 06 Aug 2026 07:13:39 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 07:13:39 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Thu, 6 Aug 2026 07:13:37 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 06 Aug 2026 07:13:37 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: megkVNSpTrWqUlfO/f1fyg==
X-CSE-MsgGUID: emlmSxM7SgCqjZytbG6fHA==
X-IronPort-AV: E=Sophos;i="6.25,207,1779141600"; d="scan'208";a="459481168"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Thu, 6 Aug 2026 07:13:37 +0200
To: James Hilliard <james.hilliard1@gmail.com>
CC: <buildroot@buildroot.org>
Message-ID: <anQYAedmf7UVuP63@yd-6wlzhs3>
References: <6a73ff1f.b251136a.3b3ec3.8c3e@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6a73ff1f.b251136a.3b3ec3.8c3e@mx.google.com>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX601.corporate.adroot.infra.ftgroup
 (10.115.26.29) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1785993222; x=1817529222;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=HS+ws226ToPxF16MgSbsFTyqN/BcUn6br9dMdSOpeLc=;
 b=WPd4vHwxfwbaYALY4qYoInZFw59Tw5RxdWmb5eOxGkUucLothbg9SSUu
 6AdZVInrgvL2i9uqnfAAi0D3gRwejJg+dCamfMPqoYt5+liEje9d25yJ/
 bwV2DmbWeGoXVfVzcWJ6FpMalRePPp8BvGCDPlDvmS2IcSGTfyhwO0UzA
 oePkWAaan+9bfhhm8wl1FppWtxUS7S8zTDUE3EravKsg0tsAbrli74EFt
 UWqmTgW3vakjhw8M6Yf1k5bVN3J5Y3OqJ3eh0IEvXaxYEraxozoHZDSYE
 duEkvKPhBw3JfLWcumPCsOOyqbpM0MYPKEXrBL0lssH0nvHNZg7dX2tWV
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=WPd4vHwx
Subject: Re: [Buildroot] [autobuild.buildroot.org] Daily results for
 2026-08-05
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

James, All,

On 2026-08-06 03:27 -0000, Buildroot Notifications spake thusly:
> Autobuilder failures (excerpt from a few daily reports):
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     i686     | amazon-ecr-credential-helpe... | https://autobuild.buildroot.org/results/f604fd0932c155812559a58ce7236c52ad46c020
>     i686     | amazon-ecr-credential-helpe... | https://autobuild.buildroot.org/results/9a21ed3d040ee123eb5a7611776f830e43aa19a2

It seems that, somehow, go gets confused between the host and target
architectures:

    * the host is AArch64
    * the target is i386

But the link of the *target* package fails due to relocation errors in
the arm64 go linker:

    loadelf: $WORK/b231/_pkg_.a(_x002.o): 367835: sym#69
    ("wm4.0.de6020793228b799ea3c25f2853d5666"): ignoring symbol in
section 2
    (".group") (type 0)
    /home/autobuild/autobuild/instance-4/output-1/host/lib/go/pkg/tool/linux_arm64/link:
    too many errors

James, I would need a bit of help on this one: the build fails on your
AArch64 autobuilder; and I have no AArch64 host at hand to reproduce and
debug the issue.

Regards,
Yann E. MORIN.

PS. Sorry for the triplicate message, I now see that replying to the
daily mails do not reply to the list... :-/

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
