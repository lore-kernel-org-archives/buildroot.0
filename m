Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B99C6FD1F
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 21:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA53C40B5C;
	Tue, 14 Mar 2023 21:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA53C40B5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bx9EF9debXIn; Tue, 14 Mar 2023 21:54:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0DD5040B58;
	Tue, 14 Mar 2023 21:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DD5040B58
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46B641BF38B
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 203EB41879
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 21:54:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 203EB41879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdGLt7SbQzuk for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 21:54:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B30A41781
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B30A41781
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 21:54:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A7602E0002;
 Tue, 14 Mar 2023 21:54:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pcCbP-001Wbb-Pa; Tue, 14 Mar 2023 22:54:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230225231419.22342-1-fontaine.fabrice@gmail.com>
Date: Tue, 14 Mar 2023 22:54:39 +0100
In-Reply-To: <20230225231419.22342-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 26 Feb 2023 00:14:19 +0100")
Message-ID: <87mt4f578g.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] boot/mxs-bootlets: fix build without
 any bootstream
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

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since the addition of the package
 > in commit 2a636d15217cd326b4546e7017538c7a9e9d399c:

 > sed -i 's,[^
 > *]power_prep.*;,\tpower_prep="/home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/power_prep/power_prep";,'
 > /home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/
 > sed: couldn't edit /home/autobuild/autobuild/instance-9/output-1/build/mxs-bootlets-10.12.01/: not a regular file

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b4b26f6b02fd1991f46eba5db240e5050b96d333

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

> ---
 >  boot/mxs-bootlets/Config.in | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/boot/mxs-bootlets/Config.in b/boot/mxs-bootlets/Config.in
 > index b3e392afa8..8f9334b610 100644
 > --- a/boot/mxs-bootlets/Config.in
 > +++ b/boot/mxs-bootlets/Config.in
 > @@ -1,6 +1,8 @@
 >  config BR2_TARGET_MXS_BOOTLETS
 >  	bool "mxs-bootlets"
 >  	depends on BR2_arm
 > +	depends on BR2_TARGET_BAREBOX || BR2_LINUX_KERNEL || \
 > +		BR2_TARGET_UBOOT
 >  	help
 >  	  Stage1 bootloaders for Freescale iMX23/iMX28 SoCs
 
 > -- 

 > 2.39.1

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
