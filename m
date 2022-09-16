Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BC4ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 354BF61228;
	Fri, 16 Sep 2022 12:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 354BF61228
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boR1XRt0unG7; Fri, 16 Sep 2022 12:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D46936121C;
	Fri, 16 Sep 2022 12:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D46936121C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 762FB1BF2E5
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:04:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51E40842E0
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51E40842E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id reNrsn5GHOnY for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:04:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB76E842D6
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB76E842D6
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:04:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E29DF200007;
 Fri, 16 Sep 2022 12:04:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZA5D-008cXH-6u; Fri, 16 Sep 2022 14:04:35 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220814182734.2878423-1-fontaine.fabrice@gmail.com>
 <20220814182734.2878423-2-fontaine.fabrice@gmail.com>
Date: Fri, 16 Sep 2022 14:04:35 +0200
In-Reply-To: <20220814182734.2878423-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 14 Aug 2022 20:27:34 +0200")
Message-ID: <87czbv8qzw.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3,
 2/2] package/libvirt: fix libvirtd dependency
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Commit 4dff1be05e90 (package/libvirt: libvirtd needs C++ for nmap-ncat)
 > introduce a recursive dependency (really: a circular dependency):

 >     package/busybox/Config.in:33:error: recursive dependency detected!
 >     package/busybox/Config.in:33:   symbol BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected by BR2_PACKAGE_EBTABLES_UTILS_SAVE
 >     package/ebtables/Config.in:11:  symbol BR2_PACKAGE_EBTABLES_UTILS_SAVE depends on BR2_PACKAGE_EBTABLES
 >     package/ebtables/Config.in:1:   symbol BR2_PACKAGE_EBTABLES is selected by BR2_PACKAGE_LIBVIRT_DAEMON
 >     package/libvirt/Config.in:44:   symbol BR2_PACKAGE_LIBVIRT_DAEMON depends on BR2_PACKAGE_NETCAT_OPENBSD
 >     package/netcat-openbsd/Config.in:1:     symbol BR2_PACKAGE_NETCAT_OPENBSD depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

 > We can't drop the C++ dependency and switch the netcat-openbsd and
 > nmap-ncat dependencies conditions without adding a glibc dependency.

 > So always mandate C++ even if is only needed by nmap and not
 > netcat-openbsd

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v2 -> v3 (after review of Thomas Petazzoni):
 >  - Always mandate C++ instead of glibc
 
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Fix patch (rebase on top of current master)

Committed to 2022.05.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
