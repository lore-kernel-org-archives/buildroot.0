Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F92CCF9E9
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 18:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C124340F96;
	Sun, 26 Oct 2025 18:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7E55lbll-kx; Sun, 26 Oct 2025 18:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F00EC40F93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F00EC40F93;
	Sun, 26 Oct 2025 18:14:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB7ABD7
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACAF640F8F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCT9I77qJRiu for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 18:14:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1246740F93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1246740F93
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1246740F93
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 18:14:47 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9AB255FFAF;
 Sun, 26 Oct 2025 19:14:44 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Oct 2025 19:14:44 +0100
MIME-Version: 1.0
Date: Sun, 26 Oct 2025 19:14:44 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251025070814.3338524-1-bernd@kuhls.net>
References: <20251025070814.3338524-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <78a2fc57ddc961ef4d4c5d4e39ec2a2d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761502485;
 bh=lR3VDkt7rae1jcBhFMWyfOujjYrDFm83UG2bj4MZ/Io=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XMwhE9xKDG2rmMFHCWyoUR/71xiLVXNX+o/wQGl4H448NyNSRZUY2/iPMuqk6Ud27
 3PWA7MlkblW1lHnz7DgAY6Q0ZykTo6iiLBvK0Um/NItVi8wbXOxIeR6sn083+57v2j
 sIl5DxMcrq3CpWDSNY1AVYel6/SvKXPSZOGj7ZO/2dyJvSPXfnUJ4AjBV2PWy3OpMs
 hoK0VCiF+Fdyt4I16UBKECHgocnZBpBE+fcPMnOUXsng6O+KdApYG0hIo22xPqzvGi
 nxviRBaiV90YSeOIVWlSmhIK3eiAvjh9oLKqo10sfBrEkww+4IcIwUcrRT1WG9ajRY
 4i6dALQcGHfGw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XMwhE9xK
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: bump version to 6.5.7
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

On 25/10/2025 09:08, Bernd Kuhls wrote:
> Release notes:
> https://sourceforge.net/p/fetchmail/mailman/message/59248304/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
