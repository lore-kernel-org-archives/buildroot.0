Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D330CC4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:58:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D25161038
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 19:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D25161038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 651D760795;
	Tue, 17 Aug 2021 19:58:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiy0hitl9Njn; Tue, 17 Aug 2021 19:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D559607A8;
	Tue, 17 Aug 2021 19:58:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A048A1BF86D
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97ABE4024C
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 19:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vw4BDkiobet for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 19:58:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F2CB4015E
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 19:58:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8b4:21c0:9a77:1566])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 50DB9B0051B;
 Tue, 17 Aug 2021 21:58:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1629230299;
 bh=EXyIF6yspK5FS0oxcCegIllS/MIGKAlw5DF02oM8/b4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YdGTwVfjJtlVtCqBxlX0nK7JQSGFck2hZOp9PYRcDRVwTt+f+VJnWf7/Lv830NQBM
 7dR0dQS4zq0iUHwTx/cUhJhxCRZ228yyjBsJyR2sr4Q9GtCRWHTmFVwwoRRAwheBZJ
 Rur7KW9oPdQ6N+GKK4ieCCkk9Ck2drkHN7rs3oj8YpZZ7fjQdtsNsMKpFFt4YPOCw5
 utRO5OcpeE4gisHmQSh0eq9ParFfhUr5OZk1s1rjeIWLYuS1rIaH6w2a2J7N+j6czA
 +wf0hZWCTll+nv0c0/n/P50jopApeYYfTYaJ2q4VHgNFFFIAvioYMEe4US8BYSrqZO
 ThztOje+/+eew==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 17 Aug 2021 21:58:13 +0200
Date: Tue, 17 Aug 2021 21:58:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20210817195813.GV27036@scaer>
References: <20210815195340.12027-1-asafka7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210815195340.12027-1-asafka7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: depend
 comment on BR2_PACKAGE_PYTHON3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Asaf, All,

All six patches applied to master, thanks (but see a small nit I fixed,
below).

On 2021-08-15 22:53 +0300, Asaf Kahlon spake thusly:
> The user shouldn't view the comment on the python2 menu.

s/view/see/ and applied.

Regards,
Yann E. MORIN.

> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-cryptography/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-cryptography/Config.in b/package/python-cryptography/Config.in
> index 5a2e6da900..da4252d6da 100644
> --- a/package/python-cryptography/Config.in
> +++ b/package/python-cryptography/Config.in
> @@ -17,4 +17,5 @@ config BR2_PACKAGE_PYTHON_CRYPTOGRAPHY
>  	  https://cryptography.io
>  
>  comment "python-cryptography needs a toolchain w/ C++"
> +	depends on BR2_PACKAGE_PYTHON3
>  	depends on !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

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
