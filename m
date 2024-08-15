Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD98ECE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 892D984867;
	Fri,  6 Sep 2024 20:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1XfCk_1rnoG; Fri,  6 Sep 2024 20:03:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A42E98485D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A42E98485D;
	Fri,  6 Sep 2024 20:03:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 261ED1BF980
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8457060ECA
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o439toS5-Fea for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D18CC60664
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D18CC60664
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CDAC586EE4; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 10:57:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f21db2bd83bf3073a50b8bcd79af6e7aed6fb000
X-Git-Newrev: ef8ed5ccfec1cced0132f03df26b94d656b6ce72
X-Patchwork-Hint: ignore
Message-Id: <20240906195853.CDAC586EE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/execline: add option to build
 multicall binary
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
Content-Type: multipart/mixed; boundary="===============1419837525224010879=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1419837525224010879==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ef8ed5ccfec1cced0132f03df26b94d656b6ce72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 2.9.2.0, with another bugfix in 2.9.4.0, execline can
be built as a multicall binary, similar to busybox. According to
the author[1], this results in space savings of 66-87% on Linux.

[1]: https://skarnet.org/software/execline/execline.html

Signed-off-by: J. Neuschäfer <j.neuschaefer@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/execline/Config.in   | 9 +++++++++
 package/execline/execline.mk | 1 +
 2 files changed, 10 insertions(+)

diff --git a/package/execline/Config.in b/package/execline/Config.in
index 7a2278fa5a..a7cbba1bb0 100644
--- a/package/execline/Config.in
+++ b/package/execline/Config.in
@@ -10,3 +10,12 @@ config BR2_PACKAGE_EXECLINE
 	  essentially useful inside an execlineb script.
 
 	  http://skarnet.org/software/execline/
+
+if BR2_PACKAGE_EXECLINE
+
+config BR2_PACKAGE_EXECLINE_MULTICALL
+	bool "execline multicall binary"
+	help
+	  Build execline as a multicall binary to save disk space.
+
+endif
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index ee38d3ed3c..922fc7b5af 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -19,6 +19,7 @@ EXECLINE_CONF_OPTS = \
 	--with-dynlib=$(STAGING_DIR)/lib \
 	--with-lib=$(STAGING_DIR)/lib/skalibs \
 	$(if $(BR2_STATIC_LIBS),,--disable-allstatic) \
+	$(if $(BR2_PACKAGE_EXECLINE_MULTICALL),--enable-multicall,) \
 	$(SHARED_STATIC_LIBS_OPTS)
 
 define EXECLINE_CONFIGURE_CMDS

--===============1419837525224010879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1419837525224010879==--
