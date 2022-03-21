Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716EDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19CDD409E5;
	Mon, 21 Mar 2022 16:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03aHFdLUoBGJ; Mon, 21 Mar 2022 16:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A13CD409F3;
	Mon, 21 Mar 2022 16:58:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32C3E1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:57:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20527401D6
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:57:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U5XWQGrLYnS8 for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:57:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C8A240207
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:57:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 67FBC84BD3; Mon, 21 Mar 2022 16:48:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:57:05 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 71c72f6b49440a979cd7c9b827575d984301b539
X-Git-Newrev: a8e6b4b546f895651f1c48ed3f91ea3810d60de5
X-Patchwork-Hint: ignore
Message-Id: <20220321164851.67FBC84BD3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/raptor: fix
 CVE-2020-25713
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8e6b4b546f895651f1c48ed3f91ea3810d60de5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

A malformed input file can lead to a segfault due to an out of bounds
array access in raptor_xml_writer_start_element_common.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2fca33462b8ed4ed7c54d5d0640ddb64723b3dae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-compare-namespace-declarations-correctly.patch | 33 ++++++++++++++++++++++
 package/raptor/raptor.mk                           |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch b/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
new file mode 100644
index 0000000000..a48a583cb1
--- /dev/null
+++ b/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
@@ -0,0 +1,33 @@
+From 4f5dbbffcc1c6cf0398bd03450453289a0979dea Mon Sep 17 00:00:00 2001
+From: Dave Beckett <dave@dajobe.org>
+Date: Sat, 18 Sep 2021 17:40:00 -0700
+Subject: [PATCH] XML Writer : compare namespace declarations correctly
+
+Apply patch from
+0001-CVE-2020-25713-raptor2-malformed-input-file-can-lead.patch.1
+that fixes Issue#0000650 https://bugs.librdf.org/mantis/view.php?id=650
+which overwrote heap during XML writing in parse type literal
+content.  This was detected with clang asan.
+
+Thanks to Michael Stahl / mst2 for the fix.
+
+[Retrieved from:
+https://github.com/dajobe/raptor/commit/4f5dbbffcc1c6cf0398bd03450453289a0979dea]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/raptor_xml_writer.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/raptor_xml_writer.c b/src/raptor_xml_writer.c
+index 56993dc3..4426d38c 100644
+--- a/src/raptor_xml_writer.c
++++ b/src/raptor_xml_writer.c
+@@ -227,7 +227,7 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
+           
+           /* check it wasn't an earlier declaration too */
+           for(j = 0; j < nspace_declarations_count; j++)
+-            if(nspace_declarations[j].nspace == element->attributes[j]->nspace) {
++            if(nspace_declarations[j].nspace == element->attributes[i]->nspace) {
+               declare_me = 0;
+               break;
+             }
diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index 6d21fad58e..69ac121300 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -20,6 +20,9 @@ RAPTOR_AUTORECONF = YES
 # 0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
 RAPTOR_IGNORE_CVES += CVE-2017-18926
 
+# 0003-XML-Writer-compare-namespace-declarations-correctly.patch
+RAPTOR_IGNORE_CVES += CVE-2020-25713
+
 RAPTOR_CONF_OPTS =\
 	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
 	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
