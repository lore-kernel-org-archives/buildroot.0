Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B97C54E71
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 16:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B08181959;
	Tue, 19 Mar 2024 16:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJEEdYIXIoNz; Tue, 19 Mar 2024 16:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 351E181E32
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351E181E32;
	Tue, 19 Mar 2024 16:34:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 399241BF836
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2614E40707
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 16:34:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHoWaiS4c5YF for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 16:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E446D404B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E446D404B6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E446D404B6
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 16:34:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 06A90FF809;
 Tue, 19 Mar 2024 16:34:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmcQ1-00438R-1D;
 Tue, 19 Mar 2024 17:34:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240304161953.3529614-1-fontaine.fabrice@gmail.com>
Date: Tue, 19 Mar 2024 17:34:29 +0100
In-Reply-To: <20240304161953.3529614-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 4 Mar 2024 17:19:53 +0100")
Message-ID: <87h6h29o4q.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libva: fix build with gcc 4.8
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

 > Fix the following build failure with gcc 4.8 raised since bump to
 > version 2.20.0 in commit e926c83928e08c0ecd6cd4383e1cca151a8a4d2c and
 > https://github.com/intel/libva/commit/4f5a4345fc9f92565763ca22026891475e3cf835:

 > ../va/va.c: In function 'va_new_opendriver':
 > ../va/va.c:695:9: error: 'for' loop initial declarations are only allowed in C99 mode
 >          for (unsigned int i = 0; i < num_drivers; i++)
 >          ^
 > ../va/va.c:695:9: note: use option -std=c99 or -std=gnu99 to compile your code

 > Fixes: e926c83928e08c0ecd6cd4383e1cca151a8a4d2c
 >  - http://autobuild.buildroot.org/results/b9dbd104fa05c59883d87f74e6522c55620a4252

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
