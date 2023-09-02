Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F6FC83F2C
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C3414055D;
	Sat,  2 Sep 2023 15:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C3414055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p3RTyW3_KKPH; Sat,  2 Sep 2023 15:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2D244053F;
	Sat,  2 Sep 2023 15:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2D244053F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 876E31BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DEE14053F
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DEE14053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hsFPNm1QVaoX for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8791840490
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8791840490
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 776FD868CB; Sat,  2 Sep 2023 15:52:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 17:50:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 99674f64ba8f87b7489b5380d0e6bafa25930341
X-Git-Newrev: 855f78edd40cc95f61f53cb8b01bf54c786fc74a
X-Patchwork-Hint: ignore
Message-Id: <20230902155212.776FD868CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pam: fix uclibc compile error
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
Content-Type: multipart/mixed; boundary="===============6388177041096817503=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6388177041096817503==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=855f78edd40cc95f61f53cb8b01bf54c786fc74a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following build failure occurs:
opasswd.c: In function 'compare_password':
opasswd.c:142:3: error: 'retval' undeclared (first use in this function); did you mean 'outval'?
  142 |   retval = outval != NULL && strcmp(outval, oldpass) == 0;
      |   ^~~~~~
      |   outval

Add a patch from upstream to fix it.
Happens since the update to 1.5.3 in Buildroot commit:
f8147e27cdac8f998ec6644a09ce4e8d62b6433c

Fixes:
 - http://autobuild.buildroot.net/results/576/576fc4b9ccbc6cff82569692bdec82192e89f036

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...0002-Fix-build-if-crypt_r-isn-t-available.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/linux-pam/0002-Fix-build-if-crypt_r-isn-t-available.patch b/package/linux-pam/0002-Fix-build-if-crypt_r-isn-t-available.patch
new file mode 100644
index 0000000000..c7fdd8be36
--- /dev/null
+++ b/package/linux-pam/0002-Fix-build-if-crypt_r-isn-t-available.patch
@@ -0,0 +1,37 @@
+From b82acc21f1e2f76d4cb0c75bb4958751562039ab Mon Sep 17 00:00:00 2001
+From: Bernhard Rosenkränzer <bero@lindev.ch>
+Date: Wed, 7 Jun 2023 19:49:01 +0200
+Subject: [PATCH] Fix build if crypt_r isn't available
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+retval was being defined only in #ifdef HAVE_CRYPT_R, but used
+unconditionally.
+
+Signed-off-by: Bernhard Rosenkränzer <bero@lindev.ch>
+Fixes: bcba17939e1b ("modules: make use of secure memory erasure")
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://github.com/linux-pam/linux-pam/commit/b82acc21f1e2f76d4cb0c75bb4958751562039ab
+---
+ modules/pam_pwhistory/opasswd.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/pam_pwhistory/opasswd.c b/modules/pam_pwhistory/opasswd.c
+index 479e3fc4..fc610e2f 100644
+--- a/modules/pam_pwhistory/opasswd.c
++++ b/modules/pam_pwhistory/opasswd.c
+@@ -128,9 +128,9 @@ static int
+ compare_password(const char *newpass, const char *oldpass)
+ {
+   char *outval;
++  int retval;
+ #ifdef HAVE_CRYPT_R
+   struct crypt_data output;
+-  int retval;
+ 
+   output.initialized = 0;
+ 
+-- 
+2.39.2
+

--===============6388177041096817503==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6388177041096817503==--
