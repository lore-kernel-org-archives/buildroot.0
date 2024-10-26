Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D19D10BF9
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 13:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CB2D40768;
	Sat, 26 Oct 2024 13:24:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19VPq88zRizl; Sat, 26 Oct 2024 13:24:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FF9F40799
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FF9F40799;
	Sat, 26 Oct 2024 13:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 129A55C1E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBCD14018E
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1B2suOc0nS1E for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 13:24:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 99FA840175
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99FA840175
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 99FA840175
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 13:24:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5CBB20002;
 Sat, 26 Oct 2024 13:24:15 +0000 (UTC)
Date: Sat, 26 Oct 2024 15:24:15 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
Message-ID: <20241026152415.5caa1258@windsurf>
In-Reply-To: <20240930193743.50889-1-ju.o@free.fr>
References: <20240930193743.50889-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729949056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7HREU8eGl/p3NNWgMqF/ZL/mnFhAOzWXzMn6gekdpo=;
 b=Mn1VVQIKgTxSbSAqaRa75BD06fKCdUKE5WOs95MyQYRsMR+50ieZSCPpCHLIJb1/qZqMJp
 tvY0aLDtcJIYMJOjnsat0GStXFCWBXSR8kbvR4YJmgBCUUcRSFC3BK9IhNIuOSHOPaei5a
 nQ2xXokwbjgfxcRjBjlSlVzTb1eWbrBZ0TL+dx3IWYRG1ymoN5T8Wn9/PF9HoCOFGZZtQQ
 Ucjk8OwwLSjfqT2CpGYranuMVOKNJTmO51LnOEWkLUAMDn2bZanQcHvpHLS47uYSA7bsYj
 prdAzX6jC47tMvh0YFRGCmAvWjD+awpOEGzLn8cTq23HR8TbE56SEndDKbhsEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mn1VVQIK
Subject: Re: [Buildroot] [PATCH 1/1] package/liblinear: change homepage url
 to use https
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

On Mon, 30 Sep 2024 21:37:43 +0200
Julien Olivain <ju.o@free.fr> wrote:

> The package homepage http url redirects to https. This commit updates
> this url to directly use https.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/liblinear/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
