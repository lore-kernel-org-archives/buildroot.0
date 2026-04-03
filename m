Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7801E7E367
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B027581CA0;
	Fri,  3 Apr 2026 10:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wd0sAC8VXJsV; Fri,  3 Apr 2026 10:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A4281DBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212124;
	bh=4TSmUmPaZcAr4jfjxJVapJBMqL8wz4KCeH/OJJ3XMd8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LslMdqimuJex4hT4FVf9S/3SG3bgsTPc0iqTpKNd59skS8ML5ahRHVambUaqYgMW9
	 QGeIP+aeF9a4zuKN9Csc6mEB4VCcDeEap12yQvuswCUO8Zc5+bO8Kr4U6DcCdgiZi/
	 znyVT4w5idLo/QprmatPcDrJPXG+G2LaMlLKlunEsCWnSNdf9IZaG+27uEfZq+9zL6
	 SHW6/0+noOD9H8or4a+xMUhlAbFQ+7Vp+Qpmed5P9QUbEMMQ6Yhz0rwcn6NF1akY2f
	 mAK0LTYRNoFmzyHHr0xw7W74ojuNHVH8N6gn0y6Sq/gReFFBvi/c/g5pITY3z5Y/PA
	 kTWUJi7Rr1cAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A4281DBF;
	Fri,  3 Apr 2026 10:28:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B6472D3
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE78E81A29
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3Vm-qZ839LS for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE9881C38
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BE9881C38
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7CED87FFF9; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 11:53:01 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 17920c622e1b3742ba49114be05894d6c55e95b5
X-Git-Newrev: b185cceaffd8bc536b9621476636faf8a747584a
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.7CED87FFF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] boot/edk2: fix build with
 host gcc >= 15, glibc >= 2.43
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7924920297918249565=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7924920297918249565==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b185cceaffd8bc536b9621476636faf8a747584a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

The edk2 package fails to build with gcc 15, with the following error:

  EfiRom.c:78:17: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]

Cherry-pick one patch from edk2-stable202602 to fix this.

This can be verified with the tests.boot.test_edk2 python tests.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Dick Olsson <hi@senzilla.io>
[Julien: add "host" gcc 15 and glibc 2.43 in commit title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d18f7e09162ac3dbe4538fd0e2a3e5ec192e88a4)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...001-BaseTools-EfiRom-fix-compiler-warning.patch | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/boot/edk2/0001-BaseTools-EfiRom-fix-compiler-warning.patch b/boot/edk2/0001-BaseTools-EfiRom-fix-compiler-warning.patch
new file mode 100644
index 0000000000..c1e688cfe0
--- /dev/null
+++ b/boot/edk2/0001-BaseTools-EfiRom-fix-compiler-warning.patch
@@ -0,0 +1,46 @@
+From 9af06ef3cbb052b142f9660c2c01e7aeb401300c Mon Sep 17 00:00:00 2001
+From: Gerd Hoffmann <kraxel@redhat.com>
+Date: Mon, 8 Dec 2025 10:28:50 +0100
+Subject: [PATCH] BaseTools/EfiRom: fix compiler warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+New warning after updating gcc:
+
+EfiRom.c: In function ‘main’:
+EfiRom.c:78:17: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
+
+The assigned value is not used, so fix the warning by just removing it.
+
+Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
+Upstream: https://github.com/tianocore/edk2/commit/9af06ef3cbb052b142f9660c2c01e7aeb401300c
+Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
+---
+ BaseTools/Source/C/EfiRom/EfiRom.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/BaseTools/Source/C/EfiRom/EfiRom.c b/BaseTools/Source/C/EfiRom/EfiRom.c
+index fa7bf0e62e..6e903b3504 100644
+--- a/BaseTools/Source/C/EfiRom/EfiRom.c
++++ b/BaseTools/Source/C/EfiRom/EfiRom.c
+@@ -44,7 +44,6 @@ Returns:
+   FILE_LIST *FList;
+   UINT32    TotalSize;
+   UINT32    Size;
+-  CHAR8     *Ptr0;
+ 
+   SetUtilityName(UTILITY_NAME);
+ 
+@@ -75,7 +74,7 @@ Returns:
+   //
+   if (mOptions.DumpOption == 1) {
+     if (mOptions.FileList != NULL) {
+-      if ((Ptr0 = strstr ((CONST CHAR8 *) mOptions.FileList->FileName, DEFAULT_OUTPUT_EXTENSION)) != NULL) {
++      if (strstr ((CONST CHAR8 *) mOptions.FileList->FileName, DEFAULT_OUTPUT_EXTENSION) != NULL) {
+         DumpImage (mOptions.FileList);
+         goto BailOut;
+       } else {
+-- 
+2.53.0
+

--===============7924920297918249565==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7924920297918249565==--
