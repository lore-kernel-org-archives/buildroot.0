Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9B9C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A22D740189;
	Sun, 11 Feb 2024 17:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ZbGXxN9PE7T; Sun, 11 Feb 2024 17:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D4904028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D4904028D;
	Sun, 11 Feb 2024 17:31:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A70C1BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 42F3C6066F
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:31:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gTOfFrxqSZfj for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:31:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3122360668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3122360668
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3122360668
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:31:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6773C13F8B3;
 Sun, 11 Feb 2024 18:31:01 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 18:31:01 +0100
Date: Sun, 11 Feb 2024 18:31:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZckEVSP3bEy1wMEx@landeda>
References: <20240210122338.999772-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240210122338.999772-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707672663;
 bh=Xn2JLm7N7KuxQyd9ez/OBW41ZsbW8y7mUJ2hwXDj7GM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y13jSOVh8uxQUTc7J3UZjRok7CuPW1dAMqyZqB+Kxq0z6szYDsyl9dr0zACXBis00
 4qdKyMNe+pJPfm9JvtDztJk7OfAJdYRLSCDteeyFAQCauJKXKZSZKFReLi1qefJP6R
 TS5o0OFJVdWZZhPWVFr+KXwINsvEVzsA7JjCIKh6/pj/mtQLS1zKOPDHn/VfwHWMML
 J09zOlvV/5PZub+DDoInTYa1cl75dyq1/kqA3TBA5JMRtzVJTJsQqenhiQhqQMZkGf
 8uevMSo758pw9yvdcAWD73sLKvJ+shd362cm/jRcsymHbu6MDhOsCQHQmzivJUvQtG
 x2dP5lcoeiOQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Y13jSOVh
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpgme: bump to version 1.23.2
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

On 2024-02-10 13:23 +0100, Julien Olivain spake thusly:
> For change log, see [1] and [2].
> 
> [1] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=blob;f=NEWS;hb=refs/tags/gpgme-1.23.2
> [2] https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=shortlog;h=gpgme-1.23.2
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Patch tested on branch master at commit 8ab4a0a with commands:
> 
>     make check-package
>     ...
>     0 warnings generated
> 
>     utils/test-pkg -p libgpgme
>     ...
>     6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> 
>     support/testing/run-tests \
>         -d dl -o output_folder \
>         tests.package.test_libgpgme
>     ...
>     OK
> ---
>  package/libgpgme/libgpgme.hash | 4 ++--
>  package/libgpgme/libgpgme.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
> index 5c47db76d5..64099df4c3 100644
> --- a/package/libgpgme/libgpgme.hash
> +++ b/package/libgpgme/libgpgme.hash
> @@ -1,5 +1,5 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  12f4c98ffa75bdbfc4934d38757f57ba718b5aa0  gpgme-1.22.0.tar.bz2
> -sha256  9551e37081ad3bde81018a0d24f245c3f8206990549598fb31a97a68380a7b71  gpgme-1.22.0.tar.bz2
> +sha1  b3a938939a9fb2182684aa9ba094c8e8ecd6167b  gpgme-1.23.2.tar.bz2
> +sha256  9499e8b1f33cccb6815527a1bc16049d35a6198a6c5fae0185f2bd561bce5224  gpgme-1.23.2.tar.bz2
>  # Locally calculated
>  sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
> diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
> index 036103b7fc..dd39b37aa2 100644
> --- a/package/libgpgme/libgpgme.mk
> +++ b/package/libgpgme/libgpgme.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGPGME_VERSION = 1.22.0
> +LIBGPGME_VERSION = 1.23.2
>  LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
>  LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
>  LIBGPGME_LICENSE = LGPL-2.1+
> -- 
> 2.43.0
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
