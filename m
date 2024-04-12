Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE30C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 15:51:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A89C4405DD;
	Fri, 12 Apr 2024 15:51:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id to2XKYLLamSe; Fri, 12 Apr 2024 15:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A210840645
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A210840645;
	Fri, 12 Apr 2024 15:51:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB3341BF42E
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C1F8225C
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 15:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CKqFTF0vLR3G for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 15:51:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8A7F82246
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8A7F82246
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8A7F82246
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 15:51:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8B0F113F8A7;
 Fri, 12 Apr 2024 17:51:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Apr 2024 17:51:06 +0200
Date: Fri, 12 Apr 2024 17:51:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <ZhlYatOD6uL7X6Hr@landeda>
References: <20240412055358.1354293-1-heiko.thiery@gmail.com>
 <ZhlWuOI9ZJzGMh6i@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZhlWuOI9ZJzGMh6i@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712937074;
 bh=ahs/+V3vDKUj0W/r6M+9z12R9h1xtwNIntQqWskqBRk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P1Xu7wuPHW093FtEU2MG3zguWxygapmoUT1kXE8MaWig/DnHmOsjzFr+UrDeuGcdY
 JGiPF6o7G1lVJoN5h7AZ0e44vpkAOdqkOJSf5sS3WiSPb0AGUqF1FJNKBUdaXlR/0q
 N+J01v1WtbgyjRwq+q3WybhiFyeJeXkpRdyNu1aDjBAoelBx1r4FvHSJraWfzaAha7
 e7vi4iyDJXTMbFMrT+42EcWlmZ1dcrKFmc+Zj4wMKoeVvRUF5Ry1kCv+hN5TBlwsO8
 aEsoLvvoTayz52gYA8yHxhxIgeGFMhSZxUgfxJaSV+XiWhKX/Ewdrc2E+HHzkihGrO
 5/+GJg2fX8BAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=P1Xu7wuP
Subject: Re: [Buildroot] [PATCH v3 1/3] package/python-yamllint: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@smile.fr>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Heiko, All,

On 2024-04-12 17:43 +0200, Yann E. MORIN spake thusly:
> Heiko, All,
> 
> On 2024-04-12 07:53 +0200, Heiko Thiery spake thusly:
> > This host package is needed since u-boot 2024.04 for building ti defconfigs.
> > 
> > This is an requirement for using buildman/binman [1].
> > 
> > [1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/tools/buildman/requirements.txt?ref_type=tags#L3
> > 
> > Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> > ---
> [--SNIP--]
> > diff --git a/package/python-yamllint/Config.in b/package/python-yamllint/Config.in
> > new file mode 100644
> > index 0000000000..5c0962f09f
> > --- /dev/null
> > +++ b/package/python-yamllint/Config.in
> > @@ -0,0 +1,8 @@
> > +config BR2_PACKAGE_PYTHON_YAMLLINT
> > +	bool "python-yamllint"
> > +	select BR2_PACKAGE_PYTHON_PATHSPEC # runtime
> 
>     $ ./utils/docker-run make check-package
>     package/python-yamllint/Config.in:3: BR2_PACKAGE_PYTHON_PATHSPEC referenced but not defined
> 
> OK, I'll go and apply that other patch of yours that introduces the
> target variant for python-pathspec, but which is not in this patchset.

Applied to master, now, thanks.

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
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
