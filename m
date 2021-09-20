Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D77C433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:41:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FBC360FF2
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:41:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3FBC360FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A4B82560;
	Mon, 20 Sep 2021 06:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U94P9TQUaLhd; Mon, 20 Sep 2021 06:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E1CD82540;
	Mon, 20 Sep 2021 06:41:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8BF1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAABF403C6
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JSre1o6y8nKH for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 06:41:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3547F403C5
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 06:41:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id D7F8B200004;
 Mon, 20 Sep 2021 06:41:05 +0000 (UTC)
Date: Mon, 20 Sep 2021 08:41:05 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20210920084105.4b8fea91@windsurf>
In-Reply-To: <f98c560b-9a4f-26df-3bcb-3bdb4509786d@benettiengineering.com>
References: <f98c560b-9a4f-26df-3bcb-3bdb4509786d@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Harfbuzz bump major version question
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Hello Giulio,

On Sun, 19 Sep 2021 23:10:23 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> I'm going to bump harfbuzz to version 3.0.0 but being a major version it 
> looses 15 apis[1] and introduce some new ones. So I'm not that sure if 
> this can be a normal bump or I need to introduce the new package 
> harfbuzz3. Package pango that requires harfbuzz builds fine, but how 
> should I proceed? Should I build every package that depends on it and 
> check if it builds fine? Or should I add package harfbuzz3 and then 
> every package that depends on harfbuzz should move to harfbuzz3 package 
> per package? I'm new to this case so help is appreciated.

The best is to not have to introduce a separate harfbuzz3 package, as
it really complicates things.

There are not that many packages that have a dependency on harfbuzz:

package/efl/efl.mk:ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
package/libass/Config.in:       select BR2_PACKAGE_HARFBUZZ
package/mupdf/Config.in:        select BR2_PACKAGE_HARFBUZZ
package/pango/Config.in:        select BR2_PACKAGE_HARFBUZZ
package/qt5/qt5base/Config.in:config BR2_PACKAGE_QT5BASE_HARFBUZZ
package/qt5/qt5base/Config.in:  select BR2_PACKAGE_HARFBUZZ if \
package/qt5/qt5base/qt5base.mk:ifeq ($(BR2_PACKAGE_QT5BASE_HARFBUZZ),y)
package/supertuxkart/Config.in: select BR2_PACKAGE_HARFBUZZ
package/vlc/vlc.mk:ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
package/webkitgtk/Config.in:    select BR2_PACKAGE_HARFBUZZ
package/wpewebkit/Config.in:    select BR2_PACKAGE_HARFBUZZ

So I would suggest to create a configuration that builds all those
packages successfully prior to the harfbuzz bump, and then retry this
configuration with the harfbuzz bump applied. This will give you a
sense of how much breakage the API changes are causing.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
