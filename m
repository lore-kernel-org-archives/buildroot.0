Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DA8C433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 15:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06D704022B;
	Fri, 21 Jan 2022 15:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WeYe1wP73kDZ; Fri, 21 Jan 2022 15:43:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27DA340207;
	Fri, 21 Jan 2022 15:43:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B15C31BF423
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC9FC404D7
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 15:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRFCYT3jWvGU for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 15:42:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C012E4046D
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=U814am/VdCkwqBhuYbIxP0XZMS1AYAm+NsCuu3clRRM=; b=dv/9M4uTvQbpgaXCCScEM+ouVQ
 /uL8v/NUh2yNJiFysAJggIgZUp/fvH24703Y5qyNSbLClwLuYdHpUM1ssZ95Z8iMMPXtC7mAfI/gU
 XLDPiXv1ZpgVhPBkmGdD9fl3rr+jKa9HSRpK2uPz6PSgdjGJkEnMq65uVUUg+YUgVL//3A9abVrZj
 6Rdo+XxDU0ksZaXHyeX+dn/9F2uGVIn3yOfm1H5vl+k65KCOWrpdWedGN1wu/BGxyo3S7pAbQiYh7
 RafvrEQI9us9XLLz39KhiHFnZmXoDloOBkjFYucbzqcAutSzmyyCFVLqMecJLYdusO83M7RYhn8mh
 XeTidTXw==;
Received: from 91-153-34-128.elisa-laajakaista.fi ([91.153.34.128] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nAw3t-000BCQ-6r; Fri, 21 Jan 2022 16:42:49 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id f57af89e;
 Fri, 21 Jan 2022 15:42:35 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Fri, 21 Jan 2022 17:42:28 +0200
Message-Id: <20220121154235.798255-1-aperez@igalia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112132618.2634250-2-aperez@igalia.com>
References: <20220112132618.2634250-2-aperez@igalia.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH RFC v2 0/7] Use Ninja as build tool for
 CMake-based packages
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
 Pierre Ducroquet <pinaraf@pinaraf.info>, Samuel Martin <s.martin49@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Here's a new version of the patch set to use Ninja for all CMake packages.
It is still incomplete (missing documentation, a couple of commits need
better commit logs, etc.) so I will be still using the "RFC" tag =)

This is what I wrote when I sent the initial version:

> In order to avoid the circular dependency of host-ninja requiring itself,
> ninja.mk gets changed to use host-generic-package with a build command
> that plainly runs the compiler on the set of sources we know are needed
> to build a minimal usable version of it under Unix-y systems. This is
> basically the list of sources that CMake would have picked (as per the
> CMakeLists.txt file) passed straight to $(HOSTCXX).
> 
> The next change modifies pkg-cmake.mk to always pass -GNinja and removes
> the $(<PKG>_INSTALL[_STAGING,_TARGET]_OPTS) variables, because when using
> Ninja the "install/fast" targets are not generated by CMake (those are
> an internal detail of the Makefile generator, it seems). For consistency
> with the Meson package infrastructure variables $(NINJA), $(<PKG>_NINJA_ENV)
> and $(NINJA_OPTS) are honored by the default set of build/install commands.

While the main changes remain the same, this v2 includes a few fixes for
packages which were needed to make them build using Ninja, and much more
testing: out of the 306 packages which use CMake today, I have been able to
successfully have 205 of them built. I will follow-up with another email
commenting more on this, and with a defconfig attached.

At this point I am confident that we can get all the packages built with
CMake without loss of functionality. Only 5 packages out of 205 needing
minor tweaks is a *very* good sign, IMO.

Cheers,
-Adrian


Adrian Perez de Castro (7):
  package/ninja: do not require cmake
  package/pkg-cmake.mk: use ninja instead of make
  package/musepack: use MUSEPACK_NINJA_OPTS
  package/mariadb: use HOST_MARIADB_NINJA_OPTS
  package/kf5/kf5-extra-cmake-modules: do not build documentation
  package/libcorrect: avoid multiple rules for same target
  package/racehound: add patch to support building with ninja

 .../kf5-extra-cmake-modules.mk                |   5 +
 package/libcorrect/libcorrect.mk              |   2 +
 package/mariadb/mariadb.mk                    |   2 +-
 package/musepack/musepack.mk                  |   2 +-
 package/ninja/ninja.mk                        |  36 +++++-
 package/pkg-cmake.mk                          |  24 ++--
 ...pport-non-Make-generators-e.g.-Ninja.patch | 112 ++++++++++++++++++
 7 files changed, 170 insertions(+), 13 deletions(-)
 create mode 100644 package/racehound/0002-CMake-Support-non-Make-generators-e.g.-Ninja.patch

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
