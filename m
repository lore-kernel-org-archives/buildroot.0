Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EFF4FCC05C
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3851A613C9;
	Fri,  6 Mar 2026 18:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvDFqAthAbir; Fri,  6 Mar 2026 18:45:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F3216139F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822717;
	bh=0gfRH0VSfNBkSdhXK2x6CZedAL0ydVF4W6Nk2VFeO5M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e8350VvHmiHrCCr5IsF1FCQ9lFpVPr3YnJBRXXJ1zQ2Wc5FpbcYUsQKlejZUZjUtx
	 8gWTnXCriZ3UvDmvbPxuAj04uKpx5mJQhKWSqoaOS5kmEsWCH4N9SpbpEuMgAnBA+E
	 Pu2HWwQm796sCyKUvELBgNO+Is6njbLQi+YFC5rfY+Wa3uAkzj0Pm/O4bcrhbQPV6J
	 TTes9uf4fqms/hqioPJsOYYkLluCKyfwgC0BS+364Qtta8h44d47smjVdFAJHKu0DO
	 YQvl2+ixyf6SiY0jpca0I7Ln0raPrvAQHfdkW7hBEKjKlw/gtIu9I5c1Z1sQNZRMGZ
	 f8KLEMhqjXS5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F3216139F;
	Fri,  6 Mar 2026 18:45:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 478FD339
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3919741E24
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ue6sYxJUBRx7 for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:45:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2F2A441E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F2A441E23
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F2A441E23
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:45:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 1AB302003C8;
 Fri,  6 Mar 2026 19:45:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 19:45:03 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 19:45:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Andr=C3=A9_Zwing?=
 <nerv@dawncrow.de>, =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel
 <petr.vorel@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260305210950.3471974-15-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
 <20260305210950.3471974-15-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <8f9881071afd8888c1f8e1d4eb99c233@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772822712;
 bh=LwKxHQAI7M8GVZEZiJH3hY52qdkj8fkSZnEGti1uKvo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dPX++GfHAcS4ejElEMwECsJ4LSLLyZosuqt/PVrmvOv/Mr+s++Sbwlc/il5k2OECY
 FpiZpx+foDk8uajoTP01wHetBgPp3mhXZOVdO7hsWOA+/BX+g5XlpM53FAED2+H3u5
 O2WV0Bg6ElA+ZELF6qRE+A0NY+VuBdJsyxd/OJYBv/P2/B8S1hcHqwMPLtZZzjb21e
 hMxeSUfLLaxnt6WAtiBeOPu5kqXxBUpxRRHzVdVISyR6UIV2hOtpQ2Ac3FnTuqT51o
 HtSrbEWzMOqv61AIy6rIlkln5WCS51/new5f5CHDB32CXZkrMsA2+5IGFcofCUAJVD
 55M9XtLHFmotg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dPX++GfH
Subject: Re: [Buildroot] [PATCH v2 14/14] package/{glibc,
 localedef}: bump version to 2.43
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

Thanks for the patch. While this new glibc 2.43 generally
works fine (I tested many configs), I've found an issue.
See below.

On 05/03/2026 22:09, Bernd Kuhls wrote:
> https://sourceware.org/glibc/wiki/Release/2.43
> 
> Updated license files and hashes due to upstream commit:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=a0ce8b0779e290596e99ca6d96c301684a2d7cfe
> 
> Rebased 
> package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
> 
> Removed patch 0003 to fix build on hosts with glibc < 2.43.

Removing this patch is reintroducing the issue described in it.
There is still configurations in which host-localedef is
failing to build. For example, in the Buildroot Debian
reference image. You can reproduce the issue with:

utils/docker-run make host-localedef

Note that, for example, host-localedef is building correctly
on my Fedora 43 host (gcc 15, glibc 2.42).

I quickly tried to put the patch back, but it does not
solve the issue.

Could you have a look, please?

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
