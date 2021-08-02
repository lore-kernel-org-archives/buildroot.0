Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F83C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 20:24:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3E2A610A8
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 20:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3E2A610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEF5E83D84;
	Mon,  2 Aug 2021 20:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EdhnJZ9UHZkq; Mon,  2 Aug 2021 20:24:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 001C683D79;
	Mon,  2 Aug 2021 20:24:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E13CD1BF303
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 20:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC39C40184
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 20:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YBZjPmvGZzpf for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 20:24:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57BBC400ED
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 20:24:03 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id E2FB2E0007;
 Mon,  2 Aug 2021 20:23:59 +0000 (UTC)
Date: Mon, 2 Aug 2021 22:23:58 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, "Yann E. MORIN"
 <yann.morin.1998@free.fr>, Buildroot List <buildroot@buildroot.org>
Message-ID: <20210802222358.2e7d14b0@windsurf>
In-Reply-To: <20210801215159.2435224-1-thomas.petazzoni@bootlin.com>
References: <20210801215159.2435224-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libmodsecurity: fix build with
 libmaxminddb
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
Cc: Frank Vanbever <frank.vanbever@essensium.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

On Sun,  1 Aug 2021 23:51:58 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> Build with libmaxminddb is broken since bump to version 3.0.5 in commit
> 464d0be380c84ac7c3f1684e49153c3868280d7e because of
> https://github.com/SpiderLabs/ModSecurity/commit/785958f9b5089b918c7d054cbcc2fe4a3c7b3788
> 
> So revert this commit until upstream answer to comment to
> https://github.com/SpiderLabs/ModSecurity/issues/2131
> 
> Reverting this commit requires autoreconfiguring, which itself causes
> lots of warnings as configure.ac queries git to know the version of
> various parts of libmodsecurity. However, it turns out that those
> versions are only used to be displayed in the output of the configure
> script, which is quite useless. The only one that is referenced
> elsewhere is LIBINJECTION_VERSION, but it's in fact a different thing:
> it is defined by others/libinjection/src/libinjection_sqli.c.
> 
> The only variable that was AC_SUBST() and therefore visible elsewhere
> was MSC_GIT_VERSION, but it is not used anywhere in the code base,
> except in the configure script itself.
> 
> Note that one patch is 0001 and the other 0003, because there was
> already a 0002 patch.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4c639fd967faa06f8ae362bacd38f3409c47267c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...-drop-usage-of-git-at-configure-time.patch | 79 +++++++++++++++++++
>  ...Revert-Fix-maxminddb-link-on-FreeBSD.patch | 28 +++++++
>  package/libmodsecurity/libmodsecurity.mk      |  2 +
>  3 files changed, 109 insertions(+)
>  create mode 100644 package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
>  create mode 100644 package/libmodsecurity/0003-Revert-Fix-maxminddb-link-on-FreeBSD.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
