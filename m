Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12D19C6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 19:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8781860EAA;
	Tue, 29 Aug 2023 19:58:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8781860EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SDjOkn-EQBmw; Tue, 29 Aug 2023 19:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E34F660C15;
	Tue, 29 Aug 2023 19:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E34F660C15
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6C751BF2C7
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 19:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 998CC4087A
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 19:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 998CC4087A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LDSVEOGQIBVm for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 19:58:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83ECF4085C
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 19:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83ECF4085C
Received: by mail.gandi.net (Postfix) with ESMTPSA id B527D1C0005;
 Tue, 29 Aug 2023 19:58:49 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qb4rQ-008Oec-Ea; Tue, 29 Aug 2023 21:58:48 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230722032332.3960-1-f.fainelli@gmail.com>
 <20230722232659.659354bd@windsurf>
Date: Tue, 29 Aug 2023 21:58:48 +0200
In-Reply-To: <20230722232659.659354bd@windsurf> (Thomas Petazzoni via
 buildroot's message of "Sat, 22 Jul 2023 23:26:59 +0200")
Message-ID: <877cpd4o3r.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/linux-tools: Disable libtracevent
 detection
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, marcin@bis.org.pl,
 d.lang@abatec.at, mmayer@broadcom.com,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > On Fri, 21 Jul 2023 20:23:32 -0700
 > Florian Fainelli <f.fainelli@gmail.com> wrote:

 >> Since upstream Linux commit 6898e60f709b0047206110d3ec9f4612210e3ff7
 >> ("perf build: If libtraceevent isn't present error the build") present
 >> in Linux 6.4 and newer, Linux will fail to build if libtraceevent is not
 >> present. Since we do not currently have support for libtracevent in
 >> buildroot, pass NO_LIBTRACEVENT=1 to get perf to build again.
 >> 
 >> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
 >> ---
 >> package/linux-tools/linux-tool-perf.mk.in | 3 ++-
 >> 1 file changed, 2 insertions(+), 1 deletion(-)

 > Thanks Florian for the patch, applied!

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
