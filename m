Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C6FC6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 16:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D10FE414BB;
	Tue, 29 Aug 2023 16:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D10FE414BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id maEs5mSxhZrn; Tue, 29 Aug 2023 16:52:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26C4B414B7;
	Tue, 29 Aug 2023 16:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26C4B414B7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F54D1BF3EA
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 16:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA9B6080A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 16:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CA9B6080A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G7YOYuEpShZR for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 16:52:10 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1402C600B3
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 16:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1402C600B3
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8C3520004;
 Tue, 29 Aug 2023 16:52:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qb1wj-008LYq-IS; Tue, 29 Aug 2023 18:52:05 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
References: <1689767858-17206-1-git-send-email-gwenj@trabucayre.com>
Date: Tue, 29 Aug 2023 18:52:05 +0200
In-Reply-To: <1689767858-17206-1-git-send-email-gwenj@trabucayre.com>
 (Gwenhael Goavec-Merou's message of "Wed, 19 Jul 2023 13:57:38 +0200")
Message-ID: <87fs414wqy.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v3] package/gnuradio: fix gnuradio python
 libraries for cross-compile
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Gwenhael" == Gwenhael Goavec-Merou <gwenj@trabucayre.com> writes:

 > From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > By default, module libraries have a suffix based on cpython version + host
 > architecture: this is fine for a native compile when these libraries are used on
 > the same computer (or similar computers). But when target architecture is not
 > the same python is unable to find libraries due to the wrong suffix and produces
 > unclear errors messages:

 > # python3
 > Python 3.11.3 (main, Jun 19 2023, 14:15:44) [GCC 11.4.0] on linux
 > Type "help", "copyright", "credits" or "license" for more information.
 >>>> from gnuradio import blocks  
 > Traceback (most recent call last):
 >   File "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", line 18, in <module>
 > ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'

 > During handling of the above exception, another exception occurred:

 > Traceback (most recent call last):
 >   File "<stdin>", line 1, in <module>
 >   File "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", line 22, in <module>
 > ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'
 >>>> 

 > By adding _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" at configure time, sysconfig will
 > return correct informations (target architecture) instead of host architecture.

 > Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 > ---
 > Changes v2 -> v3:
 > - replaces PYTHON_MODULE_EXTENSION by _PYTHON_SYSCONFIGDATA_NAME env (arnout)
 > Changes v1 -> v2:
 > - replaces patch by PYTHON_MODULE_EXTENSION option (result is the same
 >   but less "noisy")

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
