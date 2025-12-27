Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470A3E92722
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 23:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CEB240689;
	Sat, 27 Dec 2025 23:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nj_kFcU4Qum5; Sat, 27 Dec 2025 23:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76E8440500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766878860;
	bh=mnmE+IyUyPU2QpKz5hoaGPCnD5TprZ0Gi3BrIhoFZBM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fJW+WXRLaglLlGXosj6KHm/ftzVfUTj7W7I+hc6bWTfA67ZD+3r/argmJSXH81dJt
	 cUedga7WDoWgMfjtJge7X/3sVpF/MVe3B0VDHfq/avwKZ3mCxDa8t7EykfAyr/F1Cp
	 qCTCU6aLfCkmme6FnJ1KomTH2my+cvxAmIlViirzkhtu0Z4OBcETgQJs+LHTqIiD73
	 GIShTlT+C2b/q3h7HpGIy240VHD/UwOVs9tQJi3e+oevqSAdV4/YDzvIzzHQwBpa8j
	 DIetikPw72mv/6ft9i8Ub2Bmj/tkbiQM8ccnvfps7e18gG0HoNwQNREfcQ4/K094kr
	 qTHU5+TvbaQhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76E8440500;
	Sat, 27 Dec 2025 23:41:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E38A119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 139E060596
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8O3tkqJbv8Nc for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 23:40:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A46960586
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A46960586
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A46960586
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 23:40:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C5A614E41E23;
 Sat, 27 Dec 2025 23:40:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7EB9460725;
 Sat, 27 Dec 2025 23:40:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 88F0711978B3B; Sun, 28 Dec 2025 00:40:54 +0100 (CET)
Date: Sun, 28 Dec 2025 00:40:53 +0100
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>
Message-ID: <20251228004053.1a621fd2@windsurf>
In-Reply-To: <20251219210957.556930-1-ju.o@free.fr>
References: <20251219210957.556930-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766878854; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=greFJO6bczVYyK0dLcOuoUjdelFXw7+62znrKlAX/co=;
 b=SHHYvKMt0n8x2Eo2tjh4iBpMVCRHCyCNKX+0seth9nOefstMCzk2vDwsfwfXd6qL454pY0
 V+qHQxnd9xBYN0EX5BhETwqaeIifs/FkWwotWLCLkzkwMnnZwow2atiM93sS0d3rdMdarV
 cUPVQBRrdmZ91ID1yi9Lj260EWqp6MljRc/BIi7W/G49oYQC1BAHPLt7ni2rHTKHC1JfVK
 +X9KVMQ+i9ral9rMnDFHjyA2CJksM6w4vBsVQVxx2389ek3athWGVbcV/Izq1x4CmQSvUq
 jxIHH+xyhFDpc4dEIQoNWv5+JlR8cSRvulCXaamsIskVpW11DxhjqI6viJMWQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=SHHYvKMt
Subject: Re: [Buildroot] [PATCH 1/4] support/testing: ddrescue: use dmsetup
 from lvm2
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

On Fri, 19 Dec 2025 22:09:54 +0100
Julien Olivain via buildroot <buildroot@buildroot.org> wrote:

> The ddresue runtime test is using the `dmsetup` command provided by the
> dmraid package. This package is outdated and will be removed. This
> command is also provided by the lvm2 package, which is still maintained.
> 
> This commit replaces the dmraid package by lvm2 in the test config.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  support/testing/tests/package/test_ddrescue.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Series applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
