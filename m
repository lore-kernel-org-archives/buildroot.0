Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05F0EE3F00
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 18:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A46582222;
	Tue, 12 Sep 2023 18:30:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A46582222
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gG4mbDepHtxB; Tue, 12 Sep 2023 18:30:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FA4F82218;
	Tue, 12 Sep 2023 18:30:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FA4F82218
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4699A1BF964
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1EA014088A
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 18:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EA014088A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xouCqNQ6Y4Op for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 18:29:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E62824087E
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E62824087E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D536086708; Tue, 12 Sep 2023 18:29:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 12 Sep 2023 20:28:40 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 4d50613e86ff2e3f42dc0563bdca839031b0e0e7
X-Git-Newrev: c57af4987e0f568805ea787c971a29e382c36769
X-Patchwork-Hint: ignore
Message-Id: <20230912182931.D536086708@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/compiler-rt: fix
 circular dependency warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=c57af4987e0f568805ea787c971a29e382c36769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

The compiler-rt project intructs to build out of tree:
    https://compiler-rt.llvm.org/

Otherwise, the dependency chain declared in the include/CMakelLists.txt
causes a circular dependency of source files upon themselves:

    make[4]: Circular include/sanitizer/allocator_interface.h <- include/sanitizer/allocator_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/asan_interface.h <- include/sanitizer/asan_interface.h dependency dropped.
    make[4]: Circular include/sanitizer/common_interface_defs.h <- include/sanitizer/common_interface_defs.h dependency dropped.
    [--snip 19 other files--]

This is because include/CMakeLists.txt unconctional declares
dependencies in this manner:

    set(SANITIZER_HEADERS
        sanitizer/allocator_interface.h
        sanitizer/asan_interface.h
        sanitizer/common_interface_defs.h
        [...]
        )

    set(COMPILER_RT_HEADERS
        ${SANITIZER_HEADERS}
        [...])

    set(output_dir ${COMPILER_RT_OUTPUT_DIR}/include)

    foreach( f ${COMPILER_RT_HEADERS} )
      set( src ${CMAKE_CURRENT_SOURCE_DIR}/${f} )
      set( dst ${output_dir}/${f} )
      add_custom_command(OUTPUT ${dst}
        [...]
      )
      [...]
    endforeach( f )

The froeach() loop creates dependency rules between the files in
output_dir and CMAKE_CURRENT_SOURCE_DIR, without provision for the
case they are both the same directories, thus in-source builds are
not supported.

With the Makefiles backend, this only triggers the above warning
from make, because make arbitrarily breaks circluar dependencies, and
in this case it makes it work. But when we switch to the ninja backend,
this is going to be a hard error.

Anyway, ninja or make, compiler-rt does not support in-source builds.

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
[yann.morin.1998@free.fr: drastically expand commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit dedb686dd283a692376e000e61b64f6b055b1c42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/compiler-rt/compiler-rt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/compiler-rt/compiler-rt.mk b/package/compiler-rt/compiler-rt.mk
index c8ea86e899..fbf4707bfc 100644
--- a/package/compiler-rt/compiler-rt.mk
+++ b/package/compiler-rt/compiler-rt.mk
@@ -12,6 +12,7 @@ COMPILER_RT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmor
 COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_DEPENDENCIES = host-clang llvm
+COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
 
 COMPILER_RT_INSTALL_STAGING = YES
 COMPILER_RT_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
