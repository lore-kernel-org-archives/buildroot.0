Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14584C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB6DE60A58;
	Fri, 10 Jul 2026 16:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSYv4IN-3-kd; Fri, 10 Jul 2026 16:30:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD2FF606F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701028;
	bh=m1Yb3PDmOJJsG2o5E1BbaM2yrU3PEEky9omC0mqChtc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U3tcrWn1XKvMS+LzhnSjK+8xDS6WegHcKspp6XFCGHPd1JjS/6kkRfJPsdL+ssB3c
	 UceJlp2t4Mwn0y5un6GJUtPQ7jaUzRn1dmSw9f8cLVg4761ykD6iYaGo26ZscBRtXJ
	 OV6EwO+ARJj3ifCdP68DTE04+ixXgvX3VaK64uh3NycneFTZRkS0ixPeo/n/JZIbdO
	 2YlVqRfvQOnEasHgwp4CXSxvWejxjd3SvAEl/EnpAnYrN0m9Nl0rWqRCbm/N2zgP3m
	 U9q19ecXL5mClEod4a9ysQmAJWx6QqvvMifWF1O7yCK3VKMDKlpSGGLy95PTAyQQYa
	 AxpIr1yvedW8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD2FF606F8;
	Fri, 10 Jul 2026 16:30:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3DF62FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B63F780F24
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4YerQH-Y1kDs for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:30:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B5D3680FEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5D3680FEF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B5D3680FEF
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:30:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7A3FA7804FD;
 Fri, 10 Jul 2026 18:30:23 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 18:30:23 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 18:30:23 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260708193940.1578161-1-bernd@kuhls.net>
References: <20260708193940.1578161-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <b6f8f2e116f7b9807559281c9376d9c3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783701024;
 bh=sEGsHuk1UH5qR8qFcDwoY5HKFWyGd6lfCJfAhpv6sh4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tKhC1K9+gCslUzWkx9Jzna1URBvfdGrqabx+bYrjfyutH+Qb/fyDkusVPVlD7OFvD
 njwnniKaDN51aHolmTJxN0J8VCrNJh3fntJYug/gHy+NgRzkckA53eHiKlNbFKRup8
 DyYkTJdAfPmz7KAP7OrmWiK7GnKSn61tmWk2AcX8PjGMA6q+oNW49FrrK0xslJIsno
 nm4xqajIlRIiBc+YyUqWJS/kA+5BldZpQhx4/zkaEo2xkIucrb3r/ITxdD4WbaE6Fo
 X8HuoRgHY2XZt3QTW9FdTC3UZJVzQ7/WxKZLUaSwula+0DOk5xH3eB28J2/ZwYrvdw
 a1T7v4P1d9fWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tKhC1K9+
Subject: Re: [Buildroot] [PATCH 1/3] package/tar: fix build with acl-2.4.0
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

On 08/07/2026 21:39, Bernd Kuhls wrote:
> Add upstream commit to buildroot to fix build errors introduced by the
> upcoming bump of acl to 2.4.0:
> 
> https://lists.nongnu.org/archive/html/acl-devel/2026-06/msg00000.html
> "Compatibility Notes
> 
>   - libacl now exports the new functions acl_get_file_at(),
>     acl_set_file_at(), acl_delete_def_file_at(), and 
> acl_extended_file_at(),
>     which are declared in <sys/acl.h>.  This may cause conflicts in 
> programs
>     that define functions of the same name and link against libacl.
> 
>     One such program is GNU tar which defines its own versions of 
> functions
>     like acl_get_file_at().  The fix is to rename those functions.  (In 
> the
>     case if GNU tar, a fix is already on the way.)"
> 
> This patch will also fix build errors seen on the autobuilders for
> host-tar on hosts which already provide acl >= 2.4.0.
> 
> Fixes:
> https://autobuild.buildroot.net/results/478/478a9781f481df7cf2eecda80a4c13f900a0dc80/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
