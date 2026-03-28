Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F4A10F3DE2
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 11:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEAE083FF8;
	Sat, 28 Mar 2026 11:59:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Etr0vVhzt3gd; Sat, 28 Mar 2026 11:59:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4DBC83FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774699140;
	bh=TbgFQmII3DrE/ALxPJCVpXWPy1VuC/LT0xyH4ry/QzQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nMVkdmfoj/qSbYtOnNyAMTkVZEodCFheJD+UcJFNUBoHP45dltchZc8oI34xV4GCq
	 UQcjCGZS252GJWqKszGbjQgMfer/QskTixUma4HsI0/VntBF/yg7NCRl2hepc7EcqP
	 5OZme8ox/d1e6Hg09YjI6ILV4ikq5oAp4ud9d6y+HsXAkJ7bJkhyn5PCRpzrqZduaL
	 HPitlkssPehZo4zGXaBH5yxiOayovpwIOSoARF0SPMsl1bgGEN0C3IxVa0KKM8grX6
	 872vlACvrnfiYkCP7l264J7otsKjdopYDY45auQM4OdUttiPIhs6VdbYM5ym81zu/j
	 ay/dk2spnhhFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4DBC83FEF;
	Sat, 28 Mar 2026 11:59:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D74752AA
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 11:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD25E40105
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 11:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dp9yt4RpNcAt for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 11:58:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB5D04002A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB5D04002A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB5D04002A
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 11:58:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id C543819F57B;
 Sat, 28 Mar 2026 12:58:55 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Mar 2026 12:58:55 +0100
MIME-Version: 1.0
Date: Sat, 28 Mar 2026 12:58:55 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260327214055.1271678-1-bernd@kuhls.net>
References: <20260327214055.1271678-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <5bd54c684802bc1b0e7000e74d3015ae@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774699136;
 bh=XaolgVaww1m6tBOOO9t0eCb70qfXuNyxqoSuAL8t9PU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iVQOUaZLqA7FBEHMLd9K0o56JBjbZBOY5gVlucx/+wswT6gRDnaiy6FGoRSNZJRKV
 85o8gkCTjc2ci93h8jq4KF8fLEKPi8Op+MMTaTuO2hlg1gzYbPqtIoL06prwXYhGUV
 TYf36HBlEdHUiaX9tP7r/vdWcfHdeRhvvEheUJxqG/oYY1zR2UJ4BaHvRzmxr6QhOf
 dJLfBFz0alHJJRw8mKzSHZvfFrKt73dSVIhMROSPDCGjzugrLTbEFt9Ld5ZhUjV+2f
 NG0nv/YobMWf0xFsk6TraVbXKmf6Jl+yzmpF/S0bCtQUPYa6imhPhg1gyq1d/mArxK
 He1YfBsA4EFng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iVQOUaZL
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.24.0
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

On 27/03/2026 22:40, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.24.0.html
> 
> Removed patch 0002, its content is included in upstream commit
> https://gitlab.com/samba-team/devel/samba/-/commit/50604bc027c3d053cafd803ff515e6da881e79a5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
