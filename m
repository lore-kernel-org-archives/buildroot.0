Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBBDEA3C5D
	for <buildroot@archiver.kernel.org>; Thu,  9 Apr 2026 13:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D53644101F;
	Thu,  9 Apr 2026 13:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmywlIYi4ig0; Thu,  9 Apr 2026 13:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E43D54107B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775740751;
	bh=UtGgbQU+ophnVx6qxJouKsEhBPZu9D1RuXFdawsbCU0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sjl7hU2lzZ/x2JD4UzaNn2Xsp7+C4tS05ONWEgqVzamjsmu7WSMbLdWIz50q1oDWf
	 KkSzFFr2/Mc745tc+6KOHqkynTeHsVaz0C9gHYWkfWhG9+46s/WFRyAbrNYuTiFatu
	 TOwKzY4OlBhseng3wx+U4JxVEFarj5E+5sI701wVFnbxRei0sX4ZyYwCwFFJcn87Ch
	 1YlJM9WJ40qwBdiTiy9y39u/SfodZ7eubUzPbsGkEcXSbkFhU/Zg8swrzAQ9zoyFJb
	 pe/gKPej8vPEk7s959u+FMW7E0/l6JXODqgSU+DWou9le2StwI65ob8Ozy99A3oPCX
	 J751Mz+8NysLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E43D54107B;
	Thu,  9 Apr 2026 13:19:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E2DDE237
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFF8782796
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H08E5XxRs54r for <buildroot@buildroot.org>;
 Thu,  9 Apr 2026 13:19:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C5AD782784
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5AD782784
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5AD782784
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 13:19:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ca66.dip0.t-ipconnect.de [79.214.202.102])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id DED76A4C01B9
 for <buildroot@buildroot.org>; Thu,  9 Apr 2026 15:19:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58204)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wApHm-000000002eL-3IDB
 for buildroot@buildroot.org; Thu, 09 Apr 2026 13:19:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  9 Apr 2026 15:19:05 +0200
Message-ID: <20260409131906.279061-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1775740746;
 bh=pOsF7OfS7xmdGArNJjibjw5o4g2otfM+B0XDk7MsATk=;
 h=From:To:Subject:Date:From;
 b=A0sHvjeDrpTXt5fzn8wJ9W1PgR03KV9p38cSKfDRU9CJu+XbuizPyMVhw14wNFXbD
 5e0Tl6/KHJ8CSy8/K5fMuIaBcS0HxzfUm3BBSZHl6oAypzyLE9vd2T7qyJrRwEf1U7
 oX9g2dMhZxNm16r8rgr699z+FxPHmh84NyC0BA9tMCzxsWJtM6okBmpBKJEhGAiC0j
 8wC9Bgt8GC7C3ins6zPiiVQJ/W1+arnYbC7fU0NVIgpizeO+eAyx/QO6VIyeGfFGru
 2NNQ3k1Pd2KVWsbrN/Cfln/j3e2p+Clbzl3+UG0YlqiVMwb3d6J7vTfyS5zgF8ibav
 B8kNkVojpaRlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=A0sHvjeD
Subject: [Buildroot] [PATCH 1/2] package/autoconf: bump version to 2.73
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
index e0fef8f92d..946aedd39a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -194,7 +194,6 @@ package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch lib_p
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
