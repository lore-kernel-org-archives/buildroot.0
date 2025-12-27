Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719A0E8FDCC
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 14:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14E6460750;
	Sat, 27 Dec 2025 14:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mem2uQOsiV6E; Sat, 27 Dec 2025 14:41:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B17060768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766846484;
	bh=4VqGRZ4iMAddmWmLXJRT4FLiofvLaICmJNWxjeQl3mA=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=kYKJSGE+5RwCUP9SzKcobpoAdxn4Lar7yzPgZyTJU7pvKib9NDDBXBOtRZ96KLXEZ
	 KXpO+Zwm2we86AaxxCkEi8hrVSJmC7imiPSxklcTfd3bPMmjyRMUar4hFe+bIKvwH6
	 lwDPWcd+Jg4Xdw6piN27QLya66k3JvsikTLIeHQJP30AcrgtoYNfsmRLPiisJs4P7j
	 vNPPcbC2xYjp7wqimtLyig/zzue3DHG9l68eW8XM+iQDWBLUXxXj51UlI5bdC4+fSD
	 PultslJRFyxoYK/NZ3yAxcki815OZFUhmCXxtdyWOWyvf2TPVo832k9sOlcPsZ3tg2
	 HbN5FcaGoJ/dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B17060768;
	Sat, 27 Dec 2025 14:41:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABB76B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DD2B4024C
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9KLzWAOFvn1 for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 14:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2542D401EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2542D401EC
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2542D401EC
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 14:41:19 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:b316:3690:2cad:26d9] (unknown
 [IPv6:2a01:e0a:12:eba0:b316:3690:2cad:26d9])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id C0D3CBFBAB;
 Sat, 27 Dec 2025 15:41:16 +0100 (CET)
Message-ID: <3deb722d-986c-4163-87e4-9939552c0a36@grenoble.cnrs.fr>
Date: Sat, 27 Dec 2025 15:41:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20251227130435.135472-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US, fr
In-Reply-To: <20251227130435.135472-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1766846476;
 bh=Usp2BOdJseiNdfQpwkb3ppoUjISwTnyUho1kYpaMEQ4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=jZg6wocUVVLlhdYxRtLDQk/Kl9GzUCV+RJvJBe1h+FAOELWijmD3m4BIAuMlGA3mC
 Byfy99A6TYflAETt2RzhXHcfE6q4igV0kgTverNAfiI3h00o/fOeD52K0nWTs9kG5Z
 29AdhyVjMYc/DGu/fgNtFnN81GOdOL3+IB+fTvEzTKFz5UCgQtr0i0jvddyWIEo/IO
 JNQR+M2SqSkA1MBYaqtaJaN6D5qZDBsNO9sau1Kv6oEuUgLzfyvnnJlEM3/zznfGvd
 HUOceUNgC1iShQyeCLZ89JPgu0qHaMNydbl/vKhOetBE1hJsdMciyNoEYCtcaXgPU1
 AnEsRH1JG1LKg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=jZg6wocU
Subject: Re: [Buildroot] [PATCH] package/dash: fix build failure due to wchar
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio! Hello everybody!

On 2025-12-27, Giulio Benetti wrote:
> Since commit [1] package dash requires wchat so let's depend on it to

s/wchat/wchar/

> fix build failure.
>
> [1]:
> https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?id=c0674f487c7aec2a3bdf6795cea7e60c9530c360
>
> Fixes:
> https://autobuild.buildroot.org/results/e9108ebd9fb8c471add1c5a7f581757175fa5f15/
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/dash/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/dash/Config.in b/package/dash/Config.in
> index b816ac7837..fe49a908ed 100644
> --- a/package/dash/Config.in
> +++ b/package/dash/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_DASH
>  	bool "dash"
>  	depends on BR2_USE_MMU # fork()
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	depends on BR2_USE_WCHAR
>  	help
>  	  DASH is a POSIX-compliant implementation of /bin/sh that
>  	  aims to be as small as possible. It does this without
> @@ -10,3 +11,8 @@ config BR2_PACKAGE_DASH
>  	  for most tasks.
>  
>  	  http://gondor.apana.org.au/~herbert/dash
> +
> +comment "procps-ng needs a toolchain w/ wchar"

s/procps-ng/dash/

Regards,

Edgar Bonet.

> +	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> +	depends on !BR2_USE_WCHAR

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
