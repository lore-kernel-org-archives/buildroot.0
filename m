Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8F53CD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E56360F65;
	Wed,  6 May 2026 22:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sEKiVglc1tzn; Wed,  6 May 2026 22:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78123607CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778105909;
	bh=XArsoS1qWudO3UY766EilOGMYbhfS5eGC3b2Yy/rRy0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R9mAjZ+RPDZMi5Ld3y9AhzWUaHKOy/qjZiWcg1GOvG5JHftuxCxwnlvqlsOQvniXt
	 qRAifAgc136ms5I96aj7y6OKj71VYpTxBtoBg14Yba1iu67tfTszLUBNrI0fZ4xfSA
	 O1UVx5taR364wyBOqFMukIK6pjESZqt7Y5U3sjHfYFMZYZV4KpVuaX4boDoBTWc2Fl
	 /m2o4tNx019Y0fUBpolB7MSVZdwkBrfwrOZ2U+r71AbBT1O+lW/aAh6h8L1qeiMxKP
	 +4eskfjxBWeO3q59EXB1NdvEdv1Iqsovcx6KhZurHBH80XVLbF5ojdTkPdTYDTZJ1D
	 Ygn0H8M4G7KGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78123607CD;
	Wed,  6 May 2026 22:18:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 28861280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26B0D4100E
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tY1Y_8BoANc2 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:18:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 539144100D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 539144100D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 539144100D
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:18:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 316202003DD;
 Thu,  7 May 2026 00:18:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 07 May 2026 00:18:22 +0200
MIME-Version: 1.0
Date: Thu, 07 May 2026 00:18:22 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260506205330.1422799-1-bernd@kuhls.net>
References: <20260506205330.1422799-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <1033da19c9dfbedabe7615954d2cf69f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778105904;
 bh=JUI/Ub3Yo1y4RdtM+YY41Lkwp3rDCBKi8CBfgDrQg64=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PGgBiSrUOY0hy1wzmJQFyGtFWJuTrvwDxgxSifsRN3GtakGuWfKd0SbgP0I9OWbLG
 djwWuEg2BgHi4JDnPWBFbsohhtFQV4lxkEPyuaXs10rB32ezmJlgjEOxztjHmKr0H8
 eJKqMSvaLHmIOiJexdkyPWl1R4fCVyKrXWh5zDPaNqsy+UZm+Xi4sxzYiCf6CAhK2g
 1R1Y/+8PP3d4AeRf8hXOv4O+fRAymZl795w0KR8gdGHNGt/HgZivqx31Lpk7UCyATD
 tylAAAyBMlvjxpdxeQ5qoo1R53zUQ1zgRSAMB44mI20LuihZrOMW5ZqoJuTwPD72Ez
 d24IuLRkZQzAw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PGgBiSrU
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.1.0
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

On 06/05/2026 22:53, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-May/000849.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
