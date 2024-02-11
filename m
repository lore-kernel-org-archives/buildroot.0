Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D10C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C30E404F8;
	Sun, 11 Feb 2024 17:27:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dSgG2mPkbhAy; Sun, 11 Feb 2024 17:27:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88E5640492
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88E5640492;
	Sun, 11 Feb 2024 17:27:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F11EA1BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDCAE40774
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OdH8CTq2hlTx for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D784F40773
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D784F40773
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D784F40773
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:27:32 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 131B913F88E;
 Sun, 11 Feb 2024 18:27:28 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Feb 2024 18:27:27 +0100
Date: Sun, 11 Feb 2024 18:27:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZckDf-jmI3SwJuFZ@landeda>
References: <20240210122552.1001346-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240210122552.1001346-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707672450;
 bh=JxI7BLRNEcRFB3aIYhM/Zj0p7uG1EqaYVAaV7NnUwQw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JXE009Il313hymrQ6NXOIIzEmwTy65OH6unFPg/NeyDA/gA9m459vR/RXLrvhfZAv
 0lsxwaKOaeG4viB3uoLO6WG06s2Xkbkz6sYjOwdCKFus80xWjrYoZRf00xI2te/ZLi
 cwtL6kSFDmwhOtH4Madkvz+7tgJKtquTt5Hl3Nn+u68pAByunpIbyXLYfUH3ky/kVd
 JfPvDtuxM9o0yQcVotdTPipIqxK3y8Ab6RMxyDVdbFqrI4U8P5oGrevQkwZvERM0Os
 J4it3maty64vJu+Upm4v3+f5Y4iD8lhltSDD2fcc1BfMPxnI74cwJlBlPs7qS5aMtn
 87Iyf0bKf2h5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JXE009Il
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: libgpgme: increase gpg
 key generation timeout
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

On 2024-02-10 13:25 +0100, Julien Olivain spake thusly:
> gpg key generation can take longer than the default timeout on a
> loaded or slow test host. The commit increase the timeout for the
> key generation command to prevent the test to randomly fail.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/testing/tests/package/test_libgpgme.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_libgpgme.py b/support/testing/tests/package/test_libgpgme.py
> index 28a33bab03..b497891249 100644
> --- a/support/testing/tests/package/test_libgpgme.py
> +++ b/support/testing/tests/package/test_libgpgme.py
> @@ -37,7 +37,7 @@ class TestLibGpgme(infra.basetest.BRTest):
>          # We now create our gpg key.
>          cmd = "gpg --batch --passphrase ''"
>          cmd += f" --quick-generate-key {gpg_userid} default default"
> -        self.assertRunOk(cmd)
> +        self.assertRunOk(cmd, timeout=30)
>  
>          # We should now see our key in the list.
>          self.assertRunOk(gpgme_listkey)
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
