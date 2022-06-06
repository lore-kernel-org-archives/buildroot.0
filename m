Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CEBFC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 12:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 052F661000;
	Mon,  6 Jun 2022 12:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJRhqi8xE_0r; Mon,  6 Jun 2022 12:57:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FA4260BDC;
	Mon,  6 Jun 2022 12:57:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 811C21BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FDA183F84
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 12:57:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y9WNHeGEY7Y4 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 12:57:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5363A83F13
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 12:57:37 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5EEBC200005;
 Mon,  6 Jun 2022 12:57:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nyCIX-00CqbL-H2; Mon, 06 Jun 2022 14:57:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220521115055.33789-1-fontaine.fabrice@gmail.com>
Date: Mon, 06 Jun 2022 14:57:33 +0200
In-Reply-To: <20220521115055.33789-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 21 May 2022 13:50:55 +0200")
Message-ID: <87wnduueyq.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libcec: fix build with gcc 10
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 10:
 > /nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:
 > In function 'bool LibCecBootloader(const char*)':
 > /nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:175:14:
 > error: converting to 'bool' from 'std::nullptr_t' requires
 > direct-initialization [-fpermissive]
 >   175 |       return NULL;
 >       |              ^~~~
 > /nvmedata/autobuild/instance-2/output-1/build/libcec-6.0.2/src/cec-client/../../include/cecloader.h:184:12:
 > error: converting to 'bool' from 'std::nullptr_t' requires
 > direct-initialization [-fpermissive]
 >   184 |     return NULL;
 >       |            ^~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/e34bd78cc81e6da12a85c1e4ee76931818d91073

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
