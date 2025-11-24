Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6044CFD313
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 14:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74BCA60773;
	Mon, 24 Nov 2025 14:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iWhRHSrA21cO; Mon, 24 Nov 2025 14:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 625C1607BD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 625C1607BD;
	Mon, 24 Nov 2025 14:18:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43FD1E4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35C5A81321
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7jhqbqq4lOvC for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 14:18:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 642F0812E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 642F0812E6
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 642F0812E6
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 14:18:51 +0000 (UTC)
X-CSE-ConnectionGUID: YM9Zv/svQQ+6Tw2a8wRx7A==
X-CSE-MsgGUID: LbvGHsmkR/G3gEjaSzQpIw==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 24 Nov 2025 15:18:48 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Nov 2025 15:18:47 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Mon, 24 Nov 2025 15:18:46 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 24 Nov 2025 15:18:46 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: LVwHFxvGSA273zI2f+SY9A==
X-CSE-MsgGUID: 1KFyOCikT3GbGFnJVVh0xA==
X-IronPort-AV: E=Sophos;i="6.20,222,1758578400"; d="scan'208";a="361295665"
Date: Mon, 24 Nov 2025 15:18:46 +0100
To: Florian Larysch <fl@n621.de>
CC: <buildroot@buildroot.org>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <aSRpRtlFVZFHLDsd@yd-6wlzhs3>
References: <20251124140704.15108-1-fl@n621.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251124140704.15108-1-fl@n621.de>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX206.corporate.adroot.infra.ftgroup (10.115.27.7)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1763993932; x=1795529932;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=2Ob0IZgyex0U6gq6mzxvHmB/j1CY/P15CRjg10WZyP4=;
 b=AVKMzMXFafPrfpX77VeM4dal6wBwQT39Y9qVnxLP81GuArfgipMPFjyc
 2zO7C9U57qibgqT4SQh/Su5cYAxOLR3Aj/Y5Wu/kx36U+YhTVV+gzo/og
 00HwAIqsBIjzQsQXK9TOzbLwvUAp/93Bd7Q7kZyaW4MdLHYAbYJfCgOUK
 1SpTuGZeY+9Kp6N3UN/bzUFh8l6q3ikHYkKvDVwgqkEA0IleEyBQnQOj3
 0wxeyYYqv+eRJ+rKnf8yAqKzzRnUQUE1NWOHRbsfFQVxQGgO1b0A4Y9kG
 yJVCaMeppx7XC43WwoGgvCVtUOyXRgl/NynCQLypePsbz/+UbPDJyFQYx
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=AVKMzMXF
Subject: Re: [Buildroot] [PATCH 1/1] package/libconfig: refresh tarball hash
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

Florian, All,

On 2025-11-24 15:06 +0100, Florian Larysch spake thusly:
> Upstream has modified the release tarball without bumping the version,
> presumably to fix [1], which is now causing build issues. Refresh the
> hash to match the new tarball.
> 
> The original version is still available on sources.buildroot.net,
> yielding the following diffstat:
> 
>  Makefile.am                 |    1 +
>  Makefile.in                 |    1 +
>  examples/c/Makefile.am      |    2 +-
>  examples/c/Makefile.in      |    2 +-
>  examples/c/pathbuf.h        |   54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/libconfig++.pc.cmake.in |   12 ++++++++++++
>  lib/libconfig.pc.cmake.in   |   12 ++++++++++++
>  7 files changed, 82 insertions(+), 2 deletions(-)
> 
> Where the Makefile changes only add references to the added header and
> pkg-config files.
> 
> [1] https://github.com/hyperrealm/libconfig/issues/256
> 
> Fixes: https://autobuild.buildroot.org/results/89b/89b15ed871a7d8e2a789d1d9a1bab11b7f50274b/
> 
> Signed-off-by: Florian Larysch <fl@n621.de>
> ---
>  package/libconfig/libconfig.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
> index 2b10dfc125..42935426a8 100644
> --- a/package/libconfig/libconfig.hash
> +++ b/package/libconfig/libconfig.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  87c6f382994b245f9213be34a2bf19c8ee7d033d7abaa51e88fbb7bad79e2dc6  libconfig-1.8.1.tar.gz
> +sha256  c73ee3d914ec68c99b61e864832931e9a7112eeabfb449dad217fd83e385cbdf  libconfig-1.8.1.tar.gz

We can't do that.

People using older versions of Buildroot will ahve the old hash, while
those using a newer version will have the new hash.

So, if we update the archive on s.b.o, older Buildroot versions are
broken: libconfig is no longer downloadable, because no archive match
the old hash.

If we don't update, newer versions will always fallback to downloding
from s.b.o., but this is not good, as it no longer matches upstream's
archive.

In this case, either we can upsdate to a newer version (but there's none
so far), or we change to fetch from git:

    LIBCONFIG_VERSION = v1.8.1
    LIBCONFIG_SITE = https://github.com/hyperrealm/libconfig
    LIBCONFIG_SITE_METHOD = git

and update the hash file accordingly.

(we can't use the $(call github,...) helper, as the generated archive
would also be named libconfig-1.8.1.tar.gz, which would also
conflict...)

Also, bang on upstream's head and tell them : "Do not, ever, ever,
change an existing tag or release! Release a new version instead!" ;-)

Regards,
Yann E. MORIN.

>  sha256  cbbad55f94feadb16061c4f782910bac254460a44f1c8abd2b91452eff085f55  COPYING.LIB
> -- 
> 2.51.2
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
