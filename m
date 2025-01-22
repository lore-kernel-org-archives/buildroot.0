Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A54C02181
	for <buildroot@archiver.kernel.org>; Wed, 22 Jan 2025 20:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71164410C5;
	Wed, 22 Jan 2025 20:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2JDeMXRdLAA; Wed, 22 Jan 2025 20:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BCE4410E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BCE4410E6;
	Wed, 22 Jan 2025 20:35:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DC7FE959
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAA9783578
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V4UYEojCl_ct for <buildroot@buildroot.org>;
 Wed, 22 Jan 2025 20:35:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5475A80EFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5475A80EFA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5475A80EFA
 for <buildroot@buildroot.org>; Wed, 22 Jan 2025 20:35:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 076A85FFA3;
 Wed, 22 Jan 2025 21:35:23 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57160])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jan 2025 21:35:23 +0100
MIME-Version: 1.0
Date: Wed, 22 Jan 2025 21:35:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <b345d4f8d7c4dcb795ec6fcb9e4aaa5c5cd4553b.1737528518.git.yann.morin@orange.com>
References: <b345d4f8d7c4dcb795ec6fcb9e4aaa5c5cd4553b.1737528518.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <9380163c5c3c01d9e2e199a4510a442d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737578127;
 bh=CniIGgpOVuPnCNOfiUZlghRd1OJ9GWP96mC7l//qxtg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=od93sw8BWrOtWB8QlS8GUDlbxcSpGA4N2wDDV9kEhfrI3ZK0Qhji7ZZLd0F2GCr9J
 Pub2OwjlUJWjFvhu+wgwf48sSi2ejtz0I/LRdoifoToggPdFraHkbJcnm297ri5L+6
 FOm+AAXMqjtRyOyksGK7LIf6pOTuF6SQgW2U2j3quTw9mdfh3EbRWn2DDFlIm/to+n
 I47O2mR2CanGJyXTjbzDam9TyZYrJnt3ZbNo9KQQi396WHiHdd1CvX3Pow/MPor2eC
 +lAUsNeK+U5DP4rR2mG5PzKTfzAfK3s+zi2KLmDUBvnawG0DGWw/lvxAPh1AxUtCv5
 09Koc/FndnaXA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=od93sw8B
Subject: Re: [Buildroot] [PATCH v2] package/pkg-generic: store real version
 in legal manifest
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

On 22/01/2025 07:48, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The legal manifest currently stores the $(PKG)_VERSION variable.
> However, that variable undergoes a set of changes so that it is
> suitable for creating files and Makefile rules; that new value
> is purely a technical, internal detail of how Buildroot handles
> things.
> 
> In the legal manifest, we need access to the real value for the
> version, as this is what will allow actual references to the
> upstream package. If the version string is mangled, like slashes
> replaced with underscores, this introduces ambiguities as to what
> exactly the version is.
> 
> In Buildroot, there is no package, with a constant version, that
> exhibits that issue; for those packages where it is possible to
> set a custom git tree and version, like linux or uboot, such a
> custom tree can have tags with a slash (not a colon or a space,
> forbidden by git); packages in a br2-external can also use such
> version strings as well.
> 
> The packages that do have such versions are not legion, but they
> do exist. For example, Apache's ant buildsystem does use a slash
> in their reelase tags, like rel/1.10.15:
>     https://github.com/apache/ant/tags
> 
> Change the legal manifest to include the actual, original value
> as was set in the .mk file.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
