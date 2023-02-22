Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4AC7C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 22:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9901661414;
	Wed, 22 Feb 2023 22:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9901661414
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nahPwZe_5XAl; Wed, 22 Feb 2023 22:24:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3BE861770;
	Wed, 22 Feb 2023 22:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3BE861770
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE39D1BF3D2
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5CF061381
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 22:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5CF061381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T2bqhWvwPp_V for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 22:23:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 921E161072
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 921E161072
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 829AC86904; Wed, 22 Feb 2023 22:23:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 23:23:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f665acb88c7a9a50e6b93a0daefb53ca3bcc2f79
X-Git-Newrev: f5be4abc574d6f2acfde4e523c73f4cee7ac373e
X-Patchwork-Hint: ignore
Message-Id: <20230222222356.829AC86904@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/optee-client: fix uclibc build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f5be4abc574d6f2acfde4e523c73f4cee7ac373e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc build failure raised since bump to version
3.19.0 in commit 917a961d9c77d5f1aaa47206add9b9ff80e74a82:

/tmp/instance-5/output-1/build/optee-client-3.19.0/libteeacl/src/group.c: In function 'teeacl_user_is_member_of':
/tmp/instance-5/output-1/build/optee-client-3.19.0/libteeacl/src/group.c:75:12: error: implicit declaration of function 'reallocarray' [-Werror=implicit-function-declaration]
   75 |   groups = reallocarray(groups, grouplistsize, sizeof(gid_t));
      |            ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/03eba71ab9b87676f2606ecf2a9b5a151fc396bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eeacl-use-realloc-instead-of-reallocarray.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch b/package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch
new file mode 100644
index 0000000000..88f5a4f87e
--- /dev/null
+++ b/package/optee-client/0002-libteeacl-use-realloc-instead-of-reallocarray.patch
@@ -0,0 +1,34 @@
+From dde6306458331371be5df15e3ca953697d2463ef Mon Sep 17 00:00:00 2001
+From: Eero Aaltonen <eero.aaltonen@vaisala.com>
+Date: Thu, 2 Feb 2023 17:22:29 +0200
+Subject: [PATCH] libteeacl: use realloc() instead of reallocarray()
+
+Use realloc() instead of reallocarray(), since uClibc apparently does
+not implement reallocarray().
+
+Fixes: https://github.com/OP-TEE/optee_client/issues/339
+
+Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
+Reviewed-by: Jerome Forissier <jerome.forissier@linaro.org>
+
+[Retrieved from:
+https://github.com/OP-TEE/optee_client/commit/dde6306458331371be5df15e3ca953697d2463ef]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libteeacl/src/group.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libteeacl/src/group.c b/libteeacl/src/group.c
+index 10965dd0..bd165a11 100644
+--- a/libteeacl/src/group.c
++++ b/libteeacl/src/group.c
+@@ -72,7 +72,8 @@ enum rv_groupmember teeacl_user_is_member_of(const char *user, gid_t group)
+ 	if (ret == -1) {
+ 		p_groups = groups;
+ 
+-		groups = reallocarray(groups, grouplistsize, sizeof(gid_t));
++		/* we use realloc, since uClibc does not implement reallocarray */
++		groups = realloc(groups, grouplistsize * sizeof(gid_t));
+ 		if (!groups) {
+ 			free(p_groups);
+ 			return E_MEMORY;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
