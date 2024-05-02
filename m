Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C906FC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 08:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8EDE84074B;
	Thu,  2 May 2024 08:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xl3Ny9CEVr4O; Thu,  2 May 2024 08:31:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4C7C4086E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C7C4086E;
	Thu,  2 May 2024 08:31:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7DF81BF47A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4D6A82322
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IrGtIAXCOt3S for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 08:31:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 865018231F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 865018231F
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 865018231F
 for <buildroot@buildroot.org>; Thu,  2 May 2024 08:31:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D72921BF20C;
 Thu,  2 May 2024 08:31:39 +0000 (UTC)
Date: Thu, 2 May 2024 10:31:39 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240502103139.62ca4812@windsurf>
In-Reply-To: <20230917185116.182810-1-fontaine.fabrice@gmail.com>
References: <20230917185116.182810-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714638700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t1DphL8drA6pejtNRnZeOggm1CBO5UZUWYasiQLfUKQ=;
 b=MIRAM5T/4oT5wY6uN24CFMBSgHLXO8q3CBlcHIfB68/UwM8EcE3/ok+pc4r+e6+8fLH06p
 frOkfwwmwzWhUkhgpL9LF8tGs6uL2Xipmj3fnZsoCwAs8kLfPu9vhremvFqtG4hZztbOmI
 AfpSmNEvWkKXx+eFy5GcRUzpv6xbN9NB5V+1hQ4cCW3INUEu3TYpDcy+3Q+QdMWe3V3+6v
 Ip5UYCsuyP/6/t5CSAYlpVGF3hbX02dVPYcWXMj6Dp75Nuzffkha8GJoBfVgvvQdlXv0Ru
 ZNbI7WKAjdSXkg93t1QFSGRF7FRMc01TIzRrUvpJYpX8x4//KTeFb+SMhaEsNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MIRAM5T/
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: fix atomic handling
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sun, 17 Sep 2023 20:51:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Correctly fix atomic handling to avoid the following build failure with
> all users of libglib2 (e.g. gdk-pixbuf) raised since bump to version
> 2.76.1 in commit 3f9622fe3d85b4d9f734b879abc1d485afea19b2:
> 
> /usr/lib/libglib-2.0.a(gthread-posix.c.o): in function `g_mutex_trylock':
> gthread-posix.c:(.text+0xda8): undefined reference to `__atomic_compare_exchange_4'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/24a358869b98d83ab374c7c3a185ced450064d35
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0004-link-with-latomic-when-needed.patch  | 45 +++++++++++++++++++
>  package/libglib2/libglib2.mk                  |  5 ---
>  2 files changed, 45 insertions(+), 5 deletions(-)
>  create mode 100644 package/libglib2/0004-link-with-latomic-when-needed.patch

Applied to master, thanks. However, could you follow-up with upstream?
They re-opened a MR at
https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3606 but then had
to close it because it broke the build in some situations. If you could
have a look and submit a new iteration of the patch upstream, it'd be
nice.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
