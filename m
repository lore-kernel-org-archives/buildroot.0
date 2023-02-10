Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40639C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 11:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E26388226A;
	Fri, 10 Feb 2023 11:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E26388226A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HK-acbQM-PkO; Fri, 10 Feb 2023 11:45:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49CB182264;
	Fri, 10 Feb 2023 11:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49CB182264
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD2091BF2AA
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 11:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6BCA60FAE
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 11:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6BCA60FAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0LeECzIJjpEn for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 11:45:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 128E3607F5
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 128E3607F5
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 11:45:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A1F40240006;
 Fri, 10 Feb 2023 11:45:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pQRqG-00HUMA-2s; Fri, 10 Feb 2023 12:45:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: John Keeping <john@metanate.com>
References: <20230209170707.4066903-1-peter@korsgaard.com>
 <Y+YnzeeSbedxW3eK@donbot>
Date: Fri, 10 Feb 2023 12:45:24 +0100
In-Reply-To: <Y+YnzeeSbedxW3eK@donbot> (John Keeping's message of "Fri, 10 Feb
 2023 11:17:33 +0000")
Message-ID: <87fsbdg2wb.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] package/webkitgtk: Build with ninja
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
Cc: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "John" == John Keeping <john@metanate.com> writes:

 > Hi Peter,
 > On Thu, Feb 09, 2023 at 06:07:05PM +0100, Peter Korsgaard wrote:
 >> +define WEBKITGTK_BUILD_CMDS
 >> +	$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(WEBKITGTK_BUILDDIR)
 >> +endef
 >> +
 >> +define WEBKITGTK_INSTALL_STAGING_CMDS
 >> +	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
 >> +endef
 >> +
 >> +define WEBKITGTK_INSTALL_TARGET_CMDS
 >> +	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install $(WEBKITGTK_BUILDDIR)
 >> +endef
 >> +

 > Would it make sense to apply these changes in pkg-cmake.mk?

 > Using `cmake --build` and `cmake --install` works with all generators
 > and it would avoid needing to repeat this block for both of the packages
 > in this series.

Longer term that is indeed the direction we want to move to (and
generally build cmake packages with the ninja backend).

This is meant as a minimal patch that is easy to backport to the stable
branches.

We have a number of cmake packages that use custom FOO_MAKE_OPTS, how
are those passed to make when using cmake --build / --install?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
