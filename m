Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997F3CDB482
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 06:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AB46821C5;
	Fri, 13 Oct 2023 06:14:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AB46821C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6VUKtlPBHkAR; Fri, 13 Oct 2023 06:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8999081E24;
	Fri, 13 Oct 2023 06:14:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8999081E24
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 52CBB1BF3C8
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D7194016F
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 06:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D7194016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hc8vswF5Bvku for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 06:14:15 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85A1D40124
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85A1D40124
Received: by mail.gandi.net (Postfix) with ESMTPSA id A60FF240002;
 Fri, 13 Oct 2023 06:14:13 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qrBR1-006ud2-C3; Fri, 13 Oct 2023 08:14:07 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230212130336.373391-1-fontaine.fabrice@gmail.com>
 <87lecn8u3j.fsf@48ers.dk>
Date: Fri, 13 Oct 2023 08:14:07 +0200
In-Reply-To: <87lecn8u3j.fsf@48ers.dk> (Peter Korsgaard's message of "Sat, 30
 Sep 2023 19:10:56 +0200")
Message-ID: <87jzrr6ocw.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/olsr: fix build with gpsd >=
 3.25
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
 >> Fix the following build failure with gpsd >= 3.25 raised since commit
 >> 3c7fece853f3def9a425eccc384b9dacb1010051:

 >> In file included from src/configuration.h:50,
 >> from src/configuration.c:46:
 >> src/gpsdclient.h:64:8: error: redefinition of 'struct fixsource_t'
 >> 64 | struct fixsource_t {
 >> |        ^~~~~~~~~~~
 >> In file included from src/gpsdclient.h:49,
 >> from src/configuration.h:50,
 >> from src/configuration.c:46:
 >> /tmp/instance-17/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/gps.h:2714:8: note: originally defined here
 >> 2714 | struct fixsource_t
 >> |        ^~~~~~~~~~~

 >> Fixes:
 >> - http://autobuild.buildroot.org/results/47a619686bb47debd525c92aa7e14bee5c40ca9e

 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 > Yanns fix apprently never made it upstream, so committed, thanks.

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
