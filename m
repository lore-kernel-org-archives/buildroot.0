Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55A1C10F1A
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 21:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83DF141FFC;
	Thu,  9 May 2024 21:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H39LXW8Wg47x; Thu,  9 May 2024 21:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6790341FFD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6790341FFD;
	Thu,  9 May 2024 21:19:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2601BF427
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0906181749
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 21:19:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QyKOgbi5GFYN for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 21:19:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D373381587
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D373381587
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D373381587
 for <buildroot@buildroot.org>; Thu,  9 May 2024 21:19:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E523C1C0002;
 Thu,  9 May 2024 21:19:36 +0000 (UTC)
Date: Thu, 9 May 2024 23:19:35 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240509231935.613ff05a@windsurf>
In-Reply-To: <20240408202030.365656-1-fontaine.fabrice@gmail.com>
References: <20240408202030.365656-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715289577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WvDgt0wezZcTyTghEby2M7fJMNr7EsFaxK8jVOnC2FU=;
 b=hbz1xsYZuL4+Q9RdsI5yHDEypLEDgWjdcjiH+EcajLqin0WvESjLoQR1gz96Cz+jRqiT6N
 tNsBkF1QiiIk9RLuLc1xxXeDm4U0fKJSuHmiufirkNACyJ1Mm/sfPFbfIR+kXVXB1qPFMc
 UQKP03qzadPLnEeLuYICWs1UdDN8rToE1eA8ty7Jp3SFOior2SFuCG16pxjhyYw90zFEdI
 X6G0KP8KAl51A6G4WTmSe1PojmqGhJDLSPNF62eDfSxQpcwfNsg3RTYOkEz4yNuTKAachH
 IY8bZh4I5y2/9wfJUCgmq3H4H9qPDcN+do/A5QY/o9NNj1RIkdNBASNNDkjKpw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hbz1xsYZ
Subject: Re: [Buildroot] [PATCH 1/1] package/mariadb: really use system fmt
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

On Mon,  8 Apr 2024 22:20:30 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 821f9dee8112dc02fe58d60273d0dfdabbc46d1f wrongly used WITH_FMT
> instead of WITH_LIBFMT resulting in the following build failure:
> 
> [  0%] Creating directories for 'libfmt'
> [  0%] Performing download step (download, verify and extract) for 'libfmt'
> make[3]: Leaving directory '/home/buildroot/autobuild/run/instance-0/output-1/build/mariadb-10.11.6'
> make[3]: Leaving directory '/home/buildroot/autobuild/run/instance-0/output-1/build/mariadb-10.11.6'
> -- Downloading...
>    dst='/home/buildroot/autobuild/run/instance-0/output-1/build/mariadb-10.11.6/extra/libfmt/src/8.0.1.zip'
>    timeout='none'
>    inactivity timeout='none'
> -- Using src='https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip'
> CMake Error at libfmt-stamp/download-libfmt.cmake:170 (message):
>   Each download failed!
> 
>     error: downloading 'https://github.com/fmtlib/fmt/archive/refs/tags/8.0.1.zip' failed
>           status_code: 1
>           status_string: "Unsupported protocol"
>           log:
>           --- LOG BEGIN ---
>           Protocol "https" not supported or disabled in libcurl
> 
>   Closing connection
> 
>           --- LOG END ---
> 
> Fixes: 821f9dee8112dc02fe58d60273d0dfdabbc46d1f
>  - http://autobuild.buildroot.org/results/fbe3bc347a83a810ffbbbff93a45994963712bee
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/mariadb/mariadb.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

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
