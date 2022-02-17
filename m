Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553FBC433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 12:13:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C14FE40359;
	Thu, 17 Feb 2022 12:13:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7dtKPFaVP4_w; Thu, 17 Feb 2022 12:13:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C6C84017B;
	Thu, 17 Feb 2022 12:13:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1249E1BF3DF
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 12:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D3BD4017B
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 12:13:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnTVftMUrLNp for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 12:13:17 +0000 (UTC)
X-Greylist: delayed 03:38:32 by SQLgrey-1.8.0
Received: from 6.mo575.mail-out.ovh.net (6.mo575.mail-out.ovh.net
 [46.105.63.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BF3D40160
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 12:13:17 +0000 (UTC)
Received: from player715.ha.ovh.net (unknown [10.109.143.220])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 67F4722F97
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 08:34:42 +0000 (UTC)
Received: from dopsi.ch (unknown [147.87.105.170])
 (Authenticated sender: dopsi@dopsi.ch)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id 7EC9A2756992D
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 08:34:41 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0055026af58-8654-4e18-83e8-067895d3424c,
 D4DD75BF2AA26248AF7E8307681A94F109E5075B) smtp.auth=dopsi@dopsi.ch
X-OVh-ClientIp: 147.87.105.170
Message-ID: <18f64b226c55f9ff8c0bdc109793dc9a0e0657ce.camel@dopsi.ch>
From: Simon Doppler <dopsi@dopsi.ch>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 09:34:40 +0100
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-Ovh-Tracer-Id: 621778227296778357
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 50
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeejgdduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucgovfgvgihtqfhnlhihqddqteefjeefqddtgeculdehtddmnecujfgurhepkffuhffvffgtfggggfesthejredttderjeenucfhrhhomhepufhimhhonhcuffhophhplhgvrhcuoeguohhpshhiseguohhpshhirdgthheqnecuggftrfgrthhtvghrnhepteevvefgleelfffftdejieetteetkeekffefhfeihefhtdetveegkeegjeefvdfhnecuffhomhgrihhnpehgihhtlhgrsgdrtghomhenucfkpheptddrtddrtddrtddpudegjedrkeejrddutdehrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhejudehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepughophhsihesughophhsihdrtghhpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
Subject: [Buildroot] Dependency detection issue in external tree
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I am currently working on debugging early boot on a STM32MP1 based
board and I would like to use stm32wrapper4dbg to wrap the FSBL.
Since we use a fixed version of Buildroot, I have would like to keep
the packages in an external tree (we will work on upstreaming them in
the future).

In the external.mk file, when adding an extra dependency with 

    ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-stm32wrapper4dbg
    
the dependency shows up in the dependency graph, in the `make arm-
trusted-firmware-show-depends` output but not in `make arm-trusted-
firmware-show-build-order` output.
It does also not build the host-stm32wrapper4dbg package before the
arm-trusted-firmware package.

The hook that wraps the FSBL does however work when I build host-
stm32wrapper4dbg before building the rest of the system.

Is what I want to do actually supported (adding a dependency in an
external.mk file)?
Do you have any idea, when I should look to fix this dependency issue?

I have set up a minimal example here: 
https://gitlab.com/dopsi/mve-br2-external-dep (look at the README.md
for details).

Best regards

Simon Doppler

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
