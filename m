Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470A8D6B6DF
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 12:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D99A840277;
	Thu, 31 Oct 2024 12:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JiLaOWp0bpMT; Thu, 31 Oct 2024 12:51:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A16A40257
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A16A40257;
	Thu, 31 Oct 2024 12:51:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 610145E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42D9A80BCC
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YxS3wrHhYX0A for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 12:51:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4171A80BB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4171A80BB7
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4171A80BB7
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 12:51:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9AD4040005;
 Thu, 31 Oct 2024 12:51:35 +0000 (UTC)
Date: Thu, 31 Oct 2024 13:51:34 +0100
To: Romain Naour via buildroot <buildroot@buildroot.org>
Cc: Romain Naour <romain.naour@smile.fr>
Message-ID: <20241031135134.7ae9a70a@windsurf>
In-Reply-To: <20241030212700.2517051-1-romain.naour@smile.fr>
References: <20241030212700.2517051-1-romain.naour@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730379095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aMmwB8CdsM7AML7ERA6sKkKVURz3FSE4z1ys0gVxIoc=;
 b=h84lC6+LvBPk091lxMaD8O9mh4KjnOrdmP2OR5+t9GO5JGkEPLdjP+3ITUbYSjxhoWhGxX
 EeAlHw+xYm2XjsJenqvzzxyhtdEZwFGBkJ0JrmUnMaiM8Os0xIGzJwAKTYXfwPdDOadWdL
 AlEZNF3LAB9P2DWQevLFU/V5avxhbiWyf3jmvUvaUOz146ELgMQsTzVA8RNBPVubpYqd8r
 kJabSTJEr9debdS03maL3eKYqEPAtGw6OTjTL6AZBc3picD+8TsFJcrKAIEYl8Ff+x5wuc
 KMToGJLqNo36IJOKSKy4nSV0S2B5BNFl2MtSa9su+ZAAVOwXUsGtTeLLTm5MDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=h84lC6+L
Subject: Re: [Buildroot] [PATCH] package/checksec: fix download
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

On Wed, 30 Oct 2024 22:27:00 +0100
Romain Naour via buildroot <buildroot@buildroot.org> wrote:

> checksec-2.7.1.tar.gz archive was replaced or regenerated by upstream
> sometime between the 22 September 2024 [1] and the 29 September 2024
> [2].
> 
> diffoscope report no changes in extracted files exept a different
> top directory name (checksec.sh-2.7.1/checksec-2.7.1):
> 
>   --- checksec-2.7.1.tar.gz a0d7a444d4603fb3d62fa25ef678e544ef39fa7b3c9bd5d22f1a8c526152cdde
>   +++ checksec-2.7.1.tar.gz eba0616f4033385d6093608a2a2aad3c2debb847d6778c87346f89c80946684f
> 
>   Files identical despite different names
>   --- checksec-2.7.1/ChangeLog
>   +++ checksec.sh-2.7.1/ChangeLog
> 
> Use the git hash of the 2.7.1 release to use a different archive name
> than the checksec-2.7.1.tar.gz archive previously released.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/jobs/7888799855
> [2] https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006849
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/7948006849
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  package/checksec/checksec.hash | 2 +-
>  package/checksec/checksec.mk   | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to master, thanks. However, I think the idea is to move away
from the github macro and use git downloads instead.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
