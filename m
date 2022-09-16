Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62AAECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 12:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54323842F5;
	Fri, 16 Sep 2022 12:07:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54323842F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JaWWeVaS1r08; Fri, 16 Sep 2022 12:07:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739B0842E0;
	Fri, 16 Sep 2022 12:07:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739B0842E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 193211BF2E5
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E82CC40A88
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 12:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E82CC40A88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7UanMpv5nILp for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 12:06:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CF8140017
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 12:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CF8140017
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1C30083CEE; Fri, 16 Sep 2022 12:06:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 14:05:05 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 511ea0c89da9906e555bafd65746e5debb01b7a6
X-Git-Newrev: e25212443cf22d18a2c48250ebf355a7355af603
X-Patchwork-Hint: ignore
Message-Id: <20220916120631.1C30083CEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/makedumpfile: set
 CROSS
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

commit: https://git.buildroot.net/buildroot/commit/?id=e25212443cf22d18a2c48250ebf355a7355af603
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Set CROSS variable otherwise makedumpfile will use it to undefine the
host architecture through -U__$(HOST_ARCH)__ if $(TARGET) is not equal
to $(HOST_ARCH). This will result in the following build failure since
the addition of the package in commit
adb64a97e79bcb4e28450dd858654003ec8706c3 if aarch64_be is cross-compiled
on a aarch64 host for example:

/home/autobuild/autobuild/instance-5/output-1/host/bin/aarch64_be-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0  -g -O2 -Wall -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -DVERSION='"1.7.0"' -DRELEASE_DATE='"8 Nov 2021"' -D__aarch64_be__ -U__aarch64__ -DUSELZO -c -o ./print_info.o print_info.c

[...]

makedumpfile.c: In function 'is_kvaddr':
makedumpfile.c:1547:46: error: 'KVBASE' undeclared (first use in this function)
 1547 |         return (addr >= (unsigned long long)(KVBASE));
      |                                              ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e4e10364e1a24099ce31bf20eacf5adedf93e5a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b8665e39f1fa3f77fc390cb2a14884f2cb7c76f4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/makedumpfile/makedumpfile.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/makedumpfile/makedumpfile.mk b/package/makedumpfile/makedumpfile.mk
index 8399e4d063..815a159b00 100644
--- a/package/makedumpfile/makedumpfile.mk
+++ b/package/makedumpfile/makedumpfile.mk
@@ -17,6 +17,7 @@ MAKEDUMPFILE_TARGET = $(BR2_ARCH)
 endif
 
 MAKEDUMPFILE_MAKE_OPTS = \
+	CROSS= \
 	TARGET=$(MAKEDUMPFILE_TARGET) \
 	LINKTYPE=dynamic
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
