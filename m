Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08874D4662F
	for <buildroot@archiver.kernel.org>; Thu, 15 Jan 2026 22:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B65884AA4;
	Thu, 15 Jan 2026 22:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0G7RIZuehhXr; Thu, 15 Jan 2026 22:26:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F95284AA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768515990;
	bh=PJ5l+vVcUvRS66SPJO84F2av+lFf8n1QpNPnWpB+bSY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kwfuUtlIsGhe7tlbeBTP7NZ7tPqLXCI1QKEuMnrzGOvBfdatILXnWYVK8FMh/tfmS
	 jf1gMORQOIeciaBCqkJtbJeZppDtzivDQCOCNj66fUdkDabQNmplVvaPMsKsu6AHSD
	 9RZo2gnugHsrmugxEjb8+NGXIBKTwMAIPGvXs5YZ5k8VaZAsIDwo6xhQTnd5AQGgRa
	 igySEMxVeDmda9MMJax2BBF9XavQrBqK6RfgxJRBEBawQBaiV0H4TSRZ3R/7QOGy1S
	 x3BCJJ1WlyGo/+Zr5Z5uUXtXr/GfmfzNPxkN6XmTMCkHbzgcbqcLjlonhxYGPvBqpa
	 /0o5XcGDweShw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F95284AA0;
	Thu, 15 Jan 2026 22:26:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74EEA223
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 22:26:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B23241B1E
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 22:26:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JQS7KoWN1Dq6 for <buildroot@buildroot.org>;
 Thu, 15 Jan 2026 22:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D731C40090
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D731C40090
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D731C40090
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 22:26:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id A1635B00535;
 Thu, 15 Jan 2026 23:26:22 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 15 Jan 2026 23:26:22 +0100
MIME-Version: 1.0
Date: Thu, 15 Jan 2026 23:26:22 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260115210246.2892456-1-bernd@kuhls.net>
References: <20260115210246.2892456-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <4910c6a5464d4760ba08fafd070e027d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768515983;
 bh=wjYiqTvTRviy10oWd4ij9M9M0681mWvEPANDMUzKz/c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tThEYeLtoHDYy1mpy0fnk7QS7Q9Pu8858Ubd/ff9LB+370FXo1Xpxgf1WbiCEMRx8
 XKrvQ9HRJTa6PNKTZx9alA5LXk8DPsDKA1msCCnu/XBsBJVuC1H7nmAer6SJHIn+mN
 x7EsHXfpyO9rhKGeaLvZDb/jsc1YDfUDFslJe8+e1jNHxwxCgULmisisEV84xYcBr0
 k95v+5CS1yZ5K6XyxUf0UnX28p0EoHj5Jb80rD+CINi0aMkwKv+TA+aBqVrjI/0EEe
 cq+TlQTU09qDZCDn4skCYjZxJUyv1JObBxOM8MSGjCvy53lJNHlvDEdGI+IBrAL4Al
 F1O3CgRUPIRow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tThEYeLt
Subject: Re: [Buildroot] [PATCH 1/1] package/libpng: security bump version
 to 1.6.54
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

On 15/01/2026 22:02, Bernd Kuhls wrote:
> Release notes:
> https://raw.githubusercontent.com/pnggroup/libpng/v1.6.54/ANNOUNCE
> 
> * Fixed CVE-2026-22695 (medium severity):
>   Heap buffer over-read in `png_image_read_direct_scaled.
>   (Reported and fixed by Petr Simecek.)
> * Fixed CVE-2026-22801 (medium severity):
>   Integer truncation causing heap buffer over-read in 
> `png_image_write_*`
> 
> Updated license hash due to copyright year bump:
> https://github.com/pnggroup/libpng/commit/9e4e247afbe809bac24bf70f531b23427e3f20ec
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
