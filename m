Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560CFC27C53
	for <buildroot@archiver.kernel.org>; Sun,  9 Jun 2024 19:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D80481272;
	Sun,  9 Jun 2024 19:15:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rm8XX5kBcKDa; Sun,  9 Jun 2024 19:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AAAC81B36
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AAAC81B36;
	Sun,  9 Jun 2024 19:15:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FD9A1BF3E0
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 19:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 596F540395
 for <buildroot@lists.busybox.net>; Sun,  9 Jun 2024 19:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPJODTOcCY-8 for <buildroot@lists.busybox.net>;
 Sun,  9 Jun 2024 19:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D56BA40332
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D56BA40332
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D56BA40332
 for <buildroot@buildroot.org>; Sun,  9 Jun 2024 19:14:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5C5C613F861;
 Sun,  9 Jun 2024 21:14:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jun 2024 21:14:51 +0200
Date: Sun, 9 Jun 2024 21:14:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <ZmX_K6rvysPJXl0p@landeda>
References: <20240609174048.31062-1-vfazio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240609174048.31062-1-vfazio@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717960496;
 bh=bXFgowt06wbAu+sy3r/gJo2aCD0L0o5QWCQLA+3xxOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MGfjd8Q553xUn7DGxLq3cy2dji/dCBMaVHd1VSbOLDsTXvzxj3/jI4XZ3ZtVxbvt2
 uSQQQdw51UK6+ThvmavnZrDK40OdUaYm1/QnjLSa+T6wda68x5yEqJx5UQ7zOFIuH8
 Am2e0J8jj+KgTMTesKtcllZXd3GuUc9+m8yKb46frxwkZ5M0hxkaOF/5P+KGXmzC0N
 LoTgouaWoWHw23D8qxg+rM27UQxsCYEBKDonZP84pvPGm5PJ+FL6tHL5+DfhoILbiv
 zKkjxE5R4vLRQ90XbXFg3M7gQt4Vw079E0fuA+DxiQjq5XoaVJrC9ho3ZHgNT3xBvS
 OuUJaVOIcyAGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MGfjd8Q5
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: fix config directory
 pattern
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2024-06-09 12:40 -0500, Vincent Fazio spake thusly:
> Previously, when running `PYTHON3_REMOVE_USELESS_FILES`, the hook to
> clean up files from the python config directory assumed a pattern of
> "config-$(VERSION)m-$(PLATFORM_TRIPLET)".
> 
> However, the "m" ABI suffix was dropped in python 3.8, so the hook would
> never actually find files to delete. No error was raised due to the use
> of a subshell to invoke find.
> 
> Also, if a platform triplet is not detected during the configure stage,
> the config directory (LIBPL) defaults to `config-$VERSION`, and has no
> trailing `-$PLATFORM_TRIPLET`.
> 
> Now, we glob anything after the version to ensure files get deleted.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Applied to master, thank you!

Regards,
Yann E. MORIN.

> ---
>  package/python3/python3.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index 5d9d77af50..950006698b 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -204,7 +204,7 @@ define PYTHON3_REMOVE_USELESS_FILES
>  	rm -f $(TARGET_DIR)/usr/bin/python3-config
>  	rm -f $(TARGET_DIR)/usr/bin/smtpd.py.3
>  	rm -f $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/distutils/command/wininst*.exe
> -	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)m-*/ \
> +	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)*/ \
>  		-type f -not -name Makefile` ; do \
>  		rm -f $$i ; \
>  	done
> -- 
> 2.34.1
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
