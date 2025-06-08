Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7048CC5B552
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 13:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3408340B0C;
	Sun,  8 Jun 2025 13:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0MmwuYBjwfec; Sun,  8 Jun 2025 13:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BB6D40AED
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB6D40AED;
	Sun,  8 Jun 2025 13:18:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 422F01A4
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F33F607C7
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Cx2R-536Pot for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 13:18:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 58FCB607C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 58FCB607C4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 58FCB607C4
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 13:18:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id BA43213F88F;
 Sun,  8 Jun 2025 15:18:04 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Jun 2025 15:18:04 +0200
MIME-Version: 1.0
Date: Sun, 08 Jun 2025 15:18:04 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250608101422.883807-1-thomas.perale@mind.be>
References: <20250608101422.883807-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <48d42e734210ca30c6e944be83e64cf6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749388687;
 bh=DAR+NN20D0izqbiBNYOJN39YXvcP+Ykq0bCUvikJjJ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tnscngne1HHabBev+fkhQqYWMirO31PTBmMGzFdDacH4TAYNga9CQeaKoOqlX4lJb
 t3HwMTQvIGqCzfa20YHZNlBA/HWBkdTRYu/qqQndea7M7YZq2wwQu5j/N+TQyEcsDZ
 CQloxW67AmV7ENhhGRvSTMxfg6Kl2DskwyUPqDDsBgJL1kSpJs6AkNRbASNQYulTNq
 wZKbJQtHfV23iFPNFX02qeiPEA/roq15Qogz6UDD5L+bZlHaueAQK7lPlPqH2ddQfh
 YDjOn6HiAEkR6mHu/8rKHeqYe+GLP+4YJhYMp4XaI0y6uXN/64Nds/txag4V9I3TTk
 a/1W1BOgp2v8Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tnscngne
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: fix build with
 host GCC 15
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

On 08/06/2025 12:14, Thomas Perale via buildroot wrote:
> Fix the following autobuild error on configs with host GCC15.
> 
> ```
> /workdir/instance-0/output-1/host/bin/ccache /usr/bin/gcc   -O2 
> -DNDEBUG -Wall -Wstrict-prototypes -Wundef -Wmissing-declarations 
> -Wmissing-prototypes -Wwrite-strings -fno-strict-aliasing 
> -Werror=declaration-after-statement -fno-builtin -fno-common 
> -Werror=return-type -Wno-unused-local-typedefs -DHAVE_STDINT_H=1 
> -DHAVE_DIRENT_H=1 -DHAVE_SYS_DIR_H=1 -DHAVE_SYS_TIME_H=1 
> -DHAVE_SYS_TIMES_H=1 -DHAVE_INTTYPES_H=1 -DHAVE_LIBDL=1 
> -DGX_COLOR_INDEX_TYPE="unsigned long long" -D__USE_UNIX98=1 
> -DHAVE_SNPRINTF  -O2 -I/workdir/instance-0/output-1/host/include 
> -L/workdir/instance-0/output-1/host/lib 
> -Wl,-rpath,/workdir/instance-0/output-1/host/lib -DNOCONTRIB 
> -DHAVE_RESTRICT=1 -DHAVE_LIMITS_H=1 -DHAVE_STRING_H=1 
> -fno-strict-aliasing -O2 -I/workdir/instance-0/output-1/host/include 
> -L/workdir/instance-0/output-1/host/lib 
> -Wl,-rpath,/workdir/instance-0/output-1/host/lib -DHAVE_POPEN_PROTO=1  
> -I./base -o ./obj/aux/genconf ./base/genconf.c   -lz
> In file included from ./base/genconf.c:18:
> ./base/stdpre.h:348:13: error: 'bool' cannot be defined via 'typedef'
>   348 | typedef int bool;
>       |             ^~~~
> ./base/stdpre.h:348:13: note: 'bool' is a keyword with '-std=c23' 
> onwards
> ./base/stdpre.h:348:1: warning: useless type name in empty declaration
>   348 | typedef int bool;
>       | ^~~~~~~
> ```
> 
> This is due to the change in the default C language version in GCC15.
> 
> The patch included is not exactly the same as the upstream one, it only
> picks the part that fix the `bool` definition and dropped the 
> declaration
> type changes.
> 
> Fixes: 
> https://autobuild.buildroot.org/results/9c6/9c6cbff256635c6ab4be4c5b7bf18f9d3c4b46681
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
