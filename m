Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC383CCF9E5
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 12:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93F9280D13;
	Sun, 26 Oct 2025 12:35:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LumCkBVn_fjA; Sun, 26 Oct 2025 12:35:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2ED780D57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2ED780D57;
	Sun, 26 Oct 2025 12:35:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5CAFC15F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 12:35:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 425C960EA1
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 12:35:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flyH50eJjt9R for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 12:35:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A6FD60A8A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6FD60A8A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A6FD60A8A
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 12:35:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 437AA6012D;
 Sun, 26 Oct 2025 13:34:57 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 13:34:57 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 13:34:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251025164835.3551555-1-bernd@kuhls.net>
References: <20251025164835.3551555-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <b6ded7fa2952687e3c598d26d86886a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761482098;
 bh=nL6koc7PRRvqOhPYCkdFAzAS+jgA2BGlLIbKQmmnxt4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ao+DQZI07kdCiS/EUocEVceKnrj/IQLs23p4Q1Cq5zC4eiz5mhDYuP8LU18fmgwmb
 Hl4T3+5eCQlmU9VMDH3VL+dKfRKypc030bFLTAFGJYjF+zi6ldiaBYqxHy7UapDmQj
 RFr3ZC2uyDfSEPlT6l9A50Y4z4w2x/YKG6EaMDe0kJrIvPo5XtK8mb9yjMXkBBHYF1
 iyrshZyiGypbOezfsCFna6KcXoleqqTQaDXMz6GPgMTRtwjVoG60k+JXQF1Q9bFmTj
 ybsT7QClg9BIrkQnI6arDV6spzq9ZvQZHewbEwXvV6mJ2pisQK0EeudzrfwqREeuNx
 4z/ycqxr8uT2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ao+DQZI0
Subject: Re: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.50.4
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

On 25/10/2025 18:48, Bernd Kuhls wrote:
> This commit includes reverts of the last attempt to bump sqlite:
> git revert --no-edit c4c282f8ec 014174f00d 835b5659ea db481210e9 
> 296744b0f4 939244b828 f0a272ef14 274c36578f
> 
> and the following new changes:
> 
> The autoconf-based configure script until version 3.48.0 enabled rtree
> support by default:
> https://github.com/sqlite/sqlite/blob/version-3.48.0/autoconf/configure.ac#L180
> 
> while the autosetup-based needs -DSQLITE_ENABLE_RTREE
> https://github.com/sqlite/sqlite/blob/version-3.50.4/autosetup/sqlite-config.tcl#L763
> 
> Added Config.in option for RTREE support and enabled it for gdal to
> provide a needed dependency:
> https://github.com/OSGeo/gdal/blob/v3.11.4/cmake/helpers/CheckDependentLibraries.cmake#L277
> 
> Added upstream patch to fix forced addition of rpath and added
> configure option --disable-rpath to target build.
> 
> Added configure option --soname=legacy to fix wrong library name which
> breaks linking of kodi:
> https://github.com/LibreELEC/LibreELEC.tv/commit/7f2281bd7cc59425e754ac9d720071688f75580f
> 
> Added configure option --disable-shared for static builds.
> 
> Added build fixes for BR2_m68k_cf.
> 
> Removed SQLITE_CONF_OPTS and readline support from host build to avoid
> dependencies.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied to master (after testing many configurations). I also added
by Tested-by. Thanks!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
