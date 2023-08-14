Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D70D9EE49A0
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9355140B70;
	Mon, 21 Aug 2023 20:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9355140B70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m-EsCmbVyqSe; Mon, 21 Aug 2023 20:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9B4A40B9D;
	Mon, 21 Aug 2023 20:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9B4A40B9D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 333341BF94D
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A9EF40B22
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A9EF40B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8N3b9heDaWkn for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 231384063C
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 231384063C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12AD686028; Mon, 21 Aug 2023 20:01:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Aug 2023 13:06:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 00cb5f5e4ab9c6b7dc6a8d4c70648dd2f0cf7eca
X-Git-Newrev: dedb686dd283a692376e000e61b64f6b055b1c42
X-Patchwork-Hint: ignore
Message-Id: <20230821200127.12AD686028@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/llvm-project/compiler-rt: fix circular dependency warning
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

commit: https://git.buildroot.net/buildroot/commit/?id=dedb686dd283a692376e000e61b64f6b055b1c42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
---
 package/llvm-project/compiler-rt/compiler-rt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/llvm-project/compiler-rt/compiler-rt.mk b/package/llvm-project/compiler-rt/compiler-rt.mk
index 03dc76eaea..5d9c3d8fa8 100644
--- a/package/llvm-project/compiler-rt/compiler-rt.mk
+++ b/package/llvm-project/compiler-rt/compiler-rt.mk
@@ -11,6 +11,7 @@ COMPILER_RT_LICENSE = NCSA MIT
 COMPILER_RT_LICENSE_FILES = LICENSE.TXT
 COMPILER_RT_CPE_ID_VENDOR = llvm
 COMPILER_RT_DEPENDENCIES = host-clang llvm
+COMPILER_RT_SUPPORTS_IN_SOURCE_BUILD = NO
 
 COMPILER_RT_INSTALL_STAGING = YES
 COMPILER_RT_INSTALL_TARGET = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
