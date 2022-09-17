Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BF1FECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 11:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8500141D97;
	Sat, 17 Sep 2022 11:07:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8500141D97
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8PJwiWYZoB6v; Sat, 17 Sep 2022 11:07:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35FA441D8A;
	Sat, 17 Sep 2022 11:07:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35FA441D8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC4FD1BF5A3
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 11:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A868940133
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 11:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A868940133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oP9-688zFgof for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 11:06:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C405F402FE
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 11:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C405F402FE
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B38ED841EF; Sat, 17 Sep 2022 11:06:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 12:57:42 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 05a51acabb2be03f590f58dcc1942be39eebc23a
X-Git-Newrev: 1d852d6288083540170435f1ebbe8350ff9de20c
X-Patchwork-Hint: ignore
Message-Id: <20220917110651.B38ED841EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] utils/genrandconfig: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=1d852d6288083540170435f1ebbe8350ff9de20c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
index c2ca30f51e..fba2b0a009 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -180,7 +180,7 @@ def is_toolchain_usable(configfile, config):
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
