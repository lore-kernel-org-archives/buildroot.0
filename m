Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83525C2A062
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 14:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 375C24051C;
	Sun,  4 Jan 2026 14:20:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bpg2TGELghuV; Sun,  4 Jan 2026 14:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64AD740522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767536418;
	bh=3hes7AjPPgNE4R0v5DgLKbQ6F7Uuj/kZQRKxEHmxpk0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=der6ivjt1VmCsuJQEo+S5vPK4aCxY609x5/pnBdepadN4uusCWZtwiimPZBhlhOYA
	 Oqun/OzpfG5PKpCG+Ue3ijA1dCjnXrSoK7m5K/JWAGgQFRWSONuwexjLYJXvCnC0oD
	 GAz4U4nTtX+u5bqwvfhsHTMBKk0M/+J5yHDN5WWnfY/j9eZiCwWSCyepd1rNURPh0v
	 EUPPEEs7LWwyFHf1cbEh3IKLKTKsVT5oaJaj9BLrkkmMA4t4LZH/96ImRvIdeNKZVE
	 Sgwh2OAWnffhvkFqN/MbwWxTFhYvwB/yBB+vX1sdvJh38exZJTR/ve2+ii77tsA3b/
	 yQQpERenbSadQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64AD740522;
	Sun,  4 Jan 2026 14:20:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E05D229
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F4B84013F
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIBzIuprP7AG for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 14:20:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 799EB401FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 799EB401FF
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 799EB401FF
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 14:20:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5442CC1C96D
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:54:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3CA616072B;
 Sun,  4 Jan 2026 10:54:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AA408113B0449; Sun,  4 Jan 2026 11:54:30 +0100 (CET)
Date: Sun, 4 Jan 2026 11:54:29 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
Message-ID: <20260104115429.78e2cd5d@windsurf>
In-Reply-To: <20260103200229.246015-1-ju.o@free.fr>
References: <20260103200229.246015-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767524070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=esp7uC17p/jgzWRY8BS99zodg+pGbJavq+l1i+K4tpE=;
 b=XXGAK7rxuusQGEKFfTyAr4BqwyX7ml4OAW5TuBxc1o9G0cHn7zXfq241xofxsW4+FCaYFA
 eD3jRmifFULclqAH+rTncrWRa3FGmLPeq1zT34G0N6mPQSKE4JC6zaOS6p74+Rm6Ryl4e7
 eUMazjCVW4Q05cq0Ww44Q7D7Wg8URdjaiIXo6i77e4h8mu0Si/CFhlNRlg011lXyTIVkZQ
 d3g2C+miSuHs7yzv4uyechGAgolmOVYjoZyrGB6Cpf3HG0rm+IB5oDNwbwwQOkRe6WW0zY
 /jyjO+gXiahtYPFOi4FG1oo9BsJXR8n4G3nJsSlfYwxqldYAPy1IAr1RKMJ0Lg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=XXGAK7rx
Subject: Re: [Buildroot] [PATCH 1/1] package/gnupg2: bump to version 2.4.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Jan 2026 21:02:29 +0100
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> For release note, see:
> https://dev.gnupg.org/T8001
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/12595598071
> ---
>  package/gnupg2/gnupg2.hash | 4 ++--
>  package/gnupg2/gnupg2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
