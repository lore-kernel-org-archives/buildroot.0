Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D6FEF4EC0
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F41C3608C7;
	Mon,  6 Apr 2026 08:04:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mf0SV0yRmsBT; Mon,  6 Apr 2026 08:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 048D760867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775462642;
	bh=UnZ0vGUIFo55/V3mpvQxNCbWiSfxAVOZz6MQzjkX6jo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RUg1IIEuyWceym8HHkS2c4a8LeD0c7ydSV+EdCalWeT7qGaCo8nn/yuzMe6WQpJSR
	 I3B/SHEfz4ctma1hXJHsZMMc/gwl/Bb/+BrQl66zvZG7ydU1k/uS6cL7l5jjOgp42t
	 tgCxTPbUo08Jzb7nwsBUH5yjQYCriBi/Fo/Std7Dy2VLLQ7CVW7MFM+tUb2DhAVZAI
	 j+j91jGV40MmLsGHxSNZEdSZ/tIJy5LTm6MyGVdclnFEncDbz0ujc02w+Gaz7QzM1n
	 OIDTssmK4pfD50exG8KDw2Gs5dPt+TTKeF295v8ZOX4M5sN8FIdqoZtbRsNflB9FM6
	 dHjcHwUOMJF1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 048D760867;
	Mon,  6 Apr 2026 08:04:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58BDB1EB
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B433402D1
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0PiuAkj7aI5 for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8860E40162
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8860E40162
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8860E40162
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:03:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 43C015FFA3;
 Mon,  6 Apr 2026 10:03:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 10:03:55 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 10:03:55 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260403191212.41297-1-bernd@kuhls.net>
References: <20260403191212.41297-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <9bd76f389facb56a8418edbee7d9fe8f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775462637;
 bh=BU8ocaXnuIbS5/chIN+OMCbpKTxJA+adz7ij+5M4caU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sXse8RVKKXqZkSsrKYJP/KnTUPGgjko4wxo/Dn9LcN9dwIwOao405tMwHaWHlvdOx
 pcDU5/VqOaszta4g+XwfYjXc9G50EBvw0VkpPLZSuZpjbZDb7eyviwHrLZUplWLOcv
 /wEhXwbvpxEHKpNaTONKfpMfUgxiC/l13Y2nBG/NLqZvUGIBOnkM/VOqjo+I7IHMRp
 /UceSf8vR0Ab7+wCbP25wpNfuoSzB6TxveH4KfKwAAlK14L1UUy/8tPdr4cyLO+A/w
 zxmB+ISRnFS3/tffc0Ii28QB8m3B6kABRfIzi5ueuBiCoi1v2nX312WP45cRZCvRlf
 jASEaf5PaS+Yg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=sXse8RVK
Subject: Re: [Buildroot] [PATCH 1/1] package/suricata: bump version to 8.0.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 03/04/2026 21:12, Bernd Kuhls wrote:
[...]
> diff --git a/package/suricata/suricata.mk 
> b/package/suricata/suricata.mk
> index 8840853054..0ee3752a21 100644
> --- a/package/suricata/suricata.mk
> +++ b/package/suricata/suricata.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -SURICATA_VERSION = 6.0.20
> +SURICATA_VERSION = 8.0.4

This is quite a large bump. I looked for the release notes, and just
found that v8.0.4 was fixing few critical CVEs. See:
https://forum.suricata.io/t/suricata-8-0-4-and-7-0-15-released/6218

Also, according to pkg-stats, there is currently 28 CVEs reported
on this package:
https://autobuild.buildroot.org/stats/master.html

I did not checked when those CVEs were introduced or if they are
all applicable, but this should be mentioned in the commit log.
It is likely this bump should be marked as a "security" one.

I believe your first motivation was to get rid of pcre (v1)
dependency, but could you add the release notes links in the
commit log, and add a note in the commit log, mentioning either:
- none of the CVE in the release notes are applying, because
they were introduced in intermediate versions, or
- the list of the fixed CVEs, to help the LTS maintainers
(and mark the bump as "security").

>  SURICATA_SITE = https://www.openinfosecfoundation.org/download
>  SURICATA_LICENSE = GPL-2.0
>  SURICATA_LICENSE_FILES = COPYING LICENSE

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
