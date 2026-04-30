Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666CFCD13DA
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 19:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2556E84FB1;
	Thu, 30 Apr 2026 19:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxWVOBagf7AW; Thu, 30 Apr 2026 19:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F0E984FB3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777576012;
	bh=RvDSBAVOD5n6J6/3lP7n3gLxu812+GpJScyiXyAOsL0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EYHXhbYjnzDWhUdQuAMGKFilQlxmf3F0eO94+BvBOBGIgjZmOK72tSajZ3TTRfhoj
	 1v7GukKQSzwoKhmEo1R5Fsyi3L5Sk7AKwR0CP3AkzOTGgvI+XKH1NOccX75krZn8cK
	 nr/WRZaPK0C8S+Wtbtu/piOIXcJwnLOV/XqOsmjhTdd2XJ1ROQXpgJoBfB64YhErww
	 fU/wyewtMuc0Gu9Szdqm9tSoy4fAQI7rmihjwbWrZaa4KD7hvHj99YtpiJ6Fj69t22
	 lbCMTEWB8Ac9r2+6DaBoAgEvjz8YVdqy1pv+I7k52HlHL7mNpkR9ZKvRT1IatMmOTl
	 1f6Lp4Eunn3eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F0E984FB3;
	Thu, 30 Apr 2026 19:06:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C413F192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9AD241C74
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:06:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xy2407lC2kym for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 19:06:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9FA3E41C72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FA3E41C72
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FA3E41C72
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:06:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AD66DA4C2574;
 Thu, 30 Apr 2026 21:06:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60442)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWil-000000000Pg-30BB;
 Thu, 30 Apr 2026 19:06:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 21:06:34 +0200
Message-ID: <20260430190647.3212159-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777576007;
 bh=05rP90qDBoRpuWH3N5T01nlxJ8Tx9EQiDRR/CgDIhd0=;
 h=From:To:Cc:Subject:Date:From;
 b=VbRTAzuIcKfkCwSA0isGbYj38oVa+RDaOkjx2WumKDHYdpudmd+CsvtL3Z0W171Fz
 isRLrqrcqh2PJtlCQ8UzMMkux/nboWcjaiMqzJ3aj7LZfoNdsM5TP0qc2E6wuOmn/5
 PY3x0WaIInWuBL5jzDnO9MhOjKOVertmVb5mR3FAChXtOmJP+n9oP4+EvKjL5oxtk5
 miQVK0W7dWUROKBvTbUhkFfVLehbMHqyQZxsrPDLsi/1z69o2EBP6idvpX4GDeBgHd
 F//KKGDAgtLqHdbRw0hJdALDtPhY36HV7JKScv3NSVRY5axvTrO3aAapJ1A4K3Mhji
 AwWOrCBNkUBlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VbRTAzuI
Subject: [Buildroot] [PATCH v2 01/14] package/autoconf: bump version to 2.73
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
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
index f4a428d4cf..5a33df73cd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -193,7 +193,6 @@ package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch lib_p
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
