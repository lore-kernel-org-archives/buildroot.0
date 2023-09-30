Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCC2E77363
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 15:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D93A3415AF;
	Sat, 30 Sep 2023 15:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D93A3415AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zXG0liP8F0Yf; Sat, 30 Sep 2023 15:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07EE14159B;
	Sat, 30 Sep 2023 15:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07EE14159B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3265F1BF5F6
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1943D41F12
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 15:38:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1943D41F12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rViuUdztGnkt for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 15:38:40 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9624441EE8
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 15:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9624441EE8
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C1521C0003;
 Sat, 30 Sep 2023 15:38:37 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmc3B-00F1hk-Ge; Sat, 30 Sep 2023 17:38:37 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230930151502.650185-1-thomas.petazzoni@bootlin.com>
Date: Sat, 30 Sep 2023 17:38:37 +0200
In-Reply-To: <20230930151502.650185-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 30 Sep 2023 17:15:02 +0200")
Message-ID: <875y3racxu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gcc/gcc-final: only install
 libgcc_s for shared library builds
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > In commit
 > 55e83008fc82cf621d94d60ab4401a4848880bc2 ("package/gcc/gcc-final:
 > rework installation of libgcc_s/libatomic"), we reworked the libgcc_s
 > installation. In the previous code, libgcc_s was installed to
 > STAGING_DIR/TARGET_DIR unconditionally, but a "-cp" command was used,
 > which means that any failure was ignored. As we are now more picky, it
 > has become clear that this in fact wasn't entirely correct: libgcc_s
 > only exists for shared builds. For static builds, only libgcc.a is
 > available, but it doesn't need to be installed to STAGING_DIR (for
 > some reason, and as it was never installed by Buildroot, it has always
 > worked without libgcc.a in STAGING_DIR).

 > So long story short: we change the code to only install libgcc_s when
 > BR2_STATIC_LIBS is disabled. This fixes the following build failure on
 > BR2_STATIC_LIBS=y builds:

 > cp -dpf
 > /home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/lib*/libgcc_s*
 > /home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/
 > cp: cannot stat
 > '/home/thomas/buildroot/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/lib*/libgcc_s*':
 > No such file or directory

 > Reported-by: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
