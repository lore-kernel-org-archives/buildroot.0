Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 567F6FDEE3F
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 20:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08BDE411D0;
	Thu, 23 Apr 2026 20:06:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0qaqzap2SB6h; Thu, 23 Apr 2026 20:06:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E4F1411C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776974804;
	bh=CTgWHMNB73zN/omOPx4yBNJmNNdS5JrQrTX+oz0Z5xc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fsdGwJy03rn2vXf78DuupFIP792zyAXOPv9EhCyLFS2pZjSzNtdkGpA29DGXF3gbV
	 bm3n8AvPlOI+TJ40GpZDsoEj2e5snKsh/fVXksMNlb82mqt7MHIxaq4HOCNJNkR7H1
	 he5oth5yCrgRna4ZL/aXzgbMHm8N/XZbaShI3aFBjoxNgLPr+0rPB2QxPzDs0yv3cC
	 XaOu0Em6LukyeLl8pVg5sKj5dON0crgPyn3ZV/iKTILqJjjisBzrRQE5ZDIf12pwi0
	 s34x0EB6QApZSSSNeUH5T3PqsWzGHm9ZrVVMpJfZAS2NiicyziAj5g+BbFt3979C1L
	 0r7d2WIrOgKuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E4F1411C3;
	Thu, 23 Apr 2026 20:06:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 402EF231
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 319FB82257
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:06:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9NeLs79ajC5 for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 20:06:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 447258220A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 447258220A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 447258220A
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 20:06:41 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9822F2003DA;
 Thu, 23 Apr 2026 22:06:34 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Apr 2026 22:06:34 +0200
MIME-Version: 1.0
Date: Thu, 23 Apr 2026 22:06:34 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Clayton Shotwell
 <clayton.shotwell@collins.com>, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Norbert Lange <nolange79@gmail.com>
In-Reply-To: <20260420165548.2998453-1-bernd@kuhls.net>
References: <20260420165548.2998453-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <dbd41814b2d0fedf7f37c9bd619df2b7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776974800;
 bh=kpwK/OYJ55KsCUo073pEjYm7WlbRinzcCpdVjDx85Tg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TY92qAh3hYuE9nubGVDAXcZQcvkn5SOwMXDPl5csvK7Q/9XlAeEFhjSD9pkSnGmKM
 oa09U4DyoakSiW9rAlFmWTYwVoxfIrn9H85mzJEwelCRwSbcyUKd9n/R0d3YFCIW1z
 QSYCKhTBi9S+w3ZIOx7V94qtt6yRlJEi1hOjf8NHa1gu4yJSYDJapK4SHxErI11KKt
 VbiS84LZ+Gt6MYJF72OKHTWtNbbe5Gq6N9dMsj2KD6mud69siBGj+4M3C0XTjioEkk
 WE0l86o4vCRSAIVr92m4qjot81T0JdQd5wKDAGGk0iFuWsQsFvHGDL0AHStTWVMyal
 Omz+G62ODvcfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TY92qAh3
Subject: Re: [Buildroot] [PATCH v2 1/1] package/libcap-ng: bump version to
 0.9.3
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

On 20/04/2026 18:55, Bernd Kuhls wrote:
> https://github.com/stevegrubb/libcap-ng/blob/v0.9.3/ChangeLog
> 
> The source tarball is not distributed on the project site anymore so we
> switch to the github helper and need to enable autoreconf.
> 
> Added dependency to BR2_TOOLCHAIN_HAS_SYNC_4 to fix a build error:
> 
> /home/bernd/buildroot/test-libcap/bootlin-sparc-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/14.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
>  ../src/.libs/libcap-ng.so: undefined reference to 
> `__sync_bool_compare_and_swap_4'
> 
> due to this upstream commit added in version 0.9.2:
> https://github.com/stevegrubb/libcap-ng/commit/ba2e9e03199541b1c07f3e925ffc5b23774bd18f
> 
> Added _POST_EXTRACT_HOOKS and dependency to host-pkgconf to fix
> autoreconf errors.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
