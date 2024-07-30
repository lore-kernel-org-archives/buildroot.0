Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB375C3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 04:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE39E40666;
	Tue, 30 Jul 2024 04:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1DW1zeXRRjJ; Tue, 30 Jul 2024 04:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D4B40667
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40D4B40667;
	Tue, 30 Jul 2024 04:23:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9C991BF3A3
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 04:23:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E39E440667
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 04:23:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WhFYxenWPcb0 for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 04:23:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDFDC40666
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDFDC40666
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDFDC40666
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 04:23:51 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 06:23:49 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jul 2024 06:23:49 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 06:23:47 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 30 Jul 2024 06:23:47 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.09,247,1716242400"; d="scan'208";a="180644263"
Date: Tue, 30 Jul 2024 06:23:47 +0200
To: <buildroot@buildroot.org>
Message-ID: <Zqhq01IIeT8DSmq6@tl-lnx-nyma7486-2>
References: <c47a24$19l24k@smtp-ina.orange.com>
 <ZqeAk9SvzL44FV0+@tl-lnx-nyma7486-2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZqeAk9SvzL44FV0+@tl-lnx-nyma7486-2>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX104.corporate.adroot.infra.ftgroup (10.115.26.5)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1722313432; x=1753849432;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=Sl8gpY1MJ/KNdG4meClIy1D/oc1xYQS+VY2wiGLxkSY=;
 b=hsqAijuFt2LQ3R/+bgKAw4Lt0fwx7cC/zCPW3UinRzcKkEZYFbk1Ooti
 rYr9RIYISeHpMNxa8uWe2/ae/9/Nj1Tw1cSQflpcEChrpnNYC9GiPpSOY
 VjFfXBsyPTrK/Wd1GfnVKFA31mvw4UsOfCyuwqoitiBFc/jMkRUU5UA1v
 6IkA2WVimz5DioV6593A3Mxjf2Pubcsua0nRWo+GbeRqU8b/VYMVS8O8k
 4/tafBhQ4fLwG/FC9mZMO6jrvcGB7LlFMHY4aRRykWaDSlYX80lW4jwDO
 Z4RdB/EyZg9WDu4jAbLic2zmD5phXTIgpwwUTgO1OPRZdDWgq1Gi6mVl5
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=hsqAijuF
Subject: Re: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2024-07-28
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2024-07-29 13:44 +0200, MORIN Yann INNOV/IT-S spake thusly:
> On 2024-07-29 04:55 -0000, Thomas Petazzoni spake thusly:
> >    mips64    |       host-skopeo-1.13.3       | http://autobuild.buildroot.net/results/9dacb15da7dcf4fb97cd2eaf17c5cb3c88290390
> >   mips64el   |       host-skopeo-1.13.3       | http://autobuild.buildroot.net/results/e4dbb5c7eb1c952718c2efa9bcd2211681ac950a
> The root cause for these build failures is that the gpgme wrapper in go
> needs CGO support, but the failing configurations both disable CGO,
> because the target architecture does not support CGO linking support.
> 
> We handle CGO in a slightly convoluted manner:
> 
> * if the go compiler supports the tqrget
>   - if there is no CGO linking, then we set HOST_GO_CGO_ENABLED=1

Of course, this is the other way around: if there is CGO linking, then
we set HOST_GO_CGO_ENABLED=1.

Regards,
Yann E. MORIN.

>   - otherwise we set HOST_GO_CGO_ENABLED=0
> * if the go compiler does not support the target, then we set
>   HOST_GO_CGO_ENABLED=1
> 
> And then we build go packages, target or host variants alike, with:
>     CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
> 
> Furthermore, HOST_GO_CGO_ENABLED is also used when building go-src.
> The same go compiler is then used to build either target or host
> packages.
> 
> AFAICS, there is no way to tell the go compiler to build with CGO
> linking for the host but without for the target; its an all-or-nothing
> situation, and thus the limitation of the target do leak onto the host
> support.
> 
> There is a Kconfig knob that drives whether CGO is enabled, which is
> BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS. However, as its name
> suggests, it is for the target. And when go does not even support the
> target, that will not be enabled either.
> 
> So, what I see as a solution, is two-fold:
> 
>  1. introduce BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS, defined as
>     follows:
> 
>         config BR2_PACKAGE_HOST_GO_HOST_CGO_LINKING_SUPPORTS
>             bool
>             default y if BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
>             default y if !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
> 
>  2. make skopeo depend on that new symbol
> 
> Thoughts?
> 
> > -------------------------------+----------+----------------------------------------------+--------------+--------------
> > skopeo |  DISTRO  | https://release-monitoring.org/project/09216 | 1.13.3       | 1.15.2      
> 
> I'll see at updating skopeo as time permits in the week...
> 
> > skopeo | CVE-2019-10214   | https://security-tracker.debian.org/tracker/CVE-2019-10214  
> 
> That CVE applies to containers/image, and is matched for un-versioned
> skopeo (notice the dash '-' in the CPE ID):
> 
>     https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe:2.3:a:skopeo_project:skopeo:-:*:*:*:*:*:*:*
> 
> and does not apply to any versioned skopeo (any and 1.13.3 for example;
> notice the star '*' or the version instead of the dash in the CPE ID):
> 
>     https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe:2.3:a:skopeo_project:skopeo:*:*:*:*:*:*:*:*
>     https://nvd.nist.gov/vuln/search/results?adv_search=true&isCpeNameSearch=true&query=cpe:2.3:a:skopeo_project:skopeo:1.13.3:*:*:*:*:*:*:*
> 
> This was fixed in containers/image in upstream commit a3d69a4a (Use the
> same HTTP client for contacting the bearer token server and the
> registry, 2019-08-01) which has been released in containers/image v3.0.0.
> skopeo 1.13.3 vendors containers/image v5.26.2, so the CVE does not
> apply.
> 
> So, not sure what the best way of action would be...
> 
> Regards,
> Yann E. MORIN.
> 
> -- 
>                                         ____________
> .-----------------.--------------------:       _    :------------------.
> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> |                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> | yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
> '--------------------------------------:______/_____:------------------'
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
