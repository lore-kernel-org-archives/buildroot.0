Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB534C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 542FD40370;
	Fri,  1 Dec 2023 20:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 542FD40370
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O1S4nvGXgL6S; Fri,  1 Dec 2023 20:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8644240492;
	Fri,  1 Dec 2023 20:12:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8644240492
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 64ABA1BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BF1A420F5
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:12:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BF1A420F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OwlE_40WcVEo for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:12:22 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E958E42112
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E958E42112
Received: by mail.gandi.net (Postfix) with ESMTPSA id C954340008;
 Fri,  1 Dec 2023 20:12:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r99s3-004T94-0O;
 Fri, 01 Dec 2023 21:12:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20231130224904.630657-1-fontaine.fabrice@gmail.com>
 <20231201122446.GP3177259@scaer>
Date: Fri, 01 Dec 2023 21:12:19 +0100
In-Reply-To: <20231201122446.GP3177259@scaer> (Yann E. MORIN's message of
 "Fri, 1 Dec 2023 13:24:46 +0100")
Message-ID: <87wmtx4r8c.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/rtty: fix wolfssl build
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabrice, All,
 > On 2023-11-30 23:49 +0100, Fabrice Fontaine spake thusly:
 >> Fix the following wolfssl build failure raised at least since bump to
 >> version 7.4.0 in commit 6b5907bf65d27ed98532e9783f92f5575f38b3d2:
 >> 
 >> /home/autobuild/autobuild/instance-4/output-1/build/rtty-8.1.0/src/ssl/openssl.c: In function 'ssl_last_error_string':
 >> /home/autobuild/autobuild/instance-4/output-1/build/rtty-8.1.0/src/ssl/openssl.c:143:24:
 >> error: implicit declaration of function 'ERR_peek_error_line_data';
 >> did you mean 'wolfSSL_ERR_get_error_line_data'?
 >> [-Werror=implicit-function-declaration]
 >> 143 |         ssl_err_code = ERR_peek_error_line_data(&file, &line, &data, &flags);
 >> |                        ^~~~~~~~~~~~~~~~~~~~~~~~
 >> |                        wolfSSL_ERR_get_error_line_data
 >> 
 >> Fixes:
 >> - http://autobuild.buildroot.org/results/9db9f1dcc6760de4b78771bb79f109c4efd06c36
 >> - http://autobuild.buildroot.org/results/16422af9469de114e552124542508c3b18ea8f19
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> package/rtty/Config.in | 2 ++
 >> package/rtty/rtty.mk   | 2 +-
 >> 2 files changed, 3 insertions(+), 1 deletion(-)
 >> 
 >> diff --git a/package/rtty/Config.in b/package/rtty/Config.in
 >> index 198d465713..434c5d6ae7 100644
 >> --- a/package/rtty/Config.in
 >> +++ b/package/rtty/Config.in
 >> @@ -2,6 +2,8 @@ config BR2_PACKAGE_RTTY
 >> bool "rtty"
 >> depends on BR2_USE_MMU # fork()
 >> select BR2_PACKAGE_LIBEV
 >> +	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL && \
 >> +		!BR2_STATIC_LIBS

 > That's not nice, as that forces wolfssl-all even in the case that it is
 > not used by rtty, i.e. when either mbedtls or openssl are enabled.

 > So, the full condition should be something like:

 >     select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL && \
 >         !BR2_STATIC_LIBS && !BR2_PACKAGE_MBEDTLS && !BR2_PACKAGE_OPENSSL

 > But that becomes a bit too much.

 > I think the simplest solution is to just carry the .mk hunk of this
 > patch for now.

 > Eventually, I think it would be bettter to have a choice for the crypto
 > backend, like we have elsewhere, rather than rely on ordering of the
 > conditional blocks to defone what gets used, especially since that:

 >   - it does not match the ordering that upstream uses to find the
 >     backend (prefers openssl, then wolfssl, then mnedtls);

 >   - the ordering does not match the other places (e.g. libuhttpd [0] and
 >     libwebsockets have the same set of crypto backends, but each in yet
 >     a different order);

 >   - ordering is subject to being, well, reordered, and people would get
 >     confused when they update their buildroot to see their rtty change
 >     its crypto backend...

 > [0] libuhttpd suffers from the same issue in its Config.in, that this
 > patch would introduce: wolfssl-all os forced even if wolfssl will not be
 > used.

 > Applied to master, just the .mk hunk, thanks.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
