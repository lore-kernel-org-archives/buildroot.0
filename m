Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA666E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5274340108;
	Sat, 30 Sep 2023 13:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5274340108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8FxIvDMjN5t; Sat, 30 Sep 2023 13:02:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 74BD740571;
	Sat, 30 Sep 2023 13:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74BD740571
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ECEAA1BF3EB
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A031A400A6
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:02:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A031A400A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgTCNJj1m9Cv for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:02:10 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A566540571
 for <buildroot@uclibc.org>; Sat, 30 Sep 2023 13:02:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A566540571
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qmZbj-00077R-AD
 for buildroot@uclibc.org; Sat, 30 Sep 2023 15:02:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 30 Sep 2023 15:01:21 +0200
Message-ID: <pan$d090$49e00687$ce7072d2$1615a8cb@ID-313208.user.individual.net>
References: <20230923114713.1466381-1-bernd@kuhls.net>
 <20230923114713.1466381-2-bernd@kuhls.net>
 <20230930144927.57fe951f__30987.6495086186$1696078194$gmane$org@windsurf>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 2/2] package/alsa-utils: bump version to
 1.2.10
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

Am Sat, 30 Sep 2023 14:49:27 +0200 schrieb Thomas Petazzoni via buildroot:

> I think there's still an unfixed issue with this version bump:
> 
> aplaymidi.c:34:10: fatal error: alsa/ump_msg.h: No such file or
> directory
>    34 | #include <alsa/ump_msg.h>
>       |          ^~~~~~~~~~~~~~~~

Hi Thomas,

yes, I saw that error as well but left it for the moment due to time 
constraints. To fix it we propably should unconditionally enable 
BR2_PACKAGE_ALSA_LIB_RAWMIDI in the alsa-utils package.

This is necessary due to the, imho, weird way the buildroot package 
handles its suboptions. First all binaries are built, and we need the new 
dependency for this, but, by the ALSA_UTILS_INSTALL_TARGET_CMDS hook, only 
the enabled binaries are copied to $TARGET.

One could argue that this problem should be reported upstream so they 
provide a fix for this to avoid the new dependency, but again, time 
constraints on my side...

Otoh what about removing all these detailed suboptions in alsa-utils and 
let users, if needed, remove what they do not want by a post-build script?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
