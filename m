Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C408CFD362
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 22:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00D7640B94;
	Mon, 24 Nov 2025 22:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mxSnL_ys4Ls; Mon, 24 Nov 2025 22:36:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B22540B0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B22540B0B;
	Mon, 24 Nov 2025 22:36:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 376B635C
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 22:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D8426082E
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 22:36:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onjuhw9fHDmR for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 22:36:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D72AD608E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D72AD608E0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D72AD608E0
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 22:36:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 25858780333;
 Mon, 24 Nov 2025 23:36:02 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Nov 2025 23:36:02 +0100
MIME-Version: 1.0
Date: Mon, 24 Nov 2025 23:36:02 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20251123170721.909469-1-bernd@kuhls.net>
References: <20251123170721.909469-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d0df5b89a1d383b646500530f83b6e2b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764023765;
 bh=04FY2O67AcairUIZ+ytJDMCX4qTnHAC03MBmVfjhbG4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Mno/awkcVf3BZGA1UCodnlC56yMWB6YOwp30ulXZG+etU3+xZ8xlqsRjU0lVbjCXN
 sO3mLaOCtxrMlWlH/r7e4xhyeudXbtma0Ms9ZbD9d7SxzG8u1YS8oVnuM5e07nxPYX
 AuEUdFZAIMuhzjMI+bNJed9t+xQJb8AJ/Cx1V7cGk9gu09dzLaZSG6vroE8NB3XGJZ
 RY7JA5xeStqpU/TY3SLYSrDNHFiGPpzTc6l1zRB25TvxAAkRm+lHNFrVDg+Lm089wp
 i1FbIw8z4BcdMJOA8pi8kUr+MvMXchc9S9TOC2Kz8DqLi6a4HRc8SCdEqnfRdqwjvS
 oAgjD8zUrt40w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Mno/awkc
Subject: Re: [Buildroot] [PATCH/next 1/3] package/meson: bump version to
 1.9.1
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

On 23/11/2025 18:07, Bernd Kuhls wrote:
> Release notes: https://mesonbuild.com/Release-notes-for-1-9-0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.

I expect the cmake 4.2.0 bump to break few old packages still using the 
old
cmake 3.5 minimum version. We will fix that during the next release 
cycle...

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
