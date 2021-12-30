Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17EDC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9647760C1C;
	Thu, 30 Dec 2021 20:42:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ET0klxlDkQBs; Thu, 30 Dec 2021 20:42:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB68360BCB;
	Thu, 30 Dec 2021 20:42:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 660E91BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62BA060BCB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNyat08Zctrk for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6105B606ED
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:41:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C886B82DF5; Thu, 30 Dec 2021 20:35:53 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:31:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f796ac3fedc0a5b47e368d4ba79afdcd69609703
X-Git-Newrev: 5b00c382fc1b7771193fb8c348f0702e896cb13f
X-Patchwork-Hint: ignore
Message-Id: <20211230203553.C886B82DF5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/utils: make-comma-list does just
 that, not quoting
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b00c382fc1b7771193fb8c348f0702e896cb13f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we have two functions that build a comma-separated list
of items; one is double-quoting the items, while the other is
single-quoting them. Their naming is not very consistent.

Besides, in a followup change, we will need to build a comma-separated
list of items that are already double-quoted.

Introduce a macro that does just build a comma-separated list, and
use that in the two other macros; rename the existing macro so the
naming is consistent.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk  | 10 +++++-----
 support/misc/utils.mk | 12 ++++++++----
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 973eabe437..94e806963b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -120,17 +120,17 @@ define _json-info-pkg
 		"install_images": $(call yesno-to-bool,$($(1)_INSTALL_IMAGES))$(comma) \
 	)
 	"dependencies": [
-		$(call make-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
+		$(call make-dq-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
 	],
 	"reverse_dependencies": [
-		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES)))
+		$(call make-dq-comma-list,$(sort $($(1)_RDEPENDENCIES)))
 	]
 	$(if $($(1)_CPE_ID_VALID), \
 		$(comma) "cpe-id": "$($(1)_CPE_ID)" \
 	)
 	$(if $($(1)_IGNORE_CVES),
 		$(comma) "ignore_cves": [
-			$(call make-comma-list,$(sort $($(1)_IGNORE_CVES)))
+			$(call make-dq-comma-list,$(sort $($(1)_IGNORE_CVES)))
 		]
 	)
 endef
@@ -144,7 +144,7 @@ define _json-info-pkg-details
 		{
 			"source": "$(notdir $(dl))",
 			"uris": [
-				$(call make-comma-list,
+				$(call make-dq-comma-list,
 					$(subst \|,|,
 						$(call DOWNLOAD_URIS,$(dl),$(1))
 					)
@@ -161,7 +161,7 @@ define _json-info-fs
 				null \
 			),
 	"dependencies": [
-		$(call make-comma-list,$(sort $($(1)_DEPENDENCIES)))
+		$(call make-dq-comma-list,$(sort $($(1)_DEPENDENCIES)))
 	]
 endef
 
diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index dc60cad979..fdc22a2eef 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -84,13 +84,17 @@ finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
 # notfirstword(wordlist): returns all but the first word in wordlist
 notfirstword = $(wordlist 2,$(words $(1)),$(1))
 
-# build a comma-separated list of quoted items, from a space-separated
+# build a comma-separated list of items, from a space-separated
+# list of items:   a b c d  -->  a, b, c, d
+make-comma-list = $(subst $(space),$(comma)$(space),$(strip $(1)))
+
+# build a comma-separated list of double-quoted items, from a space-separated
 # list of unquoted items:   a b c d  -->  "a", "b", "c", "d"
-make-comma-list = $(subst $(space),$(comma)$(space),$(patsubst %,"%",$(strip $(1))))
+make-dq-comma-list = $(call make-comma-list,$(patsubst %,"%",$(strip $(1))))
 
-# build a comma-separated list of single quoted items, from a space-separated
+# build a comma-separated list of single-quoted items, from a space-separated
 # list of unquoted items:   a b c d  -->  'a', 'b', 'c', 'd'
-make-sq-comma-list = $(subst $(space),$(comma)$(space),$(patsubst %,'%',$(strip $(1))))
+make-sq-comma-list = $(call make-comma-list,$(patsubst %,'%',$(strip $(1))))
 
 # Needed for the foreach loops to loop over the list of hooks, so that
 # each hook call is properly separated by a newline.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
