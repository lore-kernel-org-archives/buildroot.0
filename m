Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95021C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63F5181AA7;
	Wed,  7 Feb 2024 16:42:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AUyNOZzFexXp; Wed,  7 Feb 2024 16:42:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D89781B71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D89781B71;
	Wed,  7 Feb 2024 16:42:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0439E1BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:41:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E50FE41461
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xo1rGrkkPYTi for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4FF0A40568
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FF0A40568
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FF0A40568
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:41:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67FD0E000B;
 Wed,  7 Feb 2024 16:41:54 +0000 (UTC)
Date: Wed, 7 Feb 2024 17:41:53 +0100
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Message-ID: <20240207174153.2023e1a6@windsurf>
In-Reply-To: <20240207153519.657048-1-arnout@mind.be>
References: <20240207153519.657048-1-arnout@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707324114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4hy9mv/m3+agQ5DROKx+ArHHz0PJkVMw39BCqVqV0UM=;
 b=HcgP+S+n1wr17crCd7SOx1wK3oaNKTj4WILeoltFV9n2rl8ci1DxDIQoQpn/kTX6ZqrF8a
 4ltl58q6/Iyje63UGzQeYr9t0GGEzAprwcsns4yuylZACvUkyX0tgNPThZVrwP/2L7jt1G
 czE02z/Rx+dcZEvdDOTGe9jyWRpDxfEpX2fF4N7N4SxDUhTMJqEQltggBxaYNe2sOWmH7K
 IGqC/XnJMcPy71tenVuM5pMJhvqamHYNAqrZwletU9xicf2UStWwZpEdwuyGBWqfM7I/TV
 ZCgbZgapeXFtp8HwvRRRmbjLtS/5VxbRBiezz+Mad9Mp14N4QggUGPqNqptpQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=HcgP+S+n
Subject: Re: [Buildroot] [PATCH 1/3] support/scripts/pkg-stats: remove
 checking the CPE database
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed,  7 Feb 2024 16:35:17 +0100
Arnout Vandecappelle via buildroot <buildroot@buildroot.org> wrote:

> We currently check the CPE database to see if the CPE ID we use
> (including the version) is already in the database.
> 
> However, the version part of the CPE ID is not actually used for CVE
> matching. Instead, the CVEs have a range of versions associated with
> them and we match against those ranges.
> 
> In addition, NVD is moving to a new API for accessing the CPE database.
> It will not longer be possible to simply download all the CPE IDs, and
> due to rate limiting, the download will have to be done in several
> queries.
> 
> Since all of this is anyway of limited use, drop the CPE database lookup
> entirely. Instead, as long as a CPE ID is defined in a package, it is
> considered OK, without any checks.
> 
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> ---
>  support/scripts/pkg-stats | 50 ++-------------------------------------
>  1 file changed, 2 insertions(+), 48 deletions(-)

Series applied, thanks! There were only a few flake8 warnings on PATCH
1/3 due to Python imports that were no longer needed.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
