Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB332C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 20:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E02141CA3;
	Mon, 20 Feb 2023 20:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E02141CA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGH9UsLkMgc4; Mon, 20 Feb 2023 20:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A05E41D14;
	Mon, 20 Feb 2023 20:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A05E41D14
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BDC5A1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10B7A419C5
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B7A419C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qa0aCHBPoPkC for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F09A41990
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F09A41990
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B5A086496; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 14:57:41 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4e63809d8d7ed873f320c61fc0eb7e0f64250acf
X-Git-Newrev: 51d3902af72d74cf5bf7c1246e4bf41cfc5e55f3
X-Patchwork-Hint: ignore
Message-Id: <20230220205150.1B5A086496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] packages/sudo: explicitly set
 with-tzdir
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4104776639912801619=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4104776639912801619==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=51d3902af72d74cf5bf7c1246e4bf41cfc5e55f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

sudo's configure script looks up on the host to determine the path to
the timezone data location. That fails in cross-compilation.

This is used to sanitise the TZ envirnment variable at runtime, and is
not used at buildtime (except to be stored as a string in the program).

We can tell sudo where the tz data will be, which we do when the tzdata
package is enabled, and we can tell it not to use it at all (to not pass
TZ down to sudo-ed executions) othwerwise.

Signed-off-by: Nuno Gonçalves <nunog@fr24.com>
[yann.morin.1998@free.fr: rewrite and extend commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sudo/sudo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index 1826f72017..28cfcbb1e2 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -16,6 +16,7 @@ SUDO_SELINUX_MODULES = sudo
 # This is to avoid sudo's make install from chown()ing files which fails
 SUDO_INSTALL_TARGET_OPTS = INSTALL_OWNER="" DESTDIR="$(TARGET_DIR)" install
 SUDO_CONF_OPTS = \
+	--with-tzdir=$(if $(BR2_PACKAGE_TZDATA),/usr/share/zoneinfo,no) \
 	--without-lecture \
 	--without-sendmail \
 	--without-umask \

--===============4104776639912801619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4104776639912801619==--
