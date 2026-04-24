Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD79FED3F1
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:48:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF35D84E6A;
	Fri, 24 Apr 2026 16:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XxwyFh21eaVF; Fri, 24 Apr 2026 16:48:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F412A84DFF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777049293;
	bh=m+U8ixu/9NtOzv5Ie75/oMk8Kx37c7zXQIsx0dGDuLw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JnwxeJgCKFBOjWW3A/gPooUfEsHv6MuSEDJXrwxtAiGjJqHW0W/eJ/r7NTSQ2yUbN
	 xH5eB6sza3RuzHNTpR86tnbIAkn4xRCY3fmxKAexoYm6Gle3kwFR7XRVMfBd2jScZi
	 bPqVuLwVJhtGdTSgmS+hxc2xBiEcn56OXPrmpjC/IWbohywpdlIcLk719VreLhQfWT
	 81+ZkZ+PyCoX129m0MA7mYYNhkQs5fCZ9NwUPlQSvAJL8Jx3kQwhLj4EwoHwIb9BNW
	 fjCgcxAaHbx2KdLlKMwxV2sZpyaz+7iOE4XzVFL7mHLsS7Ziz2t0++nBPAJlDzBlfA
	 EofsmtGkSvo1Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F412A84DFF;
	Fri, 24 Apr 2026 16:48:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FE62231
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85C5842980
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:48:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FPjLziJ002MH for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:48:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 182944297A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 182944297A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 182944297A
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:48:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 098552003AE;
 Fri, 24 Apr 2026 18:48:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 18:48:05 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 18:48:05 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, David Bender <codehero@gmail.com>
In-Reply-To: <20260419183610.2595830-1-bernd@kuhls.net>
References: <20260419183610.2595830-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <23c774b459d7e74e6030c4eea66e135d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777049288;
 bh=iXy03+/muw11aivVQ8+bUBHDBgLrGbsZsgALUk9Ql78=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XP1eD51RiCzf+qhAJFoGXAhgU2qy4wFzRhZcfWpbekPTAjUcu0AMEkvPVn1nEZ3DF
 Mrywj4z37BNSX1R6sEMyxMYV54f7HCQUPBFW78rxxfyNPvtPnDYwSLjsLaR323hYJH
 NqwXQrFkSUHqXcaZ/lwgAsyG0chG7hw/5lCV3X6kSqsD8danq51IWceouehv5UNeR6
 Ko3fjglhrSF9f+IHqWGMLkgFJb5YO6cpUAliq6LfME9Hca68zU8s4pkWMGj7wQcG9l
 47h15ltJy0Qu1neJaNFmWuUmbMXhNQIlPd+mmvMTeaAXUA3EVbCeohwLK2pup+dX7u
 l+WvTn16J0rUA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XP1eD51R
Subject: Re: [Buildroot] [PATCH 1/1] package/openldap: bump version to 2.6.13
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

On 19/04/2026 20:36, Bernd Kuhls wrote:
> https://github.com/openldap/openldap/blob/OPENLDAP_REL_ENG_2_6_13/CHANGES
> https://www.openldap.org/software/release/changes_lts.html
> 
> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
