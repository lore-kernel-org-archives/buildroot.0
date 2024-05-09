Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF55C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF41C402C9;
	Thu,  9 May 2024 14:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHFfBKmuR3aX; Thu,  9 May 2024 14:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EA88405B5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EA88405B5;
	Thu,  9 May 2024 14:42:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0CAFC1BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDAC9606F3
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:42:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2zxvHC2YakLN for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:42:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C2A2C6077D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A2C6077D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C2A2C6077D
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:42:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3828C1BF204;
 Thu,  9 May 2024 14:42:26 +0000 (UTC)
Date: Thu, 9 May 2024 16:42:25 +0200
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Message-ID: <20240509164225.4de0d2e3@windsurf>
In-Reply-To: <20240417080538.3451923-2-roy.kollen.svendsen@akersolutions.com>
References: <20240417080538.3451923-1-roy.kollen.svendsen@akersolutions.com>
 <20240417080538.3451923-2-roy.kollen.svendsen@akersolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715265746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8NVb5il6fJzt2Kl9p0Dkr30rLGTh/QK0qcX8xL0nMTI=;
 b=LcAQ8M94lVGo3ODVwsk53pnyL3lA4i1OIRfJT9O7i7/DQgQg2Bk/WIv2qAq4Wgmes4Keor
 /kZ/xyeAoy3pnhJRsF6f+MKfZ3gawe7DndnjNN2dXpCQKaSg9PAEnueCSmU84yJr8DU7Kb
 C4ROukYkS/ypUVe7ngUlIAzScKLfqwRL+56xFDuT/KQXs656qwJPzHUeEr72+oz1BsDv1a
 T9J3E7tQQo0tRAwG6zjS5lRCa+JkaMXHKXuoIuROhJsTHQfMVfVxRqyV23ixN4hLrNmDQN
 9grooQ0xqLS+z3nny6pgtItyIKlQpos+KuvqZL9bPOaJnAyQaz+4aSrUByrS/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=LcAQ8M94
Subject: Re: [Buildroot] [PATCH v2 02/11] package/qt6base: avoid enabling
 both desktop and es2 opengl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Roy,

On Wed, 17 Apr 2024 10:05:23 +0200
Roy Kollen Svendsen <roykollensvendsen@gmail.com> wrote:

> Fixes the following error:
> 
> ERROR: Feature "opengles2": Forcing to "ON" breaks its condition:
>     NOT WIN32 AND NOT WATCHOS AND NOT QT_FEATURE_opengl_desktop AND GLESv2_FOUND
> Condition values dump:
>     WIN32 = ""
>     WATCHOS = "0"
>     QT_FEATURE_opengl_desktop = "ON"
>     GLESv2_FOUND = "TRUE"
> 
> CMake Error at cmake/QtBuildInformation.cmake:209 (message):
>   Check the configuration messages for an error that has occurred.
> Call Stack (most recent call first):
>   cmake/QtBuildInformation.cmake:39 (qt_configure_print_summary)
>   cmake/QtBuildRepoHelpers.cmake:332 (qt_print_feature_summary)
>   CMakeLists.txt:208 (qt_build_repo_end)
> 
> Signed-off-by: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

I don't see any failures for this in our autobuilders. Could you
provide a simple Buildroot defconfig that exhibits this issue?

Also, does this issue already appears with qt6base 6.4.3 that we have
in Buildroot today, or only after the bump to qt 6.7 ? This is
important to understand if the fix needs to be backported to our stable
branches or not.

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
