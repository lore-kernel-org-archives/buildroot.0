Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C165CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 16:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E7156068A;
	Sat,  3 Oct 2026 16:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nrDhMmhLddH0; Sat,  3 Oct 2026 16:15:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 237EE606C4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791044155;
	b=d2d5vf7cLZ/S/DDsl/hGReQTsHCk6IrKLF0LLmUuTivyQmS8n68Y+vBewMvSuy7Ls0Gq
	 zUThAQE4qC3VXY/s2/0X+SEyZYKuY44Sp1E87IDLDLB9yMAB0q71s5upwA2X7FrKQRrRs
	 Qf2YHVgR9vEi+hVtrrJDq2TRY+ri8EiPZTHptZagmanbfOTHCKs82GzFqBsbCEtBC6GOn
	 exbX2r/L4ke9UqhNF+gEdpnG9xvOZVElDJcSjBQGL7eDx6QxxZgpURW0uJiM2wohpw92R
	 L4zTo2g37xLT5C3TQtjjjYnkmICNm8jQJ++6AT5i6ALyfnNy6x4Nr2ecvabYPsJchDw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791044155;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PU/O9O0keCV8NdoooQHGTVjOJuqY60v9dIqgJR5UEuA=;
	b=HgCNVtEiZ2AehgyhrY4uD1P3JMTcMBlaBMkrJoYSIakjW/prknw5yY18qX08QIPGM9eG
	 ygRWNedX0IrTC0pMiBBkzb2cA7vFyBpntFvaw+hhYIGZtMTPQPMLqeVezCfc21qJqOiXR
	 zUpDS+GPwNxTEwDuh1BKlBKY2DqOAgSIH0tkrW4m/5hQb52G0oIH/JqzdcEEX25uCM+KR
	 4+fbzPWMyTZQsOuV3gX0eSJ9L5GNvhAjBDtvGNhefKpm2xZO46+ATbI+Rd7H5mIxsF4oa
	 GvE++CBpwqxNDdUYp+TwhkorTnNqwQBNCSg/dUgYm86r0xNqCyorRrlTi801MC7L3bA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791044155;
	bh=PU/O9O0keCV8NdoooQHGTVjOJuqY60v9dIqgJR5UEuA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Gw+niPPZ3AQfcH+jK9x2lgk3Qk0xvI4GiFEbQEGJxBYiyDXuUmm1CAzVaxMq1rTqT
	 qERd0354vlwrvEi6aqwf+c5UmRjADIH9mhBTT0/X/4wVT0DDMNa/Ey/JVQo50U9BbV
	 OpYULelkLM5N5D7mqhTJji5neZtDaMJ4B0V2DoHTCW0JvYyqpnAB+6Egc+L9SK9KiB
	 FCvt0ZA73FTERUJkIzGFzEwRNn5w5UbIBDzyGd6kXv0gwyVVWQljLh0fSGkdXA5yS9
	 UkI1FsbaZLSVftohYddB8uDbLLfHRrQHlRLrwolUyICWiUohQ5wdgsnsYJjJ6XyOQR
	 5CahmWyZg6uZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 237EE606C4;
	Sat,  3 Oct 2026 16:15:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B95B6435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F49681499
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L30yBvBRDZJT for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 16:15:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9ABF081498
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791044152;
 b=Z+WCZ9TK2paTMRsagu1MF4wxahwnuvTSTrpDUk6zQLzwBiqw2JFMG1Z4MZ6ya3gmhIRh
 uXoM5eWUF2LUCciSpzrXiUD7DntKkDRnpmLXvhPhzn/4XAvFS4bvbbP5YhjOrWSzv0nlY
 KaaWFfk6rdc2wFsm19kDE5QAq8yeQ9tYqEZ0mweRRmWOQUO148CDrtzeL1bga4xmTf1xg
 jpEJCC8D3RBVf/rJ3+UrqvX3oHDXOj7xAP75HiNY1myiYm8n2Fj1fKR03efUD3BuvEqLk
 Nsv0tTDd7VaJBgr6y5lPtunadP9Sw/G+0sSFFXNpbQ5RBZBBL4+AaFnyMvUq3glvejQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791044152;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=bc5TNFN2jU/J11SvMOivc7qzqDAqVEbbTkrgmxUxo1A=;
 b=OIm/1YMQ3Cu9T9tUWDVnvbMz7mQHmULVbzJ9Ghaur+t6b85vzA9yAu71i5ZuEKSmFexk
 LvRsseBXA4RB5NqcG3Jh5qp62RdPFsg8f6qxszwaGATN7UgmFWaY8YGiJLqZXXxdg+pfL
 0z9zZebK9GlQVfdq7l7G5khwg7Wzo1+axuAJgH6/BWMIvx3smTmFEEZEnUUEaOt7Ae2OP
 x288SGKUp0kBl6xiFGT07d4CvQ/Jkeh7BQpdyGJBsENCPvvUGmCCl342n4AqgGqIwN4e5
 pwH3bV59jPlHoTOkJBaQa1ShTtMsWK3QE0rrSAD5awSvX/yvC9hDJfBBtdKP+rJGGkw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=1ibkNXRe; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9ABF081498
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 16:15:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D3C724E41134;
 Sat,  3 Oct 2026 16:15:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8BD97604FF;
 Sat,  3 Oct 2026 16:15:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8467E10328170; 
 Sat,  3 Oct 2026 18:15:47 +0200 (CEST)
Date: Sat, 3 Oct 2026 18:15:47 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>, 
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Message-ID: <asEp-UvwtZnTyfY9@windsurf>
References: <20261003160713.1350799-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003160713.1350799-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/python-scipy: remove license
 file
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

On Sat, Oct 03, 2026 at 06:07:12PM +0200, Bernd Kuhls wrote:
> Buildroot commit 5d695881f8dc68ff1efe2cce75dda462c5990e3c bumped the
> package from 1.16.3 to 1.17.1. In Version 1.17.0 upstream removed the
> license file scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING:
> https://github.com/scipy/scipy/commit/14dffda0b83c46728a7c88998804a4663bb735b3
> 
> causing an error with make target python-scipy-legal-info:
> 
> ERROR: while checking hashes from package/python-scipy/python-scipy.hash
> ERROR: scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING has wrong sha256 hash:
> ERROR: expected: 0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe
> ERROR: got     :
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/python-scipy/python-scipy.hash | 1 -
>  package/python-scipy/python-scipy.mk   | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
> index 27a72904d2..5be848c8ad 100644
> --- a/package/python-scipy/python-scipy.hash
> +++ b/package/python-scipy/python-scipy.hash
> @@ -6,5 +6,4 @@ sha256  221e59f5e910fd7f94e44f0dac77436a11338c285c6346232e4a850a50da0e94  LICENS
>  sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
>  sha256  3df9207af2fdb861af0ae3b22026f163b9bcfab4e525dc4943afe2ffa3f77624  scipy/optimize/tnc/LICENSE
>  sha256  f0cedf52503b2d42b83411a0a16e6fefac346dfad8fddc66f50050150123470c  scipy/sparse/linalg/_dsolve/SuperLU/License.txt
> -sha256  0926566f9f406178d1214f8cc796e166b1213dd7c05e0c5b461a8b8ac9e50bbe  scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING
>  sha256  106d55c931fd6a84822e5345d900273d059f1c27310d02567ccb313c5d18c55d  scipy/spatial/COPYING_QHULL.txt
> diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
> index 8c536df130..e6e87d0cb8 100644
> --- a/package/python-scipy/python-scipy.mk
> +++ b/package/python-scipy/python-scipy.mk
> @@ -19,7 +19,6 @@ PYTHON_SCIPY_LICENSE_FILES = \
>  	scipy/ndimage/LICENSE.txt \
>  	scipy/optimize/tnc/LICENSE \
>  	scipy/sparse/linalg/_dsolve/SuperLU/License.txt \
> -	scipy/sparse/linalg/_eigen/arpack/ARPACK/COPYING \

But shouldn't the <pkg>_LICENSE variable be updated?

It contains:

PYTHON_SCIPY_LICENSE = \
        BSD-3-Clause, \
        BSD-2-Clause, \
        BSD, \
        BSD-Style, \
        MIT, \
        Qhull

and I'm wondering if this "BSD" wasn't just for this ARPACK thing?

Also, would be ideal if your commit message for fixes could contain:

Fixes: <commit hash> ("<commit title>")

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
