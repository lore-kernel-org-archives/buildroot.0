Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7155C3DA59
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A303B403F4;
	Sat, 20 Jul 2024 21:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmw2z1q9xFQj; Sat, 20 Jul 2024 21:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A31403F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A31403F7;
	Sat, 20 Jul 2024 21:01:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C93A1BF2CF
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68C9C80D8C
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4zbtPo1WacOS for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 680E2817AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 680E2817AE
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 680E2817AE
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:01:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 242C3240004;
 Sat, 20 Jul 2024 21:01:48 +0000 (UTC)
Date: Sat, 20 Jul 2024 23:01:47 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240720230147.1e29731b@windsurf>
In-Reply-To: <20240720093743.259131-1-fontaine.fabrice@gmail.com>
References: <20240720093743.259131-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721509308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=octCTeqmDbRWOkimpo8Jz5TCjuk4ic5P0xNcNiNDV3s=;
 b=OclMf/MUKjYGW8yImT11uWe0O86hMJcq4LRBc/G3pJYKMP/fLdFlTG6+BReRc1lJaX7vyM
 f0nm0gieGf9yZgfhwlNR8sE2xjUKgPfTcszVoatTMg91zTIp03sAzSjwNZoxQTMae8hBaB
 zRezI4ZOjlnJ4PGdA5XVkUVt+c1sXUXmGP9rQkV5NZ3cYdYDdBxndSWMAFTVOw9/EiamA2
 3pk6g4Xg5ovkmUIXQ369cyQfZoaIQ75bMgPp1KZoaFq3IskakHhRUAWC5w+JFaCDaE5GTI
 XM2vM/xpyBHGuquBsBc+XQXFvqiZvMbJHv6FLVCAFKKt6TJru72HbGiGr6qI1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=OclMf/MU
Subject: Re: [Buildroot] [PATCH 1/1] package/libcli: fix build with gcc >= 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Steve James <ste@junkomatic.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 20 Jul 2024 11:37:43 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc >= 14:
> 
> libcli.c: In function 'cli_register_command':
> libcli.c:430:27: error: 'calloc' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
>   430 |   if (!(c = calloc(sizeof(struct cli_command), 1))) return NULL;
>       |                           ^~~~~~
> libcli.c:430:27: note: earlier argument should specify number of elements, later size of each element
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a170d27689e069cf58f830bdd74f604364ee503b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...rameters-for-Wcalloc-transposed-args.patch | 96 +++++++++++++++++++
>  1 file changed, 96 insertions(+)
>  create mode 100644 package/libcli/0001-Swap-calloc-parameters-for-Wcalloc-transposed-args.patch

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
