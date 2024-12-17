Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 740A9E77184
	for <buildroot@archiver.kernel.org>; Tue, 17 Dec 2024 21:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27EEE84996;
	Tue, 17 Dec 2024 21:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dFVlUioxfP3U; Tue, 17 Dec 2024 21:44:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4863E849A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4863E849A1;
	Tue, 17 Dec 2024 21:44:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BB44C0
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 21:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AEED40339
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 21:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhFAreXH0pVV for <buildroot@buildroot.org>;
 Tue, 17 Dec 2024 21:44:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6120240395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6120240395
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6120240395
 for <buildroot@buildroot.org>; Tue, 17 Dec 2024 21:44:39 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 99C5F2003CA;
 Tue, 17 Dec 2024 22:44:34 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44852])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Dec 2024 22:44:34 +0100
MIME-Version: 1.0
Date: Tue, 17 Dec 2024 22:44:34 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Miqu=C3=A8l_Raynal?=
 <miquel.raynal@bootlin.com>
In-Reply-To: <20241216-add_gdb_hash-v2-1-4eeb897a9f25@bootlin.com>
References: <20241216-add_gdb_hash-v2-1-4eeb897a9f25@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <911dc716d6e5f87fa825b07dca9e9a52@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734471877;
 bh=XDeCDInCMY24+GvLYthsqiki2Hd6R6s1yjNbLn/oh7g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dvmKqddqJo5+sbz6qVFxHrU3pdVhPZPHKxKotiBvG5Nd+HKJs7mHs3eCGcM78yqlF
 Zb0QAUflpTZSmLsy2c7piAXJA56nbRvwf4HT7W3w+4vC3AvV6a/cmU7Z0qyyZLG1V3
 eMiePKu7Ip4VluD51k1PSLD01TEdGDsi7MQ9VYi/5p/15fItSzxgpjHbbXeYOBwyCa
 zMU48+q5+WEC7gccYxuoCCHd8Z2dY8z+1xQbnojPGd89/4qsnav+yddVvPLjFDJF9v
 5EwJLTWM74OuYDG7ql7HqT02keq6w9KoOFgqqceyUVDx1CjBf4mD83tFKxQpZD+aG7
 61lTfARNB1nFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dvmKqddq
Subject: Re: [Buildroot] [PATCH v2] package/gdb: add hash of licence files
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

On 16/12/2024 22:16, Thomas Bonnefille via buildroot wrote:
> Adds sha256 hash of the license files for GDB.
> 
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Applied to master, thanks.

> ---
> Changes in v2:
> - Use sha256 instead of sha512
> - Add one more whitespace between the type of hash and the hash of the
>   file
> - Link to v1: 
> https://lore.kernel.org/r/20241211-add_gdb_hash-v1-1-eb02d192b6c1@bootlin.com
> ---
>  package/gdb/gdb.hash | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
> index 
> 6cf55a675dae3d373f9b32f795aec469049464f0..3d1809a2f97638b7c6a6d01e0c51e9a8b798a9ea 
> 100644
> --- a/package/gdb/gdb.hash
> +++ b/package/gdb/gdb.hash
> @@ -5,3 +5,9 @@ sha512  
> 0217434073023a8b8316088bf3ee95d53a1b6a7897f6269095429016a8900f9a05e130c3
> 
>  # Locally calculated (fetched from Github)
>  sha512  
> 3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d 
>  gdb-arc-2023.09-release.tar.gz
> +
> +# Locally calculated (fetched from gcc.gnu.org)
> +sha256  
> 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  
> COPYING
> +sha256  
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  
> COPYING3
> +sha256  
> a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  
> COPYING3.LIB
> +sha256  
> 56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  
> COPYING.LIB
> 
> ---
> base-commit: c12008448e6d0f78774b386fb0f66a14c3064eed
> change-id: 20241211-add_gdb_hash-34bc5fddec5d
> 
> Best regards,
> --
> Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
