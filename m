Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55912CD4F54
	for <buildroot@archiver.kernel.org>; Tue, 19 May 2026 06:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF5A8812E9;
	Tue, 19 May 2026 06:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1FoaOL9sOb7B; Tue, 19 May 2026 06:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5AE4812B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779173670;
	bh=+S/8/70a/X0CeAqFMnOJ6tpbqWkSwMJPl/yqAVxE0jA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwMq3dYZ7PbXvWk6YNNm7YYyycLXOVVgmzF37P84lS+FM8/G8bZD13cQ8SjcvZtzJ
	 cL3S0Z4+RNMmrxdF5oVaZLdjKgO//ZEKtkD44Hzrt5zX+Z3aAIORpxYbQIoXbeBV1g
	 buRJOexHopg2iBG4wksTiq9+ZodHTE7JDSBRmyOLgUISrVt+iECkFEgGX+d6IjwCC3
	 ZZbIw7jJ1BmyBaVVOh+Mf4sKAzBayqOgAx0NnVTLm5NyVeBYpsarGocC8L4ytY5xva
	 dulGR1w1FSIBF9JpjQDh8wdObGWqu83MhC5/K9xwUYy/f8sS6dtD2r1DNwh/b1xETp
	 JgmC42s/vvgVQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5AE4812B4;
	Tue, 19 May 2026 06:54:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49444282
 for <buildroot@buildroot.org>; Tue, 19 May 2026 06:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27893812B4
 for <buildroot@buildroot.org>; Tue, 19 May 2026 06:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VBUJFiYgkdQg for <buildroot@buildroot.org>;
 Tue, 19 May 2026 06:54:29 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B732481296
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B732481296
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B732481296
 for <buildroot@buildroot.org>; Tue, 19 May 2026 06:54:27 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 2559ABDE1F21;
 Tue, 19 May 2026 08:54:19 +0200 (CEST)
MIME-Version: 1.0
Date: Tue, 19 May 2026 06:54:19 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org,
 john.ernberg@actia.se
In-Reply-To: <d02d0c67-54ce-4522-8396-f96758df80e7@rnout.be>
References: <20260510193826.2846038-1-j@j-ernberg.se>
 <20260510193826.2846038-5-j@j-ernberg.se>
 <d02d0c67-54ce-4522-8396-f96758df80e7@rnout.be>
Message-ID: <5ba706407cfcc5b0bc20ef5a70a42761@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1779173660; bh=ctShv3PMrXAZ5iPtsna2CsvXSyPG9y76XwI7Hxn5SWU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=hJmGyH3yKKk7PXpZhagNCkimkY+3FJCaoiFZ1P6GtX8/hvJjo5Bi2K487SId97oVC
 YzCgu4mwPmm/F/yHIow0pUn2BrvJ8okVvZzLGlF9w6lptJcaY7bruX5cKyI4Q2YBaX
 oz9ow5SXtZu6kHQ2UXLcrNlpzbRkk/Twc0c24hoU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=hJmGyH3y
Subject: Re: [Buildroot] [RESEND PATCH 4/8] package/mpd: Disable sidplay
 support
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

Hi Arnout, Everyone

On 2026-05-18 19:26, Arnout Vandecappelle wrote:
> On 10/05/2026 21:38, John Ernberg wrote:
>> Commit 25af5a3b3aa3 ("package/mpd: update version to 0.24") from March 
>> 2025
>> bumped mpd to a version that dropped support for the libsidplay2 
>> library in
>> favor of libsidplayfp. [1]
>> 
>> Since libsidplayfp is not provided by buildroot and no one has 
>> complained
>> yet the sidplay feature is likely unused, as enabling it breaks the 
>> build.
>> 
>> Drop support. If someone needs it it can be re-added along with the
>> dependency.
>> 
>> Link: 
>> https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.24/NEWS [1]
>> Cc: Andreas Ziegler <br025@umbiko.net>
>> Signed-off-by: John Ernberg <j@j-ernberg.se>
> 
>  Applied to next, thanks!

This actually might be a candidate for current master; there is a recent 
autobuild error: 
https://autobuild.buildroot.org/results/c72d11535857a447acae806397c451b167e00b13

>  Regards,
>  Arnout
> 

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
