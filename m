Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40D5C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 09:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6970E41917;
	Sun,  4 Feb 2024 09:06:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6970E41917
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uMvIaOw1jmzU; Sun,  4 Feb 2024 09:06:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54A50419BF;
	Sun,  4 Feb 2024 09:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 54A50419BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2AB1BF909
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 09:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7436419BF
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 09:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7436419BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zNIGGVnxWuAU for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 09:06:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A28041917
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 09:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A28041917
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA9E51C0004;
 Sun,  4 Feb 2024 09:06:36 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWYSR-009u3s-0t;
 Sun, 04 Feb 2024 10:06:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240117210756.265708-1-ju.o@free.fr> <Zazgd8sRYiHBY1CB@landeda>
Date: Sun, 04 Feb 2024 10:06:35 +0100
In-Reply-To: <Zazgd8sRYiHBY1CB@landeda> (Yann E. MORIN's message of "Sun, 21
 Jan 2024 10:14:31 +0100")
Message-ID: <871q9sr42s.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix service runtime
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Julien Olivain <ju.o@free.fr>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Julien, All,
 > On 2024-01-17 22:07 +0100, Julien Olivain spake thusly:
 >> Since commit 2a8065e "package/postgresql: bump version to 16.1", the
 >> postgresql service fail to start at runtime with an error:
 >> 
 >> FATAL: could not load library
 >> "/usr/lib/postgresql/dict_snowball.so":
 >> /usr/lib/postgresql/dict_snowball.so: undefined symbol:
 >> CurrentMemoryContext
 >> 
 >> This is due to the Posgresql autotool configure script trying to
 >> detect whether the toolchain linker needs --export-dynamic or not.
 >> This test is done with a runtime execution of a test program, and
 >> therefore cannot run in cross-compilation. In that case, the
 >> configure script assumes it is not needed. See commit [1], included
 >> in PostgreSQL v16.0.
 >> 
 >> This commit fixes the issue by forcing the value in _CONF_ENV. The
 >> package has already a Kconfig dependency on !BR2_STATIC_LIBS, so the
 >> value can be unconditionally set.
 >> 
 >> [1]
 >> https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=9db49fc5bfdc0126be03f4b8986013e59d93b91d

 > I've added references to the ML thread upstream, with their position
 > that cross-compiling is not really a supoprted thing.

 >> Signed-off-by: Julien Olivain <ju.o@free.fr>

 > Applied to master, thanks.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
