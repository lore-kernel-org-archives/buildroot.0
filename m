Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C03C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 08:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16EDA4130A;
	Fri, 27 May 2022 08:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jFnVuIQTwUW9; Fri, 27 May 2022 08:52:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31FC141304;
	Fri, 27 May 2022 08:52:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16BE91BF385
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 05717848E3
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 08:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qp8YQLjqaDxC for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 08:52:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1E8D5848E5
 for <buildroot@buildroot.org>; Fri, 27 May 2022 08:52:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0F13540007;
 Fri, 27 May 2022 08:52:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuViD-001Fo2-Ob; Fri, 27 May 2022 10:52:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220424191957.435337-1-fontaine.fabrice@gmail.com>
Date: Fri, 27 May 2022 10:52:49 +0200
In-Reply-To: <20220424191957.435337-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 24 Apr 2022 21:19:57 +0200")
Message-ID: <87y1ynl5lq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libeXosip2: fix build with
 libressl
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with libressl >= 3.4.1 raised since
 > commit 25ef2c26dabaf1553f1724214a4fa5e3ce48dfc8:

 > In file included from eXtl_dtls.c:82:
 > /home/autobuild/autobuild/instance-4/output-1/host/x86_64-buildroot-linux-musl/sysroot/usr/include/openssl/ssl.h:1272:6:
 > note: previous declaration of 'SSL_set0_rbio' was here
 >  1272 | void SSL_set0_rbio(SSL *s, BIO *rbio);
 >       |      ^~~~~~~~~~~~~
 > eXtl_dtls.c: In function 'SSL_set0_rbio':
 > eXtl_dtls.c:108:17: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
 >   108 |   BIO_free_all(s->rbio);
 >       |                 ^~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/dfafdbf71b31fbda1b5ba491ac35239af4a20aa2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
