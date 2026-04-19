Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1C0EA71A1
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 20:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4108740EFC;
	Sun, 19 Apr 2026 20:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VP_kM6PJtYYK; Sun, 19 Apr 2026 20:48:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F41C41036
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776631722;
	bh=MeHihmDoslnWTskuFl0oLvZiySGqcYS4NGMESt9Et0c=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=eHxDwDFzKf3ipdQl+heTfcMvW4acMDX+Gn3KQSB3hqDZexue6VkZglBElbAWYdgyn
	 G7ySYrA+ZSGLpSqJWcURiO9VmMQDo8lkCezJ0jg/G6xVorKUdq2e/ZggV/8mRf1m9s
	 /AKkpUaqtwcXmYA/i00kNCqoN7xSb9tOgmhdAjutjzV3QRlH+TJHxql2VhqmWadsSA
	 iEpLonJ0hUl7sC0NkEEGsRhI6GFeMCUOuX+nFIuY3jHOBBhhTQTTtKMYgI0PiA5QCN
	 HWl0vfehYMtT3y8Q5tedNKlvl18egMD5AKZo7buipOGAz481TFdttoyYDgnmgWk9B5
	 15ZKMlQ1LNJtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F41C41036;
	Sun, 19 Apr 2026 20:48:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83C2524D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 714BF60AA7
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEQqmchOay30 for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 20:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97D4E60815
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97D4E60815
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97D4E60815
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 20:48:37 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3F1792C80C2A;
 Sun, 19 Apr 2026 22:48:34 +0200 (CEST)
Message-ID: <c593fd9b-f8b1-4fb3-93c7-d811c1be6917@bubu1.eu>
Date: Sun, 19 Apr 2026 22:48:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20260405104659.51959-1-ju.o@free.fr>
Content-Language: en-US
In-Reply-To: <20260405104659.51959-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776631714; bh=cFiRlQiqZQ1Y5bI9g8MCv7zET8RH0WP64loo+2GOpxU=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=XqLizKDq/Js/XLU5WQF1+NkFggLpsWEPaDbZ3kAX6WhLqQ98nWh21D8Vrkw1n2vwV
 tg9DpEAovugX/wFvT0C62JGJFH4VBAjnSgTcbjx6JhAvY0cW7LJAj7U5cSXBMhI4hF
 y8PDkA1Zsl/uBPVfwBhUCos2s4SfwvcVHZWLuvv5kJrKsF/IHLAxwcY+j9FyBWzsNG
 pkThN3Ei6YxHdMPXacYWAYv3kZ9vAd9Nk7MMZomdhbRNGTkCj0Ud/tHIPpu8Yoa/XT
 coouhQxKuMPOz1cidY/yl3ON3NMuOw6zBaPot93sUUcYIrXMMObt7Bin0rYryTwP6x
 mq3ON8tR1QLxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=XqLizKDq
Subject: Re: [Buildroot] [PATCH 1/1] package/mkpasswd: add dependency to
 host-libxcrypt
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Julien,

On 4/5/26 12:46, Julien Olivain via buildroot wrote:
> The host-mkpasswd package needs the <crypt.h> header file installed
> on the host. This file was initially provided by the libc headers,
> as part of its libcrypt implementation. libcrypt was removed in
> glibc 2.39. Most Linux distributions continued to ship a libcrypt
> replacement such as libxcrypt in their default installation.
> 
> Some mainstream Linux distribution (such as Debian testing) are
> now starting to remove this libcrypt and <crypt.h> header from their
> default image (of development files).
> 
> In that case, host-mkpasswd is failing to build with the error:
> 
>      /buildroot/output/build/host-mkpasswd/mkpasswd.c:54:10: fatal error: crypt.h: No such file or directory
> 
> The issue can be reproduced by adapting the Buildroot Docker file,
> by setting "FROM debian:testing-20260316" in [1] and removing
> the build of tar.
> 
> Note: debian 13 (for example Docker tag trixie-20260316) still
> includes the libcrypt-dev package by default, which provides crypt.h.
> 
> In Buildroot, there is already the host-heimdal and host-systemd
> packages requiring host-libxcrypt. Also, the host-libxcrypt is a
> small standalone package. For those reasons, instead of adding
> the Buildroot prerequisite on the user host to provide a libcrypt
> implementation, this commit simply add the package dependency to
> host-libxcrypt, to make sure it will work in all situations.

This does seem to be the easiest solution, yes, although I'm not really 
a fan of having to build host tools/libs, if they are already available 
on the host. But I don't think we have any way to test for that and it's 
fast enough to build that it doesn't matter all that much. *shrug*

> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/blob/2026.02/support/docker/Dockerfile#L11
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---

Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
