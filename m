Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4417CCCD1A7
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 06:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF6B80BC2;
	Tue, 21 Oct 2025 06:30:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hbZMQk5uvrh; Tue, 21 Oct 2025 06:30:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 464F080BC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 464F080BC1;
	Tue, 21 Oct 2025 06:30:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41D9643F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 06:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26EB94055E
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 06:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JM-X4bccQIyX for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 06:30:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.122;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF3254055A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF3254055A
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.122])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF3254055A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 06:30:53 +0000 (UTC)
X-CSE-ConnectionGUID: J8EimJQUSOSUOad/hP2iXQ==
X-CSE-MsgGUID: qDJihhaBQtaTlyJ/veY6IA==
Received: from unknown (HELO opfedv3rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 21 Oct 2025 08:30:50 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Oct 2025 08:30:50 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.59;
 Tue, 21 Oct 2025 08:30:49 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 21 Oct 2025 08:30:48 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: JfZqv7nQTnGhQKJU8L6dCA==
X-CSE-MsgGUID: dxDn1izpSMyeXtHmzNbVsQ==
X-IronPort-AV: E=Sophos;i="6.19,244,1754949600"; d="scan'208";a="348040575"
Date: Tue, 21 Oct 2025 08:30:48 +0200
To: James Hilliard <james.hilliard1@gmail.com>
CC: <buildroot@buildroot.org>, Christian Stewart <christian@aperture.us>
Message-ID: <aPcomAvNjlDA4o9R@yd-6wlzhs3>
References: <20251021055931.532861-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021055931.532861-1-james.hilliard1@gmail.com>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1761028254; x=1792564254;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=X72tV/i0MLqFbg3E+Rtbz7JoJA6it6jPoXn2yRDxB50=;
 b=dlw5KiLaW3k0YF0k6xPQO5QxSTSvyfODDxootaD1KJ6s31UYBzeta4nR
 qyCNG+3jiLDwNA40Dvv1LtJbwrIOjOXBwwHuWRFBYKvUqaesR7pO/N2ri
 M+WbUSw+G/z5HKI7sPQUilYfvkCIox5ZryIoudFDSl9vvpA+7uUEh2BJV
 wAV+91Zbq9VHSkYMUGUerEm40Wjvi9XSQWVrOA4Vs7NS5YaDAJjeSZ1d2
 qSZTWIVL6QVjMn/6dnWkFlBowX6IQUFGeq8RKoMJc/HbgxrzTBUgqE7uv
 Qw7tHVq5ip36C3FUK1vk9r0QkE+aoUNS7Z9WAjjRVabG331y2n/8Fki/b
 w==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=dlw5KiLa
Subject: Re: [Buildroot] [PATCH v3 1/3] package/pkg-golang.mk: use golang
 toolchain default GOPROXY
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

Thanks for the quick respin (while the discussion was still on-going in
a previous thread...)

I was expecting that the order of patches would be the reverse:
  - first, make it configurable, keeping the current default
  - second change the default.

If you first make it configurable and the patch is reverted, then the
default patch would _technically_ have to be reverted too.

With the ordering you propose, if the secod patch turns out to have an
issue and is reverted, then the first patch would still be applied
because it would not be _technically_ needed to revert it, and thus
people would be forced to use a proxy.

On 2025-10-20 23:59 -0600, James Hilliard spake thusly:
> This change sets the default GOPROXY value to match Go's built-in
> default of "https://proxy.golang.org,direct" which provides several
> benefits:
> 
> - Avoid package breakages due to missing module sources

As has been discussed in a previous thread, this is not always true, and
has been proven to be false in certain circumstances.

> - Better alignment with upstream Go toolchain defaults
> - Faster downloads via the proxy compared to direct Git clones
> - Maintains reproducible builds through Go's module checksum validation

We already have this feature in Buildroot, where all the sources
archives are hash-checked already, so I'd argue that dependeing on the
backend tooling (go in this case) is superfluous from the point of view
of Buildroot.

[--SNIP--]
> -	GOPROXY=direct \
> +	GOPROXY="https://proxy.golang.org,direct" \

So what happens if the archive cached in the goproxy does not match the
one expected by the being-veondred package? Would go fallback to direct,
or does it immediately abort the vendoring?

If the go vendoring fallbacks to the next item in the list when it can't
fownload from a previous one for whatever reason, such as missing in the
proxy [0] or not matching hashes, then I would argue that "direct"
should be the first in the list (to fetch from upstream preferentially,
and only fallback to a goproxy only for those mnisbehaving packages...

[0] but then, if it is missing from the goproxy, why wouldn't it caches
the archive it is missing?

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
