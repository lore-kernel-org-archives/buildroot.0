Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B74C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 09:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D68881951;
	Thu,  6 Jun 2024 09:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WBQqufQ6eTBG; Thu,  6 Jun 2024 09:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6081081E79
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6081081E79;
	Thu,  6 Jun 2024 09:31:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 817721BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C64581951
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 09:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNJ-7iI8MBuX for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 09:31:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5E4AD81350
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E4AD81350
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E4AD81350
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 09:31:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 22BE913F88F;
 Thu,  6 Jun 2024 11:31:11 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 11:31:10 +0200
Date: Thu, 6 Jun 2024 11:31:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jarkko Sakkinen <jarkko@kernel.org>
Message-ID: <ZmGB3k7fDCkXeD-L@landeda>
References: <20240605233503.23516-1-jarkko@kernel.org>
 <20240605233503.23516-2-jarkko@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605233503.23516-2-jarkko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717666274;
 bh=2F4nDazPe/VZwFgNfMKJlb7Dk4SM7iLsH+ANCORhprY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cBbRy1wnr/0w8cHoYpLX3rnm3GPiGCrJ5GOBPDBYU3nLyC6l5c8fEC/jgbPhHpUhZ
 TLoPqGgZdA/MmI17KgozbUM1AQf5NzTozY+RRD9gq6AOeE7zDjdJZZhLXF5bfEA5N9
 vOEXVR8egUZVK3vkhc0/ZneB557PgTAmwMQ3Urkv00/6n7QdbqsSncQJ7MRYaa9bqS
 sRzrMIUusXloyzaDJIRH6m63MkfTfhV/R/d+m90tY/iMkM1qAmm5aM1epQzb3IHI8A
 doO3pB3sX4z5bNNUa14VzTy8XERqZXxpq54Ybo5kybLsNgGvwMFS83H4aOPTyvwRxk
 75QHJwljiZGTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cBbRy1wn
Subject: Re: [Buildroot] [PATCH v7 1/3] package/json-glib: add host build
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
Cc: Stefan Berger <stefanb@linux.ibm.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jarkko, All,

On 2024-06-06 02:35 +0300, Jarkko Sakkinen spake thusly:
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
[--SNIP--]
> diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
> index cd53f24cee..cc9f8c9fa1 100644
> --- a/package/json-glib/json-glib.mk
> +++ b/package/json-glib/json-glib.mk
> @@ -18,6 +18,11 @@ JSON_GLIB_DEPENDENCIES = \
>  	host-pkgconf \
>  	libglib2
> 
> +HOST_JSON_GLIB_DEPENDENCIES = \
> +	host-pkgconf \
> +	host-libglib2
> +HOST_JSON_GLIB_CONF_OPTS = -Dintrospection=disabled

Like for the target variant, I also added:
    -Dgtk_doc=disabled
    -Dtests=false

Applied to next, thanks.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
>  JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
>  JSON_GLIB_DEPENDENCIES += gobject-introspection
> @@ -34,3 +39,4 @@ endif
>  JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
> 
>  $(eval $(meson-package))
> +$(eval $(host-meson-package))
> --
> 2.45.1
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
