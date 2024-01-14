Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6975FC47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 21:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25F8082310;
	Sun, 14 Jan 2024 21:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25F8082310
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8KDTk1mPPOnV; Sun, 14 Jan 2024 21:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E7EF823C0;
	Sun, 14 Jan 2024 21:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E7EF823C0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 917E41BF297
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 21:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76039404D8
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 21:37:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76039404D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KN-zXek4ACk5 for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 21:37:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CD1B4011F
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 21:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CD1B4011F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A4928617C; Sun, 14 Jan 2024 21:37:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 22:29:15 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: a9e949d89ae52d02320c61db912cee191d47617a
X-Git-Newrev: 4ffcb0c8c4771a9f522079a68692eb9ec10805bf
X-Patchwork-Hint: ignore
Message-Id: <20240114213748.8A4928617C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/apcupsd: set LD
 to TARGET_CXX
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

commit: https://git.buildroot.net/buildroot/commit/?id=4ffcb0c8c4771a9f522079a68692eb9ec10805bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

As found out by Yann E. Morin in [1], apcupsd configure script is ugly,
and uses gcc to do the link line-wrapping which will raise the following
build failure with gcc 13:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/13.2.0/../../../../powerpc64le-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64le-buildroot-linux-gnu/13.2.0/../../../../powerpc64le-buildroot-linux-gnu/lib/../lib64/libsupc++.a(eh_alloc.o): in function `std::basic_string_view<char, std::char_traits<char> >::compare(unsigned long, unsigned long, char const*, unsigned long) const':
eh_alloc.cc:(.text._ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmPKcm[_ZNKSt17basic_string_viewIcSt11char_traitsIcEE7compareEmmPKcm]+0x44): undefined reference to `std::__throw_out_of_range_fmt(char const*, ...)'

It will also raise the following build failure on sparc/arc:

/home/autobuild/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: /home/autobuild/autobuild/instance-3/output-1/host/arceb-buildroot-linux-uclibc/sysroot/lib/libsupc++.a(eh_throw.o): in function `__exchange_and_add_dispatch':
/SCRATCH/arcjenkins2/slaves/ru20-custom-arcgnu2/workspace/arcoss_verification/arc_gnu_toolchain_release/arc_gnu_toolchain_release/bd-uclibceb/gcc-stage2/arceb-snps-linux-uclibc/libstdc++-v3/include/ext/atomicity.h:82: undefined reference to `__gnu_cxx::__exchange_and_add(int volatile*, int)'
/home/autobuild/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: /SCRATCH/arcjenkins2/slaves/ru20-custom-arcgnu2/workspace/arcoss_verification/arc_gnu_toolchain_release/arc_gnu_toolchain_release/bd-uclibceb/gcc-stage2/arceb-snps-linux-uclibc/libstdc++-v3/include/ext/atomicity.h:82: undefined reference to `__gnu_cxx::__exchange_and_add(int volatile*, int)'

Instead of trying to patch the configure script as advocated by
Yann E. Morin, set LD to TARGET_CXX as:
 - this solution is quicker
 - usptream is dead (last release in 2016)
 - this solution has already been used in other packages (nodejs, zmqpp)

[1]: https://patchwork.ozlabs.org/project/buildroot/patch/20200812171821.2517-1-Evgeniy.Didin@synopsys.com/

Fixes:
 - http://autobuild.buildroot.org/results/6096c3ddc5edf3204635c2c90246c2e8c8e074e7
 - http://autobuild.buildroot.org/results/d8a/d8a3ab31c5b86871c7e1117f4ffa7b6cedfcb7e0/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit cd2dcaa6c68639470a5db806878a6baba2e15741)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/apcupsd/apcupsd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/apcupsd/apcupsd.mk b/package/apcupsd/apcupsd.mk
index 80ed0b0832..97e6d6a558 100644
--- a/package/apcupsd/apcupsd.mk
+++ b/package/apcupsd/apcupsd.mk
@@ -71,8 +71,8 @@ APCUPSD_CONF_OPTS += --disable-usb
 endif
 
 define APCUPSD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/platforms
+	$(TARGET_MAKE_ENV) $(MAKE) LD="$(TARGET_CXX)" -C $(@D)/src
+	$(TARGET_MAKE_ENV) $(MAKE) LD="$(TARGET_CXX)" -C $(@D)/platforms
 endef
 
 define APCUPSD_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
