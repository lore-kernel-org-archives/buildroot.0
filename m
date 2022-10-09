Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6BCC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 16:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA8E440643;
	Sun,  9 Oct 2022 16:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA8E440643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i6sFadBemVio; Sun,  9 Oct 2022 16:00:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D565D4063F;
	Sun,  9 Oct 2022 16:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D565D4063F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 422121BF239
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D4C8813FC
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D4C8813FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cUup_C2buHi7 for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 15:59:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA061813F4
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA061813F4
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 15:59:47 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id bn8so10843603ljb.6
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 08:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xQc0j3S+WPa12p38AigAxgpHfvezrEbKAcJVBnsMgIE=;
 b=RSosYwsXZ2Cq/nmwRVjwAn2S9gYiEOWR+z9NtxChcequ5BrPcymwGGH/Y/kOBrZeWw
 uogU2eq7ycCC7jUsIhsBSlnOCbxxqjFLbMu4iuKgdUSmqTbNKwAXnTv87sJxrFsKbpPN
 WjkFAq5COCSXJJ0wOZsS+TdSqY2UIMhH9Dytpb+5KZkkF5E/PdNPFbzDfziOgN5TU2oe
 CZ9E/4ucrHroBRJHB/qE40RHzmjjiXqzkrk0vVtbgW61KclQWOZ7cX13wG0jQe+RQy/f
 LZFWDT3SOjspN5JTCeVLMWMzbN3/dwmBSqKGkPHcIjihaVieYB2XQpOtjUnWrwEi04x4
 wwAQ==
X-Gm-Message-State: ACrzQf1JLazR1+pTqK9TJVKXHu1gGRybGHy3BBeLfYr633315odAA3if
 HPymLkViG68jQoJn/E+vmIMwF9kPvd4=
X-Google-Smtp-Source: AMsMyM7hmFhhzLuLnSCY4JzoAICdYhOvgrH9LwEJ2Kcvku1AsMr2jf2sE5cjZjLvHGZQz1D3t1vp2Q==
X-Received: by 2002:a2e:978e:0:b0:26e:8ad6:6d5b with SMTP id
 y14-20020a2e978e000000b0026e8ad66d5bmr3302054lji.363.1665331184998; 
 Sun, 09 Oct 2022 08:59:44 -0700 (PDT)
Received: from luthien.lan ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b004947a12232bsm1057918lfg.275.2022.10.09.08.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 08:59:44 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:59:29 +0200
Message-Id: <20221009155938.2041695-2-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009155938.2041695-1-troglobit@gmail.com>
References: <20221009155938.2041695-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xQc0j3S+WPa12p38AigAxgpHfvezrEbKAcJVBnsMgIE=;
 b=cUZuVFcqAuW9vrjNxofX57sm1JBc5D2t9fvLbhO9xdMZ2zHB9qgJS7C1UhnY6uDdfr
 JY3XZrKxxpsLHVz2L1pxDZCmI0o+i8s8gXea+FW1cS2QJC1/WiB5OozziTdMkhpV18jc
 bn/y//sDTN4Z3DgIbXK3HvWjKJFNR1cUn/q6yc/O+f0XVqT4b3m1NGQfVFIBWvq+E60J
 dfiQmxFYKUQ8KPux1sE3bSsB7gVH1V+kQBlcu1X+zu4TbjrWU/bLC8yLGu7iDVK5ErXp
 IoxN4imfo4GfzTRwcjXKaD39bDMSrxLCE3Uqmf1SZP6NqCwsDigxgPkTaa/r4ABGWRf2
 drCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cUZuVFcq
Subject: [Buildroot] [PATCH 1/9] package/skalibs: bump to v2.12.0.1
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
 Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Summary of changes:

New:
 - New djbunix functions: waitn_posix(), waitn_reap_posix()
 - New unix-transactional.h function: opendir_at.
 - New skalibs/posixplz.h function: munmap_void().
 - random functions now have an early version, to use when randomness is
   required before the generator can be seeded (i.e. in programs running in
   the very early boot).
 - envdir_internal() now has a SKALIBS_ENVDIR_NOCLAMP option allowing
   reading of unlimited-size variables.
 - fd_close() now chooses to adapt to Linux's close() behaviour (closing
   the fd on EINTR) over the HP-UX one (not closing it). Destructors like
   close() being allowed to fail has always been a mistake in the
   specification and a programming nightmare, making it impossible to
   behave correctly on all systems, but apparently standardization efforts
   are on the way and the Linux behaviour seems to be the chosen one.

Removed:
 - libbiguint removed.
 - Obsolete skalibs/environ.h and skalibs/getpeereid.h headers removed.
 - rc4 and md5 functions removed.
 - iobuffer removed. fd_cat() and fd_catn() changed signatures.
 - All signal functions entirely reworked; cruft removed.
 - The unsafe cdb_successor() API has been removed.
 - random_init() and random_finish() removed, as well as random_char().

Renamed APIs and type:
 - random_string() renamed to random_buf().
 - All *_t types renamed without the _t suffix, to preserve POSIX namespace.
 - subgetopt() renamed to lgetopt().
 - skalibs/cdb_make.h renamed to skalibs/cdbmake.h;
   cdbmake functions now return 1 on success and 0 on failure.
 - skalibs/cdb.h redesigned to remove reader state from the cdb structure.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/skalibs/skalibs.hash | 4 ++--
 package/skalibs/skalibs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index 48e4028edc..dd202b97fb 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  b780b0ae650dda0c3ec5f8975174998af2d24c2a2e2be669b1bab46e73b1464d  skalibs-2.10.0.3.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  3e228f72f18d88c17f6c4e0a66881d6d3779427b7e7e889f3142b6f26da30285  skalibs-2.12.0.1.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 77db57de96..0ff449a5ba 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.10.0.3
+SKALIBS_VERSION = 2.12.0.1
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
