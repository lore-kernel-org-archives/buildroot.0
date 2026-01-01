Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AB7EEB57F
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92184084B;
	Thu,  1 Jan 2026 09:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y696EZJSaXdr; Thu,  1 Jan 2026 09:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B6D34081B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260922;
	bh=mTjHcg3U8tvkAuUG4bsvkcq8oNI6cjbTZ/fIPdE59zA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kAbqDftJ6xkwdnuTEDbvDPPOopQr79/zYUs5a8FPinAanuf5Yr235j86LlZE5AK3s
	 Oyu9yH4N2ylwJKO0SbGfBblRBgVFKLjD0D7LHgYQ/rTSO2vfiwGNMwWzc2tKbYM4pE
	 uM0BR++jB3fqnRw1de2mlvsXFWrSwR9NO/Ln9/0btBeOIXfKPdk3wKighSOydYmlX2
	 +eDggBEGNE2NzP+vCv77hFrOy3Wrqz8eDs2b2Cv9UDQD80iXTfZKWoUxManAlCdyfY
	 mCR9t9qxrxQReoxccrVuRrPG+ZPIBwcHMs9mtyt7zR3OpzFuHDwn3md2+i1fmxz5zK
	 VSa4c5GwIsqNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B6D34081B;
	Thu,  1 Jan 2026 09:48:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47EF4351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AA3581E08
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EQxVzkn58A5U for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E870E81E3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E870E81E3A
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E870E81E3A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:39 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id B748EC1D19A;
 Thu,  1 Jan 2026 09:48:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 716AA606B6;
 Thu,  1 Jan 2026 09:48:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D9105113B071F; Thu,  1 Jan 2026 10:48:36 +0100 (CET)
Date: Thu, 1 Jan 2026 10:47:17 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104717.34f09e91@windsurf>
In-Reply-To: <20251231231122.732957-1-james.hilliard1@gmail.com>
References: <20251231231122.732957-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=xRSvRkg0yi38QJZILQm/hUMvfFrEgtFqBRDU4Zg9d9U=;
 b=iMrQgpL2I3y4Z1VQNhlHx4YyOxvy5PtNajjr2A1xXxY48BHC0PuHkcpEAdqNPj7SvEQJLW
 39oNLj8puZCn6rQzUYISbSeFAml1G4ZIv/8w3srR6uVb6wwmj1krDknqCKfs5ZcwJFNrb+
 Y3xFs1NgRM8moNd2/Dqh3pu3aiXUeJR7sUVADmtDmSHkhKzrjmki6nvml6Jt3pSg7lrFP+
 wQoNbhqNOJYAzE6Xkwzk9ou72IBxGxKrh7ItUvJUNH4LmZf7W/UqaXEONTu2LlkxRjb9L9
 EpWVrze1GNuXhKdxbox+0UrrNWwOKSeHsVGpgJQSHdbStwtWeOZA+Ptm3GaPJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=iMrQgpL2
Subject: Re: [Buildroot] [PATCH 1/1] package/{python-}protobuf: bump to
 version 33.2
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

On Wed, 31 Dec 2025 16:11:22 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> We need to set -Dprotobuf_BUILD_LIBUPB=ON for host-protobuf now
> as some libupb headers now appear to be required.
> 
> Also set the new -Dprotobuf_LOCAL_DEPENDENCIES_ONLY=ON option
> to ensure cmake doesn't try to download dependencies.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/protobuf/protobuf.hash               | 2 +-
>  package/protobuf/protobuf.mk                 | 6 ++++--
>  package/python-protobuf/python-protobuf.hash | 4 ++--
>  package/python-protobuf/python-protobuf.mk   | 4 ++--
>  4 files changed, 9 insertions(+), 7 deletions(-)

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
