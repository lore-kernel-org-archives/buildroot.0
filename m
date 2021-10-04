Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E6DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:40:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88B316121F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 21:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 88B316121F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5241D4039E;
	Mon,  4 Oct 2021 21:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTfkiRo2GKcp; Mon,  4 Oct 2021 21:40:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B3964035E;
	Mon,  4 Oct 2021 21:40:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E09961BF20F
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC02C402DD
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 21:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0CuKSnSoBxzE for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 21:40:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C36A7402AF
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 21:40:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A233C8F1C6; Mon,  4 Oct 2021 21:37:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 22:22:30 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: c78e73c648b1c44eab0a36197d4484784ac7be8c
X-Git-Newrev: e674e72d1edf337d77517aa6a943eec53314a218
X-Patchwork-Hint: ignore
Message-Id: <20211004213731.A233C8F1C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x]
 docs/manual/using-buildroot-debugger: suggest '-ix' iso '-x' when loading
 gdbinit
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

commit: https://git.buildroot.net/buildroot/commit/?id=e674e72d1edf337d77517aa6a943eec53314a218
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

A gdbinit file passed via '-x' will be read _after_ parsing any
object/core file passed on the command-line. In cross-compilation context,
this is particularly a problem when loading a core file, because without the
'sysroot' specified in the gdbinit file, it will give a lot of warnings,
like:

    warning: .dynamic section for "/lib/libstdc++.so.6" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/librt.so.1" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libm.so.6" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libgcc_s.so.1" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libc.so.6" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/ld-linux.so.2" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libanl.so.1" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libdl.so.2" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libpthread.so.0" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/usr/lib/libz.so.1" is not at the expected address (wrong library or version mismatch?)
    warning: .dynamic section for "/lib/libnss_files.so.2" is not at the expected address (wrong library or version mismatch?)

    warning: Could not load shared library symbols for 17 libraries, e.g. [...]
    Use the "info sharedlibrary" command to see the complete listing.
    Do you need "set solib-search-path" or "set sysroot"?

In contrast, the '-ix' option will load the specified gdbinit file _before_
parsing object/core files. This will remove said warnings.

See also: https://sourceware.org/bugzilla/show_bug.cgi?id=28330

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e1ee121caee78380722f9cc0fae6b77ddacdaafc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/using-buildroot-debugger.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.txt
index d5293beb53..9a8a7dfbaf 100644
--- a/docs/manual/using-buildroot-debugger.txt
+++ b/docs/manual/using-buildroot-debugger.txt
@@ -35,7 +35,7 @@ Then, on the host, you should start the cross gdb using the following
 command line:
 
 ----------------------------
-<buildroot>/output/host/bin/<tuple>-gdb -x <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
+<buildroot>/output/host/bin/<tuple>-gdb -ix <buildroot>/output/staging/usr/share/buildroot/gdbinit foo
 ----------------------------
 
 Of course, +foo+ must be available in the current directory, built
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
