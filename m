Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B41E31077603
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AB0060BE7;
	Wed, 18 Mar 2026 18:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z7YKbo41vjAE; Wed, 18 Mar 2026 18:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF68860BB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773857593;
	bh=jVai/yKoMnev8vm/CCN6En10UdOOv1Q7Kh/ckjSzJH8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FS/X21sLzPFMEiaWDSEiBusArQ//lDlXu8RT5IkAcMzkTeCHyzIat6+MAkWSb16Nf
	 7vU19ogJDRRQ2QjDBVLLEbXAlgBjiSKgjRv4udEYYI5NQvbk5vmYWMJd9FVJUoS1CI
	 d9T5Yi0JH+5i0UUaaay0GkhgUEyQSywEwTurZ3XPIkItSUYbcQvTWEXfZiBJzKVp/1
	 dm/TJise3cF0rrWYRAqWFWrq2HBDrm4HwF+xie+Vh1XHiiXioPs9C4Cy9m4LE60BIz
	 XKxwYkJtRa7T962c3ex/bs6Ji1qxAq7T/p9o6ynP98XSy9D6BzEHbBmNMkjMFU/m6C
	 zPrPsuK+EX9ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF68860BB3;
	Wed, 18 Mar 2026 18:13:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F9EC1B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 712424167C
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:13:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBWmZxUrrnVk for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:13:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F82441678
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F82441678
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F82441678
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:13:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id B9D4F6013F;
 Wed, 18 Mar 2026 19:12:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 19:12:57 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 19:12:57 +0100
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 steven.hill@collins.com, luca.ceresoli@bootlin.com, yann.morin@orange.com,
 brandon.maier@collins.com, fiona.klute@gmx.de, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr, michal.simek@amd.com, romain.naour@gmail.com
In-Reply-To: <20260318100457.1838670-1-neal.frager@amd.com>
References: <20260318100457.1838670-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <e2a30ce329ea45c4450f9be2a12b7278@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773857589;
 bh=FsFnGLG00nyQmTsClgsBWg/7Qy6PuJrF8xVZQkabnQ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=azH5Qd/BcLM8EnDwCF+gEQA7pGEbEd98WLMggIIETaDGmEW1GYJluLJH8VI6OXIDw
 S13srhI9FWmcGQTLyZ3QkL+RsR2ab5KjCdMQBnFZZgN6epDZcXZDH+oAkiSL6I0r3F
 z80c8Qs4XJKVAp4P0jh45QdePzA6cxeDuEynlGVHhqh32F2uJC2lPDd7kRQlEDbmlb
 1eBORwz7ppQYTZBLZVsxgompgorG2EiEjA4Oay8Fm/1hY7Z+IrC/fSQ724y507+vud
 JLp22g22apaicsC0lnpXP1VMgpygniOsFEYyCS0zJL+t/A9B3ONydQI211qYnyLzV9
 j8peKHkcJKl4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=azH5Qd/B
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: fix build issue if
 host-flex already built
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 18/03/2026 11:04, Neal Frager via buildroot wrote:
> Fix a silent build issue with the host-bootgen package if host-flex is 
> already
> built. The host-flex package will install a version of the flexlexer.h 
> header
> file that is not compatible with the version embedded in bootgen.
> 
> While the build will still 'succeed', the binary will not be correct. 
> This
> can be seen by just running the binary that is built. By default, 
> running
> bootgen without any parameters should print the help menu, but if the 
> wrong
> version of flexlexer.h is used, it will print the following instead:
> 
> $ output/host/bin/bootgen
> 
> ****** Bootgen v2025.1-Merged
>   **** Build date : Mar 18 2026-07:08:01
>     ** Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
>     ** Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights 
> Reserved.
> 
> ERROR: syntax error
> -h
> 
> Add a patch to the bootgen package that corrects the issue.
> 
> Upstream: CR to AMD jira
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
