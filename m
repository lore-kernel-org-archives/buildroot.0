Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA98C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 07:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E267A824DC;
	Wed, 13 Apr 2022 07:48:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c22osqyUXAd3; Wed, 13 Apr 2022 07:48:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF40382443;
	Wed, 13 Apr 2022 07:48:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D04C51BF4E6
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDD2340509
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 07:48:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHMK5r7jnIVm for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 07:48:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7757840504
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 07:48:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 80349200012;
 Wed, 13 Apr 2022 07:48:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1neXjw-009ZId-Dt; Wed, 13 Apr 2022 09:48:36 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220405215752.2803676-1-fontaine.fabrice@gmail.com>
Date: Wed, 13 Apr 2022 09:48:36 +0200
In-Reply-To: <20220405215752.2803676-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 5 Apr 2022 23:57:52 +0200")
Message-ID: <87czhle84r.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix build without
 NPTL
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure without NPTL raised since bump to
 > version 14.1 in commit c9bd02911565819789120370178e82da5dfbacc0 and
 > https://github.com/postgres/postgres/commit/44bf3d5083e151d772c5d6f656e3e162f573dced:

 > In file included from pthread_barrier_wait.c:16:
 > ../../src/include/port/pg_pthread.h:31:3: error: conflicting types for 'pthread_barrier_t'
 >    31 | } pthread_barrier_t;
 >       |   ^~~~~~~~~~~~~~~~~
 > In file included from /home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/bits/uClibc_stdio.h:114,
 >                  from /home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:71,
 >                  from ../../src/include/c.h:59,
 >                  from pthread_barrier_wait.c:14:
 > /home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/bits/pthreadtypes.h:135:3: note: previous declaration of 'pthread_barrier_t' was here
 >   135 | } pthread_barrier_t;
 >       |   ^~~~~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/70acbe121236ef0905c4466d4f7a0839723d2c49

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

> ---
 >  package/postgresql/postgresql.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
 > index c389246f80..1dfb20b58d 100644
 > --- a/package/postgresql/postgresql.mk
 > +++ b/package/postgresql/postgresql.mk
 > @@ -38,7 +38,7 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 >  POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=no
 >  endif
 
 > -ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 > +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 >  POSTGRESQL_CONF_OPTS += --disable-thread-safety
 >  endif
 
 > -- 

 > 2.35.1

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
