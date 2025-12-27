Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7A2E92704
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E23B406C4;
	Sat, 27 Dec 2025 15:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qqmGtJuhSInr; Sat, 27 Dec 2025 15:18:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0585240648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766848712;
	bh=JRPHxQC3XoHKOFzZLydYG3RPpOt4ZhhVcIll3Ify4n0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m9najGD7vH9Z+m+24yLk86ZweDhPjx+VvYOUR7fpwylNydcQlfKqxtdsdaZ5XAV0A
	 MhEC3MHVwqU7alI3YF6pH90putI8YtEuVoXLfn+URrBbKNinjbJFGdRpaXHSWzAodF
	 0zTnLttSFVLNpJgaykHmGGA1fPnouHZZQ0jEeMnduEYbaePzpSEOuTXM5/pqsyEpJF
	 TCTth71yoOvqxQT9rUgHayeUM52PeO6FElQ/Bn+vRx8Foy7dVXlCW2986lOU8YviLh
	 Eh1S3mQ+m5cGmicverAk0leykqN8O0qA+N5KT1mDccQmmgvE2HGBADY4AcJOCb9zOn
	 YTIch77erV3xw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0585240648;
	Sat, 27 Dec 2025 15:18:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15626119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F018F40648
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ao4x7fz2yWnm for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB04E40629
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB04E40629
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB04E40629
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:18:28 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id C3D80C1D1A5
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:18:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 03AB960725;
 Sat, 27 Dec 2025 15:18:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 221A1119784FF; Sat, 27 Dec 2025 16:18:24 +0100 (CET)
Date: Sat, 27 Dec 2025 16:18:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Laurent Charpentier <laurent_pubs@yahoo.com>
Message-ID: <20251227161824.1418e691@windsurf>
In-Reply-To: <20251214171531.1496512-1-bernd@kuhls.net>
References: <20251214171531.1496512-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766848706; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Bu38mJpwcMbOHrWLFIiCQVPOTQ3lFf2SXkAvU3Vf0PA=;
 b=Py/vH6JP7kgI3MfbxeFZGcRAXyTJvJWtSApJ8HEXQjxcDW6eHdLKn5c6pkpBSbPmXyUH1v
 oauZVM9lh5JQHMe8wS7pQlA+QP8x3RhlXsbRAg5arDyj16fqaD8QpxgEMCir3ltBxkVSnT
 vrowT4iVG/LRZLbZMTVB4GXCz6s/VmZCGqXKls5TJp/CqOI53TMsYY4ApuD0OyxbZ/Yl6D
 g4xUXam2khE0ymYKSdNywkiVrTDnJ7XrIsyfedkxHYwPaam7TqA4TD7Z53RyOg0k1edo3r
 xmoJd6MvPzaWTDm4dRfXAweUDt+Uk9lqdl8tLh9gWBMRLq5XavEbVKrUunlNLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Py/vH6JP
Subject: Re: [Buildroot] [PATCH 1/2] package/open-lldp: fix musl build with
 gcc-14.x
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

On Sun, 14 Dec 2025 18:15:30 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/0f8/0f88cbe9152ab816b4ae17e1d84e8257f458eb4a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...string.h-for-mem-function-prototypes.patch | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch

Applied to master after extending the commit message.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
