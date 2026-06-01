Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527F1CD5BD1
	for <buildroot@archiver.kernel.org>; Mon,  1 Jun 2026 21:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 172C3811E3;
	Mon,  1 Jun 2026 21:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnxFFpnZVb7F; Mon,  1 Jun 2026 21:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D51811E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780349153;
	bh=2JXzURRaLISni7cGkMWynCH8zQRYqySMNIc10AiWCEc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M/1gvBDUuNTOm5xaHJq8BfJ8SyWNqriQ7JmuMnQAvSawONBz3OVbuzxDjlQL0YFv4
	 rH5SIPsk6eLatOmC/newEVValLbUKeYfsXRA3gb+tQqMx3QjXdCE1XRO0lenS6Va2h
	 M7nYlvI9aaeAc2MUybycNAzW80/sQoDiNAbIlXrrKuRFf59o5iIzMmBXiTNOvpoCmN
	 X0gNY7n40m+niqU9dbgRLLtd3QaCyIz7TCysBudlB+A6kFz64eNd3MZPLsz21mkxLv
	 KYXcX8f0aTs5jGo6gsfNXTaBH4UdSSIti9M450MIBKdqQ2RYU7yBkqVmLsYqvZlfrJ
	 MYTNtxtXgsS2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D51811E8;
	Mon,  1 Jun 2026 21:25:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 53CB7223
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 510C060771
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:25:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LawUL376nmy for <buildroot@buildroot.org>;
 Mon,  1 Jun 2026 21:25:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FC2C60778
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC2C60778
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FC2C60778
 for <buildroot@buildroot.org>; Mon,  1 Jun 2026 21:25:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D26D8B97C39F; Mon,  1 Jun 2026 23:25:48 +0200 (CEST)
Message-ID: <4dedc041-a046-47d6-a21d-eb8d93a7e808@rnout.be>
Date: Mon, 1 Jun 2026 23:25:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Ernberg <j@j-ernberg.se>, buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20260601204735.888967-1-j@j-ernberg.se>
 <20260601204735.888967-7-j@j-ernberg.se>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260601204735.888967-7-j@j-ernberg.se>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780349149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=1RmbANR/vlwHJyWEs3lpRvuHpLT+ilXGdqeHVqSx3y4=;
 b=dxuiLgG2tFXnKwsMWRf3Gtd2gKbc81Gorni/usUH2MLcA04XRfCtj27Euz+hlWy2KF51Sj
 vphiFVnmEKwnJvCvCEk8+xMRIdoliejY1uD4FJXmpxmmmi4gH7pyg8OtkLvV2vKhKWz3Z2
 2OOCGjcRFIcrTS/uldi3P1NeSftV35FfopElbYUEvZMbg9gb1tib+EdKrhxNfoERbrjpjr
 RQeFM/PMf3RoMCFSgQfgYyYbTZyiIcKK9ss2ST9Ae5NCEfazicUF2K9yoz06zPIaNdid2u
 qNb6942kitn1t16nOcaGlY5sxV+gpQdONG6+0N0sFUlAZ7nh6mV7jJZ/Rfu4yA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=dxuiLgG2
Subject: Re: [Buildroot] [RFC PATCH 6/9] package/util-linux-libs: Do not
 install to target
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/06/2026 22:47, John Ernberg wrote:
> util-linux-libs was introduced as an intermediate package to help break
> circular dependencies with util-linux, and therefor only exists to provide
> more basic versions of the libraries util-linux provide, to break these
> dependency chains.
> 
> There is no need to install these to target as they will never be used
> there.
> 
> Under all circumstances the libraries are built and installed by the main
> util-linux package.

  Does this actually solve the conflict? It still exists in the staging (=host) 
directory, no?

  Regards,
  Arnout

> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: John Ernberg <j@j-ernberg.se>
> ---
>   package/util-linux/util-linux-libs/util-linux-libs.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/util-linux/util-linux-libs/util-linux-libs.mk b/package/util-linux/util-linux-libs/util-linux-libs.mk
> index 6716a656d2..d434a8f461 100644
> --- a/package/util-linux/util-linux-libs/util-linux-libs.mk
> +++ b/package/util-linux/util-linux-libs/util-linux-libs.mk
> @@ -24,6 +24,11 @@ UTIL_LINUX_LIBS_LICENSE_FILES = README.licensing \
>   # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
>   UTIL_LINUX_LIBS_AUTORECONF = YES
>   
> +# This package is only used to build other packages that have a depdendency
> +# on util-linux libraries which in turn may be dependencies for the full
> +# util-linux build. The libraries that are actually used on target are built
> +# by the util-linux package.
> +UTIL_LINUX_LIBS_INSTALL_TARGET = NO
>   UTIL_LINUX_LIBS_INSTALL_STAGING = YES
>   UTIL_LINUX_LIBS_DEPENDENCIES = \
>   	host-pkgconf \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
