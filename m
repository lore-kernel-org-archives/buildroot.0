Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43791C52D7C
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 16:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 041B6402A3;
	Fri, 23 Aug 2024 16:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Y48U_Fa1z3o; Fri, 23 Aug 2024 16:58:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7F48402BC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7F48402BC;
	Fri, 23 Aug 2024 16:58:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75ED31BF31F
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 625EC840D3
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 16:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NBiLnk2uK0nL for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 16:58:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6EDA840D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6EDA840D2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6EDA840D2
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 16:58:21 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AF841C0002;
 Fri, 23 Aug 2024 16:58:18 +0000 (UTC)
Date: Fri, 23 Aug 2024 18:58:17 +0200
To: Vincent Jardin <vjardin@free.fr>
Message-ID: <20240823185817.4658f57a@windsurf>
In-Reply-To: <20240822163630.37849-2-vjardin@free.fr>
References: <20240822134112.32868-1-vjardin@free.fr>
 <20240822163630.37849-1-vjardin@free.fr>
 <20240822163630.37849-2-vjardin@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1724432298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LMAGC9iK6aATKmRmwkkB0JGvZO28yFvLCpvXvXIofco=;
 b=Nle4k8YcibR7EWtCh2O4RaCFkEzPDc2U+97llUGPesl73rhtvDH8LrcjR9xDYFlUHRuKk2
 lXjlEt9pLF/q4saUghNzkTLaCZjdoGuo1QLdqjCcdtO7E1wtKi7w2XF4AbnhmPFR1nzCXW
 e1ouE8JLnEng7sDdgseDkLdBdwcOA4smLp8dBX9oZaeY5TkUkBV4v3qSz7EwTpKB34sgeu
 QVYI3ABVBxhhgyFLPiYZZnzoXMwpM4zyb2fvpekSUY7j7DV9syEnwtGyCAFUYZ+gQbsprI
 MhRwEsWobS89YW4kTtOu3TjRPEBSbV/zwMzrl4FLW87wi/3lTg7F+ucs85oWQA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Nle4k8Yc
Subject: Re: [Buildroot] [PATCH v2 1/1] package/frr: update to 9.1.1
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Vincent,

On Thu, 22 Aug 2024 18:36:30 +0200
Vincent Jardin <vjardin@free.fr> wrote:

> Update to the latest 9.x version.
> Protobuf becomes mandatory.
> 
> Update hash for COPYING too
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Thanks for the patch, but it will need more work, see below.

> diff --git a/package/frr/Config.in b/package/frr/Config.in
> index 0afd8c61a2..462c58f0da 100644
> --- a/package/frr/Config.in
> +++ b/package/frr/Config.in
> @@ -10,6 +10,7 @@ config BR2_PACKAGE_FRR
>  	select BR2_PACKAGE_LIBYANG
>  	select BR2_PACKAGE_READLINE
>  	select BR2_PACKAGE_JSON_C
> +	select BR2_PACKAGE_PROTOBUF_C

When you "select" an option, you have to replicate its depends on. So
here, BR2_PACKAGE_PROTOBUF_C has:

        depends on BR2_INSTALL_LIBSTDCPP
        depends on BR2_TOOLCHAIN_HAS_THREADS
        # host-protobuf only builds on certain architectures
        depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
        depends on BR2_HOST_GCC_AT_LEAST_7 # c++17 for host variant

So you need to replicate those dependencies to BR2_PACKAGE_FRR:

        depends on BR2_INSTALL_LIBSTDCPP # protobuf-c
        depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf-c
        depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # protobuf-c
        depends on BR2_HOST_GCC_AT_LEAST_7 # protobuf-c

And update the Config.in comment as follows:

comment "frr needs a toolchain w/ threads, dynamic library, C++, host gcc >= 7"
        depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS
        depends on BR2_TOOLCHAIN_HAS_SYNC_4
        depends on BR2_USE_MMU
        depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
		!BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_7

> diff --git a/package/frr/frr.hash b/package/frr/frr.hash
> index 4a61084bae..eb88507a9f 100644
> --- a/package/frr/frr.hash
> +++ b/package/frr/frr.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7ae9d8bafc65bb5d0f21061ac61dbc6cf93b2b05a5dae9e5eec72ed42388551e  frr-8.5.4.tar.gz
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> +sha256  6eb254c72dca867fefffd5ded80a6c2d5ce8df223ce93263302db4b8bfbb19c4  frr-9.1.1.tar.gz
> +sha256  7bf053957d6c38e39a06a112c60ff35b228d3bd03edbe8c9a03508b051128d16  COPYING

The change of license file hash must be explained in the commit log.
But actually, it is quite tricky. Basically the whole text of the GPLv2
has been replaced by just:

=====

The FRRouting project consists of parts with various licenses.  Any particular
file's license should be indicated at the top of the file with an SPDX License
identifier.

The full text of all licenses used can be found in doc/licenses.

The composite work (binary) resulting from compiling FRR is thought to always
be distributable under GPLv2 or later.  However, please note that this is
simply an expression of the community's best-effort understanding, it is not a
legal statement, guarantee, or advice of any kind.  If necessary, please
familiarize yourself with the specifics and/or consult a lawyer.

Also please be advised that FRR's documentation is, for historical reasons,
licensed under a custom (but relatively permissive) license.  This license
dates back to the GNU Zebra project and cannot easily be changed into something
more common, short of rewriting the entire documentation.

====

So it means that FRR_LICENSE must be changed to GPL-2.0+.

Also, it probably means that all files in doc/licenses/ must be added
to FRR_LICENSE_FILES most likely, and their hash added.

One thing that's a bit worrying is that they have the GPL-3.0 license
text in there. I don't know which parts of their code base has a
GPL-3.0 license, but if it's linked into the "composite work", then its
license clearly isn't GPL-2.0+.

It would be useful to clarify which part are under which license,
especially the GPL-3.0 part, which some people may not want to have in
their builds.

So this bump that looked simple is in the end not that trivial I'm
afraid :-/

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
