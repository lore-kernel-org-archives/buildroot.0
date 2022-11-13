Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A94C4332F
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 14:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A14F81766;
	Sun, 13 Nov 2022 14:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A14F81766
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gAEg8K07FqDR; Sun, 13 Nov 2022 14:02:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B073381765;
	Sun, 13 Nov 2022 14:02:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B073381765
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8AF91BF2CE
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00BB681764
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 14:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00BB681764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w79Qsmskt_Z9 for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 14:02:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34E2981763
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 14:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34E2981763
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 205BA835CE; Sun, 13 Nov 2022 14:02:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 14:57:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4e63809d8d7ed873f320c61fc0eb7e0f64250acf
X-Git-Newrev: 51d3902af72d74cf5bf7c1246e4bf41cfc5e55f3
X-Patchwork-Hint: ignore
Message-Id: <20221113140238.205BA835CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] packages/sudo: explicitly set with-tzdir
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
Content-Type: multipart/mixed; boundary="===============7771424151513411855=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7771424151513411855==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=51d3902af72d74cf5bf7c1246e4bf41cfc5e55f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

--===============7771424151513411855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7771424151513411855==--
