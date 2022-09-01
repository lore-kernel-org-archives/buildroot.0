Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A145DECAAD3
	for <buildroot@archiver.kernel.org>; Thu,  1 Sep 2022 20:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9ECD415F5;
	Thu,  1 Sep 2022 20:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9ECD415F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJRhtSvVtN5r; Thu,  1 Sep 2022 20:06:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD896415F6;
	Thu,  1 Sep 2022 20:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD896415F6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F17D1BF393
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:06:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDD7A823F6
 for <buildroot@lists.busybox.net>; Thu,  1 Sep 2022 20:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDD7A823F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QcHMBjMGhXc9 for <buildroot@lists.busybox.net>;
 Thu,  1 Sep 2022 20:06:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E7918239A
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E7918239A
 for <buildroot@busybox.net>; Thu,  1 Sep 2022 20:06:48 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glbb-buildroot@m.gmane-mx.org>) id 1oTqSa-0005ow-Oz
 for buildroot@busybox.net; Thu, 01 Sep 2022 22:06:44 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@busybox.net
From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Thu, 1 Sep 2022 20:06:40 -0000 (UTC)
Message-ID: <ter3cg$lbs$1@ciao.gmane.io>
References: <tequdh$10ie$1@ciao.gmane.io> <20220901185825.GL68979@scaer>
 <ter0vs$i38$1@ciao.gmane.io> <20220901194825.GM68979@scaer>
User-Agent: slrn/1.0.3 (Linux)
Subject: Re: [Buildroot] sftp-server for use with dropbear?
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
Cc: buildroot@uclibc.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-09-01, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>> What about gesftpserver, that has been present since Buildroot 2013.02?

>> I currently can't select it in "menuconfig" because it requires a
>> toolchain with wchar support.  I think my (exernal) toolchain does
>> have wchar support, but apparently buildroot hasn't been told about
>> it...

Rats. I was wrong. I assumed my toolchain had wchar support because
usr/include/wchar.h existed, but it's a stub:

    $ cat ./arm-unknown-linux-uclibcgnueabi/sysroot/usr/include/wchar.h
    
    /* This wchar.h is used if wchar support is disabled in uClibc.
     * We still want to provide a few basic definitions as the basic
     * C standard requires them.  And it makes our lives easier with
     * no additional overhead.
     */
    ...
    
There's no way I can justify rebuilding the toolchain with uClibc
wchar support enabled for gesftpserver when nothing else in my system
needs wchar support. I'll have to figure out a new test/development
workflow that doesn't use "scp" to copy files onto the target.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
