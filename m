Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7796D29DE7
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74B5B83EE2;
	Tue, 13 Jan 2026 19:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 884wfAWG6Uhk; Tue, 13 Jan 2026 19:41:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D0CE83ED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333282;
	bh=EwuzacAHs7ygHBqtHGjbHlzi8Jr2mUM6CCNncCSVp5U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QwXkzTF579X6Szrg1zReRWGybIa9fkJlMfaeXb8942QTxESFlsoHifOJRIA9XvHmP
	 lEcItJfmSDl7vsS3PJg2ObhkDKoX8WExzxVqiE43BPs5ITiK+lB9RrWkkroEOZe355
	 U9H/dP50iOj4eJFx8qZ5W5NAQZUxNnR/jg0isJutfMV5/3zbalePuTYoYiccuFSocD
	 R1C3ejRvVgpYlQTCDRB5jFlMmYw0O8vfNYpiDMQv5DAjk/0BNeZoOffywXqddx4UB+
	 TPfB8zlY0P4kB8dTbgZ8WJPP6kTCigx4BGXph+urAJgyQA6hcA+T00unHKVvOKuIJi
	 zPdA/gRDZRJ1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D0CE83ED3;
	Tue, 13 Jan 2026 19:41:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F670231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1D19883218
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MCsi3uoE-OWn for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4133B82F9B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4133B82F9B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F98081385; Tue, 13 Jan 2026 19:40:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:59:53 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 01e73806f161e9f1e1d0f658b8ed17b34f75b426
X-Git-Newrev: 76ba19668bf02dfb3d9d3e94a8a6da948e1e7906
X-Patchwork-Hint: ignore
Message-Id: <20260113194034.3F98081385@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/evilwm: fix
 compilation with external toolchains
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=76ba19668bf02dfb3d9d3e94a8a6da948e1e7906
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Switch to generic-package, as the configure script isn't really a
autotool generated script. This fixes building evilwm with an
external toolchain.

Fixes:
 - https://autobuild.buildroot.org/results/250/25040ce7e94acf8f92c24db895d7dea081de1d7a

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d7f6ed49f892b15b22ac3a99b2c926c1716e0304)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/evilwm/evilwm.mk | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/package/evilwm/evilwm.mk b/package/evilwm/evilwm.mk
index 78b531095b..12934427b9 100644
--- a/package/evilwm/evilwm.mk
+++ b/package/evilwm/evilwm.mk
@@ -18,4 +18,26 @@ endef
 
 EVILWM_POST_INSTALL_TARGET_HOOKS += EVILWM_INSTALL_XSESSION_FILE
 
-$(eval $(autotools-package))
+EVILWM_TOOLS_PREFIX += $(patsubst %-,%,$(TARGET_CROSS))
+
+# the configure script is not generated by autoconf
+define EVILWM_CONFIGURE_CMDS
+	(cd $(@D); $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
+		./configure \
+		--prefix=/usr \
+		--mandir=/usr/share/man \
+		--host=$(EVILWM_TOOLS_PREFIX) \
+	)
+endef
+
+define EVILWM_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define EVILWM_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
