Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9CCCCD8C80
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63FDE82026;
	Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Nkev9vMYH8R; Fri,  5 Jun 2026 12:38:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BA5181EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663136;
	bh=QWdgWx0SZR2obvvG5zYmN12Gp5v2p3IqpJcJGoPCEu4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=llh8ioCiEoqJVqKpfKGLJzyQqafjYYlhrUzU7sXwUtrL0nh4d+/Hxn33/vZu2Qxen
	 UOGjn2wr6ccMJHoSkT2I+ZcA9884mPm6OE/ZfEUTmC1hwDobaaPAqb99P8H/NwPBxZ
	 GDN8iuBklgem1sdinfwvQzrGkKok0ADaMav7lA+Ap3Z2SZ7JolcI2W8DAMPRpF6xVH
	 nwIicQOHAtPRLAnSTDnzvnSNYIEJtfOELuUxRhFS530veY7zWypJzueoMNt3gDYIDw
	 D9+dfYZ8x/ADqJd4ZwWsNRRDbklwr8BfHFqxq1kiYaBrzCf7hDSM7otst6jNi29qH/
	 l1PHKfF8mSgJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BA5181EC0;
	Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02724F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0850581E5B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h6N5ccaHd7Vy for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25A4981E4E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25A4981E4E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5006987B3B; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 12:35:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2cb350c2b418927f76634f97fb002ea7e4a1a1ee
X-Git-Newrev: bf23f3aa8373a026129761463c12e94708f2fc71
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.5006987B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/samba4: fix build
 on uclibc with GCC 14+
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf23f3aa8373a026129761463c12e94708f2fc71
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

iconv types are defined differently in glibc (as pointers) and uclibc
(as integers). With changes in GCC14, -Wint-conversion has now become
an error, which shed some light on the issue.

The actual fix for that problem is released in uclibc 1.0.58 [1].
However, because these type definitions are in toolchain headers,
this means that the toolchain used to build samba must also include
uclibc>=1.0.58 (either an external toolchain that includes the uclibc fix,
or a Buildroot toolchain after the uclibc fix is merged in Buildroot [2]).

Until then, provide a workaround for samba itself.

No autobuilder failure on this (yet). It can be reproduced with
    > ./utils/test-pkg -p samba4 -T bootlin-armv5-uclibc

[1] https://github.com/wbx-github/uclibc-ng/commit/328e14e55f35ee333e5a19c5717cb4bbf426c3f1
[2] https://lore.kernel.org/buildroot/ahPrm_0gVDGw5B5-@waldemar-brodkorb.de/

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit e136494e918090296284214ca06736e2dafb83fe)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...arset-iconv-fix-build-when-iconv_t-is-not.patch | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/package/samba4/0002-lib-util-charset-iconv-fix-build-when-iconv_t-is-not.patch b/package/samba4/0002-lib-util-charset-iconv-fix-build-when-iconv_t-is-not.patch
new file mode 100644
index 0000000000..b270deaf98
--- /dev/null
+++ b/package/samba4/0002-lib-util-charset-iconv-fix-build-when-iconv_t-is-not.patch
@@ -0,0 +1,98 @@
+From aab0668cc358e443b243528939947c3eea93ca27 Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@mind.be>
+Date: Sat, 30 May 2026 00:30:00 +0200
+Subject: [PATCH] charset: fix iconv_t int/pointer conversion on uClibc
+
+The iconv handles cd_pull, cd_push and cd_direct are stored as 'void *'
+in struct smb_iconv_s, but iconv_open() returns and iconv()/iconv_close()
+take an iconv_t. On glibc this is harmless because iconv_t is itself a
+'void *', so the implicit conversions are between identical types.
+
+On uClibc however iconv_t is a 'long int', so storing iconv_open()'s
+result into a 'void *' field (and passing those fields back to iconv()
+and iconv_close()) is an implicit integer<->pointer conversion. Since
+GCC 14 -Wint-conversion is an error by default, this breaks the build:
+
+  iconv.c: In function 'sys_iconv':
+  iconv.c:166:38: error: passing argument 1 of 'iconv' makes integer
+    from pointer without a cast [-Wint-conversion]
+  iconv.c: In function 'smb_iconv_open_ex':
+  iconv.c:403:30: error: assignment to 'void *' from 'iconv_t'
+    {aka 'long int'} makes pointer from integer without a cast
+    [-Wint-conversion]
+
+Add explicit casts between iconv_t and void * so the conversions are
+intentional and the code builds on both glibc and uClibc.
+
+Upstream: not applicable to samba, because uclibc has already released
+          a fix, but this isn't included yet in Buildroot prebuilt toolchains.
+          The problem is therefore to be patched in Buildroot itself.
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ lib/util/charset/iconv.c | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/lib/util/charset/iconv.c b/lib/util/charset/iconv.c
+index 074794a26e3..90389d6a954 100644
+--- a/lib/util/charset/iconv.c
++++ b/lib/util/charset/iconv.c
+@@ -163,7 +163,7 @@ static size_t sys_iconv(void *cd,
+ 	size_t ret = iconv((iconv_t)cd,
+ 			   discard_const_p(char *, inbuf), inbytesleft,
+ 			   outbuf, outbytesleft);
+-	if (ret == (size_t)-1) iconv(cd, NULL, NULL, NULL, NULL);
++	if (ret == (size_t)-1) iconv((iconv_t)cd, NULL, NULL, NULL, NULL);
+ 	return ret;
+ }
+ #endif
+@@ -345,12 +345,12 @@ static int smb_iconv_t_destructor(smb_iconv_t hwd)
+ 	}
+ #endif
+ #ifdef HAVE_NATIVE_ICONV
+-	if (hwd->cd_pull != NULL && hwd->cd_pull != (iconv_t)-1)
+-		iconv_close(hwd->cd_pull);
+-	if (hwd->cd_push != NULL && hwd->cd_push != (iconv_t)-1)
+-		iconv_close(hwd->cd_push);
+-	if (hwd->cd_direct != NULL && hwd->cd_direct != (iconv_t)-1)
+-		iconv_close(hwd->cd_direct);
++	if (hwd->cd_pull != NULL && hwd->cd_pull != (void *)(iconv_t)-1)
++		iconv_close((iconv_t)hwd->cd_pull);
++	if (hwd->cd_push != NULL && hwd->cd_push != (void *)(iconv_t)-1)
++		iconv_close((iconv_t)hwd->cd_push);
++	if (hwd->cd_direct != NULL && hwd->cd_direct != (void *)(iconv_t)-1)
++		iconv_close((iconv_t)hwd->cd_direct);
+ #endif
+ 
+ 	return 0;
+@@ -400,19 +400,19 @@ _PUBLIC_ smb_iconv_t smb_iconv_open_ex(TALLOC_CTX *mem_ctx, const char *tocode,
+ 	 * conversions */
+ 
+ 	if (from == NULL) {
+-		ret->cd_pull = iconv_open("UTF-16LE", fromcode);
+-		if (ret->cd_pull == (iconv_t)-1)
+-			ret->cd_pull = iconv_open("UCS-2LE", fromcode);
+-		if (ret->cd_pull != (iconv_t)-1) {
++		ret->cd_pull = (void *)iconv_open("UTF-16LE", fromcode);
++		if (ret->cd_pull == (void *)(iconv_t)-1)
++			ret->cd_pull = (void *)iconv_open("UCS-2LE", fromcode);
++		if (ret->cd_pull != (void *)(iconv_t)-1) {
+ 			ret->pull = sys_iconv;
+ 		}
+ 	}
+ 
+ 	if (to == NULL) {
+-		ret->cd_push = iconv_open(tocode, "UTF-16LE");
+-		if (ret->cd_push == (iconv_t)-1)
+-			ret->cd_push = iconv_open(tocode, "UCS-2LE");
+-		if (ret->cd_push != (iconv_t)-1) {
++		ret->cd_push = (void *)iconv_open(tocode, "UTF-16LE");
++		if (ret->cd_push == (void *)(iconv_t)-1)
++			ret->cd_push = (void *)iconv_open(tocode, "UCS-2LE");
++		if (ret->cd_push != (void *)(iconv_t)-1) {
+ 			ret->push = sys_iconv;
+ 		}
+ 	}
+-- 
+2.54.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
