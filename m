Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B3CC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 11:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 054414000B;
	Wed,  1 Nov 2023 11:16:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 054414000B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oGZ9vzERSiF8; Wed,  1 Nov 2023 11:16:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 073DC430DA;
	Wed,  1 Nov 2023 11:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 073DC430DA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 70FF51BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A98184875
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 11:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A98184875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yMpeGxhk2xUU for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 11:16:11 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B11D84870
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 11:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B11D84870
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0148C20008;
 Wed,  1 Nov 2023 11:16:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1qy9Ch-00584d-12;
 Wed, 01 Nov 2023 12:16:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231031145830.14831-1-fontaine.fabrice@gmail.com>
 <8734xq1xem.fsf@48ers.dk>
Date: Wed, 01 Nov 2023 12:16:07 +0100
In-Reply-To: <8734xq1xem.fsf@48ers.dk> (Peter Korsgaard's message of "Tue, 31
 Oct 2023 19:04:17 +0100")
Message-ID: <87cywtzpu0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.6.4
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> [Medium] A fix was added, but still under review for completeness, for a
 >> Bleichenbacher style attack, leading to being able to decrypt a saved
 >> TLS connection and potentially forge a signature after probing with a
 >> large number of trial connections. This issue is around RSA decryption
 >> and affects static RSA cipher suites on the server side, which are not
 >> recommended to be used and are off by default. Static RSA cipher suites
 >> were also removed from the TLS 1.3 protocol and only present in TLS 1.2
 >> and lower. All padding versions of RSA decrypt are affected since the
 >> code under review is outside of the padding processing. Information
 >> about the private keys is NOT compromised in affected code. It's
 >> recommended to disable static RSA cipher suites and update the version
 >> of wolfSSL used if using RSA private decryption alone outside of TLS.

 >> https://github.com/wolfSSL/wolfssl/releases/tag/v5.6.4-stable

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Committed, thanks.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
