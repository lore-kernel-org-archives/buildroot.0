Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A247C3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 09:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 503A54067D;
	Sun, 13 Apr 2025 09:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoJoeO5AN4Yt; Sun, 13 Apr 2025 09:45:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8306B407E8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8306B407E8;
	Sun, 13 Apr 2025 09:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BF8EF108
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC24640415
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:45:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wMcS4AM5hBL9 for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 09:45:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFFF7400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFFF7400CE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFFF7400CE
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 09:45:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 13580B00583;
 Sun, 13 Apr 2025 11:44:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Apr 2025 11:44:59 +0200
MIME-Version: 1.0
Date: Sun, 13 Apr 2025 11:44:59 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250328180427.3434693-5-olteanv@gmail.com>
References: <20250328180427.3434693-1-olteanv@gmail.com>
 <20250328180427.3434693-5-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e1f065426213f7cc79587e788fb8f79b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744537506;
 bh=mciEFvIlq75sQ7O7pmrrICXfak51wA2B8kYB9pOqemM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jAHAvPvjqmvwsyvyf9Y8SiOPlxLjZasBL5pkf1t3oOnAcsys5M7+FXRUh8DZlS0a6
 /03u88ddSa5YiALOj93y6fPkJVaYGiX9F1krRlKihEA9auRF4gGXEC5bec/igt/iTo
 v0vhydr45UMRhp7nQ3bJx10/a6jdgxNVErBUp5kpJxT5VkgrWijxCEGwMkvkGGRDh3
 RcCBVhOFo1Jx7OacSukcXzKyGNW90siCJhS2zBlCGTXrPhMrrniknKW7Q8M0zcmlkf
 4tnS/NywCPXFpo4oJC5+AE5L7vCoruz04KXSzym/OQV3oJtmA66dYc7K917QfV5jfI
 jRe95ssKKGhZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jAHAvPvj
Subject: Re: [Buildroot] [PATCH v2 04/18] package/qoriq-cadence-dp-firmware:
 sync with NXP Yocto download site
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

On 28/03/2025 19:04, Vladimir Oltean wrote:
> The updated download path was taken from the Yocto BSP at
> https://github.com/nxp-qoriq/yocto-sdk.
> 
> The recipe is here:
> https://github.com/Freescale/meta-freescale/blob/master/recipes-bsp/dp-firmware-cadence/dp-firmware-cadence_22.04.bb
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

I applied a second bacth of this series, which bumps existing QorIQ
packages and defconfigs to the lf-6.12.3-1.0.0 BSP.

I slightly changed the commit order, to bump package version first
and all the defconfigs after. I also reworked few patches to add
extra info in the commit log and fix few things.

Applied to master, thanks.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
