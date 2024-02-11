Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC997C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 22:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A875681F60;
	Sun, 11 Feb 2024 22:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zP201xKLGDTt; Sun, 11 Feb 2024 22:08:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEA5881F62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEA5881F62;
	Sun, 11 Feb 2024 22:08:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D12771BF44A
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE23961025
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 22:08:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qOTfZo4R5pTf for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 22:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E170A6100A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E170A6100A
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 22:08:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9088F87807; Sun, 11 Feb 2024 22:08:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:54:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e728889e8c8aeab4dde27210e983e295c0e21068
X-Git-Newrev: 7593aea519dee34cb25715296c1b03f471123ee2
X-Patchwork-Hint: ignore
Message-Id: <20240211220824.9088F87807@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elfutils: drop lfs tweak
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

commit: https://git.buildroot.net/buildroot/commit/?id=7593aea519dee34cb25715296c1b03f471123ee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the elfutils package was first introduced, it filtered out
LFS-related compiler flags due to issues with the package's
implementation. This package has since evolved over the years to support
LFS (e.g. using `AC_SYS_LARGEFILE` [1]).

Filtering out `-D_FILE_OFFSET_BITS=64` can lead to a configuration error
when `BR2_TIME_BITS_64` is enabled:

    checking whether gcc supports -Wl,-z,relro... yes
    checking for __thread support... no
    configure: error: __thread support required
    ...

With the configuration log providing the specific reason:

    configure:7175: .../output-1/host/bin/m68k-buildroot-linux-gnu-gcc -o conftest -fPIC -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 -Ofast -g0 -D_FORTIFY_SOURCE=2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_TIME_BITS=64 -shared -Wl,-z,defs -Wl,-z,relro   -latomic -Wl,--build-id conftest.c  >&5
    In file included from .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
                     from .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33,
                     from .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/stdlib.h:26,
                     from conftest.c:13:
    .../output-1/host/m68k-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
       26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
          |     ^~~~~
    configure:7175: $? = 1
    ...

Fixes:
 - http://autobuild.buildroot.org/results/fbfe131673ed78999a07dbc879436e0ef6a8a1c0

[1]: https://sourceware.org/git/?p=elfutils.git;a=commit;h=3425454a10d307fae891fb667cf7969e945cde79

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elfutils/elfutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 521c37a776..cb4293b0c3 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -29,10 +29,6 @@ HOST_ELFUTILS_CONF_OPTS = \
 	--without-zstd \
 	--disable-progs
 
-# elfutils gets confused when lfs mode is forced, so don't
-ELFUTILS_CFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CFLAGS))
-ELFUTILS_CPPFLAGS = $(filter-out -D_FILE_OFFSET_BITS=64,$(TARGET_CPPFLAGS))
-
 ELFUTILS_CONF_ENV += \
 	CFLAGS="$(ELFUTILS_CFLAGS)" \
 	CPPFLAGS="$(ELFUTILS_CPPFLAGS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
