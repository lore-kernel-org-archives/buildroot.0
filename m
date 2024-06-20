Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBF1C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 20:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC7E4845E3;
	Thu, 20 Jun 2024 20:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zQ6yAN61_L3y; Thu, 20 Jun 2024 20:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BFF20845F2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFF20845F2;
	Thu, 20 Jun 2024 20:22:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71F851BF83B
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 20:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F8BC6152A
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 20:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r0Nz64hcXqR3 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 20:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 00BF3613A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00BF3613A9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00BF3613A9
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 20:22:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id AAB8F13F8B8;
 Thu, 20 Jun 2024 22:22:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 20 Jun 2024 22:22:00 +0200
Date: Thu, 20 Jun 2024 22:22:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <ZnSPaHGXWwfvoJuq@landeda>
References: <20240616070849.2608438-1-yann.morin.1998@free.fr>
 <CH2PR12MB500403A5982F031A0ABA5AA1F0C82@CH2PR12MB5004.namprd12.prod.outlook.com>
 <CH2PR12MB5004E97FDF74EEC7C7B0A4E6F0C82@CH2PR12MB5004.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR12MB5004E97FDF74EEC7C7B0A4E6F0C82@CH2PR12MB5004.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718914922;
 bh=x6PzKIAFGx2rqXXEGv3xHprQwp8zAYyjTDA3GTUfeuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pDzSIA/vsxmMmVg7dSDmiB3Z8FKJQI3Sc1hhFqAnP5aIJZBws+WVUHYoyg29dpPvs
 j/zxJsgN7N7eeG7M8yp2aN4c/4n8zCJDX2R1XQDfurUSQ7Tx8UweX35h942RvmOZ2I
 VzdWMQBBBl9s9XtV3w7NWErtV5fnrsX/HsnT2R0UuK/R0decNfv7jYebJ9H+pHKDv1
 z3nOmRi1E3lRojewp+M9MAc7MPe/3mCn5H6WkAEWjmhV+t93t+jafN+cp/rN1IktB6
 PN1LlGlpUOGGKmBgPtCb3MXDiMhm4bKGFyK0iPWOQ4I+4F/OevsuX2ryRazgQL2hyb
 u7A6BHDrthfOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pDzSIA/v
Subject: Re: [Buildroot] [PATCH] board/xilinx: re-add hash file for
 xilinx-prebuilt
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Neal, All,

On 2024-06-20 13:42 +0000, Frager, Neal via buildroot spake thusly:
[--SNIP--]
> > diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> > new file mode 100644
> > index 0000000000..c955cd79f5
> > --- /dev/null
> > +++ b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
> > @@ -0,0 +1,2 @@
> > +# Locally calculated
> > +sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
> Actually, wouldn't this be better if this was just a link to the hash in the
> /boot/xilinx-prebuilt directory?

I don't think so: the purpose of the per-board hash files is so that the
package can be updated without forcing the boards to be updated.

We want that the versions of "critical" packages be pinned in the
defconfig files, so that an update of the version be explicit: updating
the version should be done by someone that can test on the actual
hardware.

If you do the symlink as you suggest, then we'd have to bump the boards
exactly whjen the packag eis updated, or the version used by the
defconfigs would no longer be present in the hash file.

Regards,
Yann E. MORIN.

> Also, if you are the one who applies the xilinx-source patch set, could you
> make sure to do the same thing with the hash file for the xilinx-source
> package?
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20240618074922.3555070-1-neal.frager@amd.com/
> 
> Best regards,
> Neal Frager
> AMD
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
