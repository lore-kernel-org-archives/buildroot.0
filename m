Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D96DC77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAD0C40AB1;
	Sun, 23 Apr 2023 10:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAD0C40AB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oms_24ZAemkI; Sun, 23 Apr 2023 10:01:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB6FC404BB;
	Sun, 23 Apr 2023 10:01:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB6FC404BB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C23D1BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E984060BA6
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E984060BA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gf_l6RU40Ljw for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:01:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2237360AD0
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:01:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2237360AD0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D678843B2; Sun, 23 Apr 2023 10:01:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 11:57:59 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: cec14f3328bd7ea2d5c6762eb186d5161255084f
X-Git-Newrev: 8e4bf44aad24a56f68cafec59446f7c0565c5524
X-Patchwork-Hint: ignore
Message-Id: <20230423100119.0D678843B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/poppler: fix
 introspection build
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

commit: https://git.buildroot.net/buildroot/commit/?id=8e4bf44aad24a56f68cafec59446f7c0565c5524
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure raised since commit
9d1d4818c39d97ad7a1cdf6e075b9acae6dfff71:

[ 98%] Generating Poppler-0.18.typelib
Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
error parsing file /home/giuliobenetti/autobuild/run/instance-1/output-1/build/poppler-21.12.0/glib/Poppler-0.18.gir: Failed to parse included gir GObject-2.0
If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"

Fixes:
 - http://autobuild.buildroot.org/results/d2f50aa56410c2fff8a0538c57038104906e747e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - drop patch adding INTROSPECTION_COMPILER_ARGS as it's now upstream
    as of 22.02.0, and we use 22.10.0
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4466c206212226da3d68374299989cada8d4542d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/poppler/poppler.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
index 02ccf742ac..5524bfc420 100644
--- a/package/poppler/poppler.mk
+++ b/package/poppler/poppler.mk
@@ -47,7 +47,8 @@ POPPLER_DEPENDENCIES += gobject-introspection
 POPPLER_CONF_OPTS += \
 	-DENABLE_GOBJECT_INTROSPECTION=ON \
 	-DINTROSPECTION_SCANNER=$(STAGING_DIR)/usr/bin/g-ir-scanner \
-	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler
+	-DINTROSPECTION_COMPILER=$(STAGING_DIR)/usr/bin/g-ir-compiler \
+	-DINTROSPECTION_COMPILER_ARGS="--includedir=$(STAGING_DIR)/usr/share/gir-1.0"
 else
 POPPLER_CONF_OPTS += -DENABLE_GOBJECT_INTROSPECTION=OFF
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
