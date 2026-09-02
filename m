Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A87C624D4
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 19:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2C1A40BD9;
	Wed,  2 Sep 2026 19:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sefxriHdF66s; Wed,  2 Sep 2026 19:26:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D8DF940BD2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788377176;
	b=FjYmPQRwZLxxWPY99JRPX2LZl46k5ZwwaK04ruww0PpqyZHQIrqekK50HKX4sd0Ctz6+
	 KrEBiX+PypItNa2kh/DGRBGRq8nHFlSLjzoMJRmP2kG8Ip29DVQ8ac91mWInMnigmsx8F
	 E8V43f7hixRn8nWln2WDzpLEswc9r4EUa8PKBGhGMtOlE9/rCzvH9CsgD8pndPWxk3ytR
	 lyYqDc/0d0E5OrJpovIvJYXvbhmG0CS8t9sMxG77Uyq194xzeMju970wnyXMXIqm2jHI0
	 1esfkeai4C5YGMEhYlDURQ4XDK1aghH2yqvLgatn3QZwmf4UPKYnijD1DgAcP25V05A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788377176;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=VICIJRe2lU2UqY5xj05E1otjJMxVzhWGZMCWtcrfAuA=;
	b=I1sqKVB4aoWa+1IEo0MLvN2RlYKZSZVlXWqlX21+KsiaWCRstZNHx4SXUHs1iSLsSrBY
	 JBFdcJRhzlVZ59aZzCM2p+DdHt+AqVl7FaRGjM8Lv+7EgyIoKoLnhryYeRbnoSTzqfRiL
	 QyiMTUKe93Ot0QrTkFPupKIwF0SLyz1gLvB0L3vsOWvBscyS5E5f1NMkziSW9T/7A8DeJ
	 dkZMChdpfTfaqWhogyVU6KCQalJ/IiOTgO18Y7b6Npwd7DQxqPKj8LsvwYgresG5T3rrM
	 KeQT50ne7770dFSsOuw6m1dLohkRCyFIPv+LwsCokR/pnh9bGon5gqTVZ503wbRb+vQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788377175;
	bh=VICIJRe2lU2UqY5xj05E1otjJMxVzhWGZMCWtcrfAuA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P29nXj/FrEJe3zVVh8kNu/MUsspTp8S1Bm09NxN5T4W7RZdfFJt52x8RXDeZm/zjP
	 VYinsBfMHMUZYefrB8UzUOqajI2bFD1rFn2LzhV3UTSUjn3o+QRRMCpeF9pbKSYS75
	 R73++koqksVWNC1RMtEGnvcvqoH9zm5hu3Ys1GYKOHIWvNRO3+oIy6Xp+4SLQWfhuF
	 kTHqAcozmUTGQjm79kVQ+YSAzbQipsrTH/li9Gj7MoBIJZteZx4NbAvykTgjmrq8LL
	 y7+leAY6yyctFqgXwkK081k0lwjmAsGdc8BdoZxU7yqgiqNGfct71MW7At8i3m9sm+
	 VWSUubOdgNiYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8DF940BD2;
	Wed,  2 Sep 2026 19:26:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB27A2B2
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C165A40BD2
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kz0YvfV3j3EC for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 19:26:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 13D1040BCE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788377174;
 b=KfBqAlXZ+Jzl7dKl+/4Aqo0glkAoiIB4xykO8/6mkl8FhtSfHpBR5i+Ue8Mu6w65qMwO
 OpWtOs1RPyYwJ5u663C8hTa3JQL0LKoon4UqOa/t9+vs6iXiEEwze5VxbownCAZZuW2/E
 iuOf0q8QUgxG0uuLD21KGkRosXgVjfN66huNDEXenZ1HOCkyZMLEr2xxMZ26ZbaLJgCAq
 7XzKJgjhGPnCsdelvcS46g9NVP6TnUUB9ou9pfC/5iLt9P6UXH3uwaxxV3ynF3qHrADAn
 WdHlQRJhKdBtAcYWuCFgSn0f4wkA29loR0vrjEJ9um1hKeyFAttK5GroJyJvCkbxfPA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788377174;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FUtjZTe+eN5HVLE29AWaURwJ2MYq/Lg2bQnr1iCCcMk=;
 b=ZfFcXFmHEVtfgOlTxRwW6tzjR8ElpH8nnDFl/C7Pw/Bvy0Mv2rLxHwCs78S4rdp+Qfsq
 cJndytL64B6N3en0T+8MvtDKbSATpRVse8mC6g5fy//fwvDfQIWxx2RX4M3X2Ev0QZJYE
 tpJfCrqgv2nZjVvtRydPjuuD0J38e6M8G05Qv771RZ2EUQ4hHfHIsqD6vAYL07eCGoAV7
 dHgNVxcLPllyrvYs9TpvPwax1Yti5W1s0floyQDHOBdYd/rWbjGIy46DABoW+8oSOkGO/
 4ia52xclUOcPEoknjz96eQ4CAw3K0XINa2ufhP4sDyp6XmbMx2GIX44bey0lyH7E0Gw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13D1040BCE
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:26:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 612938F54B; Wed,  2 Sep 2026 19:25:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Sep 2026 21:25:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94013c3a95a849b6a8d8db5321f9bfea4c389b10
X-Git-Newrev: 672b5f9213841bd79f1596e755bbffa7e4f39d2a
X-Patchwork-Hint: ignore
Message-Id: <20260902192514.612938F54B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openscap: drop duplicate patch
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0813706815633404738=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0813706815633404738==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/672b5f9213841bd79f1596e755bbffa7e4f39d2a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit bd5b267b1de0 ("package/openscap: fix build failure with dbus and
musl") brought an upstream patch to fix a build failure on the openscap
package, detected by the autobuilder on buildroot 2026.02.x, which had
openscap 1.3.12 at that time. bd5b267b1de0 has recently been merged on
master; openscap has already been bumped to 1.4.4 on this branch, and so
it already brings the needed fix for musl+dbus build configurations,
hence making the patch step fail. This upstream patch is then not needed
anymore on any maintained branch.

Fixes: https://autobuild.buildroot.org/results/d11d0b82dcdb4bf10f6c37db8bdbc42a78bdf28b/
Fixes: https://autobuild.buildroot.org/results/4397a4ef94ccf482f1ab9d24b6334adb0222a580/
Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...02-OVAL-probes-add-missing-header-include.patch | 48 ----------------------
 1 file changed, 48 deletions(-)

diff --git a/package/openscap/0002-OVAL-probes-add-missing-header-include.patch b/package/openscap/0002-OVAL-probes-add-missing-header-include.patch
deleted file mode 100644
index 0c7598b2b5..0000000000
--- a/package/openscap/0002-OVAL-probes-add-missing-header-include.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From ab69b76cb40d6f35d252246e965245804b17591f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
-Date: Thu, 13 Aug 2026 15:18:15 +0200
-Subject: [PATCH] OVAL/probes: add missing header include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Openscap build can fail with the following log when
--Wimplicit-function-declaration is turned into an error:
-
-In file included from [...]/src/OVAL/probes/unix/linux/systemdunitproperty_probe.c:38:
-[...]/src/OVAL/probes/unix/linux/systemdshared.h: In function ‘get_all_systemd_units’:
-[...]/src/OVAL/probes/unix/linux/systemdshared.h:188:50: error: implicit declaration of function ‘basename’; did you mean ‘rename’? [-Wimplicit-function-declaration]
-  188 |                 char *unit_name_s = oscap_strdup(basename(value.str));
-      |                                                  ^~~~~~~~
-      |                                                  rename
-In file included from [...]/src/OVAL/probes/unix/linux/systemdunitdependency_probe.c:37:
-[...]/src/OVAL/probes/unix/linux/systemdshared.h: In function ‘get_all_systemd_units’:
-[...]/src/OVAL/probes/unix/linux/systemdshared.h:188:50: error: implicit declaration of function ‘basename’; did you mean ‘rename’? [-Wimplicit-function-declaration]
-  188 |                 char *unit_name_s = oscap_strdup(basename(value.str));
-      |                                                  ^~~~~~~~
-      |                                                  rename
-
-Add the missing header include pointed by `man 3 basename` to fix the
-error.
-
-Upstream: https://github.com/OpenSCAP/openscap/commit/ab69b76cb40d6f35d252246e965245804b17591f
-Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
----
- src/OVAL/probes/unix/linux/systemdshared.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/OVAL/probes/unix/linux/systemdshared.h b/src/OVAL/probes/unix/linux/systemdshared.h
-index 879ae5be9d6c..57e94ca6f49e 100644
---- a/src/OVAL/probes/unix/linux/systemdshared.h
-+++ b/src/OVAL/probes/unix/linux/systemdshared.h
-@@ -35,6 +35,7 @@
- #include <config.h>
- #endif
- 
-+#include <libgen.h>
- #include <limits.h>
- #include <stdio.h>
- #include "common/debug_priv.h"
--- 
-2.55.0
-

--===============0813706815633404738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0813706815633404738==--
