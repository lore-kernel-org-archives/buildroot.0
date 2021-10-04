Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DFDC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:46:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D799061528
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D799061528
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A7622400F3;
	Mon,  4 Oct 2021 21:46:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GiloJVFOVXzn; Mon,  4 Oct 2021 21:46:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3A3F402AF;
	Mon,  4 Oct 2021 21:46:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 906EE1BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7EE89402AF
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yp4WwQqW4cuj for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:46:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 151B140133
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:46:02 +0000 (UTC)
Received: (Authenticated sender: peter@casa-korsgaard.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 148DEFF805;
 Mon,  4 Oct 2021 21:45:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mXVmZ-0007RC-BI; Mon, 04 Oct 2021 23:45:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
References: <20210922192612.F32918C9E5@busybox.osuosl.org>
Date: Mon, 04 Oct 2021 23:45:59 +0200
In-Reply-To: <20210922192612.F32918C9E5@busybox.osuosl.org> (Arnout
 Vandecappelle's message of "Wed, 22 Sep 2021 21:21:13 +0200")
Message-ID: <87r1d0ea5k.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/libcurl: security bump to
 version 7.79.1
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

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=6d6842130b456499d3ff230a3b70cec756cbccd1
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes the following security issues:

 > - CVE-2021-22945: UAF and double-free in MQTT sending
 >   When sending data to an MQTT server, libcurl could in some circumstances
 >   erroneously keep a pointer to an already freed memory area and both use
 >   that again in a subsequent call to send data and also free it again.

 >   https://curl.se/docs/CVE-2021-22945.html

 > - CVE-2021-22946: Protocol downgrade required TLS bypassed
 >   A user can tell curl to require a successful upgrade to TLS when speaking
 >   to an IMAP, POP3 or FTP server (--ssl-reqd on the command line or
 >   CURLOPT_USE_SSL set to CURLUSESSL_CONTROL or CURLUSESSL_ALL with libcurl).
 >   This requirement could be bypassed if the server would return a properly
 >   crafted but perfectly legitimate response.

 >   This flaw would then make curl silently continue its operations without
 >   TLS contrary to the instructions and expectations, exposing possibly
 >   sensitive data in clear text over the network.

 >   https://curl.se/docs/CVE-2021-22946.html

 > - CVE-2021-22947: STARTTLS protocol injection via MITM
 >   When curl connects to an IMAP, POP3, SMTP or FTP server to exchange data
 >   securely using STARTTLS to upgrade the connection to TLS level, the server
 >   can still respond and send back multiple responses before the TLS upgrade.
 >   Such multiple "pipelined" responses are cached by curl.  curl would then
 >   upgrade to TLS but not flush the in-queue of cached responses and instead
 >   use and trust the responses it got before the TLS handshake as if they
 >   were authenticated.

 >   Using this flaw, it allows a Man-In-The-Middle attacker to first inject
 >   the fake responses, then pass-through the TLS traffic from the legitimate
 >   server and trick curl into sending data back to the user thinking the
 >   attacker's injected data comes from the TLS-protected server.

 >   Over POP3 and IMAP an attacker can inject fake response data.

 >   https://curl.se/docs/CVE-2021-22947.html

 > In addition, 7.79.1 fixes a number of regressions in 7.79.0:
 > https://daniel.haxx.se/blog/2021/09/22/curl-7-79-1-patched-up-and-ready/

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2021.02.x, 2021.05.x and 2021.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
