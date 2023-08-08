Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BCEFC001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 16:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18DC360BDA;
	Tue,  8 Aug 2023 16:02:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18DC360BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQm3YCSuKaBc; Tue,  8 Aug 2023 16:02:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B9E860B89;
	Tue,  8 Aug 2023 16:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B9E860B89
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 420371BF284
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B0E660B89
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 16:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B0E660B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wYwVi5HHmxQC for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 16:02:13 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C503660AEA
 for <buildroot@uclibc.org>; Tue,  8 Aug 2023 16:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C503660AEA
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qTP9t-000AI0-Ln
 for buildroot@uclibc.org; Tue, 08 Aug 2023 18:02:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Tue, 08 Aug 2023 18:01:40 +0200
Message-ID: <pan$23d9a$9e16430b$9042433f$15f9ab31@ID-313208.user.individual.net>
References: <20230807174515.3261136-1-bernd@kuhls.net>
 <20230807231438.6bfe2c7a__31533.8530390122$1691442911$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/2] package/berkeleydb: add option for
 historic dbm interface
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Mon, 7 Aug 2023 23:14:38 +0200 schrieb Thomas Petazzoni via buildroot:

> I agree that in Python 3.11, they moved some detection logic from
> setup.py to configure.ac. But the actual code of dbm module hasn't
> changed.

the problem I am fixing is only about the detection during configure and 
unrelated to the code of the dbm module.

The detection logic in Python 3.11 tries to link a sample program 
containing "dbm_open()" to -ldb: https://github.com/python/cpython/blob/
d2340ef25721b6a72d45d4508c672c4be38c67d3/configure.ac#L4007

and fails, for whatever reason:
conftest.c:(.text.startup+0x8): undefined reference to `__db_ndbm_open'

The detection in Python 3.10 is aimed only at the existence of the library 
file and does not try to link code: https://github.com/python/cpython/
blob/b4e48a444ea02921ce4b701fe165e6cfd4cf5845/setup.py#L1430C34-L1430C65

> So I'm really confused. How does it work in Python 3.10 ? Did we already
> need the historic dbm interface back then ?

Me, too, but only because my knowledge about C functions, macro expansion 
etc. is very limited, I can not comment your analysis why the dbm module 
works despite missing symbols. Anyway, with Python 3.11 the dbm module is 
not build at all atm.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
