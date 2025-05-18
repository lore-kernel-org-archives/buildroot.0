Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD31C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC6C26064D;
	Sun, 18 May 2025 14:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id un5foVs2nISK; Sun, 18 May 2025 14:46:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EADFD60AD0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EADFD60AD0;
	Sun, 18 May 2025 14:46:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A4981BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3CB14092D
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:46:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x8suW8Q9cp7r for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:46:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29AE64092B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29AE64092B
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29AE64092B
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:46:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4AD3F1C1055; Sun, 18 May 2025 16:46:11 +0200 (CEST)
Message-ID: <9ba3e406-4836-452a-b641-91b3fb31afbf@rnout.be>
Date: Sun, 18 May 2025 16:46:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Phil Eichinger <phil.eichinger@gmail.com>
References: <20250425192458.2276762-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250425192458.2276762-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=f58hl68jK0TOdXFSsn8eEolF+J0KaLjUaSOFvfvk67A=;
 b=MCWmXWqeGSYvXuUofH7jY/B5jUfHPEztYxKeTdkDk1XyRvfglOpkUXoowtk8v4AEAe1mrU
 MvQ4vB9RdJPjr4BkoOaLIzmGGXBmbbLDpWuBxvJfkUv8Bt1Y7YCDJ9mkVqVtZudmT/l9WX
 S95mac3KymzzSMxD2MapMH3uRP3km9Zi50Q+Kc+5jnBhRBxa3G1c7kRKST0ZDDHNf56T4N
 67KhyxrXY9+fpPjxlhVr4FQRZB5f2rPtAAf9ZbvvBee9m+sUdunUYkUwfmJpN8apnlO45W
 CrNrjFubOWPhq7HjcYuM9DugZLiAeD/0cvpX+NK9OxTbpARx6Wa5jGG1EvB6pQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MCWmXWqe
Subject: Re: [Buildroot] [PATCH 1/2] package/libqrencode: update Config.in
 homepage url
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



On 25/04/2025 21:24, Julien Olivain wrote:
> The old home page url [1] redirects to https, and points to the
> japanese version of the site.
> 
> The commit updates this url to the https english version of the
> site [2].
> 
> [1] http://fukuchi.org/works/qrencode/index.html
> [2] https://fukuchi.org/en/works/qrencode/
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied both to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/libqrencode/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libqrencode/Config.in b/package/libqrencode/Config.in
> index b86662621e..7c3d9e4df6 100644
> --- a/package/libqrencode/Config.in
> +++ b/package/libqrencode/Config.in
> @@ -7,7 +7,7 @@ config BR2_PACKAGE_LIBQRENCODE
>   	  QR Code is up to 7000 digits or 4000 characters, and is
>   	  highly robust.
>   
> -	  http://fukuchi.org/works/qrencode/index.html
> +	  https://fukuchi.org/en/works/qrencode/
>   
>   if BR2_PACKAGE_LIBQRENCODE
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
