Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE31C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 13:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 272B540A30;
	Wed, 12 Jan 2022 13:26:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Op8pFfa23O1K; Wed, 12 Jan 2022 13:26:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FB2840A2A;
	Wed, 12 Jan 2022 13:26:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1DAF01BF3DC
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 13:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B2DB6FB96
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 13:26:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMbCrhdcBdk9 for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 13:26:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5434C60DDF
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 13:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6WXKcgYiTuZDY3VSY2f4unHs6W0prsBbESaM6pANAec=; b=jtgQCnBSuOsCWyFy2GUCZj6V75
 KQVnFaI2gXN+/flAKyFZLvEi2Okm2HW+pdLP4hdn8DtFiy9/ZEOxylZ3cB++kGG70Ou8ou9wJNlXW
 W6QMV/BvPyJwgMrSR24gpnMgWUIE/EXkFK6zHi4diRU4bNgjg57HUQx3G38bPSSAgXmMK3KwnRLU5
 c7Dyb79FZDQs9cgU6Zz9nBnbggLJC4HDwGp7DCP2BOW6kyWchSjaB4RV1+rxKvCVgqJOehZiXERp/
 vOZouMJd5KqY07tfCWLw4r4UUNK+ETyistgfK1fPQZmjNxrdLcWczlKqTUAEn4InDyrtabsvmupCv
 ftWozvqA==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7de2-000ARv-Nb; Wed, 12 Jan 2022 14:26:30 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 9dcbf00a;
 Wed, 12 Jan 2022 13:26:18 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 15:26:16 +0200
Message-Id: <20220112132618.2634250-1-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC 0/2] Use Ninja as build tool for CMake-based
 packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello everybody,

As discussed yesterday, here is a quick stab for testing and getting the
conversation started about using Ninja for CMake-based packages (hence the
missing documentation updates and the "RFC" tag in the subject :-D).

In order to avoid the circular dependency of host-ninja requiring itself,
ninja.mk gets changed to use host-generic-package with a build command
that plainly runs the compiler on the set of sources we know are needed
to build a minimal usable version of it under Unix-y systems. This is
basically the list of sources that CMake would have picked (as per the
CMakeLists.txt file) passed straight to $(HOSTCXX).

The next change modifies pkg-cmake.mk to always pass -GNinja and removes
the $(<PKG>_INSTALL[_STAGING,_TARGET]_OPTS) variables, because when using
Ninja the "install/fast" targets are not generated by CMake (those are
an internal detail of the Makefile generator, it seems). For consistency
with the Meson package infrastructure variables $(NINJA), $(<PKG>_NINJA_ENV)
and $(NINJA_OPTS) are honored by the default set of build/install commands.

Now, there might be packages that break with this, and I would be
particularly concerned about things like packages which use CMake and
build out-of-tree kernel modules (as the kernel build infrastructure is
all Make, and only Make!) but the changes included were enough for me
to get Raspberry Pi images built with WebKit (both GTK and WPE ports)
in it, which results in the following built using [host-]cmake-package:

  - brotli
  - cog
  - jpeg-turbo
  - openjpeg
  - webkitgtk
  - webp
  - woff2
  - wpewebkit

While not a long list by any means, I think it shows a decent sample of
packages coming from different development teams that work just fine
switching to Ninja.

If anybody can suggest something with a bigger number of CMake packages to
build (or a .config file to share) I will be more than happy to give it a
test this with these patches applied :)

Cheers,
-Adrian


Adrian Perez de Castro (2):
  package/ninja: do not require cmake
  package/pkg-cmake.mk: use ninja instead of make

 package/ninja/ninja.mk | 36 +++++++++++++++++++++++++++++++++++-
 package/pkg-cmake.mk   | 24 ++++++++++++++----------
 2 files changed, 49 insertions(+), 11 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
