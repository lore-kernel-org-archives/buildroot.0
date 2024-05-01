Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A78C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 21:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79AB180A75;
	Wed,  1 May 2024 21:33:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U3-jZms84B0F; Wed,  1 May 2024 21:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7349282154
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7349282154;
	Wed,  1 May 2024 21:33:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FDD01BF384
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C12C82156
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 21:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7j4dQzAykdvV for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 21:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82EEE82151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82EEE82151
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82EEE82151
 for <buildroot@buildroot.org>; Wed,  1 May 2024 21:33:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74286E0005;
 Wed,  1 May 2024 21:33:34 +0000 (UTC)
Date: Wed, 1 May 2024 23:33:33 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240501233333.7bf8f247@windsurf>
In-Reply-To: <20240415220237.333222-1-ju.o@free.fr>
References: <20240415220237.333222-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714599214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mLiAmVy3rb9nBl2F52tm3SW3E6ldf/T0koOUYHcn0I=;
 b=kePzxKE7BQqlkuWHZElLjlZLNNys/P2/BcXqWwqvdZMmjjDmjf2C4CiRohVQ1VEvsrZp1g
 Jx6dNs0oOYqbXSW7lBot+rWKGDrXYhGxY44Yr0JYoQGK5RgnbKhK3KA/YDixmWkzwuXgU5
 BOmlbntYd1fG0gtRlquqsHKeXn5OlSqEeXzHCqWSp3NibA2SpScLy6VM7feRCwW7RPj8uH
 IRnTECWt79jL7HdTHQNiqC4q7JSgAThFsDQf41O5kLg90cUJQjVuPL155ojXx3F4rxryoR
 WGC+5VdujPHzNHpNswYi454WG2kAVFvRzchwRldXf7Yo7b0Lh0agARqjQ73A+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kePzxKE7
Subject: Re: [Buildroot] [PATCH 1/1] package/gnu-efi: add BR2_RISCV_64 in
 _ARCH_SUPPORTS
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 16 Apr 2024 00:02:37 +0200
Julien Olivain <ju.o@free.fr> wrote:

> gnu-efi RISC-V 64bit support was introduced in commit [1], first
> included in version 3.0.14.
> 
> This commit adds this architecture in _ARCH_SUPPORTS.
> 
> [1] https://sourceforge.net/p/gnu-efi/code/ci/b95f138fa1550040e68ac3dd34cfce7d148d7984
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  package/gnu-efi/Config.in  | 1 +
>  package/gnu-efi/gnu-efi.mk | 2 ++
>  2 files changed, 3 insertions(+)

Applied to master after changing the commit title to "enable on RISC-V
64-bit". Indeed your title "add BR2_RISCV_64 in _ARCH_SUPPORTS" is how
we do this, but really the aim of the commit is to make the package
available on RISC-V 64-bit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
