Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A8FBECE57A
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 13:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82551401EF;
	Mon,  9 Sep 2024 13:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sTP3qOm6G-K; Mon,  9 Sep 2024 13:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20C4740185
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20C4740185;
	Mon,  9 Sep 2024 13:22:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 182D91BF947
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 13:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C989401C9
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 13:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GWVIoPAhFhdL for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 13:22:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4C89F400D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C89F400D9
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C89F400D9
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 13:22:00 +0000 (UTC)
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 15:21:57 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 15:21:58 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 9 Sep 2024 15:21:56 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Mon, 09 Sep 2024 15:21:56 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.10,214,1719871200"; d="scan'208";a="195752604"
Date: Mon, 9 Sep 2024 15:21:56 +0200
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <Zt72dKoL8r+EbaVG@tl-lnx-nyma7486-2>
References: <20230117110440.3405234-1-carrier.nicolas0@gmail.com>
 <6c8d181d-a540-4f60-8b9c-30e508fcd2a3@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6c8d181d-a540-4f60-8b9c-30e508fcd2a3@mind.be>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX206.corporate.adroot.infra.ftgroup (10.115.27.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1725888120; x=1757424120;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=oOyRp9D9TsuoOlcYR2ZWDujyLQbbbIsWZCsOz1GHW1Q=;
 b=at58Zr2PV9s0oJcMi3xtKayI72MNb/js8MLEaF1AmS07crcu9G8kXgTz
 ui1N95wbA/Hh6HdKtY+w0DqQZaOffwvHTIHebdtMlC4nMKWPhcw7UG09p
 34SViMFQB5rwaScjsjGOeALSi3muIRvII7ZNX8PbTDlD6UwBCBbqEsr6z
 T2q1KgMrrR0Wvpk66l/5V5rg3B4mkVx6qrGSwYPAdDNIDIJ7kbRN+mG3R
 fDGG49/Ay38bxddZ3pzlUDZ0ZK+c67wUAVVq0aVn/YM3cXm1msX4aeFx7
 o9scxkMVd8DHa9PooBkXk2VkPFCaFV97B4oI8IMT6gtK77PzEkDSWjGIc
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=at58Zr2P
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: local and
 override support in legal-info
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
Cc: carrier.nicolas0@gmail.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Nicolas, Arnout, All,

On 2024-07-15 19:48 +0200, Arnout Vandecappelle via buildroot spake thusly:
> On 17/01/2023 12:04, carrier.nicolas0@gmail.com wrote:
> > From: Nicolas Carrier <carrier.nicolas0@gmail.com>
[--SNIP--]
> > This patch generates a tar.gz archive on the fly, containing the
> > result of the rsync of the package's source directory, using the
> > same arguments as during the preparation of a build.
> > Note that is not possible to archive the builddir, since it may
> > contain artifacts of previous compilations.
[--SNIP--]
>  I finally applied to master, with a number of changes still:
>      - Drop the auxiliary variables: their use is contained within one code
>        block and it's easier to read with being explicit.
>      - Put it in an additional subdirectory .legal-info-rsync of the build
>        directory, to reduce the chance of conflict with an existing
>        file/directory.
>      - Archive the directory (e.g. linux-custom) rather than its contents,
>        so that it matches a normal tarball.
>      - Use the mk_tar_gz function from download helpers to create a
>        reproducible tarball.
>      - Split long lines.

This is in fact silently broken:

    cd buildroot
    git clone https://git.busybox.net/busybox/
    echo "BUSYBOX_OVERRIDE_SRCDIR=$(pwd)/busybox" >local.mk
    echo "BR2_PER_PACKAGE_DIRECTORIES=y" >.config
    make olddefconfig
    make legal-info


Right in the middle on the legal-info, there are uncaught errors:

    + ..../buildroot/output/per-package/busybox/host/bin/tar cf - '--transform=s#^\./#busybox-custom/#S' --numeric-owner --owner=0 --group=0 --mtime=1970-01-01T00:00:00+00:00 --format=posix '--pax-option=delete=atime,delete=ctime,delete=mtime,exthdr.name=%d/PaxHeaders/%f,exthdr.mtime={1970-01-01T00:00:00+00:00}' --mode=go=u,go-w -T ..../buildroot/output/build/busybox-custom/tmp.a4vUEstZxu.sorted
    support/download/helpers: line 62: ..../buildroot/output/per-package/busybox/host/bin/tar: No such file or directory
    + gzip -6 -n
    support/download/helpers: line 68: ..../buildroot/output/legal-info/sources/busybox-custom/busybox-custom.tar.gz: No such file or directory

If one removes use of PPD, the exact same gzip error still occurs,
bizarrely enough...

In both cases, though, the legal-info process continues till the end,
and no archive of overridden packages is even created.

>  There isn't actually much left of the original patch :-)
>  See [0] for all the gory details.
> 
>  I hope this helps you!

As was reported by the other Yann, this is actually breaking our
use-case: for the past many years, we've been depending on the fact
that overridden packages were actually NOT saved in legal-info, and
that a warning was emitted instead.

I know it's going to be contentious, but can we get back the old
behaviour that people have been relying on for so long (and that was
actually working), please?

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
