Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C85AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C14A1845C9;
	Thu, 26 May 2022 08:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id InXjJVAvFXF2; Thu, 26 May 2022 08:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E87EF845A4;
	Thu, 26 May 2022 08:44:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41E591BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E8DA845A4
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PKm6jwgdXSIb for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:44:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA4C984554
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:44:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id DA516E0004;
 Thu, 26 May 2022 08:44:11 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nu96I-00HKAI-RO; Thu, 26 May 2022 10:44:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220421115529.2625137-1-fontaine.fabrice@gmail.com>
Date: Thu, 26 May 2022 10:44:10 +0200
In-Reply-To: <20220421115529.2625137-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 21 Apr 2022 13:55:29 +0200")
Message-ID: <87k0a8r8dh.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/arptables: fix build with
 BR2_OPTIMIZE_0
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

 > Fix the following build failure with BR2_OPTIMIZE_0 raised since the
 > addition of the package in commit
 > efc10eb6b87884f1f7917462d78af6953fcd99e3 and
 > https://git.netfilter.org/arptables/commit/?id=369afc14de1d89ff5627ff4c5f72f6f839244b50:

 > libarptc/libarptc.c:48:21: error: redefinition of 'arpt_get_target'
 >    48 | #define GET_TARGET  arpt_get_target
 >       |                     ^~~~~~~~~~~~~~~
 > libarptc/libarptc_incl.c:16:1: note: in expansion of macro 'GET_TARGET'
 >    16 | GET_TARGET(STRUCT_ENTRY *e)
 >       | ^~~~~~~~~~
 > In file included from .//include/libarptc/libarptc.h:7,
 >                  from libarptc/libarptc.c:26:
 > .//include/linux/netfilter_arp/arp_tables.h:196:43: note: previous definition of 'arpt_get_target' was here
 >   196 | static __inline__ struct xt_entry_target *arpt_get_target(struct arpt_entry *e)
 >       |                                           ^~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/730dce4101e7afcee233067e2870603cd64b8a48

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
