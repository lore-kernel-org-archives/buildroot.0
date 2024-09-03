Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2F6CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 432C940A02;
	Tue,  3 Sep 2024 19:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIhoL3MEv18a; Tue,  3 Sep 2024 19:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB24840A1F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB24840A1F;
	Tue,  3 Sep 2024 19:20:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E3411BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1876640269
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6ZaxqJgV-Fd for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:20:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D8AD40257
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D8AD40257
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D8AD40257
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:20:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F01FEFF804;
 Tue,  3 Sep 2024 19:20:18 +0000 (UTC)
Date: Tue, 3 Sep 2024 21:20:17 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20240903212017.5f4f179c@windsurf>
In-Reply-To: <20240902205707.239163-1-dario.binacchi@amarulasolutions.com>
References: <20240902205707.239163-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1725391219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0422sZrM+u34GmUibneJksR8VyfVUFRfzvqQU2p/g0U=;
 b=eYc1CHQMkEXOHPFKeJSOoGgAIrILD56lntjRUaJ6hPzZzxUAWs1/h9EnNfJvvb8uao5iWV
 OTH5ds7hcSBSOgGvgPcWoS+0wuNwTDe5JV6k3IiFvljzZ34ieRMbmPLROh7H7U+pc3+JjR
 zH+wi0dfQufeJd/nzlPSgy2Op2+q6o96jlg1kU5jRJtWXbR4Ng62s2EdDS6GuNvK327Gbw
 jthBhddWoHViZZPPDwBIYxnUljwH2MIzr77RJ/sSLwTgj9Fwcl/L2N2Eg22noZ+fYGA6/b
 pp8wsVJTzw7Ez2UOrWFOg0hJTgJofZh+AgUtueVlPKG6IuE6FDPBKMDL+3UjKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eYc1CHQM
Subject: Re: [Buildroot] [PATCH v4 1/2] package/babeld: update URL site
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
Cc: linux-amarula@amarulasolutions.com, "Yann E .
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  2 Sep 2024 22:57:06 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> As reported in [1], version 1.9.2 has been moved to another archive, and
> it is recommended to use https://github.com/jech/babeld as the official
> repository.
> 
> The use of the github macro:
> 
> $(call github,jech,babeld,babeld-$(BABELD_VERSION))
> 
> would have downloaded a file with the same name (e.g. babeld-1.9.2.tar.gz)
> but with a different hash from the one downloaded from the previous URL,
> creating unacceptable backward compatibility issues.
> Therefore, it was decided to download the package via the git method. In
> this way, the downloaded file is babeld-babeld-1.9.2-git4.tar.gz, thus
> with a different name, to which its SHA can be associated without side
> effects, except for breaking the release monitoring process.
> Unfortunately, for now, we will have to live with this limitation.
> 
> Particularly interesting are the explanations provided by Yann E. Morin,
> which you can find in [2], that guided the creation of this patch.
> 
> Fixes:
> - http://autobuild.buildroot.org/results/2447060c86acf1bd8d6ee0bcf8f9b6adcdfc50c9
> 
> [1] https://alioth-lists.debian.net/pipermail/babel-users/2024-August/004187.html
> [2] https://patchwork.ozlabs.org/project/buildroot/patch/20240901063634.3504315-1-dario.binacchi@amarulasolutions.com/
> 
> Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> Changes v3 -> v4:
>   - Use the git method to download the package instead of the github
>     macro.

Series applied to master, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
