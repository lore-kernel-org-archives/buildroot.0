Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936F6CE7A8C
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD1C941775;
	Sun, 24 Sep 2023 21:15:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD1C941775
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQGROfMJmmYn; Sun, 24 Sep 2023 21:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7D0E41708;
	Sun, 24 Sep 2023 21:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7D0E41708
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 930BB1BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B13741708
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B13741708
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbsNOs6UMo9X for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:15:10 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D3EE408F0
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D3EE408F0
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25C42C0003;
 Sun, 24 Sep 2023 21:15:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkWRX-001wyK-0m; Sun, 24 Sep 2023 23:15:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230916125132.1509289-1-fontaine.fabrice@gmail.com>
Date: Sun, 24 Sep 2023 23:15:07 +0200
In-Reply-To: <20230916125132.1509289-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 16 Sep 2023 14:51:32 +0200")
Message-ID: <87il7zgtno.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/conmon: fix libseccomp shared
 build
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Drop patch and disable libseccomp when building statically to avoid the
 > following build failure raised since commit
 > 29834d8a12d984e8efe05398c5aaa6a61f7880e0:

 > src/seccomp_notify.c: In function 'seccomp_notify_plugins_load':
 > src/seccomp_notify.c:136:42: warning: implicit declaration of function
 > 'dlopen'; did you mean 'popen'? [-Wimplicit-function-declaration]
 >   136 |                 ctx->plugins[s].handle = dlopen(it, RTLD_NOW);
 >       |                                          ^~~~~~
 >       |                                          popen
 > src/seccomp_notify.c:136:53: error: 'RTLD_NOW' undeclared (first use in this function)
 >   136 |                 ctx->plugins[s].handle = dlopen(it, RTLD_NOW);
 >       |                                                     ^~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/13d3b46990720bba8621c922b5dce54ab650e96d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
