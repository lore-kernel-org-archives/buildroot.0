Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778C5C25B74
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 17:02:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B651241ECA;
	Thu,  9 May 2024 17:02:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VYx8lIrHvCWF; Thu,  9 May 2024 17:02:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17DCB41F16
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17DCB41F16;
	Thu,  9 May 2024 17:02:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 872BF1BF337
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 745CD4012E
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 17:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJId8oGhYFHa for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 17:02:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E975941D8E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E975941D8E
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E975941D8E
 for <buildroot@buildroot.org>; Thu,  9 May 2024 17:02:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2299520005;
 Thu,  9 May 2024 17:02:01 +0000 (UTC)
Date: Thu, 9 May 2024 19:02:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240509190200.2ccb2613@windsurf>
In-Reply-To: <20240407114445.683504-8-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
 <20240407114445.683504-8-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715274124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s+uGQJfh7mbwqj6ML1OZ4mHGi/9FZ36+zaK5NTJyJIA=;
 b=ElOzSl25igLr4ymEOpY8Haepm4Pwsw+X4QZ02GtZv85cxMeU/dPF+6hc7VUT4GVkuIXWey
 JZ9s2ZNlqyplyNcbM4O3xFXruBq2KDzoPee1mtkif021YBjQ0VAP/FnvmZT9ykb4rabb5H
 G+YAy83/iIfV9aNTY30u98vl9/1/ADaKiZfmpnl4FmWq+QDacs01TvSRrhadd0/yQWPp8D
 vTxnZhoYZrZPri9ZxWUHButJ2F669+/3oFxEQE0bQKGx+CCV7t8tkPaLP/nylg8iHBQFPA
 AOZ3Wx9Twt4RHNREuLRinUV3yZum3dtHlTVjfuQJXyC4zfFQ79X2OI1vifNxJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ElOzSl25
Subject: Re: [Buildroot] [PATCH v2 07/20] package/kodi: bump version to
 21.0-Omega
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Apr 2024 13:44:32 +0200
Bernd Kuhls <bernd@kuhls.net> wrote:

> Added new dependency to libdisplay-info for gbm support:
> https://github.com/xbmc/xbmc/commit/ce9626479c1792210c7b7cc02c7dc4f819ace509
> 
> Added new required dependency to tinyxml2:
> https://github.com/xbmc/xbmc/commit/9e983ed0449aaf3007d8bfa3261056b120d84188
> Please note that parts of kodi still use tinyxml so both dependencies
> are needed.
> 
> Added new required dependency to libudfread: Since upstream commit
> https://github.com/xbmc/xbmc/commit/5f9b9cfa26f274e381e92d73cfa33fb55582436e
> kodi does not build anymore without libudfread.
> 
> Upstream removed the bundled groovy/apache commons binaries:
> https://github.com/xbmc/xbmc/commit/d6bc920e056baad7782f47b86cba85d1336bb134
> 
> - JsonSchemaBuilder fixes:
> 
> Upstream moved CMakeLists.txt to src/ subfolder:
> https://github.com/xbmc/xbmc/commit/7e87d98ca55c72fcbc9b8dadf2cb979a85732606
> 
> - TexturePacker fixes:
> 
> texturepacker now depends on c++17:
> https://github.com/xbmc/xbmc/commit/54bd6d7ab552a4ddc04d2595826457d8bfa864d5
> 
> Since the host version of texturepacker is a build dependency of kodi:
> https://github.com/xbmc/xbmc/blob/Omega/CMakeLists.txt#L187
> https://github.com/xbmc/xbmc/blob/Omega/CMakeLists.txt#L472
> we add a new dependency to BR2_HOST_GCC_AT_LEAST_9.
> 
> Upstream moved CMakeLists.txt to src/ subfolder
> https://github.com/xbmc/xbmc/commit/e336a75f42d9c4efd3433f3fa6edd05309689deb
> 
> Due to this update we can remove all of our patches for texturepacker.
> 
> - Kodi fixes:
> 
> Set KODI_SOURCE_DIR variable to root directory of the source tarball.
> When building natively, outside of a meta buildsystem like Buildroot,
> kodi builds its own tools as part of its build process. TexturePacker
> needs cmake modules available from the top of the Kodi source tree, a
> source file in a sub-directory at the top-level source tree, which
> itself needs includes from the same sub-dir. The Kodi build process sets
> KODI_SOURCE_DIR so that TexturePacker can find those files.
> 
> In Buildroot, as we cross-build, we build the tools explicitly, without
> using the Kodi build process, and thus we must set KODI_SOURCE_DIR to the
> root directory of the source tarball. LibreELEC added something similar:
> https://github.com/LibreELEC/LibreELEC.tv/commit/70abdd27a22b22547060fcb00a2c70ea61721465
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../kodi-jsonschemabuilder.mk                 |  6 ++---
>  .../0001-texturepacker.patch                  | 16 -----------
>  ...-fix-texture-packer-cmake-source-dir.patch | 27 -------------------
>  .../kodi-texturepacker/kodi-texturepacker.mk  |  9 ++++---
>  package/kodi/Config.in                        |  4 +++
>  package/kodi/kodi.hash                        |  6 ++++-
>  package/kodi/kodi.mk                          | 25 ++++++++++-------
>  7 files changed, 33 insertions(+), 60 deletions(-)
>  delete mode 100644 package/kodi-texturepacker/0001-texturepacker.patch
>  delete mode 100644 package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch

Thanks for the detailed commit log explaining all the changes, it was
*very* useful.

One small thing was missing: you add a dependency on host gcc >= 9, but
you forgot to update the Config.in comment and dependency about this. I
fixed that up when applying.

Thanks for the continued maintenance of this complicated package!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
