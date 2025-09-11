Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27877CAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 21:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7AAF42661;
	Thu, 11 Sep 2025 21:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UIIGOmE4u6h; Thu, 11 Sep 2025 21:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F327542676
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F327542676;
	Thu, 11 Sep 2025 21:14:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AAB2E92E
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 912CC81305
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x0Nokqg8E-eh for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 21:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A0679812BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0679812BA
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A0679812BA
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 21:14:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0FF35B9787FA; Thu, 11 Sep 2025 23:14:22 +0200 (CEST)
Message-ID: <b27ab84d-db7b-475a-83b0-f51db9aaec18@rnout.be>
Date: Thu, 11 Sep 2025 23:14:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: James Knight <james.knight@collins.com>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-23-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-23-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757625265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=JbQxkgdnlJqnwflqg6oNE8/buz2WwAVOIS+QHXAZDsg=;
 b=STKj2OyviGh/+uRqgNOoTLk7xQiX+m+TTFBjeYB75t7UJKWgDgnSLkr6diUtXvgxUT/msM
 0yWT2iq/l8A6I0/xQ9x6R0WitcrA004/bL1kH+Di1s+5E9rYLGzKPrFumQ9Tu87Oi6KbRg
 QKBUKZubgbr5BDcUJLtpPJl88oMHO9h5HZdmyCg49mQClnZW6o3TdmxPsvxWPJXuCtSdFe
 Q9IUzzfjVsnS0KjpZNQZlit1THPf1kdJBH9NpKWvm5ymCPDLSbX1XqrFWAL61G+mA5J18l
 gr1VlK7XaNahjsTuqmKJ6/JnbvWNDy+HeJK8/5yyb0fkbpA4UgeCmvhtm/3uNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=STKj2Oyv
Subject: Re: [Buildroot] [PATCH 22/23] package/yad: drop support for gtk2
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



On 10/09/2025 23:32, Thomas Petazzoni via buildroot wrote:
> As we're about to remove libgtk2, we need to first drop support for
> gtk2 in yad. It continues to support gtk3.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>   package/yad/Config.in | 8 +++-----
>   package/yad/yad.mk    | 3 ---
>   2 files changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/package/yad/Config.in b/package/yad/Config.in
> index 300525ee3c..4a140f63d7 100644
> --- a/package/yad/Config.in
> +++ b/package/yad/Config.in
> @@ -1,13 +1,11 @@
>   config BR2_PACKAGE_YAD
>   	bool "yad"
> -	depends on BR2_PACKAGE_XORG7
> -	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3_X11
> +	depends on BR2_PACKAGE_LIBGTK3_X11
>   	help
>   	  YAD (yet another dialog) is a tool for create graphical
>   	  dialogs from shell scripts.
>   
>   	  http://sourceforge.net/projects/yad-dialog/
>   
> -comment "yad needs libgtk2 or libgtk3 w/ X11 backend"
> -	depends on BR2_PACKAGE_XORG7
> -	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3_X11
> +comment "yad needs libgtk3 w/ X11 backend"
> +	depends on !BR2_PACKAGE_LIBGTK3_X11
> diff --git a/package/yad/yad.mk b/package/yad/yad.mk
> index 15788efac0..fdddb6523d 100644
> --- a/package/yad/yad.mk
> +++ b/package/yad/yad.mk
> @@ -16,9 +16,6 @@ YAD_CONF_OPTS = --enable-html=no
>   ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)

  Since this condition is always true, the code can be simplified to 
unconditional dependencies and conf opts.

  Applied to master with that changed, thanks.

  Regards,
  Arnout

>   YAD_DEPENDENCIES += libgtk3
>   YAD_CONF_OPTS += --with-gtk=gtk3
> -else
> -YAD_DEPENDENCIES += libgtk2
> -YAD_CONF_OPTS += --with-gtk=gtk2
>   endif
>   
>   $(eval $(autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
