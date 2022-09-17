Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDABECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 11:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB5A4403AC;
	Sat, 17 Sep 2022 11:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB5A4403AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rVy7rsEhgndU; Sat, 17 Sep 2022 11:06:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D497B402FE;
	Sat, 17 Sep 2022 11:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D497B402FE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDB4D1BF968
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 11:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C690B60B74
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 11:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C690B60B74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71Ap-QLg982G for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 11:06:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDB3660AF8
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 11:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDB3660AF8
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B6235841DC; Sat, 17 Sep 2022 11:06:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 12:57:34 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: d01c3d3205d0398feb1a9d2a5cddcdc85a18844f
X-Git-Newrev: a4435cfb55f64682d7c95a8a092deca8f6d8ab82
X-Patchwork-Hint: ignore
Message-Id: <20220917110616.B6235841DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] utils/genrandconfig: fix
 checking host glibc version
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

commit: https://git.buildroot.net/buildroot/commit/?id=a4435cfb55f64682d7c95a8a092deca8f6d8ab82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Unless explicitly told otherwise, subprocess.check_output() returns
bytes objects [0].

When we try to check the C library version (to check the Linaro
toolchain is usable), genrandconfig currently fails with:
    TypeError: cannot use a string pattern on a bytes-like object

So, as suggested in the python documentation, decocde() the output of
subprocess.check_output() before we can use it.

[0] https://docs.python.org/3/library/subprocess.html#subprocess.check_output

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 12e4f7c5c43fb7b4db6d6548b9dbabb9c1b5f875)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index cf43778183..0de5a43ebb 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -181,7 +181,7 @@ def is_toolchain_usable(configfile, config):
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
             ldd_version_output = subprocess.check_output(['ldd', '--version'])
-            glibc_version = ldd_version_output.splitlines()[0].split()[-1]
+            glibc_version = ldd_version_output.decode().splitlines()[0].split()[-1]
             if StrictVersion('2.14') > StrictVersion(glibc_version):
                 print("WARN: ignoring the Linaro ARM toolchains because too old host glibc", file=sys.stderr)
                 return False
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
