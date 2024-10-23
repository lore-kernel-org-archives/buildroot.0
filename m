Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEA7CFA466
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 20:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA6B40079;
	Wed, 23 Oct 2024 20:32:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDq39CI6cTtc; Wed, 23 Oct 2024 20:32:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2A914004F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2A914004F;
	Wed, 23 Oct 2024 20:32:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F0983F2E
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1F6D840A98
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:32:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9e5y8b1D-0O1 for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 20:32:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9137540A56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9137540A56
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9137540A56
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 20:32:10 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF1E6E0004;
 Wed, 23 Oct 2024 20:32:07 +0000 (UTC)
Date: Wed, 23 Oct 2024 22:32:06 +0200
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20241023223206.27f7e378@windsurf>
In-Reply-To: <462871d252e473dfd0850058abdffb85c5c90f79.1729511657.git.baruch@tkos.co.il>
References: <462871d252e473dfd0850058abdffb85c5c90f79.1729511657.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729715529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfqmWTOPg5AUEQ+4Eg84xNO+XmEZ/+yiRkgQYZ341zc=;
 b=o3yP7B9Agv7VT3MfjU1akOrqidCjkZAohUD0Pa8efI6DVXXjDSIt/P//2mbU5+1muYM7JH
 32NYqTpSGuO6lpjygflDFUtEOSQ9gIxt3NEUThYODVLMMkNxWBUUuei9vqkn/II5C1hdBw
 GFC+PVweXEyOSaEuelwuRpp/bL8iupjiv6fM2+bSTeo/JnNDzBUkc0mnfIQx26+mdyAZwp
 3VxP74xgMYXNOT/ixYA9NOffMl6s9cJz+JPa9yhIvhJYcXSFpYxztjjDqZySmow+4snacW
 f/oASwTMt6PxkVfJBtHdyKfQhETBjz3g+ggBi9RCCxmunr3voztGUr6l7E9unA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=o3yP7B9A
Subject: Re: [Buildroot] [PATCH] package/libcurl: ignore CVE-2024-32928
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

On Mon, 21 Oct 2024 14:54:17 +0300
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> This vulnerability only affects libcurl deployments in Nest products
> because of incorrect use.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/libcurl/libcurl.mk | 4 ++++
>  1 file changed, 4 insertions(+)

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
