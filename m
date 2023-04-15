Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FD7C77B73
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 21:30:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C59C6845AE;
	Sat, 15 Apr 2023 21:30:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C59C6845AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6MokBHePxcm; Sat, 15 Apr 2023 21:30:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11C8A842FF;
	Sat, 15 Apr 2023 21:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11C8A842FF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A70C01BF3C3
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 21:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 804B46111C
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 21:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 804B46111C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJyaOHmmSmUT for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 21:30:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8169E61105
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 21:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8169E61105
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DDA684216; Sat, 15 Apr 2023 21:30:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Apr 2023 22:13:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b713a230c54559637baea065b731748201e19c1a
X-Git-Newrev: 4466c206212226da3d68374299989cada8d4542d
X-Patchwork-Hint: ignore
Message-Id: <20230415213029.6DDA684216@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/poppler: fix introspection build
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

commit: https://git.buildroot.net/buildroot/commit/?id=4466c206212226da3d68374299989cada8d4542d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
