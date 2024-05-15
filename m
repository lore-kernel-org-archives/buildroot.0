Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50E0C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 06:14:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8150640B40;
	Wed, 15 May 2024 06:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ldfsddrpftno; Wed, 15 May 2024 06:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8ABEF41987
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ABEF41987;
	Wed, 15 May 2024 06:14:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 053621BF59A
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E663F40569
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 06:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_W_NeyoBrJz for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 06:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4ECAB4056C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4ECAB4056C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4ECAB4056C
 for <buildroot@buildroot.org>; Wed, 15 May 2024 06:14:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54EBB20004;
 Wed, 15 May 2024 06:14:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1s77uC-000aAk-2I;
 Wed, 15 May 2024 08:14:24 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240514172142.4449-1-fontaine.fabrice@gmail.com>
Date: Wed, 15 May 2024 08:14:24 +0200
In-Reply-To: <20240514172142.4449-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 14 May 2024 19:21:42 +0200")
Message-ID: <87frujsitb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libnpth: fix gnupg2 build with
 uclibc
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure of gnupg2 raised since bump to version
 > 1.7 in commit 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91 and
 > https://git.gnupg.org/cgi-bin/gitweb.cgi?p=npth.git;a=commitdiff;h=02ce6b2d27f91ed6285e4e92d99c21bcc7823c9b:

 > /home/autobuild/autobuild/instance-2/output-1/host/lib/gcc/armeb-buildroot-linux-uclibcgnueabi/13.2.0/../../../../armeb-buildroot-linux-uclibcgnueabi/bin/ld:
 > /home/autobuild/autobuild/instance-2/output-1/host/bin/../armeb-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libnpth.so:
 > undefined reference to `busy_wait_for'

 > Fixes: 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91
 >  - http://autobuild.buildroot.org/results/9a27ffde79598a39b4fd55c716978d32d0beb924

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
