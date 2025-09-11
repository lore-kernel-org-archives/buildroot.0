Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7328CCAC587
	for <buildroot@archiver.kernel.org>; Thu, 11 Sep 2025 19:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FC8F61CFA;
	Thu, 11 Sep 2025 19:34:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10mpqmUp8OdL; Thu, 11 Sep 2025 19:34:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27EB16EE91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27EB16EE91;
	Thu, 11 Sep 2025 19:34:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4ED9234
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:34:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B32E6F482
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:34:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IP0cVZEux1hi for <buildroot@buildroot.org>;
 Thu, 11 Sep 2025 19:34:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0AD56F488
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0AD56F488
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0AD56F488
 for <buildroot@buildroot.org>; Thu, 11 Sep 2025 19:34:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F2678B978576; Thu, 11 Sep 2025 21:34:44 +0200 (CEST)
Message-ID: <af266d11-4a5a-411a-9422-0146064b241f@rnout.be>
Date: Thu, 11 Sep 2025 21:34:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250910213241.1529448-1-thomas.petazzoni@bootlin.com>
 <20250910213241.1529448-2-thomas.petazzoni@bootlin.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250910213241.1529448-2-thomas.petazzoni@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1757619285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=0NW6xnEWsd0IN1/7N5HBpH9t1wFtTSzIdqalr4irZaU=;
 b=FHueNtXlmTS2kaFJW+xg8i7ldN4fUu6uBmUGWFBXvty28C2lxBoC5vkb8AYy7/7wW/oevV
 cWxxengcZoPCpywcht2Z5oxmjRdAsBXB9DQZMjRLSA471zBgHMTZiAL+M++5wLgZFw4Rpz
 mguTa1biK7ZsGrqkhUTw+BIrOI8P2OrzxMW1MMB6OBriDTUdn/u78qWM4T/Uksx154O2sK
 FBUyZBfmw0Fap3WrV97cgrEEalJ/3wXTPLZFMtbcNRBkjFArpqdUoyV4i+c+bHImakijeC
 Dg1s13Hvq+YUqrpaicnqlZYupRlqe42HzkZin3UfMleYVdm2KXKD+5DTRhMHUQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=FHueNtXl
Subject: Re: [Buildroot] [PATCH 01/23] package/adwaita-icon-theme: drop
 reference to libgtk2
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
> As we are about to drop support for libgtk2, let's drop the reference
> to libgtk2 from the adwaita-icon-theme package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/adwaita-icon-theme/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/adwaita-icon-theme/Config.in b/package/adwaita-icon-theme/Config.in
> index 71b839d996..0eb856ad9e 100644
> --- a/package/adwaita-icon-theme/Config.in
> +++ b/package/adwaita-icon-theme/Config.in
> @@ -1,6 +1,6 @@
>   config BR2_PACKAGE_ADWAITA_ICON_THEME
>   	bool "adwaita icon theme"
> -	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
> +	depends on BR2_PACKAGE_LIBGTK3
>   	# host-libgtk3 -> host-librsvg -> host-pango -> host-harfbuzz
>   	depends on BR2_HOST_GCC_AT_LEAST_4_9
>   	help

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
