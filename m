Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730AAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 19:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94A744100E;
	Wed, 30 Mar 2022 19:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23BkJlKebxSy; Wed, 30 Mar 2022 19:43:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67BAA4100C;
	Wed, 30 Mar 2022 19:43:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B704B1BF40D
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 19:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFD3084901
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 19:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkvxiqpRv7Lz for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 19:43:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4707184912
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 19:43:06 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 78073200004;
 Wed, 30 Mar 2022 19:43:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nZeDd-000A3x-D5; Wed, 30 Mar 2022 21:43:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Andreas Ziegler <br015@umbiko.net>
References: <20211227074056.13882-1-br015@umbiko.net>
 <20220320114138.433796-1-br015@umbiko.net>
Date: Wed, 30 Mar 2022 21:43:01 +0200
In-Reply-To: <20220320114138.433796-1-br015@umbiko.net> (Andreas Ziegler's
 message of "Sun, 20 Mar 2022 12:41:38 +0100")
Message-ID: <87fsmz6xbu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 1/1] package/zziplib: fix static build
 failure with mpd
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?utf-8?Q?J=C3=B6rg?= Krause <joerg.krause@embedded.rocks>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Andreas" == Andreas Ziegler <br015@umbiko.net> writes:

 > The current released version of zziplib copies static libraries with appended 
 > major version, but omits creating the necessary links to the base file names. 
 > This prevents the linker to find the libraries via the search path.

 > The issue (https://github.com/gdraheim/zziplib/issues/117) has been 
 > fixed upstream; this patch extracts the necessary part of commit
 > 0e8d35f92efb680c81f6ec1fca9f11d173dce389, to enable creation of
 > symlinks.

 > This resolves the following autobuild issues:

 > http://autobuild.buildroot.net/results/6c56b645a2b723920f07b98474452824fba5e2c1
 > http://autobuild.buildroot.net/results/032aaff121fb114f388c67dbca3ad2b02f670e38
 > http://autobuild.buildroot.net/results/ba711034c0abe980f677e26de41739223e2f66e9

 > Signed-off-by: Andreas Ziegler <br015@umbiko.net>
 > ---
 > Changes v1 -> v2:
 >  - extract link creation from commit 0e8d35f
 > Changes v2 -> v3:
 >  - update failure list

Committed to 2021.02.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
