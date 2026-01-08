Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6743DD185D5
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:15:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A0BA80F87;
	Thu,  8 Jan 2026 11:15:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiPNhQ5IPO6D; Thu,  8 Jan 2026 11:15:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D588680F73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870908;
	bh=sbCS4Jr+L8hXamX+0rqB4T7dvL6F8fFiyq7EHeqGHSA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dW9Gkg/MbAqG85ddrEwVBpsFpTyItPWnYcb7t3RPGzX2wlDtZovjCnvVJTGdMIaPO
	 mkpwlhurlugC7xxGPEYIeDJNjRJPPKLO+vg2KcaP5RsE41dX5zGVP1zWJmE0NL683x
	 0x0xlTAtkP18kkwkouFV6B+Q8/9gfbPILLkwsdrKmXrbI2kspg+LXU57b790zqqhG7
	 +UTqeqjJg5Mytrx/byhJiQGVLmmwQhj5uxK/zUzWOlchx6myfQmTlYaOhnIBEm72iI
	 szvkiTEhrbIfNKKQ+x/sGkx+J5Vc66xEtWYT6iUuvFSVFUbLHQLxPcdASPzrL/iZxs
	 bj2B//doXJtWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D588680F73;
	Thu,  8 Jan 2026 11:15:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D94EB2C0
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C01E440581
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:15:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDEg_UKYESj4 for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:15:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA3AA40264
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA3AA40264
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA3AA40264
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:15:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 19C2B1A2659;
 Thu,  8 Jan 2026 11:15:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E1C25606B6;
 Thu,  8 Jan 2026 11:15:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7AFC8103C8829; Thu,  8 Jan 2026 12:15:02 +0100 (CET)
Date: Thu, 8 Jan 2026 12:15:02 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Horatiu Vultur <horatiu.vultur@microchip.com>
Message-ID: <20260108121502.26658939@windsurf>
In-Reply-To: <20260103141300.460719-1-bernd@kuhls.net>
References: <20260103141300.460719-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767870904; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4k+UxgsSTgO9mK4+ohp1h3v/OCuAU5/gDpMh7mH0EVU=;
 b=VaLj24DDrjoz6wGTd94izh2iXp0c6n67N4Del5+gEQuYDIYJaoaZ5jVa4zadDhQf1ohQgJ
 ZL+jFDYwjVhJ/G96t0ujY3jqWlubIVlZjsBEXTJHsYL6rXHHmpXOsSIvgYWrAcn3ZsdQ9n
 nnPVaRL0HgxM+4firYWRgtEeqABaWa4Kxg64rqGsiY06EqlDmFCNcqCCUetbrl5r9wcqIT
 17gxeBEGL0YWqFkhDaCcPOdtH+jNTlHxxH6ez8WBPz80KDj+JdE8oUjYy+rTj++dPbPZe0
 lB/opp/PUs6DpxuGf1Y3yJFFRKHT8MlPochvk/YfEzOEEMwiEaQaDq/JrJWifw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=VaLj24DD
Subject: Re: [Buildroot] [PATCH 1/1] package/cfm: fix build with cmake 4
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

On Sat,  3 Jan 2026 15:13:00 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/d01/d01d8fe3a63128246ce242de450b016b4ef13baa/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  ...01-CMakeLists-fix-build-with-cmake-4.patch | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/cfm/0001-CMakeLists-fix-build-with-cmake-4.patch

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
