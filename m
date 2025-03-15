Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE85C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 13:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 680EC40BDE;
	Sat, 15 Mar 2025 13:05:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0k4uXldEyqT; Sat, 15 Mar 2025 13:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4583F40BAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4583F40BAD;
	Sat, 15 Mar 2025 13:05:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B5DF61
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 13:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D3D1607B8
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 13:05:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id op0YZqM7xNK8 for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 13:05:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D3C1A60814
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3C1A60814
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3C1A60814
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 13:05:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 6B52D2003AE;
 Sat, 15 Mar 2025 14:05:06 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Mar 2025 14:05:06 +0100
MIME-Version: 1.0
Date: Sat, 15 Mar 2025 14:05:06 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250302215219.1276480-6-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-6-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <482493f17e63d2b4cb285b50049ed8e6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742043913;
 bh=1RJObUmqEldFdumlcQj4PP72u8omb107bq/VxkTwN74=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HhBlUx2NLq2cBHtylGgvtonODYLogSub9IUDif4hx6qYl052VLTfJTqhS/voZJhqh
 ersgz0NGJsbh7FvMRP7RjUfXTxrIPm4uCADc8QbnIo6kno27q1EUJXbSFQLt4s85B9
 KSx9kdzecOE9DNMdHNEocAto/XaEgA5BdcyIU7SvenFhINx4SZbL7UuqyK/O4fy0m/
 axwcKy2A9EDuBunLdQDfKYCm69JToXN0+BUy4v4ujPCHMHK9SXwSEb7OGeCDPlvvZN
 NkxWzJ5Cn16gmGXshNxn6Oi2GdVDVNVUdPYAN7BBjNlk2flAWawS78QpSnWJYhVpis
 qDgHzrpt3iKBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HhBlUx2N
Subject: Re: [Buildroot] [PATCH 05/15] package/qoriq-mc-binary: new package
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

Hi Vladimir, All,

On 02/03/2025 22:52, Vladimir Oltean wrote:
> Add a package which deploys the NXP MC (Management Complex) firmware
> to the target. This is necessary for NXP DPAA2 SoCs (LS1088A, LS2080A,
> LS2088A, LX2160A).
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
[...]
> diff --git a/package/qoriq-mc-binary/Config.in 
> b/package/qoriq-mc-binary/Config.in
> new file mode 100644
> index 000000000000..fc340e9c3ab8
> --- /dev/null
> +++ b/package/qoriq-mc-binary/Config.in
> @@ -0,0 +1,47 @@
> +config BR2_PACKAGE_QORIQ_MC_BINARY
> +	bool "qoriq-mc-binary"
> +	help
> +	  The Management Complex (MC) is a key component of the
> +	  networking subsystem named DPAA2 (Data Path Acceleration
> +	  Architecture, second version) in some NXP Layerscape SoCs.
> +
> +	  The MC coprocessor runs a closed-source, NXP-supplied
> +	  firmware image that simplifies and abstracts the allocation
> +	  and configuration of the networking hardware primitives into
> +	  DPAA2 "objects".

The DPAA2 Management Complex firmwares are also provided in the 
linux-firmware
repository. See:
https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/dpaa2/mc?h=20250311

Note that: 1. the MC firmwares in the linux-firmware are older compare 
to
the version you are introducing here and 2. the dpaa2/mc firmwares are
currently not supported by the Buildroot linux-firmware recipe.

Could you add a comment in the commit log describing why we are not
adding the dpaa2/mc support in the linux-firmware package, please?
For example, is this package/version recommended to be used with
the nxp-qoriq/linux kernel tree?

Finally, do you think there is a value to add such a dpaa2/mc firmwares 
support
in the linux-firmware package? For example, to be used with the upstream
kernel tree?

> +
> +	  https://github.com/nxp-qoriq/qoriq-mc-binary
> +

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
