Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A01EC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 20:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14E9284CCC;
	Thu, 13 Jan 2022 20:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TKa3t4Hs55Im; Thu, 13 Jan 2022 20:40:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EA0684CC9;
	Thu, 13 Jan 2022 20:40:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A4901BF3ED
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68F9D84CC9
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 20:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-_8f8SN9MCz for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 20:40:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B08C84C97
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 20:40:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4AB5082DEC; Thu, 13 Jan 2022 20:34:05 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 21:40:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e247f605e82fdfca6fbee6365baec982d1468071
X-Git-Newrev: d0c778c18ce180c02b0210169d7f7df0f9b4499a
X-Patchwork-Hint: ignore
Message-Id: <20220113203405.4AB5082DEC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: add checklist of upgrade
 caveats
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
Content-Type: multipart/mixed; boundary="===============2993922401774498158=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2993922401774498158==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d0c778c18ce180c02b0210169d7f7df0f9b4499a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping the version of systemd is a little more complicated than the
usual package, and it's easy to forget some of the things that need to
be done - and this has happened several times in the past.

Add a checklist of things to worry about when updating systemd.

Note that there are many other complicated packages that also need a lot
of attention when upgrading. However, systemd is a really critical
package so it's more important that we get that one right than, say,
valgrind.

Cc: Norbert Lange <nolange79@gmail.com>
Cc: Jérémy ROSEN <jeremy.rosen@smile.fr>
Cc: Adam Duskett <aduskett@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3811dbae42..2d3971f31d 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,6 +4,21 @@
 #
 ################################################################################
 
+# When updating systemd, take care of the following:
+# - Check if the requirements have changed (see README), in particular
+#   arch and headers
+# - If yes, propagate the dependencies to BR2_INIT_SYSTEMD
+# - If the required kernel options have changed, update the Config.in
+#   help text and the list of KCONFIG_ENABLE_OPT.
+# - Check if there are new meson_options. Make sure all options are set
+#   explicitly (usually to default value).
+# - If there are new services:
+#   - create new options for them (if they really are optional);
+#   - create a new _USER if necessary;
+#   - create new directory (with _PERMISSIONS) if necessary.
+# - Diff sysusers.d with the previous version
+# - Diff factory/etc/nsswitch.conf with the previous version
+#   (details are often sprinkled around in README and manpages)
 SYSTEMD_VERSION = 250.1
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \

--===============2993922401774498158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2993922401774498158==--
