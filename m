Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4436ECAAD4
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 22:38:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 414DE6103E;
	Tue, 30 Aug 2022 22:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 414DE6103E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X56EiKNc7TEn; Tue, 30 Aug 2022 22:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4933061037;
	Tue, 30 Aug 2022 22:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4933061037
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADD5A1BF372
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 22:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93AAF41765
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 22:37:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93AAF41765
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdLavVvCBUeL for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 22:37:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EB7541758
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 22:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EB7541758
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1511A868CB; Tue, 30 Aug 2022 22:22:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 00:29:44 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 12b706f7624acc9d795adb46eb7f386417706c9c
X-Git-Newrev: ec7bbd66c7e32d4fdcf90cfbc0802f704bb98ac2
X-Patchwork-Hint: ignore
Message-Id: <20220830222254.1511A868CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/scripts/check-host-rpath: send readelf error output to oblivion
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec7bbd66c7e32d4fdcf90cfbc0802f704bb98ac2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Somewhere between binutils 2.35 and 2.37, some functionality was
added in readelf to parse more DWARF information. Unfortunately, as
reported in binutils bug
28981 ("https://sourceware.org/bugzilla/show_bug.cgi?id=28981"), this
feature causes a number of fairly scary warnings to be displayed when
running readelf on binaries built with Clang, such as the pre-built
rustc and rustdoc binaries part of the host-rust-bin package. It
looks like this:

readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Bogus end-of-siblings marker detected at offset 2f in .debug_info section
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Bogus end-of-siblings marker detected at offset 10b in .debug_info section
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Bogus end-of-siblings marker detected at offset 10c in .debug_info section
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Further warnings about bogus end-of-sibling markers suppressed
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x23
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: Unrecognized form: 0x22
readelf: /home/thomas/projets/buildroot/output/host/bin/rustc: Warning: DIE at offset 0x1da refers to abbreviation number 5827 which does not exist

These warnings are caused by the readelf calls done by the
support/scripts/check-host-rpath script. The annoying thing is that
once host-rust-bin has been installed in $(HOST_DIR), this warning
appears after the installation of every single host package, because
support/scripts/check-host-rpath rescans all binaries every time.

To avoid showing those scary warnings, this commit sends the error
output of readelf to /dev/null.

Of course, it would be nicer to only filter out those warnings, but
filtering the error output without merging the error output into the
standard output is tricky, so let's keep things simple. If there is
really an error, readelf will abort.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit d353d30deed97bf7953cda379315413ffbb70d89)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/check-host-rpath | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/check-host-rpath b/support/scripts/check-host-rpath
index b27cb883f3..f36677cc96 100755
--- a/support/scripts/check-host-rpath
+++ b/support/scripts/check-host-rpath
@@ -61,7 +61,7 @@ elf_needs_rpath() {
 
     while read lib; do
         [ -e "${hostdir}/lib/${lib}" ] && return 0
-    done < <( readelf -d "${file}"                                         \
+    done < <( readelf -d "${file}" 2>/dev/null                             \
               |sed -r -e '/^.* \(NEEDED\) .*Shared library: \[(.+)\]$/!d;' \
                      -e 's//\1/;'                                          \
             )
@@ -100,7 +100,7 @@ check_elf_has_rpath() {
 	    # false.
             [[ ${dir} =~ "${perpackagedir}/"[^/]+/host/lib ]] && return 0
         done
-    done < <( readelf -d "${file}"                                              \
+    done < <( readelf -d "${file}" 2>/dev/null                                  \
               |sed -r -e '/.* \(R(UN)?PATH\) +Library r(un)?path: \[(.+)\]$/!d' \
                       -e 's//\3/;'                                              \
             )
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
