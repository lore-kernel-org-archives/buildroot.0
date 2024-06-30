Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5DFC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 09:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55C994038E;
	Sun, 30 Jun 2024 09:30:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSIcwh01JtAE; Sun, 30 Jun 2024 09:30:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D436405AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D436405AE;
	Sun, 30 Jun 2024 09:30:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A7321BF364
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2650A405DE
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 09:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PorGjyuO0zp for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 09:30:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA0E14038E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA0E14038E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA0E14038E
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 09:30:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 172D513F88F;
 Sun, 30 Jun 2024 11:30:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Jun 2024 11:30:46 +0200
Date: Sun, 30 Jun 2024 11:30:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZoElxng_7sJTJLTW@landeda>
References: <20240629082745.3489228-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240629082745.3489228-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1719739849;
 bh=gS9ft+b0RfjOoGipIoi5UHIyajFxwmxQa/R6fMwvFc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dvlM9BgjKnPOk3EVwYgKy6qbwe3UKPzRlz2m+CZ8am9xkCpbXigTLVepT79C6Gzgx
 TImmp1nLaqEjj/kiG6/F4vbCXWWXGdFtPMLqJruhVLb77TdsaRBfh/n5m7POne1IQW
 mli6LoIB3FwAlLMrHAhxgcVhEnka1ib3pM/kZ6R2jhEX8VEgvfX9fnjvBsMBtf01TK
 1Juy+l/JxBQOPqFWgRXcOsmBt2EX1hfIc01xEhg44BXqkTJH6UkcgLw3DS93Xm3NwI
 ZlMYrpdq352LMywjSjhX2p51cnha07bmujdLOhK1z/Z8GZQpjU0PdKgxaMbDCoxEl7
 bhB2O25+kE1Ag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dvlM9Bgj
Subject: Re: [Buildroot] [PATCH 1/1] package/crda: update patches to be
 applied with fuzz 0
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

Bernd, All,

On 2024-06-29 10:27 +0200, Bernd Kuhls spake thusly:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, crda fails to build with output:
> 
>     Applying 0001-crda-support-python-3-in-utils-key2pub.py.patch using patch:
>     patching file Makefile
>     Hunk #1 FAILED at 112.
>     1 out of 1 hunk FAILED -- saving rejects to file Makefile.rej
> 
> Rebase patch to fix the problem, problem was not yet caught by
> autobuilders.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../crda/0001-crda-support-python-3-in-utils-key2pub.py.patch | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
> index f2b9cca2d6..00b5a52ea7 100644
> --- a/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
> +++ b/package/crda/0001-crda-support-python-3-in-utils-key2pub.py.patch
> @@ -33,6 +33,8 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>  Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  [Romain: Use pycryptodomex]
>  Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +[Bernd: rebased for version 4.15]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>  ---
>   Makefile         |   2 +-
>   utils/key2pub.py | 146 ++++++++++++++++++++++++-----------------------
> @@ -49,7 +51,7 @@ index a3ead30..8da38d0 100644
>  -	$(Q)./utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
>  +	$(Q) python utils/key2pub.py --$* $(wildcard $(PUBKEY_DIR)/*.pem) $@
>   
> - $(LIBREG): regdb.h reglib.h reglib.c
> + $(LIBREG): reglib.c regdb.h reglib.h
>   	$(NQ) '  CC  ' $@
>  diff --git a/utils/key2pub.py b/utils/key2pub.py
>  index 9bb04cd..8a0ba2a 100755
> -- 
> 2.39.2
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
