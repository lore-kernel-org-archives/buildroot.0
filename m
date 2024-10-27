Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07A40D13572
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C461C40188;
	Sun, 27 Oct 2024 18:46:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KIr_KzU0s9_d; Sun, 27 Oct 2024 18:46:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 921D440164
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 921D440164;
	Sun, 27 Oct 2024 18:46:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18A7A971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED8944015C
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:46:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bJNxIoTfGIoV for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:46:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D162F40129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D162F40129
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D162F40129
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:46:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E65EFF803;
 Sun, 27 Oct 2024 18:46:24 +0000 (UTC)
Date: Sun, 27 Oct 2024 19:46:23 +0100
To: "Guillaume GC. Chaye" <guillaume.chaye@zeetim.com>
Cc: buildroot@buildroot.org, Sergey Matyukevich <geomatsi@gmail.com>
Message-ID: <20241027194623.2afee86d@windsurf>
In-Reply-To: <20240916085510.2953923-1-guillaume.chaye@zeetim.com>
References: <20240916085510.2953923-1-guillaume.chaye@zeetim.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730054784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ylq2c2nE32jN22QtZVmyGAhCc66ub/xz7u6/b3HObYc=;
 b=YTfuYTwK2Rp5BdQmX5byrnZcOGEIFEoJ9iqFP5pCZFVcK8pqqGDBM3sjS1gtbzx+f53dw8
 kUA/uoNXU4m8P4mhQBSIm2y1sfoYfC4xNGaCvzODxe1SniXbxlrctIn9WJz3lZP6cjk627
 GeaJu4g4ZGQ/y2b/RN1BuGowpD3riJsa/je7iR627boFiBWd75bO6uf/0wjpssQLGKJzZN
 rZ5pGQZZCnm6ghCA4KUR3uaTbZAb/eotbgw+Uq8iPoeDoXaW3M+/51dTUlSYb1ZKeX2j5w
 dVaU2KnK5VtvgJrAF5KWCvwzPWZvj1QG1qoANndcoULMmS+31GZg6UVOj5zN4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YTfuYTwK
Subject: Re: [Buildroot] [PATCHv3 1/1] package/wpa_supplicant: add
 configuration for WPA3-Entreprise
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

Hello Guillaume,

On Mon, 16 Sep 2024 10:55:10 +0200
"Guillaume GC. Chaye" <guillaume.chaye@zeetim.com> wrote:

> Signed-off-by: Guillaume GC. Chaye <guillaume.chaye@zeetim.com>
> ---
>  package/wpa_supplicant/wpa_supplicant.mk | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

The commit log was a bit desperately empty, so I added some
explanations, and applied. Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
