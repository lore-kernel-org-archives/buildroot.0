Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A3EEED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B8978106A;
	Fri,  2 Jan 2026 17:20:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jz8XtXIICTGl; Fri,  2 Jan 2026 17:20:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC0B980EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374418;
	bh=RbKzRqgYT87mCda7sAXynu4OknpFja/KOh2MHqXb+ws=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ONT4RXYbski2b9hFxuvwFbv7pAuP5dwyhwwE5ne1pG5ui0OZG3SkjV0HPJ1V/ZKin
	 URxsGRsgdmgEwi2D5L3zGUn2rFbdxtOiYyjLqvriHoRdq4k5f9wu2ownEgk/6OyFsG
	 YSu2RZzaYiY16/C3C4F8Cn9zWKIFwcynaTOFk9evVTjzLSDf/fO+HHsXyeEgdSA7B7
	 CXGfBtlBPOeSjZYqdxvgx3k67vxXqirXyWhLMmirEkOxG0X5BCjvbT5y/HNy6aykt0
	 MXijFsWOYK8fPfF9WWC+1pVajkpnWBoKp0fxzAU2mV0ZH4RWaXYuGtMtXvr5Uf+M2b
	 NAopfXvpus//A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC0B980EF2;
	Fri,  2 Jan 2026 17:20:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F84C351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7108D406D4
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fLFzzYyvUMI8 for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:20:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C2414056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C2414056C
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C2414056C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:20:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 3C9C11A25C2;
 Fri,  2 Jan 2026 17:20:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0ED94606C7;
 Fri,  2 Jan 2026 17:20:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 40EB0113B0718; Fri,  2 Jan 2026 18:20:11 +0100 (CET)
Date: Fri, 2 Jan 2026 18:20:10 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
Message-ID: <20260102182010.42a16d03@windsurf>
In-Reply-To: <aMKU_BEQ4TKSd6qq@waldemar-brodkorb.de>
References: <aMKU_BEQ4TKSd6qq@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767374412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ZoEto05F8sk8i9VnRWdyfMiZ1ZK74U7MZAtK3+KHlJI=;
 b=mdKdq/y1et6WmIFG1fJS1RN1x37CoefnviRMn/jxljxZlEcFFRaJCoxIwYc8B1/X8f+B99
 zIREFINaX4AcQfafUwXOgz1bKd9HiaRzj4KLzEP8Mv5D172T5OuR9oMvxXJ6WA5TsmeB1N
 +3FmKuJiqNBnB6tSffbkDZKiXqZ1J0D9JYiEQgfTOUJd0pwRMsnKxuBz1CdddlWeEaSHXo
 7+DWwyo1E5eFXkdxTcz1JpvawFoh35KkUmDfiYQPaXGseFNuiEbOTe9b90Sj47ci+FhiWg
 0azLPWFxh5n6ZKBBhbXKUCmo9w5b9x9k8mt8o+8YaiP0vxT0rtrX+V0JQyt3CA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=mdKdq/y1
Subject: Re: [Buildroot] [PATCH v2] package/evilwm: fix compilation with
 external toolchains
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

On Thu, 11 Sep 2025 11:23:08 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> Switch to generic-package, as the configure script isn't really a
> autotool generated script. This fixes building evilwm with an
> external toolchain.
> 
> Fixes:
>  - https://autobuild.buildroot.org/results/250/25040ce7e94acf8f92c24db895d7dea081de1d7a
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> v1->v2:
>   - add link to autobuilder (suggested by Arnout)
>   - use TARGET_CROSS (suggested by Arnout)
> ---
>  package/evilwm/evilwm.mk | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)

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
