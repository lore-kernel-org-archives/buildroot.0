Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8052C3271E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jul 2024 19:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 592376105B;
	Fri,  5 Jul 2024 19:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNn6UHqyx1M1; Fri,  5 Jul 2024 19:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5ADB60818
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5ADB60818;
	Fri,  5 Jul 2024 19:23:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAF6E1BF98E
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B60878492A
 for <buildroot@lists.busybox.net>; Fri,  5 Jul 2024 19:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hfon3Gv5nUGQ for <buildroot@lists.busybox.net>;
 Fri,  5 Jul 2024 19:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1BA91848CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1BA91848CC
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BA91848CC
 for <buildroot@buildroot.org>; Fri,  5 Jul 2024 19:23:48 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BD692E0004;
 Fri,  5 Jul 2024 19:23:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sPoX2-000Us5-2h;
 Fri, 05 Jul 2024 21:23:44 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240615202826.3303698-1-fontaine.fabrice@gmail.com>
Date: Fri, 05 Jul 2024 21:23:44 +0200
In-Reply-To: <20240615202826.3303698-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 15 Jun 2024 22:28:24 +0200")
Message-ID: <87o77bve0v.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/avro-c: fix build with gcc 14
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
Cc: Titouan Christophe <titouanchristophe@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with gcc 14:
 > In file included from /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/src/avro/legacy.h:33,
 >                  from /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/src/avro/io.h:31,
 >                  from /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/src/avro/consumer.h:30,
 >                  from /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/src/avro.h:28,
 >                  from /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/examples/quickstop.c:18:
 > /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/examples/quickstop.c: In function 'print_person':
 > /home/autobuild/autobuild/instance-6/output-1/build/avro-c-1.11.3/examples/quickstop.c:123:61: error: passing argument 3 of 'first_value.iface->get_string' from incompatible pointer type [-Wincompatible-pointer-types]
 >   123 |                         avro_value_get_string(&first_value, &p, &size);
 >       |                                                             ^~
 >       |                                                             |
 >       |                                                             int32_t ** {aka int **}

 > Fixes:
 >  - http://autobuild.buildroot.org/results/fdbc6a888ba8bb51f4e076a450919477d1378eb3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2024.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
