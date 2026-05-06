Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016E7CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 16:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E4B240EFD;
	Wed,  6 May 2026 16:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UuD_z-Jh0I1F; Wed,  6 May 2026 16:31:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 250B040EF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778085106;
	bh=zmUEvzaOangNuhNfvqipEMpxYtit92DBrkMnJ3JEEg8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BhSTJToJZvUHQISJv0+HtUQjEwCSPBCn2gVVJyMN77WKdi8zSYqzX3kCFq6hkIcoR
	 X57CW3Rpi6sIFSV7cuowtpfCxRdsw6b8kYpU0KJTYLjpbu3uHU5vOywQAzldsDlBZG
	 Os6VUB6+I9xc2ukXnnJFL86H9/sdeul4+JuGBasUPlTCzudWP2tnT3quedjLD3ZFZj
	 p79s7AGhyLuOwgKldps0thWpyMmloLlsOneCrqD2ebmZwVBuMT/FZr/BmZFwOfEZIK
	 24o+aTr2bItuWiCM5iv4eRoSqwao77FlY677rMixdJxZAmC8maSLaTtyE1LfZnOCXG
	 tr269mn1TuVbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 250B040EF2;
	Wed,  6 May 2026 16:31:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DD25317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03EAA40EF2
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mE8rptzFYlrn for <buildroot@buildroot.org>;
 Wed,  6 May 2026 16:31:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D44240E83
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D44240E83
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D44240E83
 for <buildroot@buildroot.org>; Wed,  6 May 2026 16:31:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc94.dip0.t-ipconnect.de [79.214.204.148])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 607E5A4C00CF;
 Wed,  6 May 2026 18:31:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51906)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKf9u-000000002XI-0ieX;
 Wed, 06 May 2026 16:31:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 18:31:14 +0200
Message-ID: <20260506163136.1330722-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506163136.1330722-1-bernd@kuhls.net>
References: <20260506163136.1330722-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778085099;
 bh=Z3EOEN1AUuHk2UgqJfvfZaH+LoS7aAQcHMQjGgbaMXY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fAojyFjeK0nnTKqcx3zrJwJpB5c0KTff0WEph7/+oIKiJlzPpV5O27xoOz3+b8TYi
 4UfFsiwb0nT7fHM4q45MfY9+Sn6ruacVAJAzY5AgPK8nIhgXIiBBglwgPjbuj7IbaO
 YLEqOh20LoXIIYM2TxobPCPB3mZkYjPZcxPppkVAuu/7XhiL53FqOjeotObIZhAkZ7
 dRwcQrWsVLt3g5Uv+VyKQPayjtq8xNGSdDicdEN5S6tMtYa05B8DkYIctMv2WhkAHh
 tiljCblX2P+k2rp+RdPkwHFIr9PYVehR78G15a9SgATCkUhhHZYNM59Mj6m3wWneGt
 drxAH6R3tcqyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=fAojyFje
Subject: [Buildroot] [PATCH v5 01/22] package/autoconf: bump version to 2.73
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.gnu.org/archive/html/autoconf/2026-03/msg00060.html

Rebased patch due to upstream commit
https://cgit.git.savannah.gnu.org/cgit/autoconf.git/commit/build-aux/git-version-gen?id=2f1f41b8d3cf38101c6dce30e6319402f8c44b83

Added Upstream: tag to patch.

Added sha256 hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                                  |  1 -
 .../autoconf/0001-dont-add-dirty-to-version.patch    | 12 ++++++++----
 package/autoconf/autoconf.hash                       |  5 +++--
 package/autoconf/autoconf.mk                         |  2 +-
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index b2d5320045..6147aae299 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -192,7 +192,6 @@ package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch lib_p
 package/at/S99at lib_sysv.Indent lib_sysv.Variables
 package/attr/0001-build-with-older-GCCs.patch lib_patch.Upstream
 package/aumix/0001-fix-incorrect-makefile-am.patch lib_patch.Upstream
-package/autoconf/0001-dont-add-dirty-to-version.patch lib_patch.Upstream
 package/automake/0001-noman.patch lib_patch.Upstream
 package/avahi/S05avahi-setup.sh lib_sysv.Indent lib_sysv.Variables
 package/avahi/S50avahi-daemon lib_sysv.Indent lib_sysv.Variables
diff --git a/package/autoconf/0001-dont-add-dirty-to-version.patch b/package/autoconf/0001-dont-add-dirty-to-version.patch
index a1a50d2838..4ce3616d9d 100644
--- a/package/autoconf/0001-dont-add-dirty-to-version.patch
+++ b/package/autoconf/0001-dont-add-dirty-to-version.patch
@@ -10,19 +10,23 @@ commonly done in buildroot).
 The affect is that autoconf gets built as being version 2.65-dirty, which
 breaks programs (like Python) which explicitly checks for autoconf-2.65.
 
+Upstream: Not applicable (Buildroot specific)
+
 [Gustavo: update for autoconf 2.69]
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Bernd: rebased for version 2.73]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 
 diff -Nura autoconf-2.69.orig/build-aux/git-version-gen autoconf-2.69/build-aux/git-version-gen
 --- autoconf-2.69.orig/build-aux/git-version-gen	2013-06-27 11:31:02.340200154 -0300
 +++ autoconf-2.69/build-aux/git-version-gen	2013-06-27 11:31:13.734577033 -0300
-@@ -210,7 +210,7 @@
+@@ -234,7 +234,7 @@
        *) # Append the suffix only if there isn't one already.
            case $v in
-             *-dirty) ;;
--            *) v="$v-dirty" ;;
-+            #*) v="$v-dirty" ;;
+             *-dirty | *-modified) ;;
+-            *) v="$v-modified" ;;
++            #*) v="$v-modified" ;;
            esac ;;
    esac
  fi
diff --git a/package/autoconf/autoconf.hash b/package/autoconf/autoconf.hash
index f94b2d9de5..96f36ec3bd 100644
--- a/package/autoconf/autoconf.hash
+++ b/package/autoconf/autoconf.hash
@@ -1,4 +1,5 @@
-# Locally calculated after checking pgp signature
-sha256  ba885c1319578d6c94d46e9b0dceb4014caafe2490e437a0dbca3f270a223f5a  autoconf-2.72.tar.xz
+# From https://lists.gnu.org/archive/html/autoconf/2026-03/msg00060.html
+sha256  9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e  autoconf-2.73.tar.xz
+# Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYINGv3
 sha256  1f1cde9fb68b9b3cff18c420894bec5bd4defacd700b7d13df54a887301e5350  COPYING.EXCEPTION
diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 48bfc80e7f..6f29bba146 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOCONF_VERSION = 2.72
+AUTOCONF_VERSION = 2.73
 AUTOCONF_SOURCE = autoconf-$(AUTOCONF_VERSION).tar.xz
 AUTOCONF_SITE = $(BR2_GNU_MIRROR)/autoconf
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
