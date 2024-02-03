Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9016C4828F
	for <buildroot@archiver.kernel.org>; Sat,  3 Feb 2024 18:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 917FF405E0;
	Sat,  3 Feb 2024 18:45:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 917FF405E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WFDLTrTlOrVl; Sat,  3 Feb 2024 18:45:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C52D400A4;
	Sat,  3 Feb 2024 18:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C52D400A4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 039411BF5DE
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 11:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E51EF834B6
 for <buildroot@lists.busybox.net>; Sat,  3 Feb 2024 11:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2ccUYVeS0lo for <buildroot@lists.busybox.net>;
 Sat,  3 Feb 2024 11:24:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D7BE683455
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7BE683455
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7BE683455
 for <buildroot@buildroot.org>; Sat,  3 Feb 2024 11:24:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A61341BF208;
 Sat,  3 Feb 2024 11:24:39 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWE8U-009KzD-3D;
 Sat, 03 Feb 2024 12:24:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
References: <20240113194950.11170-1-adam.duskett@amarulasolutions.com>
Date: Sat, 03 Feb 2024 12:24:38 +0100
In-Reply-To: <20240113194950.11170-1-adam.duskett@amarulasolutions.com> (Adam
 Duskett's message of "Sat, 13 Jan 2024 12:49:50 -0700")
Message-ID: <87a5ohu6x5.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v4 1/1]
 package/flutter-sdk-bin/Config.in.host: change flutter-pub-cache location
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Adam" == Adam Duskett <adam.duskett@amarulasolutions.com> writes:

 > When running the command "flutter pub get," the plugins are stored in the
 > pub-cache directory along with their sha256sum hashes. The default location of
 > the pub-cache directory is current $(HOST_DIR)/share/flutter/sdk/.pub-cache,
 > which is not an acceptable choice by default because every plugin is
 > re-downloaded during every build of a flutter application either during a new
 > build or when building with the per-package-directory option enabled.

 > Furthermore, keeping the pub-cache in its current location prevents users from
 > committing the pub-cache directory to git for faster rebuilds of a
 > Buildroot-based system, as users cannot store the pub-cache for later use.

 > To fix the above issue completely, the following two changes must occur:

 >   - Change the hard-coded Flutter pub-cache location to
 >     $(DL_DIR)/br-flutter-pub-cache.

 >   - Remove the `rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache` and the
 >     associated comment about why the build system removes the .pub-cache
 >     directory. After further research, the help text of the precache command
 >     reads, "Populate the Flutter tool's cache of binary artifacts."
 >     The current reasoning listed in the comments is not accurate for a
 >     the following reasons:

 >     1. We do not want to remove their directory if users already have a pub
 >        cache they have symlinked to.

 >     2. If the flutter-sdk-bin package previously set up the pub-cache, then
 >        the pub-cache directory is set up with the options we want, and there
 >        is no reason to remove the pub-cache directory.

 > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
 > ---
 > changes v3 -> v4:
 >   - Hardcode the directory to $(DL_DIR)/br-flutter-pub-cache. [Yann]
 >   - Remove the `rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache` line. [Yann]
 >   - Remove the associated comments about the above line. [Yann]
 >   - Expand the commit log.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
