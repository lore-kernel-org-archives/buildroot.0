Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E54F6C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:55:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11E360F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:55:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B11E360F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87C6B403F7;
	Tue,  3 Aug 2021 22:55:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Y5N2Ia8Pc9Y; Tue,  3 Aug 2021 22:55:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C115B415F5;
	Tue,  3 Aug 2021 22:55:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1634F1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64BE34061F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H5e3CXL4FtKX for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 620E6404DA
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A912085F62; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 4 Jun 2021 23:40:55 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a7186cd1ea0f26e44dda06d31cf010091cd13535
X-Git-Newrev: bedd8420786b184f4aec4433800083a3468cfe1c
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.A912085F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lvm2: disable parallel
 build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=bedd8420786b184f4aec4433800083a3468cfe1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Parallel build is broken since bump to version 2.03.12 in commit
80997acd35. Commits 4526078d1b, 8a313b019c, and a7186cd1ea tried to fix
that by only installing systemd units when appropriate.

It turns out that there are more cases where parallel build still fails:

    http://autobuild.buildroot.org/results/995/995f46ee0033e34261ba7b24b61c41e7a088602b/

    >>> lvm2 2.03.12 Installing to staging directory
    [...]
        [INSTALL] ioctl/libdevmapper.so
        [CC] dmsetup.c
    /usr/bin/make -C lib install_device-mapper
        [CC] dmsetup.c
    [...]
        [CC] dmsetup
        [CC] dmsetup
    /nvme/rc-buildroot-test/scripts/instance-0/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/10.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /nvme/rc-buildroot-test/scripts/instance-0/output-1/host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/Scrt1.o: in function `_start':
    (.text+0x54): undefined reference to `main'
    collect2: error: ld returned 1 exit status
    Makefile:60: recipe for target 'dmsetup' failed

Or:

    http://autobuild.buildroot.org/results/a4e/a4ea87da502272dc2e677123b6fbcb0c23106f0b/

    >>> lvm2 2.03.12 Installing to staging directory
    [...]
        [CC] dmsetup
    /home/giuliobenetti/autobuild/run/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-musleabihf/9.3.0/../../../../arm-buildroot-linux-musleabihf/bin/ld: /home/giuliobenetti/autobuild/run/instance-3/output-1/host/arm-buildroot-linux-musleabihf/sysroot/lib/Scrt1.o: in function `_start_c':
    Scrt1.c:(.text._start_c+0x5c): undefined reference to `main'
    collect2: error: ld returned 1 exit status
    make[3]: *** [Makefile:61: dmsetup] Error 1
    make[3]: Leaving directory '/home/giuliobenetti/autobuild/run/instance-3/output-1/build/lvm2-2.03.12/libdm/dm-tools'
    make[2]: *** [../libdm/make.tmpl:315: dm-tools.device-mapper] Error 2
    make[2]: *** Waiting for unfinished jobs....
        [CC] dmsetup
        [INSTALL] dmsetup
    [...]

Similar traces in either case: it tries to build dmsetup twice, at
intall time instead of build time.

Fixes:
  - http://autobuild.buildroot.org/results/995/995f46ee0033e34261ba7b24b61c41e7a088602b/
  - http://autobuild.buildroot.org/results/a4e/a4ea87da502272dc2e677123b6fbcb0c23106f0b/

Note that this is just a workaround for a broken buildsystem anyway:
indeed, the build of dmsetup is done at install time, instead of build
time. More fixes should be worked on with upstream to properly fix the
issue...

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr:
  - update after the three partial fix-commits
  - extend commit log accordingly
  - add new upstream failures
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lvm2/lvm2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 5ce79768b6..6726e165b1 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -11,6 +11,8 @@ LVM2_INSTALL_STAGING = YES
 LVM2_LICENSE = GPL-2.0, LGPL-2.1
 LVM2_LICENSE_FILES = COPYING COPYING.LIB
 LVM2_CPE_ID_PRODUCT = redhat
+# parallel build issues
+LVM2_MAKE = $(MAKE1)
 
 # Make sure that binaries and libraries are installed with write
 # permissions for the owner. We disable NLS because it's broken, and
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
