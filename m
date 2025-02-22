Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0093FC021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 17:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B22BC8129E;
	Sat, 22 Feb 2025 17:08:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvRc4r7fermY; Sat, 22 Feb 2025 17:08:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF765812CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF765812CD;
	Sat, 22 Feb 2025 17:08:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A98E86B
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87249606D3
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgiyKnvHcilP for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 17:08:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BED71605BE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BED71605BE
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 17:08:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA5B58770B; Sat, 22 Feb 2025 17:08:15 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 18:06:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51b848b534b194dc716cf4a75133b64f0fa216d9
X-Git-Newrev: d0711b892d09723cda3a3a017c8a1d62c51b81af
X-Patchwork-Hint: ignore
Message-Id: <20250222170815.AA5B58770B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rnnoise: fix builds with
 BR2_OPTIMIZE_FAST
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d0711b892d09723cda3a3a017c8a1d62c51b81af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://autobuild.buildroot.org/results/3e954cf8e4365d81e58949df50db7e82bf0d0ebf/

Rnnoise refuses to build with -Ofast unless FLOAT_APPROX is defined:

src/arch.h:171:2: error: #error Cannot build libopus with -ffast-math unless
FLOAT_APPROX is defined.  This could result in crashes on extreme (e.g.
NaN) input

So do that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rnnoise/rnnoise.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/rnnoise/rnnoise.mk b/package/rnnoise/rnnoise.mk
index edbe2b5606..f696d4ed9f 100644
--- a/package/rnnoise/rnnoise.mk
+++ b/package/rnnoise/rnnoise.mk
@@ -12,4 +12,9 @@ RNNOISE_INSTALL_STAGING = YES
 
 RNNOISE_CONF_OPTS = --disable-examples
 
+# rnnoise refuses to build with -Ofast unless FLOAT_APPROX is defined
+ifeq ($(BR2_OPTIMIZE_FAST),y)
+RNNOISE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DFLOAT_APPROX"
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
