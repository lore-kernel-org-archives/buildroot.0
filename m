Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F84FC32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 20:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92C8D4077D;
	Tue, 23 Aug 2022 20:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92C8D4077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wWTmPJtObf82; Tue, 23 Aug 2022 20:20:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FD344069B;
	Tue, 23 Aug 2022 20:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FD344069B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33E8F1BF5A8
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C6BA8135A
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 20:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C6BA8135A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HCvLvpbUcry for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 20:20:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14EAB81355
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 20:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14EAB81355
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D1DC287BBB; Tue, 23 Aug 2022 20:05:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 22:19:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af582c9f8fb958d8860c9fcaad98c4f70a6488fa
X-Git-Newrev: 12e4f7c5c43fb7b4db6d6548b9dbabb9c1b5f875
X-Patchwork-Hint: ignore
Message-Id: <20220823200511.D1DC287BBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: fix checking host
 glibc version
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

commit: https://git.buildroot.net/buildroot/commit/?id=12e4f7c5c43fb7b4db6d6548b9dbabb9c1b5f875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index c6b3123feb..21d4592049 100755
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
