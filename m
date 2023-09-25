Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2BECE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35D2B607A1;
	Mon, 25 Sep 2023 11:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35D2B607A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BSg0KX1maFgJ; Mon, 25 Sep 2023 11:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93DC960742;
	Mon, 25 Sep 2023 11:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93DC960742
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C458E1BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8D7C4176B
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8D7C4176B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OgV06yFJ-TSn for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:40:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2872F4174C
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2872F4174C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D6191C0006;
 Mon, 25 Sep 2023 11:40:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkjxJ-002ZA9-MI; Mon, 25 Sep 2023 13:40:49 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230918201623.2639458-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Sep 2023 13:40:49 +0200
In-Reply-To: <20230918201623.2639458-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 18 Sep 2023 22:16:23 +0200")
Message-ID: <87edimeb0e.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/agentpp: fix build with gcc 4.8
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 4.8 raised since bump of snmppp
 > to version 3.5.0 in commit e011fa0415883b9d44df616cfaf6956e1a11da88:

 > configure: error: Cannot find suitable libsnmp++ library

 > [...]

 > configure:9496: checking if libsnmp++ can be linked with flags from pkg-config
 > configure:9528: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-none-linux-gnueabi-g++ -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1 -pthread -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE -D_XOPEN_SOURCE=XPG6  conftest.cpp -L/home/buildroot/autobuild/run/instance-1/output-1/host/bin/../arm-buildroot-linux-gnueabi/sysroot/usr/lib -lsnmp++ >&5
 > In file included from /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/snmp_pp.h:71:0,
 >                  from conftest.cpp:92:
 > /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/snmp_pp/uxsnmp.h:628:35: error: 'nullptr' was not declared in this scope
 >       CSNMPMessage *snmp_message = nullptr);
 >                                    ^

 > Fixes:
 >  - http://autobuild.buildroot.org/results/f272473e7b588f5390b183072935a0217290ee4e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
