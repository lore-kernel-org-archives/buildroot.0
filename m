Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECACCFA3743
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 14:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A29441570;
	Mon, 31 Oct 2022 14:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A29441570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GdvzNd4I0udy; Mon, 31 Oct 2022 14:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C9741603;
	Mon, 31 Oct 2022 14:41:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18C9741603
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F3771BF3D7
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49E5C41570
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 14:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E5C41570
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5XcKJkKrggC for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 14:40:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 174AC41603
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 14:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 174AC41603
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F21DA87948; Mon, 31 Oct 2022 14:40:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 15:24:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f1a357452d473e384f28a37d3e4ba4146519160
X-Git-Newrev: 1227e4e7202adcb0b73760584bf8383aa65bc0cf
X-Patchwork-Hint: ignore
Message-Id: <20221031144041.F21DA87948@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gawk: don't sliently try autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=1227e4e7202adcb0b73760584bf8383aa65bc0cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e6942ad11ff0 (package/gawk: fix double free during kernel build)
backported an upstream patch, with hunks in autotools files, Makefile.am
and Makefile.in.

Such changes ususally require an explicitly autoreconf, but in this
case, Makefile.in is modified after Makefile,am, and a simple local test
did not trigger a silent autoreconf, so the patch was applied as-is.

That was a bit too optimitstic, though, and the build fails in some
situations.

Since the hunks in the autotools files are about tests, just drop those
hunks as we are not interested in running the tests.

Also drop the hunks about the changelogs while at it.

Fixes:
    http://autobuild.buildroot.org/results/068/0686697cb52d22c42ae2249db3442c008082fe72/
    http://autobuild.buildroot.org/results/754/75463639cb9cbc32108f059bd6044810a078db06/

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../gawk/0002-Fix-a-bug-with-Node_elem_new.patch   | 132 +--------------------
 1 file changed, 3 insertions(+), 129 deletions(-)

diff --git a/package/gawk/0002-Fix-a-bug-with-Node_elem_new.patch b/package/gawk/0002-Fix-a-bug-with-Node_elem_new.patch
index 502f7dcd95..8cbe9c6d02 100644
--- a/package/gawk/0002-Fix-a-bug-with-Node_elem_new.patch
+++ b/package/gawk/0002-Fix-a-bug-with-Node_elem_new.patch
@@ -6,35 +6,12 @@ Subject: [PATCH] Fix a bug with Node_elem_new.
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 [james.hilliard1@gmail.com: backport from upstream commit
 baab183439ff4e0c6b77d62156d447e61fc1dcfb]
+[yann.morin.1998@free.fr: drop all hunks about tests and changelogs]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
- ChangeLog         | 8 ++++++++
  interpret.h       | 1 +
- test/ChangeLog    | 5 +++++
- test/Makefile.am  | 4 +++-
- test/Makefile.in  | 9 ++++++++-
- test/Maketests    | 5 +++++
- test/elemnew1.awk | 9 +++++++++
- test/elemnew1.ok  | 0
- 8 files changed, 39 insertions(+), 2 deletions(-)
- create mode 100644 test/elemnew1.awk
- create mode 100644 test/elemnew1.ok
+ 1 files changed, 1 insertions(+), 0 deletions(-)
 
-diff --git a/ChangeLog b/ChangeLog
-index 5fb25483..cd9d9fcd 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,3 +1,11 @@
-+2022-09-14         Arnold D. Robbins     <arnold@skeeve.com>
-+
-+	* interpret.h (r_interpret): For the `push' opcodes, upref
-+	the Node_elem_new. See test case elemnew1. Thanks to
-+	Emanuel Attila Czirai <corre.a.buscar@gmail.com> for the report,
-+	and to Jan Alexander Steffens (heftig)" <heftig@archlinux.org>
-+	for the fix.
-+	
- 2022-09-04         Arnold D. Robbins     <arnold@skeeve.com>
- 
- 	* 5.2.0: Release tar ball made.
 diff --git a/interpret.h b/interpret.h
 index 57d060e6..268655b2 100644
 --- a/interpret.h
@@ -47,109 +24,6 @@ index 57d060e6..268655b2 100644
  				PUSH(m);
  				break;
  
-diff --git a/test/ChangeLog b/test/ChangeLog
-index a73637bf..ea08edee 100644
---- a/test/ChangeLog
-+++ b/test/ChangeLog
-@@ -1,3 +1,8 @@
-+2022-09-14         Arnold D. Robbins     <arnold@skeeve.com>
-+
-+	* Makefile.am (EXTRA_DIST): New test: elemnew1.
-+	* elemnew1.awk, elemnew1.ok: New files.
-+
- 2022-09-04         Arnold D. Robbins     <arnold@skeeve.com>
- 
- 	* 5.2.0: Release tar ball made.
-diff --git a/test/Makefile.am b/test/Makefile.am
-index ab06974c..8a5c3c49 100644
---- a/test/Makefile.am
-+++ b/test/Makefile.am
-@@ -282,6 +282,8 @@ EXTRA_DIST = \
- 	dumpvars.ok \
- 	dynlj.awk \
- 	dynlj.ok \
-+	elemnew1.awk \
-+	elemnew1.ok \
- 	escapebrace.awk \
- 	escapebrace.in \
- 	escapebrace.ok \
-@@ -1480,7 +1482,7 @@ GAWK_EXT_TESTS = \
- 	binmode1 charasbytes clos1way clos1way2 clos1way3 clos1way4 \
- 	clos1way5 clos1way6 colonwarn commas crlf dbugeval dbugeval2 \
- 	dbugeval3 dbugtypedre1 dbugtypedre2 delsub devfd devfd1 devfd2 \
--	dfacheck1 dumpvars errno exit fieldwdth forcenum fpat1 fpat2 \
-+	dfacheck1 dumpvars elemnew1 errno exit fieldwdth forcenum fpat1 fpat2 \
- 	fpat3 fpat4 fpat5 fpat6 fpat7 fpat8 fpat9 fpatnull fsfwfs functab1 \
- 	functab2 functab3 functab6 funlen fwtest fwtest2 fwtest3 fwtest4 \
- 	fwtest5 fwtest6 fwtest7 fwtest8 genpot gensub gensub2 gensub3 \
-diff --git a/test/Makefile.in b/test/Makefile.in
-index 834feb09..a4fb1cc1 100644
---- a/test/Makefile.in
-+++ b/test/Makefile.in
-@@ -550,6 +550,8 @@ EXTRA_DIST = \
- 	dumpvars.ok \
- 	dynlj.awk \
- 	dynlj.ok \
-+	elemnew1.awk \
-+	elemnew1.ok \
- 	escapebrace.awk \
- 	escapebrace.in \
- 	escapebrace.ok \
-@@ -1748,7 +1750,7 @@ GAWK_EXT_TESTS = \
- 	binmode1 charasbytes clos1way clos1way2 clos1way3 clos1way4 \
- 	clos1way5 clos1way6 colonwarn commas crlf dbugeval dbugeval2 \
- 	dbugeval3 dbugtypedre1 dbugtypedre2 delsub devfd devfd1 devfd2 \
--	dfacheck1 dumpvars errno exit fieldwdth forcenum fpat1 fpat2 \
-+	dfacheck1 dumpvars elemnew1 errno exit fieldwdth forcenum fpat1 fpat2 \
- 	fpat3 fpat4 fpat5 fpat6 fpat7 fpat8 fpat9 fpatnull fsfwfs functab1 \
- 	functab2 functab3 functab6 funlen fwtest fwtest2 fwtest3 fwtest4 \
- 	fwtest5 fwtest6 fwtest7 fwtest8 genpot gensub gensub2 gensub3 \
-@@ -4476,6 +4478,11 @@ dfacheck1:
- 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
- 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
- 
-+elemnew1:
-+	@echo $@
-+	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
-+	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
-+
- exit:
- 	@echo $@
- 	@-$(LOCALES) AWK="$(AWKPROG)" "$(srcdir)"/$@.sh  > _$@ 2>&1 || echo EXIT CODE: $$? >>_$@
-diff --git a/test/Maketests b/test/Maketests
-index 3a667af8..90828e7f 100644
---- a/test/Maketests
-+++ b/test/Maketests
-@@ -1432,6 +1432,11 @@ dfacheck1:
- 	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  < "$(srcdir)"/$@.in >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
- 	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
- 
-+elemnew1:
-+	@echo $@
-+	@-AWKPATH="$(srcdir)" $(AWK) -f $@.awk  >_$@ 2>&1 || echo EXIT CODE: $$? >>_$@
-+	@-$(CMP) "$(srcdir)"/$@.ok _$@ && rm -f _$@
-+
- exit:
- 	@echo $@
- 	@-$(LOCALES) AWK="$(AWKPROG)" "$(srcdir)"/$@.sh  > _$@ 2>&1 || echo EXIT CODE: $$? >>_$@
-diff --git a/test/elemnew1.awk b/test/elemnew1.awk
-new file mode 100644
-index 00000000..58dc9fcd
---- /dev/null
-+++ b/test/elemnew1.awk
-@@ -0,0 +1,9 @@
-+function add_flags(old) {
-+  if (old)
-+    return 0
-+  if (!old)
-+    return 1
-+}
-+BEGIN {
-+  a[0]=add_flags(a[0])
-+}
-diff --git a/test/elemnew1.ok b/test/elemnew1.ok
-new file mode 100644
-index 00000000..e69de29b
 -- 
 2.34.1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
