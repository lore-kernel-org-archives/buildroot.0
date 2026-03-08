Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21718EA852C
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 15:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCC37832EB;
	Sun,  8 Mar 2026 15:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1wrCUhw3yXaP; Sun,  8 Mar 2026 15:20:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0462F83227
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772983256;
	bh=fTMhG7ezXR1ixfRFXGDvgJaiJ2sPwMfIeWlqbESR7nc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=J7n7d6GogjqLW5TfwPXdREPWmUH69fva5BMKVAPdbtrtI3v+yYyqi5R5XGOiYm77q
	 EKuMwPDHv6DZSMybkrEKeFf3MaPrq02Ty9aQzWycOMJr7AsjXO9eHaQ/FT94jknJoJ
	 TzSI3rbzMdPCyxGuiExKjKEL8V5/ueWNjF0Nq2kLFsr8Y3cQZ7P4sa85XACudFOaCL
	 E5tNuipT82XQgHeyF2kb8CZo68IxYT78POHNBjQ63/MpZ8+kk1dK5j4rK1w8AEk2kW
	 q0aH4h6ZRlVmOIT+wWNW2OpsesLxnjLeZgl63I0zyQ3rn2O3ctap9KydTBLt9onRS7
	 qp0VeVUQ+HVEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0462F83227;
	Sun,  8 Mar 2026 15:20:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B8636119
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:20:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E9BE60E89
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:20:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCjQaZhMf9VX for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 15:20:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87A7460B18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87A7460B18
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87A7460B18
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 15:20:52 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2C0B8B00539;
 Sun,  8 Mar 2026 16:20:45 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Mar 2026 16:20:45 +0100
MIME-Version: 1.0
Date: Sun, 08 Mar 2026 16:20:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Daniel Lang <dalang@gmx.at>, Joseph Kogut
 <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>, Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20260305195003.147773-3-bernd@kuhls.net>
References: <20260305195003.147773-1-bernd@kuhls.net>
 <20260305195003.147773-3-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <4a9ebe6229ba5bb787b4b3f05850b9ab@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772983250;
 bh=urfOfHAdmc3Tvdd3LJqG3x0+cG4e6Pf0nhdDZF7q9TQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KkdaffIH4yE9/mK3NjlBQqTkHn3/9LqzIpSIjEvOJcXk41rTZa/C/aVVRp1uOFFhr
 9VCvcfd3PXkRdcRnNeXRYM2LuoSLKTSm5Hl/uorJRXhqYe+RnabLDzDx2XXnP00WGi
 V099+bQL16zB/zHGN9kYDjOs2Zr8wLyNIqXElYLr6YdcNaiWiaPRdxZ2ohvB09UJCK
 GY57+QBilg++aF0JW9wA8queHh85u/LbDg6X6ATMg5yvr6gqyjEUmFUc8Bx67FA7bD
 p6k0LTcyQE2Q7ycAIhH3XSjm9AxejTJOO0kByNgiURZnvPpcQtoruW/B1gGTEpPpLZ
 0EtCxuAN6IUQw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KkdaffIH
Subject: Re: [Buildroot] [PATCH v2 3/3] package/llvm-project: bump version
 to 22.1.0
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

Hi Bern,

Thanks for the patch. This new version introduces build failres.
See below.

On 05/03/2026 20:50, Bernd Kuhls wrote:
[...]
> diff --git a/package/llvm-project/llvm-project.mk 
> b/package/llvm-project/llvm-project.mk
> index 411ef5fb3a..d9820d7d12 100644
> --- a/package/llvm-project/llvm-project.mk
> +++ b/package/llvm-project/llvm-project.mk
> @@ -4,8 +4,9 @@
>  #
>  
> ################################################################################
> 
> -LLVM_PROJECT_VERSION_MAJOR = 21
> -LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.8
> +LLVM_PROJECT_VERSION_MAJOR = 22
> +LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.0

This new version breaks the test_clang and also test_bcc.
I used the command:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder \
     tests.package.test_bcc \
     tests.package.test_clang

I confirm I was able to run successfully test_mesa3d and test_weston.

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
