Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A15ABEEB57B
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7861B40818;
	Thu,  1 Jan 2026 09:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bPRXxGtYBEv0; Thu,  1 Jan 2026 09:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABA784081B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260987;
	bh=RHPdYpbPFIFoetGs9YlZBgz+kXPATLaGDt8POJCOy4o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XlGiJWVgBZqIujc4XaJYz68u6ovl5owW5Qt22OAFR6KQmo5xcQHhQRkCSpZ7s0zvm
	 K/S/0qGsP/ByxanJ/4PIS9/78wpVDDLnp39/T27pugPv60FoYsMDGFFDWNIe/I6lP5
	 NG6R48DIYt4VX2qbaeqWnYka5wQoVa4XF6oYV++SH2JMG5XvLpjsyFLj5B5hdRNb/D
	 vJjEXb4iizTeTz8DW4rZATKbPFxq24LEm3M6X8j4/R3k4gUI6gL/T9MBkLUFX98JUy
	 ltH4GfHnYtYwTvQpCE67CJ1QQKVuVOcuSbK5CkxyWt5DU8bcYQV4UOPCVhRgqs07q1
	 AU6nMFgcH7Qew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABA784081B;
	Thu,  1 Jan 2026 09:49:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 34567351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3237C40168
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gkiVyg9KOLTB for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:49:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 35871400A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35871400A5
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 35871400A5
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4F02AC1D19A
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:49:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 09EEC606B6;
 Thu,  1 Jan 2026 09:49:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58940113B071F; Thu,  1 Jan 2026 10:49:42 +0100 (CET)
Date: Thu, 1 Jan 2026 10:46:24 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104624.76b48221@windsurf>
In-Reply-To: <20251231202628.4099815-1-james.hilliard1@gmail.com>
References: <20251231202628.4099815-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=XDcDfTmb1TFfdlFJ0RGEt0mkZKLs4t8FEivwuf0YCYc=;
 b=CvnGTaYBjty0E9LKiYigOiNec3bI4DgFOBZoQxbEoNF8aHtPwRymkF07yUPQPp3DN87CNS
 79HjmcPY/oMe9YdHnRMvJcOmKcBlZqNuUs0IXESlgANsp5ypV1kpJamcgq7RrUQzobdNU/
 6xd9zHsT7cdVllRNt5Y2E5Dco2oMStAIBbO2UL8m201/K7NtkLZEbCBSZvRvvAUCwkHL72
 WI1z+llajKV9JleY7LzqL3w5pdPFyaCumzMf4lzLR+WRI0HH8dVhC/cosrUoOZSuvcU9I+
 v5kTTKdMVh8wv3ElR2usdvMT2cExAwNGMhcV+JBuEyI+54x6fggKuB9DPSdxNg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=CvnGTaYB
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ruamel-yaml: bump to
 version 0.19.0
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

On Wed, 31 Dec 2025 13:26:28 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-ruamel-yaml/python-ruamel-yaml.hash | 4 ++--
>  package/python-ruamel-yaml/python-ruamel-yaml.mk   | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)

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
