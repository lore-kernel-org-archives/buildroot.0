Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B77AFC72C4
	for <buildroot@archiver.kernel.org>; Sun, 22 Mar 2026 14:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C64DF412FF;
	Sun, 22 Mar 2026 14:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZUKrrSS7htz; Sun, 22 Mar 2026 14:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0847D412FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774188399;
	bh=A/KnNu8fDFpT9Dkc2BeAJrWcAWsPsZUOa3zTPqwVQGs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j4oA8IFqibTH6U7jDVy21pZ3/o82+eJstUYX6ihF+qsAbrUJ+Tk10F90/Whg+YRrK
	 FXD+s0Pc1xHncn+T90bf9VoXvFEkxn0PLSQ6l9qimwOPZgVL671lU9KmRbUznoVz3+
	 /xA4YYSHMwU91S7b4n/Fa0V0FwMjAL84jNs4pEX3HLb+abS3EJw2EXlYyv2kdBuyhU
	 4RnUZwZgTxyHkYXbgQcQv3e42EekwRUAmzSH4oztXbilUVaTesEbAMJyDo1YkIMWpt
	 ZqVDjIhJs0gqGmBOFSkGJpRHd2DXP3e7pnsxEGW+MLobRI4Z99tBUWHCwmfzcKQ6OG
	 AhWtvYTWkql+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0847D412FC;
	Sun, 22 Mar 2026 14:06:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 472D82CC
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 372464008A
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgijlBJcMb4n for <buildroot@buildroot.org>;
 Sun, 22 Mar 2026 14:06:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3097140052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3097140052
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3097140052
 for <buildroot@buildroot.org>; Sun, 22 Mar 2026 14:06:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id B4C5C2003C6;
 Sun, 22 Mar 2026 15:06:31 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 22 Mar 2026 15:06:31 +0100
MIME-Version: 1.0
Date: Sun, 22 Mar 2026 15:06:31 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260302193754.3549175-1-bernd@kuhls.net>
References: <20260302193754.3549175-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <e982387eb2423ace5d9a78006aa488bc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1774188393;
 bh=N6jbITLFwqk1dIO16LTK6hRxI9pc2fBHD8wK3xY7Uhc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=avC7IVtiE7I85yIxEn54pp4fZTzWxZNqt+qXydywl6QAqo71rc8rP+VwDsx0Y1WfC
 q8+MDQgzq9GHX894G9riOENY6fSJVIAVtRL5pXIyrOPM/soLUwfFSQclvQlhTCk9X/
 K89DGlKvLQuuotmhmYbAcqZL5jXEiIvCX8HcWv8p4viWbyz46XNiFFbz+iCiXYST+R
 yeTsyj3Z78gXmUW74IUvnR2kcPBWlPk/lojcC1Wdz95YQlWoYu1UHzr2oCoVF55H6D
 fKZfxVdsfW4peV2spToKmjGnclVuJ7nqoncUa7xfNyHfwjNx+9yQHZrqONmZGrAVVE
 wpOznQMpvQ8Sg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=avC7IVti
Subject: Re: [Buildroot] [PATCH/next 1/1] package/piglit: bump version
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

On 02/03/2026 20:37, Bernd Kuhls wrote:
> Includes 
> https://gitlab.freedesktop.org/mesa/piglit/-/commit/ec0fc2fef0755b1595c3799ab25129174a4b2007
> which fixes build with gcc >= 16.x.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
