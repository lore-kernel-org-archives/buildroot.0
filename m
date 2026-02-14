Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9243AEF5851
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 19:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EA5182849;
	Sat, 14 Feb 2026 19:51:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZyAXKtSltET5; Sat, 14 Feb 2026 19:51:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61AB9822A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771098713;
	bh=kjqyu4TeFfEzNOKPT7bUN2RGra52DIWGceJLTKtboy0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EpdVdVLxy1qtEO6GN5weT4Ubv1/uxt5hgRWDGxNSiVbPO8JhbtC1j11WopbKN3DM2
	 Jbws6gUGCYtgEwVnmQNGmv2h0EC0dCYxWS4PsjI1+is01q5OlnkaMyq23k5Ji1e1tM
	 k8coRFWQrNlJ4shOGlKtTICsxMBSLNaYTV4WSNAOGYiYvll0soNSiCD/HQ8dEyX57h
	 ZgoKYRZpUha16z10ZkwGDhl1IVrNSncc9DdGHhHIXeMai/CU5znSNY3L6RF3zBqXDQ
	 0VOjaw9AsP3sycNL3QwI98KEgg9IbGR3M7I0uu4R3G7HjDTSpgQ7SEXFkc1CPYc/1R
	 b1kT3vF4eA1YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61AB9822A5;
	Sat, 14 Feb 2026 19:51:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F12D431F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:51:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D612860789
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:51:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQfnxJ72TA_6 for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 19:51:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8C24560640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C24560640
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C24560640
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 19:51:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5D4B25FFC0;
 Sat, 14 Feb 2026 20:51:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Feb 2026 20:51:37 +0100
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 20:51:37 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Leon Anavi <leon.anavi@konsulko.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Fabrice Goucem
 <fabrice.goucem@oss.nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20260210000739.3810940-2-giulio.benetti@benettiengineering.com>
References: <20260210000739.3810940-1-giulio.benetti@benettiengineering.com>
 <20260210000739.3810940-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <cc4a08444f2ae8c06f48c78473bd19cf@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771098706;
 bh=JmfaL6Ix4Dt7u0CKEaAoGUbR9G4hN277NsreiaKgqrM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XjzroQNf3FvU13BX/feJdDVTcmiezrZsT1K+7H6NRuR+HxYi3tJeuaaIK0q/oKthB
 7kKXUzkO0o9wIE3sNx9obezZngIwuotuC/r+saZQgWCFNMtiHQWs7PtdvsD7qmJK3P
 aPlI+afDCZfYrFQ3IvG4QENantiNtacDgrQ/yKQK/0hvfK2XGd3n/tywxetd+21xxC
 RH9y+fWWgpTcdvbfb+TUjBtEw33sbvmcKqyD2X8prBYPYIg9LWnYWA8+5s1d+NWXZa
 pfE9lgjRinReK64x3B7bt4YIaVWpFbk9O8psqfeg9lVZMasGPFWtx/D/ULO2RYSi0N
 8uxwPQRIIcfKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XjzroQNf
Subject: Re: [Buildroot] [PATCH v2 01/13] configs/amarula_vyasa_rk3288: bump
 Linux to 6.18.8 and U-Boot to 2026.01
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

On 10/02/2026 01:07, Giulio Benetti wrote:
> The patch:
> * bumps Linux kernel to version 6.18.8
> * bumps U-Boot to version 2026.01
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Series applied to master, with the exception of patch #6
(see my separate answer). Thanks.

I changed the comment in linux.hash files to suggest the hash
is coming from upstream (rather than being locally computed),
where applicable.

Also, could you consider, in the future, switching those defconfigs
to use Bootlin external glibc stable toolchains, please? See:
https://elinux.org/Buildroot:DeveloperDaysELCE2024#Rules_for_defconfigs

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
