Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBBFC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 16:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62F1581E67;
	Sun,  5 May 2024 16:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwiRden8jajG; Sun,  5 May 2024 16:12:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 684BC821AD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 684BC821AD;
	Sun,  5 May 2024 16:12:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5564B1BF286
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 16:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 503AE606E5
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 16:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yj4Q63m7k4X8 for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 16:12:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED49A60630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED49A60630
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED49A60630
 for <buildroot@buildroot.org>; Sun,  5 May 2024 16:12:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1E3A213F8E1;
 Sun,  5 May 2024 18:12:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 18:12:00 +0200
Date: Sun, 5 May 2024 18:12:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zjev0Gx3mTeK8VcD@landeda>
References: <20240505112227.36660-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240505112227.36660-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714925524;
 bh=U7DZ80tfy/uibG0QOEQC3lmVqqrXQgBFtfMsTRXNryw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MOc0SHvOvLX5GrKb5JlIMl+DrS4B/zKBrjEL/dJE6BTMxIWecT7ajBQ1qORQ6UvLs
 wzC7Gk5JSELe2tDOYM2osn7p7LbxP1Rs8sPoNHEbkW2/ucvzVodbgvtd26SUuoNolo
 qdwmn2QGK3Bkp3Jqmibafc3atyL2uWOhRMvBtZQ3D3mVlL/GzTyhtLJFx0Cnof+5y7
 gJW1lkTp8P2jhR6xkPN15t60rJsz/WcVNIqxHCEo8gEMYxj1xhJ7b7wE6S+/fjIxc0
 m7NQh3xrtX0aVnKjeolndTzQNNEEsVQI/L4pLJKMIpWmZEWsmk/hrwADhDiezrhICG
 DCapqIX7OIesg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MOc0SHvO
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec: fix x86_64 build with
 binutils 2.41
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-05 13:22 +0200, Fabrice Fontaine spake thusly:
> Fix the following x86_64 build failure with binutils 2.41:
> 
> purgatory/arch/i386/entry32-16.S:23: Error: 64bit mode not supported on `i386'.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/60f2f163b491879a8ea7f2d56a6b0d38b3cf439c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

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
