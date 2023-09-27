Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82762E810D5
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 11:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2760761411;
	Wed, 27 Sep 2023 11:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2760761411
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tyacbpmm9EJ5; Wed, 27 Sep 2023 11:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26CD761400;
	Wed, 27 Sep 2023 11:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26CD761400
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF4DD1BF909
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 11:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9344610B4
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 11:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9344610B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4a0_9WBAUcU for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 11:48:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 617FA60B7C
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 11:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 617FA60B7C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DC3D8225E; Wed, 27 Sep 2023 11:48:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 13:38:49 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: f4c3e4a55e4b43dec6dece3ee47c199cd5775f77
X-Git-Newrev: ef266a16b9455b7727e34dccb93b223df09db628
X-Patchwork-Hint: ignore
Message-Id: <20230927114812.4DC3D8225E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/nodejs: fix
 cross-compile builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=ef266a16b9455b7727e34dccb93b223df09db628
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

When nodejs is build, a qemu wrapper script is used to execute some
programs built for the target in user-mode emulation. However, when the
target and build machines are similar (e.g. x86_74), running those
programs fails, with errors such as:

    cd ../../tools/v8_gypfiles; python ../../deps/v8/tools/run.py ../../out/Release/v8-qemu-wrapper ../../out/Release/bytecode_builtins_list_generator ../../out/Release/obj.host/gen/generate-bytecode-output-root/builtins-generated/bytecodes-builtins-list.h
    ../../out/Release/bytecode_builtins_list_generator: /lib/x86_64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.29' not found (required by ../../out/Release/bytecode_builtins_list_generator)
    ../../out/Release/bytecode_builtins_list_generator: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by ../../out/Release/bytecode_builtins_list_generator)
    ../../out/Release/bytecode_builtins_list_generator: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found (required by ../../out/Release/bytecode_builtins_list_generator)
    ../../out/Release/bytecode_builtins_list_generator: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by ../../out/Release/bytecode_builtins_list_generator)
    Return code is 1

So the question is: why the heck does Qemu use the host C library?

To answer this question, we first have to look at how the -L option of
Qemu is implemented. This option is documented as such:

    -L path     QEMU_LD_PREFIX   set the elf interpreter prefix to 'path'

The v8-qemu-wrapper script makes this option point to $(STAGING_DIR),
so that the ELF interpreter used is the one in $(STAGING_DIR).

However, contrary to what the option documentation says, this option
does much more than setting the ELF interpreter prefix: it is going to
affect how *all* system calls manipulating files (open, etc.) are
going to work.

When this option is passed, the function init_paths() in
https://git.qemu.org/?p=qemu.git;a=blob;f=util/path.c is called at
initialization time, and essentially its sets the global "base"
variable to point to the directory passed as -L argument.

Then, for every single syscall that manipulates a path, this path will
be passed through the path() function in the same file. This function
will first attempt to resolve the path with "base" as a prefix, and if
not, return the unprefixed path.

After adding some traces into this function, I was able to understand
what happens:

(1) -L$(STAGING_DIR) is passed, causing "base" to point to
$(STAGING_DIR)

(2) The target ELF interpreter from $(STAGING_DIR) is properly invoked

(3) When this ELF interpreter then resolves the libc.so.6 library, it
    first looks for /etc/ld.so.cache.

(4) Qemu first looks for /etc/ld.so.cache with the -L prefix, i.e
    $(STAGING_DIR)/etc/ld.so.cache, but it does not exist. So, the Qemu
    system call emulation falls back to /etc/ld.so.cache, which means
    the target ELF interpreter reads the /etc/ld.so.cache of the host
    system.

(5) This /etc/ld.so.cache of the host system says that libc.so.6 is in
    /lib/x86_64-linux-gnu/

(6) The target ELF interpreter therefore tries to use
    /lib/x86_64-linux-gnu/libc.so.6. The Qemu system call emulation
    first tries $(STAGING_DIR)/lib/x86_64-linux-gnu/libc.so.6, but
    this library does not exist (it is in
    $(STAGING_DIR)/lib/libc.so.6), so the Qemu system call emulation
    falls back to /lib/x86_64-linux-gnu/libc.so.6 of the host system,
    which exist... but is too old compared to the target C library.
    Indeed, results from ld.so.cache take precedence over the simple
    resolution of library paths in /usr/lib and /lib.

We see 3 possible ideas to resolve this problem:

(A) Change the behavior of Qemu to not fallback to unprefixed paths:
    when -L is passed, all path-related system calls should see the
    paths prefixed by the -L option.

    Issue with this is that this change is unlikely to get accepted by
    Qemu upstream. And there might be some side effects we have not
    really identified.

(B) Create an empty $(STAGING_DIR)/etc/ld.so.cache. We have tested
    this solution and it works: it gets used instead of the host
    /etc/ld.so.cache. Because $(STAGING_DIR)/etc/ld.so.cache is empty,
    there's no libc.so.6 match, so the target ELF interpreter goes
    through its normal library location resolution logic, which falls
    back to trying in /usr/lib and /lib, which works as those paths
    ends up being prefixed with $(STAGING_DIR) by Qemu.

(C) Pass LD_LIBRARY_PATH pointing to $(STAGING_DIR)/lib and
    $(STAGING_DIR)/usr/lib in the Qemu wrapper. This works because
    LD_LIBRARY_PATH paths have precedence over paths given by
    ld.so.cache.

    This is the solution already used by the GOI qemu wrapper in
    package/gobject-introspection/g-ir-scanner-qemuwrapper.in.

We chose to go with the third option, because it has been proven to work
for the GOI wrapper, and has been reported to solve #14366. Even though
the first option would be the best, it is also the one that has the
least chances to land any time soon (if ever); the second has not been
exercised, and the impact is not fully understood either (e.g what about
non-glibc toolchains?).

Fixes: #14366

Signed-off-by: Jens Maus <mail@jens-maus.de>
[yann.morin.1998@free.fr:
  - add whole analsys done by Thomas in:
    https://lore.kernel.org/buildroot/20221031213926.50d3c778@windsurf/
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 278d1db56becb4c6b5784c9bb9a0c452ea73ae16)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nodejs/v8-qemu-wrapper.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nodejs/v8-qemu-wrapper.in b/package/nodejs/v8-qemu-wrapper.in
index e1083f47f7..48222d089b 100644
--- a/package/nodejs/v8-qemu-wrapper.in
+++ b/package/nodejs/v8-qemu-wrapper.in
@@ -5,5 +5,6 @@
 exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
     @QEMU_USERMODE_ARGS@ \
    -L "${STAGING_DIR}/" \
+   -E LD_LIBRARY_PATH="${STAGING_DIR}/lib:${STAGING_DIR}/usr/lib/" \
     "$@"
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
