Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3422C2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 20:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58AF8400F5;
	Mon,  1 Jul 2024 20:50:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CnXSTtyHDdi; Mon,  1 Jul 2024 20:50:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D73DF4138A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D73DF4138A;
	Mon,  1 Jul 2024 20:50:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B12A1BF361
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:50:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77D7A4138A
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 20:50:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Pb1HWjfmH5v for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 20:50:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 000B7400F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 000B7400F5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 000B7400F5
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 20:50:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8298813F899;
 Mon,  1 Jul 2024 22:50:30 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Jul 2024 22:50:30 +0200
Date: Mon, 1 Jul 2024 22:50:30 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZoMWlpzVwwxMy1C1@landeda>
References: <20240701180930.793992-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240701180930.793992-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719867032;
 bh=yAyjLGiPi3kujANfjJnexECXrkuFPWCfTAy7DIQH38o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ah+7nDesNbB8qAVl9rxNXOblxhUivKfq1ujUfBSGiuN1+aDlSD4JMbF1ONnyTGz6E
 NDEeGmkTV5647c8nGFZb8cQ9mYHSL0mqOQOl8odID83Umr2GkUupRN3LTEsTBNdj+v
 P7lU6camNNH7VaWQby9jTWvqnsCoQ1FdNWSJciPlBw+D2EP3xlB8sKZ2GYLkZyXz/l
 mnnSn/eTVvlN8n9WsFEOL6Mg+wo8SLUywS8O0tlQNF+SoRGGVUdpFpcgcg/uLZGiWA
 JGN2KwfbGUN7Aqutv6zGwvq9vX2qMVDxELTZ9EJfE3hl3SJiZdYkKk4+ZrwqomcdeV
 O+qPJa3LisTbQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ah+7nDes
Subject: Re: [Buildroot] [PATCH 1/1] package/sylpheed: fix patch fuzz
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Julien, All,

On 2024-07-01 20:09 +0200, Julien Olivain spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, sylpheed fails to build with output:
> 
>     Applying 0001-harden-link-checker-before-accepting-click.patch using patch:
>     patching file src/textview.c
>     Hunk #1 FAILED at 2885.
>     Hunk #2 FAILED at 2922.
>     2 out of 2 hunks FAILED -- saving rejects to file src/textview.c.rej
> 
> This commit refreshes the package patch on the current package version.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...n-link-checker-before-accepting-click.patch | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
> index fe3375bc91b..46b45058372 100644
> --- a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
> +++ b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
> @@ -1,4 +1,4 @@
> -From ac286a71ed78429e16c612161251b9ea90ccd431 Mon Sep 17 00:00:00 2001
> +From 876c54b2927e48ab6900e5e6b9395742f75e840e Mon Sep 17 00:00:00 2001
>  From: Paul <paul@claws-mail.org>
>  Date: Sun, 23 May 2021 12:16:40 +0100
>  Subject: [PATCH] harden link checker before accepting click
> @@ -6,25 +6,27 @@ Subject: [PATCH] harden link checker before accepting click
>  [Retrieved from:
>  https://git.claws-mail.org/?p=claws.git;a=commit;h=ac286a71ed78429e16c612161251b9ea90ccd431]
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Julien: rebased patch on version 3.7.0]
> +Signed-off-by: Julien Olivain <ju.o@free.fr>
>  ---
>   src/textview.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>  
>  diff --git a/src/textview.c b/src/textview.c
> -index 62ad46eaf..3cdf5d911 100644
> +index e55eea9..6fbb8a1 100644
>  --- a/src/textview.c
>  +++ b/src/textview.c
> -@@ -2885,7 +2885,7 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
> +@@ -2689,7 +2689,7 @@ static gboolean textview_uri_security_check(TextView *textview, RemoteURI *uri)
>   	gboolean retval = TRUE;
>   
>   	if (is_uri_string(uri->uri) == FALSE)
>  -		return TRUE;
>  +		return FALSE;
>   
> - 	visible_str = textview_get_visible_uri(textview, uri);
> - 	if (visible_str == NULL)
> -@@ -2922,6 +2922,8 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
> - 		if (aval == G_ALERTALTERNATE)
> + 	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(textview->text));
> + 	gtk_text_buffer_get_iter_at_offset(buffer, &start_iter, uri->start);
> +@@ -2725,6 +2725,8 @@ static gboolean textview_uri_security_check(TextView *textview, RemoteURI *uri)
> + 		if (aval == G_ALERTDEFAULT)
>   			retval = TRUE;
>   	}
>  +	if (strlen(uri->uri) > get_uri_len(uri->uri))
> @@ -33,5 +35,5 @@ index 62ad46eaf..3cdf5d911 100644
>   	g_free(visible_str);
>   
>  -- 
> -2.25.1
> +2.45.2
>  
> -- 
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
