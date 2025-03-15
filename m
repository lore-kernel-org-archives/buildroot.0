Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB0EC28B2F
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 00:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C8BF607BB;
	Sat, 15 Mar 2025 00:22:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7G1caoHeiXV; Sat, 15 Mar 2025 00:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C11CC6121E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C11CC6121E;
	Sat, 15 Mar 2025 00:22:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3FC8EA
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 00:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3EE24242E
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 00:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R-R1bZ-37FHB for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 00:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F3A542429
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F3A542429
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F3A542429
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 00:22:52 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:adce:9a58:bcbc:dc56])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 55FE1780316;
 Sat, 15 Mar 2025 01:22:44 +0100 (CET)
Date: Sat, 15 Mar 2025 01:22:44 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, 
 Brandon Maier <Brandon.Maier@collins.com>, Julien Olivain <ju.o@free.fr>, 
 Romain Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <cakbsr7cr7tvxi3h365fmoau34bdwrlkkuye5k2zifthwtepbn@ulltkokquvh2>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-7-olteanv@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250302215219.1276480-7-olteanv@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741998170;
 bh=9zVH1a1UiGvjKiZXf9GmH+gV9rIS/y15uLfz3Pe3INc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d8k8vIgIx6lj2QN67xoa+IbkaxsJ+fmHk+LEe4ILI4fQtigpC4D70EtWex05VOxZ6
 S+tcRZ8sAwz64yj5IgD/K8Apf5q7oSrpSe4rrqLeQ+MswWiL6P2I0axt9DkH3uXG0o
 Jojmy4TfLtJe+lR4/9EP4M4XQQwZkcdXPnzhQcvjDPBiGegQ0kcWqu+KBpaE47rXer
 tp9DXNOAYINUaS4NhovjaFUjN4KY66dyd+LnxZ7HstgH/gOD2OBkhlifZSZlV5MjMQ
 Uwu4VXDEZwaUnnoCk7TahGN2Bf8q1xShGM92GvQJPayCmpjJ2cJ/expB7Pji+L2Eoy
 1wGn1vTOXKWZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=d8k8vIgI
Subject: Re: [Buildroot] [PATCH 06/15] package/qoriq-mc-utils: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 02, 2025 at 11:52:10PM +0100, Vladimir Oltean wrote:
> The configuration files for the MC firmware binary are distributed
> through a separate repository on GitHub, and need a different package.
> They are licensed differently than the firmware itself, and unlike the
> firmware, they are customizable.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

LGTM

Reviewed-by: Vincent Jardin <vjardin@free.fr>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
