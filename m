Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E798D65552
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 20:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C701848EA;
	Tue, 26 Nov 2024 20:08:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLYXpRf7YjJc; Tue, 26 Nov 2024 20:08:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65B0E8494B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65B0E8494B;
	Tue, 26 Nov 2024 20:08:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8845D1DA8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75BC960662
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0o3cR2_Frxpb for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 20:08:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1DD30605E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DD30605E0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DD30605E0
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 20:08:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C8975B00573;
 Tue, 26 Nov 2024 21:08:32 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59024])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 26 Nov 2024 21:08:32 +0100
MIME-Version: 1.0
Date: Tue, 26 Nov 2024 21:08:32 +0100
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20241124222844.162887-1-giulio.benetti@benettiengineering.com>
References: <20241124222844.162887-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <ea9a43e9db3c2773dbed38789b93e90b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732651715;
 bh=zQtJ0rx1dLNF3W+QWamPcliXlvgNuKlxJC/0LjiXd5I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pLI7DlL3yLMIFDBB1QKqOgAap5QAvbpG/N2/vvMrJQmWp8gTUeitDF/ZJ4xSNWW2Q
 FJthWvXGEYdXInOvteAO5G/rDtRgudSWnntif1xjpnsv5yqW+vQIhJjTco/wvktDXi
 5amlq45vWx1/z67Em3Eh8HFhbNNWukWUUcH5bkGXMvONB39D0NRXDtCeIqkLiXb/sG
 50k9mR7xl1sINJNnUITr8vi8gbVBYAkrdg4/w/eLEtws5kGUvvv7WFcviEdvprpB5u
 PT4Sc9h5EVnjqlyxCVJpZ4iGQ5X7rosmja/2KwkxGGpmSULs/3XM0dyICGg9uuSeUT
 INvziAYEMFO7w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pLI7DlL3
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump to version
 2024-11-15
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

On 24/11/2024 23:28, Giulio Benetti wrote:
> It builds up to Linux 6.11.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to next, thanks.

> ---
>  package/esp-hosted/esp-hosted.hash | 2 +-
>  package/esp-hosted/esp-hosted.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/esp-hosted/esp-hosted.hash 
> b/package/esp-hosted/esp-hosted.hash
> index ea18c243d1..ac0164c38c 100644
> --- a/package/esp-hosted/esp-hosted.hash
> +++ b/package/esp-hosted/esp-hosted.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> 78ab4f10ddce76749d36511591a0a7bb2a982db96ac1ea1b02b5c35dab725d8c  
> esp-hosted-91b093365cc58214532b976dd8749f65523d1e6d.tar.gz
> +sha256  
> 7fd95a9b47c203a8bd0fdcab21f15c9d4cf1cad936f0206a94da0d932dd42206  
> esp-hosted-927a34f99724bb744efaf865a7c75cc1615f59a2.tar.gz
>  sha256  
> ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  
> LICENSE
> diff --git a/package/esp-hosted/esp-hosted.mk 
> b/package/esp-hosted/esp-hosted.mk
> index 4efefc3023..f4382e7fee 100644
> --- a/package/esp-hosted/esp-hosted.mk
> +++ b/package/esp-hosted/esp-hosted.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -ESP_HOSTED_VERSION = 91b093365cc58214532b976dd8749f65523d1e6d
> +ESP_HOSTED_VERSION = 927a34f99724bb744efaf865a7c75cc1615f59a2
>  ESP_HOSTED_SITE = $(call 
> github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
>  ESP_HOSTED_DEPENDENCIES = linux
>  ESP_HOSTED_LICENSE = GPL-2.0
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
