Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE381E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 08:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8023440179;
	Fri, 10 Jan 2025 08:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NrcJJEuTHxHs; Fri, 10 Jan 2025 08:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8C2E401D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8C2E401D3;
	Fri, 10 Jan 2025 08:08:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4494D76C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25120400FF
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLn8cKlh81QW for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 08:08:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EBC204024C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EBC204024C
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBC204024C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 08:08:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 433D2FF808;
 Fri, 10 Jan 2025 08:08:18 +0000 (UTC)
Date: Fri, 10 Jan 2025 09:08:13 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250110090813.027b8e96@booty>
In-Reply-To: <20250107151521.1655280-2-neal.frager@amd.com>
References: <20250107151521.1655280-1-neal.frager@amd.com>
 <20250107151521.1655280-2-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736496499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8DMBPWZejbIfoVsol8cyDu7OqH6NEovYmz6tsFDOjYY=;
 b=dJirZbtMs3wz4o+iaCZMR2gy5XMBeFcMI3Npj7R/npPa8c4agkVz5MToUbXDxhT2gcDLzT
 oB0/TStaJxOHMyp7/cKNXGl0NfFCLAm8CpOs2tvopiByQwYY2QZ16GDDDAokaO729b64Ba
 klRrSOmeXnkcelXHY/q1sPC376j5U7gatB7JhqLJ+JeRrxRaPKWZhvTUEOpXyKtJoLjpK1
 GI7p8g9q6eW2GEWPx4eaKUmxNTlMHj+oJFXoXxrTnpsj3rARgV/VBwmIFCbEr+Tij0Aq5D
 j0LVne6zw0ILg+pkDidcc000mkqxayGJjuKpV7FlRXGouRhJp8KHPJb3LwLyrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dJirZbtM
Subject: Re: [Buildroot] [PATCH v1 2/2] configs/zynqmp|versal: bump
 xilinx-prebuilt to xilinx_v2024.2_update1
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: ibai.erkiaga-elorza@amd.com, brandon.maier@collins.com, ju.o@free.fr,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org, romain.naour@smile.fr,
 michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 7 Jan 2025 15:15:21 +0000
Neal Frager <neal.frager@amd.com> wrote:

> Bump the zynqmp and versal defconfigs to use the xilinx-prebuilt
> xilinx_v2024.2_update1 release tag instead of the xilinx_v2024.2 release tag.
> 
> The zynqmp_kria defconfigs were still using the old default xilinx_v2024.1
> release tag, so they have automatically updated to the new
> xilinx_v2024.2_update1 release.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
