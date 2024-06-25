Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78C2C30658
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 11:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B1976104C;
	Tue, 25 Jun 2024 11:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UVkTN4s_ZNf; Tue, 25 Jun 2024 11:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5312261058
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5312261058;
	Tue, 25 Jun 2024 11:18:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1AC51BF426
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 11:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC07B8139F
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 11:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Cq0-QCBpO8R for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 11:18:27 +0000 (UTC)
X-Greylist: delayed 430 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 25 Jun 2024 11:18:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B704B80FA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B704B80FA7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B704B80FA7
 for <buildroot@busybox.net>; Tue, 25 Jun 2024 11:18:26 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 13:11:14 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2024 13:11:15 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 13:11:13 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 13:11:12 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.08,263,1712613600"; d="scan'208";a="158666820"
Date: Tue, 25 Jun 2024 13:11:12 +0200
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <Znql0FCAPG8jP+Lx@tl-lnx-nyma7486-2>
References: <20240612135727.11811-1-ps.report@gmx.net>
 <20240612135727.11811-5-ps.report@gmx.net>
 <ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZnqUPBAcDbB7ND64@tl-lnx-nyma7486-2>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX203.corporate.adroot.infra.ftgroup (10.115.26.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1719314306; x=1750850306;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=5p2HEAcyCITzfWT4QqG1/ATtoJ1OMryPjhe1EqUUWeY=;
 b=mvGzyYCK/o1Eu+Hj2AZKw1ONueIQmWGxusJf2JNI5QwRZONd1ypgD9Jg
 qqH0JU+tSsK83Vqqko+mUvZE8N7Vd/DrpCep7mFspY29z16vAb3YlrnkA
 n5Qne6DD+mSdhmUqDVe/w7ErOQDt95+P2ZG3F8yL2l4AXZ7QKmRqcH8EE
 +WWDqvOoiajIjNzO0m5pkI//AS/fny/jY2IFowild+gVTnvkhk2wDgcT4
 4mohlHikLqpdn9ULoVpI0OLKcYUYqeCA/OT8ApFQdTRfVi3JqDIeqkZwa
 nL7qKnT9hZbf0FG8CzE8eF/hQPCUVJpeYQa5u5P7tJY94RMNUDDIiWnDU
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=mvGzyYCK
Subject: Re: [Buildroot] [PATCH v2 5/5] package/xz: convert to cmake build
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
Cc: buildroot@busybox.net, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-06-25 11:56 +0200, MORIN Yann INNOV/IT-S spake thusly:
> On 2024-06-12 15:57 +0200, Peter Seiderer via buildroot spake thusly:
> > Convert to cmake build with the following autoconf options without
> > direct equivalent cmake option:

The autotools build system is still operational, and still works. So,
what was the rationale behind that change?

Was that a defence against another backdooring attempt? If so, I think
it should have been stated clearly in the commit log. Also, we can be as
paranoid as we want, but it is possible to inject a similar backdoor
in cmake as was injected in autotools, so switching to cmake just for
this reason is not rally sufficient...

Note: the issue I hit can be solved by passing ENABLE_NLS=OFF in the
host variant; we don't really require translations, so we can
unconditionally turn it off.

However, we might hit a similar issue in target builds, and there, I am
not sure what would be the best solution...

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
