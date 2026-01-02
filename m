Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C138EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01901406A8;
	Fri,  2 Jan 2026 17:21:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAJEU8XTuWOS; Fri,  2 Jan 2026 17:21:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33688406AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374493;
	bh=SvgM4yb/rCuCCpFzV5vF6uVnhXzuHq9R/q0Q/4rOIFs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eSc0VJuoUwf6HzJV0iLHYUsK7JhQjvPmtkHAgP7wHr0UIovf+cskV0dsvVkIEIsv5
	 UDQzvoLXF7y2t0jZcrgswxMtbACd8c5n28RXZNGHvouy22YGPfWpOFMJ6z8M/9i94U
	 ZsFCp2CjI6xH7dhRwhqDt2Bvm4XbICuYxCzo+osoRmGI0GpLWDpDrlGlmXRm/rJiRQ
	 Z5KsTOjstbeIx7XOXzy+p0DXocxH4SK8MvEbnGx8BCaDO4li3xJeM4a2SHJlYvAG2M
	 XXD5cEjBQ3GmLA0QHpbFR2jz3hyxUAS+2c05dV1C+hz7I70Mnigbk7HyXBGNID9N1g
	 AYNLb5EkmVTRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33688406AF;
	Fri,  2 Jan 2026 17:21:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25F19351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B75D406A8
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNSQBcaOU-oo for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:21:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DA2C406AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DA2C406AF
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:21:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 19AB788026; Fri,  2 Jan 2026 17:21:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:20:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02053569051b8f5d58b386ff8be733df31ad04e7
X-Git-Newrev: d7f6ed49f892b15b22ac3a99b2c926c1716e0304
X-Patchwork-Hint: ignore
Message-Id: <20260102172131.19AB788026@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/evilwm: fix compilation with
 external toolchains
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d7f6ed49f892b15b22ac3a99b2c926c1716e0304
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to generic-package, as the configure script isn't really a
autotool generated script. This fixes building evilwm with an
external toolchain.

Fixes:
 - https://autobuild.buildroot.org/results/250/25040ce7e94acf8f92c24db895d7dea081de1d7a

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
