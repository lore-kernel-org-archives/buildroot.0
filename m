Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE85DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 570E14056D;
	Sat, 15 Jan 2022 10:19:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yV_lGWR1T8nT; Sat, 15 Jan 2022 10:19:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C2D84056A;
	Sat, 15 Jan 2022 10:19:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55B331BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F294056A
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:19:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q0A8L5smsiDL for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:19:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79B3A40569
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id A11208294C; Sat, 15 Jan 2022 10:12:48 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:19:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 589065acf96e89ad503e4943fd55517d769563c1
X-Git-Newrev: 8f6b346a34bdb344c4a001d8bd66f5e973013c17
X-Patchwork-Hint: ignore
Message-Id: <20220115101248.A11208294C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ipmitool: add freeipmi optional
 dependency
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8f6b346a34bdb344c4a001d8bd66f5e973013c17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

freeipmi is an optional dependency which is enabled by default

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ipmitool/ipmitool.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index facd97a0b8..801f1ea6b0 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -19,6 +19,13 @@ IPMITOOL_CPE_ID_VENDOR = ipmitool_project
 # 0013-fru-sdr-Fix-id_string-buffer-overflows.patch
 IPMITOOL_IGNORE_CVES += CVE-2020-5208
 
+ifeq ($(BR2_PACKAGE_FREEIPMI),y)
+IPMITOOL_DEPENDENCIES += freeipmi
+IPMITOOL_CONF_OPTS += --enable-intf-free
+else
+IPMITOOL_CONF_OPTS += --disable-intf-free
+endif
+
 ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
 IPMITOOL_DEPENDENCIES += openssl
 IPMITOOL_CONF_OPTS += --enable-intf-lanplus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
