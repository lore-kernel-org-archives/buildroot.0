Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3621BC6FD1C
	for <buildroot@archiver.kernel.org>; Tue, 14 Mar 2023 08:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C41EC41823;
	Tue, 14 Mar 2023 08:25:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C41EC41823
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tifTnCZD88Z5; Tue, 14 Mar 2023 08:25:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEEE24181C;
	Tue, 14 Mar 2023 08:25:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEEE24181C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E82651BF2C3
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF2A281980
 for <buildroot@lists.busybox.net>; Tue, 14 Mar 2023 08:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF2A281980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WE5OLib-QK1m for <buildroot@lists.busybox.net>;
 Tue, 14 Mar 2023 08:25:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F203814BA
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5F203814BA
 for <buildroot@buildroot.org>; Tue, 14 Mar 2023 08:25:52 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5DECD1C0008;
 Tue, 14 Mar 2023 08:25:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pbzye-000tha-E3; Tue, 14 Mar 2023 09:25:48 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230225172806.9444-1-fontaine.fabrice@gmail.com>
Date: Tue, 14 Mar 2023 09:25:48 +0100
In-Reply-To: <20230225172806.9444-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 25 Feb 2023 18:28:06 +0100")
Message-ID: <87pm9b7n8z.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pistache: fix libressl build
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

 > Fix the following libressl build failure which is probably raised since
 > the addition of the package in commit
 > 65d891efc2fb069f9cf707f47302776f7076b80c:

 > ../src/server/listener.cc: In member function 'void
 > Pistache::Tcp::Listener::setupSSLAuth(const std::string&, const
 > std::string&, int (*)(int, void*))':
 > ../src/server/listener.cc:582:29: error: 'SSL_verify_cb' was not declared in this scope; did you mean 'RSA_verify'?
 >   582 |                            (SSL_verify_cb)cb
 >       |                             ^~~~~~~~~~~~~
 >       |                             RSA_verify

 > Fixes:
 >  - http://autobuild.buildroot.org/results/066fc078980e5216f38411eee455088e15fa1101

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
