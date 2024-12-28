Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E0EE77188
	for <buildroot@archiver.kernel.org>; Sat, 28 Dec 2024 10:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22F3780D7F;
	Sat, 28 Dec 2024 10:00:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBU5Sl6TpXza; Sat, 28 Dec 2024 10:00:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D54280D50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D54280D50;
	Sat, 28 Dec 2024 10:00:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1C0DF1B
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF6C84029A
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iP2T1sq4gbUP for <buildroot@buildroot.org>;
 Sat, 28 Dec 2024 10:00:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AE14240287
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE14240287
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE14240287
 for <buildroot@buildroot.org>; Sat, 28 Dec 2024 10:00:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6753560134;
 Sat, 28 Dec 2024 11:00:51 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56674])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Dec 2024 11:00:51 +0100
MIME-Version: 1.0
Date: Sat, 28 Dec 2024 11:00:51 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241227210352.2759332-1-thomas.petazzoni@bootlin.com>
References: <20241227210352.2759332-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <08172012d32b9b907f3df1f1f5b69a19@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735380052;
 bh=eYupzaWwRvAb42QHDctu8qW6WAWd6E7BwwIhZxRShZg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FR4HwT3WUEbTIJz76z/eN/tLFSwyIk3/8mI4gcn40R1DitIuWDrihDAc4HKJ+aLBY
 Z8lf1XwEyD1dY9FTPqnVnnk07wUEBj6EFXCPgikUIKO63enRsnPjpVvv1B1/HR7kQ0
 aTclL7tzzGxyPDu9i6tgWfFsS69lHLUh5qeZcgFXVO4Sx71xIFWPpjlEC7KyE+LHg0
 Wn6gTY30vFoEGdILFDazYEN0VguuCpdanJJyyM9WBn02yAuvMuqsr/E4T49Ftk4Vxk
 Zu8Y1lDn4DC49x5QyDq+SnmSG2rJ/U0JAOeBGcn1nnxsiMzJ8N9nNJc1mkEb/W6o8N
 JQKYabtQ+iq1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FR4HwT3W
Subject: Re: [Buildroot] [PATCH] package/hiawatha: remove package
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

On 27/12/2024 22:03, Thomas Petazzoni via buildroot wrote:
> We wanted to update hiawatha from 11.2 to the latest version 11.6, but
> since its version 11.5, building with -DENABLE_TLS=OFF is broken. The
> upstream project is also kind of dead/weird:
> 
> - The Gitlab repo at https://gitlab.com/hsleisink/hiawatha does not
>   have real commit history, just one commit per release
> 
> - There is no bug tracker for the project, nor any mailing list to
>   contact the author and report a bug
> 
> - The upstream website at https://hiawatha.leisink.net/support states
>   "Due to lack of interest in this project, I no longer actively
>   support and promote Hiawatha. I still use Hiawatha a lot myself, so
>   development will continue, but likely very slow. New versions will
>   still be released via this website.
> 
> Since I was the one who introduced this package, and nobody else seems
> to use it, let's drop it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
