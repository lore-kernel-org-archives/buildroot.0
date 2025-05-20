Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E8EC3DA6D
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40977404CB;
	Tue, 20 May 2025 17:23:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4hBbzmtjia6o; Tue, 20 May 2025 17:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B93C407F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B93C407F6;
	Tue, 20 May 2025 17:23:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEB42D4
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B01A88130B
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:23:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19tVOCz2r6sB for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:23:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 18F09810D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18F09810D3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18F09810D3
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:23:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 5D32D6013A;
 Tue, 20 May 2025 19:23:13 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:23:13 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:23:13 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518173649.2148027-1-bernd@kuhls.net>
References: <20250518173649.2148027-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <e57684a077f656a661890786ea4a75eb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747761794;
 bh=ZvFtVs51gkQyFenU+dyXNFaYlSnpHgNOrnn2NUt5AB8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MXoQVyk0Z9ci2w9AI7QACvKFp0biDU8qliEI6u939mTdmOqGAW7rI6Vy1WQWnl1By
 AyBnLutx9yclaI7m1drsZpOmtQfFruhs/cpOpukpbQv/QOT+fiImQji2WLURrhcu3Y
 sNi5kFkNS6GqziVO1ivbIgTsEqgH9vKFSFcREgRn48qN+w86wXclUulamNAQaJKINI
 rTqElEsc3Uko4O7pZlfZiV73Zi403JOw8PDp1LO3y4mPF7sf9A+XPu8Qkc45j9qydi
 uoZs4+63l8mnc/s6LvYGX2qQpXBRR4ciLpivdzmokGKuLKKlOvHdz1s3+qO41sfNRo
 BmqTGGXX6wL9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MXoQVyk0
Subject: Re: [Buildroot] [PATCH 1/1] package/usb_modeswitch: bump version to
 2.6.2
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

On 18/05/2025 19:36, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
