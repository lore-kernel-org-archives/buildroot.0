Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AD3C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FE8941825;
	Mon,  6 Nov 2023 21:07:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FE8941825
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QmdqNartA-wZ; Mon,  6 Nov 2023 21:07:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B23841FE1;
	Mon,  6 Nov 2023 21:07:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B23841FE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA8871BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFA18415BD
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFA18415BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZIuFRULXriQp for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:06:16 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACA8C414FA
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACA8C414FA
Received: by mail.gandi.net (Postfix) with ESMTPSA id CBE45C0002;
 Mon,  6 Nov 2023 21:06:13 +0000 (UTC)
Date: Mon, 6 Nov 2023 22:06:13 +0100
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231106220613.6f55cf92@windsurf>
In-Reply-To: <20231106204715.53979-1-fontaine.fabrice@gmail.com>
References: <20231106204715.53979-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1699304774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NeC3LSI4NeA8PTCfc54ebFv/R/Mn7O9yd1d7HnEW3p4=;
 b=cnAvdNvTHGRePACiVLWa6DTznmgJA9df4J4XxFoxjKFBauFh8VKSNpQYyqwTjvfKx9xiAK
 IxmLj8JR8+/FaeJR7mDcDqAMTmaPpyfsl005b3glqnP6HHV5R6dK2ov3aSDYjcqiWAdykH
 umdGtGKKDd0/rzO47/Sl2knC+9744B7uU4xDiLyFCdF0pnpllNEMPampcUlhrlP3s6UK8X
 2Ae8k7opIDDqFyZ/atEHhSxbVmWU7N5f6AIOEl2wtHYgxCooEihDvU+6y6NZC6U2wQL+8D
 GPHP1EytkgL5YCqW90fVcz36MRQn1A0gMOONr9HQ6eoxBBdmHEWHTzpOXopCXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cnAvdNvT
Subject: Re: [Buildroot] [PATCH 1/1] package/civetweb: fix build with Lua 5.1
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

On Mon,  6 Nov 2023 21:47:15 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with Lua 5.1 raised since bump to
> version 1.16 in commit fcc4ea595a07f47c86f4d52084dc1317473d2f40 and
> https://github.com/civetweb/civetweb/commit/82ba5a04c9a1ca980d8dfe00c18e086017e8ab25:
> 
> /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-gnu/13.2.0/../../../../sh4-buildroot-linux-gnu/bin/ld: out/src/third_party/lua_struct.o: in function `luaopen_struct':
> lua_struct.c:(.text+0xce4): undefined reference to `luaL_newlib'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7459b504e52f473c5830c0f3c7bffd037f6e1770
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...kefile.in-lua-fix-build-with-Lua-5.1.patch | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 package/civetweb/0001-resources-Makefile.in-lua-fix-build-with-Lua-5.1.patch

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
