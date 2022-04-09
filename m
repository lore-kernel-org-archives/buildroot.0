Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14926C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 14:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB7C860B73;
	Sat,  9 Apr 2022 14:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K6qr2dNxPW03; Sat,  9 Apr 2022 14:11:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D246660A98;
	Sat,  9 Apr 2022 14:11:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3942D1BF425
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:11:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 366CC41CD4
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 14:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vy2LPKpJOl75 for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 14:11:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F20D441CC4
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 14:11:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id F144520004;
 Sat,  9 Apr 2022 14:11:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ndBo7-003IH0-5C; Sat, 09 Apr 2022 16:11:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220403140024.3774250-1-fontaine.fabrice@gmail.com>
Date: Sat, 09 Apr 2022 16:11:19 +0200
In-Reply-To: <20220403140024.3774250-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Apr 2022 16:00:24 +0200")
Message-ID: <87pmlqqrco.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/glib-networking: fix build with
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > glib-networking raises the following build failure with libressl:
 > ../tls/openssl/gtlsconnection-openssl.c: In function 'g_tls_connection_openssl_handshake_thread_request_rehandshake':
 > ../tls/openssl/gtlsconnection-openssl.c:419:27: error:
 > 'TLS1_3_VERSION' undeclared (first use in this function); did you mean
 > 'TLS1_2_VERSION'?
 >   419 |   if (SSL_version(ssl) >= TLS1_3_VERSION)
 >       |                           ^~~~~~~~~~~~~~
 >       |                           TLS1_2_VERSION
 > ../tls/openssl/gtlsconnection-openssl.c:419:27: note: each undeclared
 > identifier is reported only once for each function it appears in
 > ../tls/openssl/gtlsconnection-openssl.c:420:11: error: implicit
 > declaration of function 'SSL_key_update'
 > [-Werror=implicit-function-declaration]
 >   420 |     ret = SSL_key_update (ssl, SSL_KEY_UPDATE_REQUESTED);
 >       |           ^~~~~~~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/b8dea5704903c84858c7a339a73ecb713ac2791c

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
