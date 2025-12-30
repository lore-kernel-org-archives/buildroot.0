Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 620B9E95A8B
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A8F680E58;
	Tue, 30 Dec 2025 13:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2MBpyE9SUi0; Tue, 30 Dec 2025 13:06:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6000280CAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099967;
	bh=NGIQjHO3DkP0iwmBCyvcquH3/yJVSan9WLRbXTbYftc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O5NIuT136qe7Us8v6XgvbRlQ/E9pboP4I3H65lACp6+UNcGteq2lOxUZQAnQWniKf
	 9y1j9uVMso5e1cJjNLwdG2Bfa5aolDCb9kHGSIWHhpvq3xGzxVtZs48q43IIPL9hJF
	 tSWl3hFFSJJsguEOXeOw+K9axT5PcvYAcfqXPoOsl6h49fEcRiBF8Jq6PJMRVM+HS6
	 L66kJBayWufUzgFAfDvvd2F0VwunD9muaDGNysTTqjYHjo3SYJrk6sFbTc70C4nLkb
	 /xmpRzyHPr2k5wc5l6XusYL0wUK81dnCtMLgXTYCs68trKxKg/oKRCcTCk6wYpeqjh
	 mz7wFtQirmoQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6000280CAC;
	Tue, 30 Dec 2025 13:06:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E516B177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D72BC80CAC
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DM3GFygn7jnJ for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:06:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D584A80C87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D584A80C87
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D584A80C87
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:06:04 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 3B49C4E41E82
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:06:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 11C386072C;
 Tue, 30 Dec 2025 13:06:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 352F9113B0392; Tue, 30 Dec 2025 14:06:02 +0100 (CET)
Date: Tue, 30 Dec 2025 14:03:49 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20251230140349.1cf082e1@windsurf>
In-Reply-To: <20251229012322.3160158-1-james.hilliard1@gmail.com>
References: <20251229012322.3160158-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767099962; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=SmxgOcMCzMyIF3uTPzRmEVEv5rcn6SrHQfRdXZT0luM=;
 b=bUexcgIahoafmFNGDHDpr8i+wwIZvAPGqEnbTmDWjP2j4oxvGjCIJ9ab01WY862HnvXxin
 cL7yr5VVEeJnRoHb3urouJSO//bIcbBofXxj1K+p+EzSeZmK8L18ATddYo20C4IahNDUhB
 iz6MK0a2sxQAFDr0diaVEFRMPii25jSUnPe3MtlwGFDGcJkECCTaiPoWOnEoxwzb6TVqlH
 ZaCy5V97Yx07E6wgv89oKKEr9y3I0msXqh7syYNdUpM/AjUleBzsG8TGIr6qtSFLG5Xz6q
 MdGcO1NSnfRyuylxDvQGOq+yfIQEZs6Nn+pHFPkhBfcZSmrq49v5NNw713q6fA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=bUexcgIa
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ecdsa: bump to version
 0.19.1
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

On Sun, 28 Dec 2025 18:23:22 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-ecdsa/python-ecdsa.hash | 4 ++--
>  package/python-ecdsa/python-ecdsa.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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
