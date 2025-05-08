Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2141DC3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91CF8845B9;
	Mon, 19 May 2025 10:57:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4VceIBlpXuyr; Mon, 19 May 2025 10:57:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E65820D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4E65820D4;
	Mon, 19 May 2025 10:57:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1592CE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB06D41462
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vU8bLNDQ1-6t for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F2B241466
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F2B241466
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D45F8348A; Mon, 19 May 2025 10:40:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 8 May 2025 21:35:27 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: dc0691f038e4cefa1cef064d160dfe1421aa278f
X-Git-Newrev: 448ceefa78c74195e82982046e562f6e2a332d70
X-Patchwork-Hint: ignore
Message-Id: <20250519104000.2D45F8348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 support/dependencies/dependencies.sh: awk is needed by Buildroot
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=448ceefa78c74195e82982046e562f6e2a332d70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

A basic Fedora 42 container does not have 'awk' installed, but it is
needed by Buildroot. First by check-host-python3.sh:

support/dependencies/check-host-python3.sh: line 6: awk: command not found
support/dependencies/check-host-python3.sh: line 19: awk: command not found
support/dependencies/check-host-python3.sh: line 19: awk: command not found

but then even building host-expat assumes awk is available:

config.status: creating Makefile
./config.status: line 1404: awk: command not found
config.status: creating expat.pc
./config.status: line 1404: awk: command not found

Since it's a pretty basic tool, make it part of the tools checked by
dependencies.sh. One minor annoyance is that check-host-python3.sh is
executed *before* dependencies.sh does its thing, so when 'awk' is not
available, we end up seeing:

support/dependencies/check-host-python3.sh: line 6: awk: command not found
support/dependencies/check-host-python3.sh: line 19: awk: command not found
support/dependencies/check-host-python3.sh: line 19: awk: command not found
which: no awk in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin)
You must install 'awk' on your build machine
make: *** [support/dependencies/dependencies.mk:27: dependencies] Error 1

It would be nice to have the awk check *before* it gets used in
check-host-python3.sh, but that's a topic for another patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/manual/prerequisite.adoc        | 1 +
 support/dependencies/dependencies.sh | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/prerequisite.adoc b/docs/manual/prerequisite.adoc
index 5d3aa297a9..1bfcff1a4a 100644
--- a/docs/manual/prerequisite.adoc
+++ b/docs/manual/prerequisite.adoc
@@ -38,6 +38,7 @@ between distributions).
 ** +file+ (must be in +/usr/bin/file+)
 ** +bc+
 ** +findutils+
+** +awk+
 
 * Source fetching tools:
 ** +wget+
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index fb0defd0c9..2843e3c5d5 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -154,7 +154,7 @@ fi
 
 # Check that a few mandatory programs are installed
 missing_progs="no"
-for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
+for prog in perl tar wget cpio unzip rsync bc cmp find xargs awk ${DL_TOOLS} ; do
 	if ! which $prog > /dev/null ; then
 		echo "You must install '$prog' on your build machine";
 		missing_progs="yes"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
