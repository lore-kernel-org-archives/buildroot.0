Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C859DC43219
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 13:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7748460E2A;
	Tue, 15 Nov 2022 13:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7748460E2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ocH7-4KjHmUH; Tue, 15 Nov 2022 13:03:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAB3360D88;
	Tue, 15 Nov 2022 13:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAB3360D88
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE4B51BF348
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5548415DF
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 13:03:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5548415DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EmFSeUDnftFB for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 13:03:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C825415A3
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 13:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C825415A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A82A83C69; Tue, 15 Nov 2022 13:03:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 15 Nov 2022 13:55:29 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c87b45c01ea5eab3cc9573139b6b83fdb9e93761
X-Git-Newrev: 2a6da8d48660027c48a007394b10369e277b3741
X-Patchwork-Hint: ignore
Message-Id: <20221115130300.8A82A83C69@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] packages/sudo: explicitly
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
Content-Type: multipart/mixed; boundary="===============3790429379758746473=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3790429379758746473==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2a6da8d48660027c48a007394b10369e277b3741
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index 54901943cd..67af546cfc 100644
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

--===============3790429379758746473==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3790429379758746473==--
