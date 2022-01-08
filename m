Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CA3C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 10:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD7B0402ED;
	Sat,  8 Jan 2022 10:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNpj-OoTSpj1; Sat,  8 Jan 2022 10:51:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16149402C4;
	Sat,  8 Jan 2022 10:51:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADAA41BF306
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A66D640231
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 10:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FS0PzyRfISmG for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 10:51:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B71B40043
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 10:51:44 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 4B701200003;
 Sat,  8 Jan 2022 10:51:41 +0000 (UTC)
Date: Sat, 8 Jan 2022 11:51:40 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220108115140.760e195f@windsurf>
In-Reply-To: <20220104205455.3632671-1-fontaine.fabrice@gmail.com>
References: <20220104205455.3632671-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2, 1/1] package/file: fix build with gcc 4.8
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  4 Jan 2022 21:54:55 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 5.41 in
> commit d38b72bcd75392a88b5100839ac410859d0a6a79:
> 
> readelf.c: In function 'do_auxv_note':
> readelf.c:1046:2: error: 'for' loop initial declarations are only allowed in C99 mode
>   for (size_t off = 0; off + elsize <= descsz; off += elsize) {
>   ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/31cbc313fceb84c0cbb1969fca5ac44244871dbc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I am afraid it seems like this didn't fix the problem, see:

  http://autobuild.buildroot.net/results/957/9573e8b01d8f21cd89a67475daabdeef533d31d7/build-end.log

ac_cv_prog_cc_c99='-std=gnu99' is properly passed to the configure
script, but it still fails.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
