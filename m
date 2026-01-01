Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB475EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9411640837;
	Thu,  1 Jan 2026 09:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQHc6dYqopBL; Thu,  1 Jan 2026 09:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E0B4066B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260896;
	bh=bXIxjG6sv+hwuh5dRGl8tN/jNmZ5ua//g2wV0DdP2mQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Q0qP2XKXErvI/dz/rHzeRi9CKkvCHiWLaLNVxQrH93rC9yWjfBCND6hdZgso3BW4k
	 oXbTyJbZr1o8D2jQxVvdQlPzH6OkVr3HrzXR4PqSJEHZWZdglgnlmy3Q/YNMLBzrgs
	 qa9vxWBspYwoIt5I+ZqY8RgnaMRxc7QX61otoNtmlapAGFHq4bf5EzavzUUgoSL06C
	 6SP0tKTd0F5PvvvKfTTmguGB0O6idO2LRI5dbi8PqPdejgC4xyoDT5a9TvV5juFVb/
	 24cL6H58DaNUkI+rXrwoAsk4W3Nj7Sp+kWVegK+Vkx/aFXjP3M13ZiVoYEk1DJ7l0d
	 ChIOIByRCKBCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E0B4066B;
	Thu,  1 Jan 2026 09:48:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 36FA0206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34F7181B14
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id it6cbTaqhGCK for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34DEF81AEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34DEF81AEF
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34DEF81AEF
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 25D46C1D19A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:47:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D31A7606B6;
 Thu,  1 Jan 2026 09:48:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 296EF113B071F; Thu,  1 Jan 2026 10:48:09 +0100 (CET)
Date: Thu, 1 Jan 2026 10:45:24 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104524.152e6f90@windsurf>
In-Reply-To: <20251231182821.3921349-1-james.hilliard1@gmail.com>
References: <20251231182821.3921349-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zkTpYszgIxMpSMX43LOLU38ubtCdA+JNwF9L6tUxgiM=;
 b=m3MW/N66qcH8AEJ5ZeNyd3ggOS5RLbNtur2GCzPyAH7jdYus2S1hNW12eLF00dHkN9VOL2
 YVqekpAZyWyGxy3yDDfJn5GG8UrFMmYXWdTLY0NDME6g95bLQCyoaumuXlBHwhb3owZz6w
 tRqeTorfXGemRVVf++K0xopqgPVqdI1BjySBA40SvZLBF4dCnqcPb7k7ekDPSLidK1modA
 1euFUU7D89qKZzga59F/fI7gkCdaymVt5o+cegbG0n26mzMtnuUxZtlKdW1bYWPIdewl6B
 ybblegxlEilEAzgpuh0Qpgqtd/YUy1+UmwXAH+WtWYyGUcJ6/83LEeTGAozAcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=m3MW/N66
Subject: Re: [Buildroot] [PATCH 1/1] package/python-zc-lockfile: bump to
 version 4.0
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

On Wed, 31 Dec 2025 11:28:21 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Skip dependency check due to unnecessarily strict setuptools version
> restriction.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-zc-lockfile/python-zc-lockfile.hash | 4 ++--
>  package/python-zc-lockfile/python-zc-lockfile.mk   | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)

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
