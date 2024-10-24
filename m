Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAADD1036C
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 20:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B40881225;
	Thu, 24 Oct 2024 20:48:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zT1uCHpumlNf; Thu, 24 Oct 2024 20:48:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE3578122D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE3578122D;
	Thu, 24 Oct 2024 20:48:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32E49497A
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 119D341D78
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJxB9IKAr_Q2 for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 20:48:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB78941DBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB78941DBF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB78941DBF
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 20:48:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8068C0007;
 Thu, 24 Oct 2024 20:48:40 +0000 (UTC)
Date: Thu, 24 Oct 2024 22:48:39 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20241024224839.62dbdfb6@windsurf>
In-Reply-To: <20241007202822.722991-1-ju.o@free.fr>
References: <20241007202822.722991-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729802921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vqZ5UQNeSzdDHNKdWMCNwHRcBn3aYaeBJ1nsrJ8G5KA=;
 b=gTEtZe47VabW6JiYJ4RDNwyJUcGl1vDiqp5t4HWoQVt5dN95AOAvluDWfrk3ZqkXDcRw+2
 u/5zVKdjgALUgzSa4tU8TY7t91A9GV7CZ4HbdE6ibkI95xjPW+S6raEg+bJ1QAjVAmp/Ld
 SR1zg2+yFdUlwnE4q90apuOj9rbTma+5hJlMUaxlfGhQqIznhKmbnhHB8qJl1+OKXzaywE
 qXUHLxoL2IibiLkkKSXuiQV50Cs/tncSdy7urvtITy9NOdtGdlGTGbokPrAmaJuFrL+/rO
 /Y3G025SzxfMnqR6Da0fSIIXEVXE3A3ghkvcEF3oupVuGvOA5EvUcXJT8d/ZkQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=gTEtZe47
Subject: Re: [Buildroot] [PATCH 1/1] package/libjxl: bump to version 0.11.0
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

On Mon,  7 Oct 2024 22:28:22 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For release notes since v0.10.3, see:
> https://github.com/libjxl/libjxl/releases/tag/v0.11.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8014840254
> ---
>  package/libjxl/libjxl.hash | 2 +-
>  package/libjxl/libjxl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
