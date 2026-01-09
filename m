Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A34AD2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1114A83BF6;
	Tue, 13 Jan 2026 19:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooLkYW-Hg4sM; Tue, 13 Jan 2026 19:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1FA9783C8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333046;
	bh=Z3AV5U0j86P87SLUn4xB/gDIemh4EwFetBzjzr2TUF8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=idkm29BCKZ7pIzqAtHNGNZFmY+NRx91kqsSqS1+YiuuFSjFyh0npS42N1LqEQ+PVK
	 GHm91Ny8mKNlDtG1IHDfGiYi8YAV129x4AV1wZWUQCdKvbTrG8F2wiFtNxtFR+yZTY
	 PiDxT1N9hTwtq9X/S7P/U2pjyPxZt+ggM0GhIi40w2/LGkKR6wc15xnPBjE5NE6Nyl
	 8mdsicO9ZeI8my9mBW6wILW/MeYpanKADdCgvhKmM02EM/wP916IQO6j57uCUVvQTs
	 8hFBkmtCVkdvh15Jw88JgSzZrfQCjECRGvecya/c5pQBmmRYz+apSDPZYr4aaGbN8I
	 zh3V6PD1QG1kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FA9783C8A;
	Tue, 13 Jan 2026 19:37:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 216DC1C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86B37404D0
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KfJJrLE1OQSy for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 575DE40543
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 575DE40543
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 566D7873D9; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:59:50 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f3490f35fb929e62100a4bc29ecdefb9b242a3b7
X-Git-Newrev: 4288f056cb6b2cab982bfcd8baa96c0cd8208363
X-Patchwork-Hint: ignore
Message-Id: <20260113193619.566D7873D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/evilwm: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=4288f056cb6b2cab982bfcd8baa96c0cd8208363
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
