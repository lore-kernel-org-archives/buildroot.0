Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E67C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 20:41:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E280480BFC;
	Sat,  8 Jan 2022 20:41:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9MDq1l1wIus; Sat,  8 Jan 2022 20:41:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DCE980BF6;
	Sat,  8 Jan 2022 20:41:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1FDA1BF847
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CEE2A40122
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:41:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J6anS4pW9t7n for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 20:41:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA9A5400C1
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 20:41:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DA7AC83456; Sat,  8 Jan 2022 20:35:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 21:41:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fc0d98699b91bbdc9e6fe7064ecb1d966aaa4a0
X-Git-Newrev: 0651b22d638faecb3688f1fd4e0760c31bfba893
X-Patchwork-Hint: ignore
Message-Id: <20220108203526.DA7AC83456@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcap: drop host-libcap dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=0651b22d638faecb3688f1fd4e0760c31bfba893
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-libcap was added as a dependency of libcap in commit
efae605c88deb15d9c50fd67bdd80f46a78b06c1 because back then at
installation time, the setcap utility was called.

However, since commit 57155c6b6a7a40523075626353375109fe159c04, we use
RAISE_SETFCAP=no, which disables calling setcap at install
time. Therefore, having host-libcap built before libcap is no longer
needed.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcap/libcap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcap/libcap.mk b/package/libcap/libcap.mk
index 42acca9082..1207995333 100644
--- a/package/libcap/libcap.mk
+++ b/package/libcap/libcap.mk
@@ -11,7 +11,7 @@ LIBCAP_LICENSE = GPL-2.0 or BSD-3-Clause
 LIBCAP_LICENSE_FILES = License
 LIBCAP_CPE_ID_VENDOR = libcap_project
 
-LIBCAP_DEPENDENCIES = host-libcap host-gperf
+LIBCAP_DEPENDENCIES = host-gperf
 LIBCAP_INSTALL_STAGING = YES
 
 HOST_LIBCAP_DEPENDENCIES = host-gperf
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
