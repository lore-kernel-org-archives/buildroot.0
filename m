Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5FDC282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B7B70A02;
	Fri, 28 Feb 2025 17:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIzw4vMKJZWQ; Fri, 28 Feb 2025 17:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C002670E19
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C002670E19;
	Fri, 28 Feb 2025 17:22:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B2691DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4991C47489
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S7J3fQtj-XHM for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:32:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7991F47963
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7991F47963
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7552883577; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 18:35:28 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 99d4180edae555c47d70ea40ca63316445c56ac2
X-Git-Newrev: 180fc4ec96e280a6f1caaf043b11430a13c1bf0b
X-Patchwork-Hint: ignore
Message-Id: <20250228163046.7552883577@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pkg-utils.mk: add
 patches to show-info json
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=180fc4ec96e280a6f1caaf043b11430a13c1bf0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds support for listing the patches path or url applied to a
package when calling `show-info`.

To avoid making `show-info` dependant on having to download and patch the
packages there is a known limitation with the patch listing of `show-info`:

  * If a package applies patches in the pre/post hook, they won't be listed
    (for instance: `android-tool`, `libmad`, `gcc-initial`, `gcc-final`,
    `linux-header`, ...).
  * Patches defined in the `<pkg-name>_PATCH` variable will be listed as
    an URL instead of listing the content with a path. For individual
    patches this is probably OK, but it's not so ideal if it's a tarball
    containing patches

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Co-authored-by: Matthias Swiggers <matthias.swiggers@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-utils.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index ca736da597..0266f66b42 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -168,6 +168,12 @@ pkg-patches-dirs = \
 			$(or $(wildcard $(dir)/$($(1)_VERSION)),$(dir)),\
 			$(dir))))
 
+pkg-patches-url = $(foreach patch,$($(1)_PATCH),\
+	$(if $(findstring ://,$(patch)),$(patch),\
+		$($(1)_SITE_METHOD)+$($(1)_SITE)/$(patch)))
+
+pkg-patches-list = $(foreach patchdir,$(call pkg-patches-dirs,$(1)),$(wildcard $(addsuffix /*.patch,$(patchdir)))) $(call pkg-patches-url,$(1))
+
 define _json-info-pkg-details
 	"version": $(call mk-json-str,$($(1)_DL_VERSION)),
 	"licenses": $(call mk-json-str,$($(1)_LICENSE)),
@@ -190,6 +196,13 @@ define _json-info-pkg-details
 		},
 	)
 	],
+	"patches": [
+		$(foreach patch, \
+			$(call pkg-patches-list,$(1)), \
+			$(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$(patch)))$(comma) \
+
+		)
+	],
 endef
 
 define _json-info-fs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
