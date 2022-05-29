Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C19C433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 20:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96A2641842;
	Sun, 29 May 2022 20:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1M1It0jo2903; Sun, 29 May 2022 20:54:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B49FD41843;
	Sun, 29 May 2022 20:54:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12D0A1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0956F40128
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:54:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40F5xySmXkv1 for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 20:54:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A125400FF
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:54:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id EAAB3866FF; Sun, 29 May 2022 20:43:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 22:54:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3613c3cb331930bbb82cbfb27050f8e03ea288a5
X-Git-Newrev: 7ebff53bf82ade8c2df25bfdf15f2501256f9d12
X-Patchwork-Hint: ignore
Message-Id: <20220529204315.EAAB3866FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: fix build without
 plugins
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ebff53bf82ade8c2df25bfdf15f2501256f9d12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 3.17.0 in
commit ffd45b8726d42bb299199d9f1e10ee3d3469c85a and
https://github.com/OP-TEE/optee_client/commit/876b1ae719e12890ddd96e85cd4e9862dab46448:

/home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.17.0/tee-supplicant/src/tee_supplicant.c:104:22: error: 'TEE_PLUGIN_LOAD_PATH' undeclared here (not in a function); did you mean 'TEEC_LOAD_PATH'?
  104 |  .plugin_load_path = TEE_PLUGIN_LOAD_PATH,
      |                      ^~~~~~~~~~~~~~~~~~~~
      |                      TEEC_LOAD_PATH

Fixes:
 - http://autobuild.buildroot.org/results/384e0ca894dbc0ec72cea76141de890f1ce484db

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ant-src-tee_supplicant.c-fix-build-withou.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch b/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch
new file mode 100644
index 0000000000..e41c9138ee
--- /dev/null
+++ b/package/optee-client/0001-tee-supplicant-src-tee_supplicant.c-fix-build-withou.patch
@@ -0,0 +1,39 @@
+From f2a7c942393c6383ac89d9264999cd9c93a70b80 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 14 May 2022 19:33:57 +0200
+Subject: [PATCH] tee-supplicant/src/tee_supplicant.c: fix build without
+ plugins
+
+Fix the following build failure with CFG_TEE_SUPP_PLUGINS != y raised
+since version 3.17.0 and commit [1].
+
+/home/giuliobenetti/autobuild/run/instance-2/output-1/build/optee-client-3.17.0/tee-supplicant/src/tee_supplicant.c:104:22: error: 'TEE_PLUGIN_LOAD_PATH' undeclared here (not in a function); did you mean 'TEEC_LOAD_PATH'?
+  104 |  .plugin_load_path = TEE_PLUGIN_LOAD_PATH,
+      |                      ^~~~~~~~~~~~~~~~~~~~
+      |                      TEEC_LOAD_PATH
+
+Link: [1] https://github.com/OP-TEE/optee_client/commit/876b1ae719e12890ddd96e85cd4e9862dab46448
+Fixes: http://autobuild.buildroot.org/results/384e0ca894dbc0ec72cea76141de890f1ce484db
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+Reviewed-by: Etienne Carriere <etienne.carriere@linaro.org>
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/OP-TEE/optee_client/commit/f2a7c942393c6383ac89d9264999cd9c93a70b80]
+---
+ tee-supplicant/src/tee_supplicant.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tee-supplicant/src/tee_supplicant.c b/tee-supplicant/src/tee_supplicant.c
+index 7b186ed9..53c29a26 100644
+--- a/tee-supplicant/src/tee_supplicant.c
++++ b/tee-supplicant/src/tee_supplicant.c
+@@ -101,7 +101,9 @@ static struct tee_shm *shm_head;
+ 
+ struct tee_supplicant_params supplicant_params = {
+ 	.ta_dir = "optee_armtz",
++#ifdef TEE_PLUGIN_LOAD_PATH
+ 	.plugin_load_path = TEE_PLUGIN_LOAD_PATH,
++#endif
+ 	.fs_parent_path  = TEE_FS_PARENT_PATH,
+ };
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
