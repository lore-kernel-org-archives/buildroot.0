Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55D9EA7969
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 04:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CC1B608EB;
	Thu,  5 Feb 2026 04:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xzQbnVBSAcqs; Thu,  5 Feb 2026 04:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A74B60A3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770267228;
	bh=3uUr+OTh88BLm+GKt9/k/obnZnlD1e45+UWnqF96UEo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aNMcJ0N9xO47O1C9td0SOBIV6ns3XebEBnxO5aAUuZyzYEIlHvDw7BvcxBsTr8kpC
	 FFtDBZolpzXRU4dCwcnQhy2UL8O9FpCcB9GpVANcG5jj/y/P/le2IPtEm0smNFZ8l1
	 dpIgMdoM7J7WOiK/d3+Q/MnrC/QWRxdFQi393NHhhjC3t4Zi53hs60WnbDfFMId3Rn
	 muzG6dvRTj1tRpsBnYCzjhnVE2xuzpnip5CFo7DC6T5c/PRo6OrUGCqub0ZGaawKv3
	 unZZARIVgTkSnQu08j1HcNdwNhE0h9Up9Cjc9a5hjTBteJSNQIMcmdFLWxL36gS22o
	 AJ+j+PWRIGRqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A74B60A3A;
	Thu,  5 Feb 2026 04:53:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82A9A173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 04:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6776440800
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 04:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzU9FyVYbBNe for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 04:53:45 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9AF45407CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AF45407CB
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9AF45407CB
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 04:53:43 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 29FB8BDE0A79;
 Thu, 05 Feb 2026 05:53:40 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 05 Feb 2026 04:53:39 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260204185926.1073422-1-bernd@kuhls.net>
References: <20260204185926.1073422-1-bernd@kuhls.net>
Message-ID: <10a5b66440fd7c2ee7366b63b332a67c@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1770267220; bh=1kWbB9ViVjHhmE8ok0bI51gkbJGdVXsaKCoy7zb/H2o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=NQ9gzZLARYneAfWq/mxgUm0A8OkjZq3OJi4yaOazi7B8SRLnFP2nd0oh4vYea3MPf
 ADNb3tst0l7WNY1vjGf/Qq5pwPTTBdny74kvW7zCvSuQNPf3hDYxLA8eJSUZ5tj54H
 iRaM9GV6KsfeDTyR16h9A7x+G+QcEuyZ/WCmiclo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=NQ9gzZLA
Subject: Re: [Buildroot] [PATCH 1/1] package/mpd: bump version to 0.24.8
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thank you for the patch!

On 2026-02-04 18:59, Bernd Kuhls wrote:
> https://www.musicpd.org/news/2026/01/mpd-0-24-8-released/
> https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24.8/NEWS
> 
Acked-by: Andreas Ziegler <br025@umbiko.net>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/mpd/mpd.hash | 2 +-
>  package/mpd/mpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

<...>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
