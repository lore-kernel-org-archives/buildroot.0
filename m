Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4691FD111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:58:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 169EE60DA6;
	Thu, 27 Nov 2025 19:58:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RCitV-vG6vXr; Thu, 27 Nov 2025 19:58:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8508960A79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8508960A79;
	Thu, 27 Nov 2025 19:58:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 453032A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42D7884400
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9D0SZmEodu5O for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:58:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D3BF843F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D3BF843F7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D3BF843F7
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:58:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4C2E5B979CE5; Thu, 27 Nov 2025 20:58:13 +0100 (CET)
Message-ID: <12c610db-5ff0-48c3-b09c-e9fa99f02668@rnout.be>
Date: Thu, 27 Nov 2025 20:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251117185838.4083475-1-bernd@kuhls.net>
 <20251117185838.4083475-3-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251117185838.4083475-3-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273493; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=JUVI91o5so2JdUCWRguEYQZJ1XKs20Bu75wskGCQ1eY=;
 b=jTcwkilWCOZmxOVAoDLHAEOvtgATQrypIAq3czzxUEIYLb8dT8rZrcuwF/IyktrcavpExy
 UIcI05uuyksYDEXAIR2o42JTOokhlVP2JxfFr6rlBuAGwtwmSMnLit3u10WMhkpGz2CjxL
 vdT0LMrRzfbFR4uTyORQWBOvxHggGfkMoKFLOJ0/eEl16oCGfYg0NF/eNCffH+21KLLFvs
 fzQN9YykmuUL4bsEFVpkl0xLL/pV9eO0C57IhsVBRmasL07FQFnZU3tjpvoCkC9r1+GJhE
 M7CMDgv+B236ky67fXKvugM4yLaPXahxSUruUB25yYwZ8jyQpoeEIJ2w8tonbA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jTcwkilW
Subject: Re: [Buildroot] [PATCH 3/3] DEVELOPERS: remove Bernd Kuhls from
 libdecor & libfreeglut
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



On 17/11/2025 19:58, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index faecd749a4..1c7fc5d38b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -407,7 +407,6 @@ F:	package/libcec/
>   F:	package/libcodec2/
>   F:	package/libcrossguid/
>   F:	package/libde265/
> -F:	package/libdecor/
>   F:	package/libdeflate/
>   F:	package/libdisplay-info/
>   F:	package/libdrm/
> @@ -415,7 +414,6 @@ F:	package/libdvbcsa/
>   F:	package/libdvdcss/
>   F:	package/libdvdnav/
>   F:	package/libdvdread/
> -F:	package/libfreeglut/
>   F:	package/libfribidi/
>   F:	package/libg7221/
>   F:	package/libglew/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
