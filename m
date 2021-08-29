Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFDBC432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 10:46:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087C960F3A
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 10:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 087C960F3A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3BC240496;
	Sun, 29 Aug 2021 10:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id th1V4gOKvjWT; Sun, 29 Aug 2021 10:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E8AB4049B;
	Sun, 29 Aug 2021 10:46:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 679971BF336
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 10:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E8A64013F
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 10:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VgIPtJhdY-qL for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 10:46:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DE42400DA
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 10:46:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c87f:483a:a09f:382b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C7FFA5FF27;
 Sun, 29 Aug 2021 12:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630234002;
 bh=dPucVfzsA0ZE3pB81PoEnROdLc+PxsWasURmYXAvMNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qM8wsVDMVAUyOEZ2f2wjlz9t5HbzaP1COlONeLiaqsggrQYNd+uvoPuFxTfNTrsFy
 sxBMteJHSJWUxSNMbLiZbUuJuRLjL6vBq9oT+s7Id8DeayX/wHxu/mQ6wB+/E6HvuG
 f3ognqfsvfW8ifmxEtzGNB+lcWiUmUTLsGHObOMvH87QXreyVxFAavM8oNstZkxJBs
 J34Y2oICxS9245uyhkv3gkQL5G0p5LoPPWUYyB3mbVk73xV7gQ0a6vKVI8ymrkoe7P
 400yTYJWwl6HcAppcb9SW96kCHRCuOCHmq32+h8cHZTKtUO5r6QHsSAjHj8zh7qLZ9
 ugy+Oxkb6Q2ww==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Aug 2021 12:46:27 +0200
Date: Sun, 29 Aug 2021 12:46:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20210829104627.GU2661@scaer>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
 <20210817083930.3718711-15-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210817083930.3718711-15-herve.codina@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 14/16] support/testing/tests: add test
 for check_bin_arch
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On 2021-08-17 10:39 +0200, Herve Codina spake thusly:
> From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> This tests build a bogus package that installs a binary built for the
> host architecture into $(TARGET_DIR), which should cause a build
> failure, at least as long as the host architecture isn't ARM.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

This was not really part of the PPD/TLPB stuff, and did not seem to
depend on it in any way, so: applied to next, thanks.

Seem a small nit below, though...

> ---
[--SNIP--]
> diff --git a/support/testing/tests/core/test_bad_arch.py b/support/testing/tests/core/test_bad_arch.py
> new file mode 100644
> index 0000000000..76acba3711
> --- /dev/null
> +++ b/support/testing/tests/core/test_bad_arch.py
> @@ -0,0 +1,19 @@
> +import infra
> +import infra.basetest
> +import subprocess

    $ make check-flake8
    support/testing/tests/core/test_bad_arch.py:3:1: F401 'subprocess' imported but unused
    1     F401 'subprocess' imported but unused

I fixed that when applying.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
