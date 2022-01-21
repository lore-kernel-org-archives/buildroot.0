Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D803EC433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 07:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4387D60EC3;
	Fri, 21 Jan 2022 07:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mtbrq1IRXpcR; Fri, 21 Jan 2022 07:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97F7760E9A;
	Fri, 21 Jan 2022 07:41:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E30F1BF2F0
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 07:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C0674166D
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 07:41:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPsNRsMYdcjC for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 07:41:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C8A740940
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 07:41:46 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D637424000A;
 Fri, 21 Jan 2022 07:41:42 +0000 (UTC)
Date: Fri, 21 Jan 2022 08:41:41 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220121084141.6eac525e@windsurf>
In-Reply-To: <20220121065850.GF3252931@scaer>
References: <20220119084545.3642950-1-james.hilliard1@gmail.com>
 <20220119204518.GC3095239@scaer>
 <CADvTj4q2AWnzpQbbQHFRUWnKki_uRCcDTOiT7pwRZ4-Ao0o3fw@mail.gmail.com>
 <20220120222936.6e7b5aba@gmx.net>
 <CADvTj4rXQO8Kbe0sMA5YJdj6A2R98OELOB5sPD_xriZ_npkaFQ@mail.gmail.com>
 <20220121065850.GF3252931@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: switch to generic-package
 make build
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 21 Jan 2022 07:58:50 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> So, I think that Peter's proposal is not so un-appealing, in then end.
> But then in such situation, I think it would be simpler for us to just
> apply something like:
> 
>     define RE2_INSTALL_PC
>         $(INTALL) -d -m 0644 $(@D)/re2.pc \
>             $(STAGING_DIR)/usr/lib/pkgconfig/re2.pc
>         $(SED) 's,@includedir@,/usr/include,; s,@libdir@,/usr/lib,' \
>             $(STAGING_DIR)/usr/lib/pkgconfig/re2.pc
>     endef
>     RE2_POST_STAGING_INSTALL_HOOKS += RE2_INSTALL_PC
> 
> And be done with it: minimal change to the re2 package, no dual-buildsystem
> situation and thus no install conflict on the headers, usual and simple
> post-install hook.

I might be missing something in the whole discussion, but why not patch
the CMake build system so that it also installs this .pc file, and
contribute this fix upstream ?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
