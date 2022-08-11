Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA410C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 11:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3659282FC9;
	Thu, 11 Aug 2022 11:06:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3659282FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tshx5XUMMOnm; Thu, 11 Aug 2022 11:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF7B82FA2;
	Thu, 11 Aug 2022 11:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF7B82FA2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3F61BF38C
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A89A4026A
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 11:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A89A4026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bMcY_uah5hUw for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 11:06:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E951640132
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E951640132
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 11:06:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9E5FCE0004;
 Thu, 11 Aug 2022 11:06:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oM613-002ox0-QB; Thu, 11 Aug 2022 13:06:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220718203847.2646609-1-yann.morin.1998@free.fr>
Date: Thu, 11 Aug 2022 13:06:17 +0200
In-Reply-To: <20220718203847.2646609-1-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 18 Jul 2022 22:38:47 +0200")
Message-ID: <87sfm3m446.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCHv5] package/uacme: requires TLS support in
 libcurl
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
Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Baruch Siach <baruch@tkos.co.il>
 > uacme configure script fails when libcurl does not support TLS. This
 > means that BR2_PACKAGE_LIBCURL_TLS_NONE is incompatible with uacme.

 > Add a kconfig knob to libcurl, BR2_PACKAGE_LIBCURL_FORCE_TLS, so that
 > _TLS_NONE is not an option. Select that from uacme.

 > Note that, beside selecting BR2_PACKAGE_LIBCURL_FORCE_TLS, packages will
 > have to also select a package that can be used as a crypto backend by
 > libcurl. Use of BR2_PACKAGE_LIBCURL_FORCE_TLS is unlikely to become very
 > common in the foreseeable future, so we don't need to optimize for this
 > corner case.

 > uacme already needs a crypto package for itself, so the above
 > requirement is naturally met for uacme.

 > Fixes:
 > http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
 > http://autobuild.buildroot.net/results/4e16f1d958ac3d30e26e7f17bdffc47834b0e2bd/
 > http://autobuild.buildroot.net/results/25280409b32282b4dd40b1e88127051439380f3d/

 > Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 > [yann.morin.1998@free.fr:
 >   - keep the current forward select
 >   - add the kconfig knob
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

 > ---
 > v5 (Yann E. MORIN):
 >   Rename knob to _FORCE_TLS (Baruch)
 >   _FORCE_TLS needs a crypto package to be selected (Baruch)
 >   Expand commit log to explain that (Baruch)

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
