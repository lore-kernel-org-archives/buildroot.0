Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5E50C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:46:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D1BF61168
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D1BF61168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21F0E400CF;
	Tue, 21 Sep 2021 20:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9jSLCYEptWIj; Tue, 21 Sep 2021 20:46:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 325CE40172;
	Tue, 21 Sep 2021 20:46:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0F1B1BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF05A60ABF
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:46:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZqTXgalyu0E for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:46:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDCDC61389
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:46:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0BA868C983; Tue, 21 Sep 2021 20:44:20 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:43:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c9a3c10417aadce9ee4922e30235776409ce8eb3
X-Git-Newrev: e1ee121caee78380722f9cc0fae6b77ddacdaafc
X-Patchwork-Hint: ignore
Message-Id: <20210921204420.0BA868C983@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual/using-buildroot-debugger:
 suggest '-ix' iso '-x' when loading gdbinit
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e1ee121caee78380722f9cc0fae6b77ddacdaafc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
