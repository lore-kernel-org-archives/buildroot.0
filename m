Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32227FA3750
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED7D407D8;
	Fri,  2 Jan 2026 22:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEhTklKXeJgL; Fri,  2 Jan 2026 22:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2735B40851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767393552;
	bh=4ej7PfbMsY2f11STMjwzBoSfcJX/hNFutPAsABTVefA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UyNx7PCwI3kUylkh3bSSRXEVxgWf18rLnzXQ17RPxRthuGnFvPqyaxsJmLBVuc0QH
	 nEQQqA9wMd06hZkKCE1v51Q+A2VwyFFYnnLcEax0acSCjy3xipiTnR7oSAgFkMzHgF
	 qybJzLLRisrTjYLuZBVchdNfqiecWRdSyWi3uv26cdLi4WX2P8cfUf1bWN43r04n3C
	 6bklBlmkzCgAszbom7oGo7BL/rq/kBfLL0CsMMwdNc451YC0DGyfObSVZstbzfMxKu
	 0Ipj53ymUMoeKwxzBGBII2wxhCAyJwHKqTcJtUpWHknRGJRvhqXhTlC8U77dOuOAXa
	 BTadM073l1oBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2735B40851;
	Fri,  2 Jan 2026 22:39:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5850C249
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D8E1608FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ACGol16d2X4v for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:39:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3CE7E608F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CE7E608F2
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CE7E608F2
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:39:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 104564E41F05
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:39:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D1A4F606C7;
 Fri,  2 Jan 2026 22:39:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE3FA113B023D; Fri,  2 Jan 2026 23:39:05 +0100 (CET)
Date: Fri, 2 Jan 2026 23:39:04 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20260102233904.426f2e8b@windsurf>
In-Reply-To: <20251125210759.333290-1-bernd@kuhls.net>
References: <20251125210759.333290-1-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767393546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0D4WffPGNWHnhyMg0PIdVXQguBZG4b5SibWWMzcspaU=;
 b=luTx4TFb8mH/rTl+p7aRnZx1wtla1YeqXbfOANA5yfabRUH0eD9Ydjsh/aOkm/Vd8BgsNr
 clX8BwQmHJONwU5bdXw9I2KFdLpDwScX5V0pKEvktRXIWUVn2rhp6uWOY/8QNd1tMe3Ehc
 BAJ1alRnOtA77+y4UmFdMyyhPF3710vX+X0LxQcnMjsZcpXPc4EsnwLW4202jGuc39iF3f
 nEeHtczKjI9s6VUKrPTqoWc2Wuv49J7r7cF23ERn5Wjz8oNhMSATOpbVXSDsGZ/+I9bOKv
 xKpKevTBwAEC6yMd9r8fIId8Jcz2a12ctvSJgcIXwSv8KYmb4DTUZUusVTTFgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=luTx4TFb
Subject: Re: [Buildroot] [PATCH 1/1] package/cairo: Fix build with newer gcc
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Bernd,

On Tue, 25 Nov 2025 22:07:59 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> Fixes:
> https://autobuild.buildroot.net/results/0e9/0e962c66e1e96b5899e87c13ace824379adc09f9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

In the spirit of recent discussions, could you respin this patch with a
more specific description, by doing some actual testing: what was the
last GCC version that built cairo successfully, and with which GCC
version did it start failing.

> ---
>  .../0001-Wincompatible-pointer-types.patch    | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/cairo/0001-Wincompatible-pointer-types.patch
> 
> diff --git a/package/cairo/0001-Wincompatible-pointer-types.patch b/package/cairo/0001-Wincompatible-pointer-types.patch
> new file mode 100644
> index 0000000000..79f0347538
> --- /dev/null
> +++ b/package/cairo/0001-Wincompatible-pointer-types.patch
> @@ -0,0 +1,38 @@
> +Fix build with newer gcc
> +
> +Downloaded from
> +https://github.com/LibreOffice/core/blob/master/external/cairo/cairo/Wincompatible-pointer-types.patch.0

This link doesn't work anymore, because you pointed to the master
branch, from which this patch has probably been removed.

> +
> +Upstream: https://gitlab.freedesktop.org/cairo/cairo/-/issues/921
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Cairo is using Git as its version control-system, so this patch should
be Git-formatted.

I see this hasn't been fixed upstream, while Cairo is widely used and
well-maintained. Why only us are hitting the issue? Not Fedora, Arch,
etc. who use bleeding-edge GCC compilers? Presumably the upstream Cairo
developers are also using an up-to-date distro, so why didn't they fix
the issue?

Is the issue perhaps happening only with a certain C library? Or maybe
it isn't gcc version related after all, or?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
