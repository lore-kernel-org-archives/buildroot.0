Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5839C433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A91160E1E;
	Tue, 15 Nov 2022 13:01:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A91160E1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLE-CltCt8bG; Tue, 15 Nov 2022 13:01:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BE1B60DDF;
	Tue, 15 Nov 2022 13:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BE1B60DDF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 012F01BF348
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D14F24051D
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D14F24051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NUXYKWVOW0xj for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:01:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C32440481
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C32440481
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EC6EE83C54; Tue, 15 Nov 2022 13:01:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 13:54:58 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 885b5940f7963ca011611205602ed2d4323405f5
X-Git-Newrev: 280119afcb333f459435da3b407254ce49fb2b2a
X-Patchwork-Hint: ignore
Message-Id: <20221115130151.EC6EE83C54@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] packages/sudo: explicitly
 set with-tzdir
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
Content-Type: multipart/mixed; boundary="===============8116776429125287972=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8116776429125287972==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=280119afcb333f459435da3b407254ce49fb2b2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

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
(cherry picked from commit 51d3902af72d74cf5bf7c1246e4bf41cfc5e55f3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============8116776429125287972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8116776429125287972==--
