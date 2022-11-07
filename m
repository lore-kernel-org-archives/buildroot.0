Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662F3C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA1281DE6;
	Mon,  5 Dec 2022 11:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA1281DE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pHMBZbA2G-jJ; Mon,  5 Dec 2022 11:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A8CC8144B;
	Mon,  5 Dec 2022 11:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A8CC8144B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4699E1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0157D4168C
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0157D4168C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gblHNTMYGHko for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DB094167E
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DB094167E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1934C85BA3; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:10:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8450b769187087751f83cbefcf0a88f70d9da670
X-Git-Newrev: f7a6011f78044e782c5ef19d1f5abb3b6fd9e435
X-Patchwork-Hint: ignore
Message-Id: <20221205112608.1934C85BA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Makefile: unexport PERL_MM_OPT
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

commit: https://git.buildroot.net/buildroot/commit/?id=f7a6011f78044e782c5ef19d1f5abb3b6fd9e435
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compilation of Perl-related packages fails if `PERL_MM_OPT` is defined.

We previously issued an error in this case.
Instead, simply `unexport` the variable.

Signed-off-by: Gleb Mazovetskiy <glex.spb@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Makefile                             | 3 +++
 support/dependencies/dependencies.sh | 9 ---------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 7c1c07a2e4..71b622474f 100644
--- a/Makefile
+++ b/Makefile
@@ -396,6 +396,9 @@ unexport DESTDIR
 # Causes breakage with packages that needs host-ruby
 unexport RUBYOPT
 
+# Compilation of perl-related packages will fail otherwise
+unexport PERL_MM_OPT
+
 include package/pkg-utils.mk
 include package/doc-asciidoc.mk
 
diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 2b678ae8c4..4b5012b807 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -46,15 +46,6 @@ case ":${PATH:-unset}:" in
 	;;
 esac
 
-if test -n "$PERL_MM_OPT" ; then
-	echo
-	echo "You have PERL_MM_OPT defined because Perl local::lib"
-	echo "is installed on your system. Please unset this variable"
-	echo "before starting Buildroot, otherwise the compilation of"
-	echo "Perl related packages will fail"
-	exit 1
-fi
-
 check_prog_host()
 {
 	prog="$1"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
