Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759E9C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 11:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36169404A6;
	Sun,  5 May 2024 11:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eg4aDCfRE7Xj; Sun,  5 May 2024 11:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5C0840565
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5C0840565;
	Sun,  5 May 2024 11:19:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C02051BF36C
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 11:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACF7340644
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 11:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOL8lazAzNhH for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 11:19:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 75B0340544
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75B0340544
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75B0340544
 for <buildroot@buildroot.org>; Sun,  5 May 2024 11:19:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B87D113F89C;
 Sun,  5 May 2024 13:19:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 13:19:01 +0200
Date: Sun, 5 May 2024 13:19:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjdrJRDHxxcLAMjg@landeda>
References: <20240504093446.376426-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240504093446.376426-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714907948;
 bh=6uEl3noMKqEVWVcvy07XxRbeBf5jFP8HQx952gv1Czg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DDoRnMjxPXd4lUBEZUAOxRZllc0YZxi7tQzzt9w86lImaNocAkj7dy8gHajt8bAfX
 vCmRGAePemp6GoJg5+FV3ucxJma7037mSUcRcgMHWRAiLesX4R/PnZ8hd4kb51ZVzY
 7zN97tggEnzDsxjqWHEKrQSFX9QL4XtxlrK+WzLWOEKf63XP4EnsMjjYDB7O4Xut9/
 92vefMmn2uEeCLu4TszAmsncEcXIdc/uIv2OB2qG4lZVUDi4m8jgKXSqHrCFbEAxji
 fJi20va+egWSwTTD4yD8Jfz0Ok4Ep8uMdU6TlVmbhZj2eCEjmDfALPTfWWx/KN4Ntn
 ExzzyYMH0cD1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DDoRnMjx
Subject: Re: [Buildroot] [PATCH 1/1] package/proj: needs NPTL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Murat Demirten <mdemirten@yh.com.tr>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Dominik Michael Rauh <dmrauh@posteo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-04 11:34 +0200, Fabrice Fontaine spake thusly:
> NPTL is mandatory since bump to version 9.3.0 in commit
> 57aba033e6cc81b95d006227c45a15eb3fc77d07 and
> https://github.com/OSGeo/PROJ/commit/ce080251225d16e11e139a5ebe07cf608fe022b2:
> 
> /home/buildroot/instance-0/output-1/build/proj-9.3.0/src/iso19111/factory.cpp: In member function 'std::shared_ptr<osgeo::proj::io::SQLiteHandle> osgeo::proj::io::SQLiteHandleCache::getHandle(const std::string&, PJ_CONTEXT*)':
> /home/buildroot/instance-0/output-1/build/proj-9.3.0/src/iso19111/factory.cpp:622:9: error: 'pthread_atfork' was not declared in this scope; did you mean 'pthread_attr_t'?
>   622 |         pthread_atfork(nullptr, nullptr,
>       |         ^~~~~~~~~~~~~~
>       |         pthread_attr_t
> 
> Fixes: 57aba033e6cc81b95d006227c45a15eb3fc77d07
>  - http://autobuild.buildroot.org/results/392664375c5bc5f047d39bff31534a226e8ea526
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
