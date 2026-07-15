Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F79DC44501
	for <buildroot@archiver.kernel.org>; Wed, 15 Jul 2026 19:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A9F74076A;
	Wed, 15 Jul 2026 19:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WR0om2WniJgn; Wed, 15 Jul 2026 19:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7418840681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784142935;
	bh=gbP+9x/JWmkrQmF7+2mSwG1vOQEMiiaaUmgbPJo4LOY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pQZcqfRJCphHfQieXwVMWAMzvcO7St0Pqvjdm0Su/MNMfgdgvd/DQheqia+rEiaav
	 3OZKaZgsZhU7bjH96gY2T7V43oRPqe1LuopAPXmbUaGr5HOGgq4A2xuCZVFHoQCdUV
	 jetm1jES9PZA7Qxac/M13L1iGJdL3aR5us4RQubyFBJJYIEd3aDrLXQSpvS/A68F2i
	 WSPBWwGUdMefVBr8jDy84j2s07rWmxBbbL3+tMT71HnkpkD8fL16DVhD1xcy7WP2rT
	 g5g8GYGgunScmAa41S/ju5UvT0QjXsaYjiWHvw1Yrl+VOxhrYggTNWvBlnLcXlwy3b
	 zbINA1v3QGQGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7418840681;
	Wed, 15 Jul 2026 19:15:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A953D320
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E99F80D2D
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-Otkn4vw7AO for <buildroot@buildroot.org>;
 Wed, 15 Jul 2026 19:15:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB3A780D1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB3A780D1D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB3A780D1D
 for <buildroot@buildroot.org>; Wed, 15 Jul 2026 19:15:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 423D7B0055E;
 Wed, 15 Jul 2026 21:15:29 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 15 Jul 2026 21:15:29 +0200
MIME-Version: 1.0
Date: Wed, 15 Jul 2026 21:15:29 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260715172049.3529215-1-bernd@kuhls.net>
References: <20260715172049.3529215-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <63d001b63bb26ad531596eff6161e9a8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784142931;
 bh=R+trKO2K+1uEWix1GY3m2hUGImMQTh1ZVN+zDQRwa6s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RIazhj3tm/KI+yZzsbvOQcnTv5sqpw62LP814CEW1jbcEqjHgm2+wI31OzqdoQwd4
 bsW9c93o7Ib8/Qdxdzr3KZFQ1pEAYlmL39g5y3mnOY8WpccUncz9sEY4Fn7TG4see8
 odvHaaKgz3V/U77AiYdHhav5dtbjvdR2an6DpFNTF/mvml9BjMDasgrIiDuZPUKEPP
 j/SbuOmkBg5/y/IUDkjG/EA9Qu+c3FZP+2M+F1yAxUNINdYJ3iOY2P8itNd89q56Qh
 YwkunTL3OYGUb3obAgjrzwA0gAQMbfVAQzcIHBidSRKNZC5ZVAM3DhJPqV7e2IUxnt
 tHSHS5vDe4eAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RIazhj3t
Subject: Re: [Buildroot] [PATCH 1/1] package/cifs-utils: bump version to 7.7
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

On 15/07/2026 19:20, Bernd Kuhls wrote:
> https://lists.samba.org/archive/samba-technical/2026-July/140952.html
> https://lists.samba.org/archive/samba-technical/2026-June/140908.html
> 
> Version 7.5 was not announced separately:
> https://wiki.samba.org/index.php/LinuxCIFS_utils
> "December, 2025: Release 7.5
>  - Various fixes for utilities"
> https://git.samba.org/?p=cifs-utils.git;a=shortlog;h=refs/tags/cifs-utils-7.5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
