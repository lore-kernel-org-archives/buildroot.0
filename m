Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A3EC021A6
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 21:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2945C6074E;
	Thu, 13 Feb 2025 21:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4hg05feRLfI; Thu, 13 Feb 2025 21:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4638A6075D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4638A6075D;
	Thu, 13 Feb 2025 21:23:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF8EF199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 21:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 947E483216
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 21:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iH0qS6y1AuNR for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 21:23:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 644F98176A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 644F98176A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 644F98176A
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 21:23:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A6D7878035E;
 Thu, 13 Feb 2025 22:23:22 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 13 Feb 2025 22:23:22 +0100
MIME-Version: 1.0
Date: Thu, 13 Feb 2025 22:23:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Niklas Cassel <niklas.cassel@wdc.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250213180908.3963679-1-dario.binacchi@amarulasolutions.com>
References: <20250213180908.3963679-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <1da1969f3e232db05ab1622415b2dec7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1739481806;
 bh=+OldmOMAFQ9C0ZN8SDV+TarCUMR/tvdevZpmxZPpzM8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BR797DJbeM8iNJzUPkJ1fmw+NEd75iv7rej4ooRWWDFC8iRNI/zEdNibmplWMZB+k
 tenugZTIYuNCCIh6V7F6rCV30JZJrCkPqtF7X6K8IGkHIFyhrad5yMyH7QPA7Nc7m1
 t1Ulj0r3yyHtVb+co8CCU/qztbLB3BSAUEihGzWDDfo30vpssn8yCD+r6kDU+n2cCL
 ABgKwfGFV6gZ7wNkTERxfTEiScSNOE1fqaJEUEHs8O64x5rOz9/zfNYGEVcMpEdqKb
 70Y6iKmsWFmkr7p5VB88ps4xQ+S9XyTLCV6wAKSwf61Xsg31o0wyP7x7SjQlnAata3
 5++qUvbBOGMFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BR797DJb
Subject: Re: [Buildroot] [RFC PATCH v2 1/1] package/pkg-download: don't
 export the download command variables
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

Hi Dario, All,

On 13/02/2025 19:09, Dario Binacchi wrote:
> Exporting the download variables can cause unfortunate name clashes, as
> occurred with the SCP variable used by Binman for compiling U-Boot [1].
> Do not globally export the package download commands anymore; instead,
> pass them to the dl-wrapper environment.
> 
> [1] 
> https://lore.kernel.org/buildroot/a023971c7c8bfa4826a9a8721500c7ff@free.fr/T/
> Cc: Julien Olivain <ju.o@free.fr>
> Suggested-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

I applied the patch to master. I did few minor changes, see:
https://gitlab.com/buildroot.org/buildroot/-/commit/56cc6fa2c71eff27efcb66d60f254da04439ac18

Thank you for your patience and perseverance!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
