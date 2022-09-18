Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E013ECAAD8
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 15:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C58A060BFA;
	Sun, 18 Sep 2022 15:45:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C58A060BFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PnJ6jpuuGOB; Sun, 18 Sep 2022 15:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0583360B57;
	Sun, 18 Sep 2022 15:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0583360B57
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 084B11BF301
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 15:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7F8940181
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 15:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7F8940181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9uaq5fdRtmz for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 15:45:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E97A400F2
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E97A400F2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 15:45:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3F07140002;
 Sun, 18 Sep 2022 15:45:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oZwUH-00DRPm-LZ; Sun, 18 Sep 2022 17:45:41 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220918133049.3180533-1-peter@korsgaard.com>
 <20220918145816.GI1419013@scaer>
Date: Sun, 18 Sep 2022 17:45:41 +0200
In-Reply-To: <20220918145816.GI1419013@scaer> (Yann E. MORIN's message of
 "Sun, 18 Sep 2022 16:58:16 +0200")
Message-ID: <871qs8heje.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/openssh: allow sandboxing to be
 disabled as workaround for seccomp issues
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2022-09-18 15:30 +0200, Peter Korsgaard spake thusly:
 >> As explained in bug #14796, there are situations where the seccomp based
 >> sandboxing in openssh can get confused, leading to connection issues.
 > [--SNIP--]
 >> As a workaround, add a _OPENSSH_SANDBOX option (defaulting to y) to decide
 >> if sandboxing should be used or not.
 > [--SNIP--]
 >> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
 >> index 63a28f3af5..9fab2c9038 100644
 >> --- a/package/openssh/openssh.mk
 >> +++ b/package/openssh/openssh.mk
 >> @@ -24,6 +24,7 @@ OPENSSH_CPE_ID_VENDOR = openbsd
 >> OPENSSH_CONF_OPTS = \
 >> --sysconfdir=/etc/ssh \
 >> --with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
 >> +	$(if $(BR2_PACKAGE_OPENSSH_SANDBOX),--with-sandbox,--without-sandbox) \

 > --with-sandbox expects an argument that specifies what type of sandbox
 > to use:

 >     --with-sandbox=style Specify privilege separation sandbox (no,
 >                          capsicum, darwin, rlimit, seccomp_filter,
 >                          systrace, pledge)

 > If we just pass --with-sandbox without a value, configure will try to
 > look for a list of available sabdboxing mechanisms, and use the first it
 > finds:

 >     https://github.com/openssh/openssh-portable/blob/1875042c52a3b950ae5963c9ca3774a4cc7f0380/configure.ac#L3642

Yes, exactly, --with-sandbox is use-the-best-available-sandbox option
(E.G. the default, so if --with-sandbox / --without-sandbox is not used).

 > All that is before looks like it is BSD-only: pledge and systrace, or
 > darwin. But then, after seccomp, there is also capsicum and rlimit.
 > Capsicum on linux does not exist, and rlimit is probably does not bring
 > much security-wise...

 > So, in all practical matters, on Linux, sandboxing uses seccomp
 > filtering, or there is no sandboxing.

 > I've added a blurb to explain the above, and applied to master, thanks.

Great, thanks.

 > Note that it looks like we can disable seccomp with:

 >     ac_cv_have_decl_SECCOMP_MODE_FILTER=no

That is also an option, but given that this no-sandbox thing is really
special in the first case (and arguably because of a bug in glibc and/or
how seccomp works), I think just having a way to disable it is good
enough (tm).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
