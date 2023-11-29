Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF3FC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 09:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49F1B80F02;
	Wed, 29 Nov 2023 09:00:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49F1B80F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZXbJdwRCuS7; Wed, 29 Nov 2023 09:00:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B302580C08;
	Wed, 29 Nov 2023 09:00:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B302580C08
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9141BF276
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5609960B89
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5609960B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kCpI2cEbPVvJ for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 09:00:25 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D7A560B7C
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:00:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D7A560B7C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8AB01FF816;
 Wed, 29 Nov 2023 09:00:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8GQf-0015wj-2y;
 Wed, 29 Nov 2023 10:00:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231128214841.1045878-1-fontaine.fabrice@gmail.com>
Date: Wed, 29 Nov 2023 10:00:21 +0100
In-Reply-To: <20231128214841.1045878-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 28 Nov 2023 22:48:41 +0100")
Message-ID: <87wmu19boa.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/refpolicy: fix build with
 smartmontools
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
Cc: Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with smartmontools raised since bump to
 > version 2.20231002 in commit 68de45491ba7d4b7aeff6f869934745440f88c00:

 >  Compiling targeted policy.33
 >  env LD_LIBRARY_PATH="/home/thomas/autobuild/instance-2/output-1/host/lib:/home/thomas/autobuild/instance-2/output-1/host/usr/lib" /home/thomas/autobuild/instance-2/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
 >  policy/modules/services/smartmon.te:146:ERROR 'type fsadm_exec_t is not within scope' at token ';' on line 237472:
 >  	allow smartmon_update_drivedb_t fsadm_exec_t:file { { getattr open map read execute ioctl } ioctl lock execute_no_trans };
 >  #line 146
 >  checkpolicy:  error(s) encountered while parsing configuration
 >  make[1]: *** [Rules.monolithic:80: policy.33] Error 1

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a01123de9a8c1927060e7e4748666bebfc82ea44

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
