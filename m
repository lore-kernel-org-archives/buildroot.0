Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C20C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 21:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092AC404EF;
	Sat, 20 Jul 2024 21:17:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zBqphkXXSNzP; Sat, 20 Jul 2024 21:17:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E41840538
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E41840538;
	Sat, 20 Jul 2024 21:17:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A0DD1BF2C7
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8839960733
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 21:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpn6qv26fbiR for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 21:17:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBFCD605E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BBFCD605E3
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 21:17:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0B0786E77; Sat, 20 Jul 2024 21:17:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 23:15:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6084d904de77ddb99daad7fb9d67dad06fd42526
X-Git-Newrev: 183f5399cef8b09b675ef7386a0e4984294e5f59
X-Patchwork-Hint: ignore
Message-Id: <20240720211754.B0B0786E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zabbix: fix patch fuzz
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=183f5399cef8b09b675ef7386a0e4984294e5f59
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix patch fuzz to avoid the following build failure raised since commit
8f88a644ed7d6c9ea55fd4fbe9d7f37055920016 which reduced the fuzz factor:

Applying 0002-fix-build-with-libressl-3.5.0.patch using patch:
patching file include/zbxcomms.h
Hunk #1 succeeded at 210 (offset -43 lines).
patching file src/libs/zbxcomms/tls.c
Hunk #1 FAILED at 30.
1 out of 1 hunk FAILED -- saving rejects to file src/libs/zbxcomms/tls.c.rej

While at it, also fix Upstream tags

Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
 - http://autobuild.buildroot.org/results/75dfe12312b5479669fcdfea623d93880c675e13

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                              | 2 --
 package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch | 2 +-
 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch          | 8 ++++----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 2e6e8a9cac..975a7f21f4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1486,8 +1486,6 @@ package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch lib_patch.Ups
 package/yajl/0004-Link-libyajl-_s-with-libm-when-isnan-is-not-brought-.patch lib_patch.Upstream
 package/ympd/0001-only-c-language.patch lib_patch.Upstream
 package/ympd/0002-added-forward-declarations.patch lib_patch.Upstream
-package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch lib_patch.Upstream
-package/zabbix/0002-fix-build-with-libressl-3.5.0.patch lib_patch.Upstream
 package/zic/0001-remove-dependency-check-on-version-file.patch lib_patch.Upstream
 package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch lib_patch.Upstream
 package/zip/0002-configure-Don-t-use-host-CPP.patch lib_patch.Upstream
diff --git a/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
index ffb1f54ba2..6c742b0d0a 100644
--- a/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
+++ b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
@@ -16,7 +16,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/0f541e45d1fa27b3302968683bf64949131ec1c9
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/zabbix/zabbix/pull/61]
+Upstream: https://github.com/zabbix/zabbix/pull/61
 ---
  m4/netsnmp.m4 | 7 +++++--
  1 file changed, 5 insertions(+), 2 deletions(-)
diff --git a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
index acb5cfc9a6..ad6960f329 100644
--- a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
+++ b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
@@ -30,7 +30,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/acdfcb17b39d438ccf5e4621707a10f60577d233
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: not sent (no feedback on first patch)]
+Upstream: not sent (no feedback on first patch)
 ---
  include/zbxcomms.h      | 3 ++-
  src/libs/zbxcomms/tls.c | 5 +++--
@@ -54,9 +54,9 @@ diff --git a/src/libs/zbxcomms/tls.c b/src/libs/zbxcomms/tls.c
 index 54ab0a6ef4..bd4075b3e4 100644
 --- a/src/libs/zbxcomms/tls.c
 +++ b/src/libs/zbxcomms/tls.c
-@@ -30,8 +30,9 @@
- #include "zbxstr.h"
- #include "zbxtime.h"
+@@ -28,8 +28,9 @@
+ #include "log.h"
+ #include "zbxcrypto.h"
  
 -#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || defined(LIBRESSL_VERSION_NUMBER)
 -/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL */
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
