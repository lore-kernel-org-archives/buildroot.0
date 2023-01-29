Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A256C05027
	for <buildroot@archiver.kernel.org>; Sun, 29 Jan 2023 21:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2C034160D;
	Sun, 29 Jan 2023 21:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2C034160D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiZTLZ1iGMwJ; Sun, 29 Jan 2023 21:06:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F282B41608;
	Sun, 29 Jan 2023 21:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F282B41608
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 772941BF576
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5214F4032B
 for <buildroot@lists.busybox.net>; Sun, 29 Jan 2023 21:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5214F4032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IjtoB5oYfB2h for <buildroot@lists.busybox.net>;
 Sun, 29 Jan 2023 21:06:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 617E6400CC
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 617E6400CC
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 21:06:14 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 27BE140004;
 Sun, 29 Jan 2023 21:06:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pMEsL-0053Ck-Sz; Sun, 29 Jan 2023 22:06:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230118173718.207535-1-fontaine.fabrice@gmail.com>
 <20230118210834.GM2770@scaer>
Date: Sun, 29 Jan 2023 22:06:09 +0100
In-Reply-To: <20230118210834.GM2770@scaer> (Yann E. MORIN's message of "Wed,
 18 Jan 2023 22:08:34 +0100")
Message-ID: <87edrd3vb2.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/proftpd: disable sftp with
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
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Fabrice, All,
 > On 2023-01-18 18:37 +0100, Fabrice Fontaine spake thusly:
 >> sftp doesn't build with libressl >= 3.5.0 resulting in the following
 >> build failure since commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:
 >> 
 >> mac.c: In function 'init_mac':
 >> mac.c:189:3: warning: implicit declaration of function
 >> 'HMAC_CTX_init'; did you mean 'HMAC_CTX_new'?
 >> [-Wimplicit-function-declaration]
 >> 189 |   HMAC_CTX_init(hmac_ctx);
 >> |   ^~~~~~~~~~~~~
 >> |   HMAC_CTX_new
 >> mac.c: In function 'set_mac_key':
 >> mac.c:435:14: error: storage size of 'ctx' isn't known
 >> 435 |   EVP_MD_CTX ctx;
 >> |              ^~~
 >> 
 >> So disable sftp with libressl

 > This, and the commit title, are misleading: sftp is not _disabled_ with
 > libressl; if you had done that, then the code would have looked like:

 >     config BR2_PACKAGE_PROFTPD_MOD_SFTP
 >         bool "mod_sftp"
 >         depends on !BR2_PACKAGE_LIBRESSL

 > Realy, what this change does, is to force use of openssl for sftp.

 > So, I tweeaked the commit title and log to reflect that.

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
