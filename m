Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2209CC88CB2
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 17:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD12F400B7;
	Mon, 12 Jun 2023 17:54:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD12F400B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_GPB4vTZWXT; Mon, 12 Jun 2023 17:54:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65CEA410DF;
	Mon, 12 Jun 2023 17:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65CEA410DF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 39F611BF306
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 17:54:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AA3A410DF
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 17:54:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AA3A410DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aHxVz0M-NSUJ for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 17:54:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A92F400B7
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A92F400B7
 for <buildroot@buildroot.org>; Mon, 12 Jun 2023 17:54:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3d05:f741:f166:4219])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 46C6D19F732;
 Mon, 12 Jun 2023 19:54:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 12 Jun 2023 19:54:14 +0200
Date: Mon, 12 Jun 2023 19:54:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230612175414.GA2773@scaer>
References: <20230425171454.48802-1-aduskett@gmail.com>
 <20230425171454.48802-3-aduskett@gmail.com>
 <87pm60znip.fsf@48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87pm60znip.fsf@48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1686592463;
 bh=RlLKrQ5o8gtinNYbWDioiuZnhQ0UysDEFQNhp+b/4yc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jVC1ktB0LbAB9WoV+yrGx3nq9CAHvmF6BszvqikL8s2hnSPq7Dglm1q6NjvzjEMxe
 AvMSquMXUK3eZ5ek23W7EtN2STuQ25GvS5zbGctlZGPCViVXeMIERTIPhGV4YsBg03
 dr3cIvlWQtswHjFneZUuIPFAiMVs6wCoBGjwVo5cGRvRDaxcCdBbodUnMHF46PHy1N
 KsOuDg3mZIR4tK5v3ul2Wc3jZs0HiXXaOOxSxy2jpvzYPuRMSVPWPy3udx/JB8eXI7
 YYTrwBz5UHZhUGV+5vjpxlweDQaeNEPyoqG2O0W4zI8wpf1ASBtUGIZctmtQ2c2O0I
 VUZRGolYuXbWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jVC1ktB0
Subject: Re: [Buildroot] [PATCH v2 02/13] package/python-pip: add host
 variant
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-06-12 17:52 +0200, Peter Korsgaard spake thusly:
> >>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:
>  > In the following patch that updates libselinux, the libselinux python tools now
>  > require pip to install.
>  > Signed-off-by: Adam Duskett <aduskett@gmail.com>
> Somewhat related, is there any way we can ensure that this pip is only
> used for the installation logic (which is fine if a bit odd)

Yes, I too found it odd. I don't recall the details, though, but indeed,
we do need pip to perform the install step, while the build step is
still performed with setuptools.

> and NOT to pull in extra python
> dependencies (which is naturally NOT OK)?

That was a concern of mine when I applied the patch, too, but I did not
have a good idea to prevent that.

But since then, I've learnt about --no-index, and if that is not enough,
we can redirect to a fake index with -i and --extra-index-url. Could
using --no-deps also be useful?

So we could maybe provide our wrapper around pip3, that uses a combo of
those options, to prevent installing anything but a local file.

That would not work for packages that use a python script to import pip
and directly call it, though; is that even possible (I'd guess so, and
probably something, somewhere is (ab)using that).

Alternatively, the wrapper could also export http_proxy and https_proxy
to something that does not exist, and that would cause the download to
fail.

Regards,
Yann E. MORIN.

> > ---
>  >  package/python-pip/python-pip.mk | 1 +
>  >  1 file changed, 1 insertion(+)
> 
>  > diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
>  > index 8cf3aaa3ec..35ad7bede2 100644
>  > --- a/package/python-pip/python-pip.mk
>  > +++ b/package/python-pip/python-pip.mk
>  > @@ -14,3 +14,4 @@ PYTHON_PIP_CPE_ID_VENDOR = pypa
>  >  PYTHON_PIP_CPE_ID_PRODUCT = pip
>  
>  >  $(eval $(python-package))
>  > +$(eval $(host-python-package))
>  > -- 
> 
>  > 2.40.0
> 
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot@buildroot.org
>  > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> 
> -- 
> Bye, Peter Korsgaard

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
