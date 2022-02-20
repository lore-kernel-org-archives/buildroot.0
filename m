Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF469C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 09:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75E41817D3;
	Sun, 20 Feb 2022 09:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7i5X9INmiSj; Sun, 20 Feb 2022 09:55:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 847C681402;
	Sun, 20 Feb 2022 09:55:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64BBD1BF3F3
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 09:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 612B081402
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 09:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j1ewmjDW-SaU for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 09:55:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9911D813E9
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 09:55:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id DBB0B82DFB; Sun, 20 Feb 2022 09:47:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 10:54:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 59a813d2a884c2eb247d9695089375b56751b6d5
X-Git-Newrev: 21c07c0aaa7e43b8f676c564f173a510d345a77a
X-Patchwork-Hint: ignore
Message-Id: <20220220094754.DBB0B82DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/expat: security bump to version
 2.4.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=21c07c0aaa7e43b8f676c564f173a510d345a77a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Security fixes:
 #562  CVE-2022-25235 -- Passing malformed 2- and 3-byte UTF-8
       sequences (e.g. from start tag names) to the XML
       processing application on top of Expat can cause
       arbitrary damage (e.g. code execution) depending
       on how invalid UTF-8 is handled inside the XML
       processor; validation was not their job but Expat's.
       Exploits with code execution are known to exist.
 #561  CVE-2022-25236 -- Passing (one or more) namespace separator
       characters in "xmlns[:prefix]" attribute values
       made Expat send malformed tag names to the XML
       processor on top of Expat which can cause
       arbitrary damage (e.g. code execution) depending
       on such unexpectable cases are handled inside the XML
       processor; validation was not their job but Expat's.
       Exploits with code execution are known to exist.
 #558  CVE-2022-25313 -- Fix stack exhaustion in doctype parsing
       that could be triggered by e.g. a 2 megabytes
       file with a large number of opening braces.
       Expected impact is denial of service or potentially
       arbitrary code execution.
 #560  CVE-2022-25314 -- Fix integer overflow in function copyString;
       only affects the encoding name parameter at parser creation
       time which is often hardcoded (rather than user input),
       takes a value in the gigabytes to trigger, and a 64-bit
       machine.  Expected impact is denial of service.
 #559  CVE-2022-25315 -- Fix integer overflow in function storeRawNames;
       needs input in the gigabytes and a 64-bit machine.
       Expected impact is denial of service or potentially
       arbitrary code execution.

https://blog.hartwork.org/posts/expat-2-4-5-released/
https://github.com/libexpat/libexpat/blob/R_2_4_5/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 10e13206d0..cd2e8c7fb9 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.4/
-md5  a712d23b7afb32e7527cf0b3fd8f12ac  expat-2.4.4.tar.xz
-sha1  6028b04d3505fc519c4c7c6bd67e1ad1a08cd7b6  expat-2.4.4.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.5/
+md5  9dc183e6c1eebc1b658c1e71be0885e1  expat-2.4.5.tar.xz
+sha1  360a49b55c442e91cb7b328bc0335083909ddf4f  expat-2.4.5.tar.xz
 
 # Locally calculated
-sha256  b5d25d6e373351c2ed19b562b4732d01d2589ac8c8e9e7962d8df1207cc311b8  expat-2.4.4.tar.xz
+sha256  f2af8fc7cdc63a87920da38cd6d12cb113c3c3a3f437495b1b6541e0cff32579  expat-2.4.5.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 250600c25e..7815d61027 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.4
+EXPAT_VERSION = 2.4.5
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
