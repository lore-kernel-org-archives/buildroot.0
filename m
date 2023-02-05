Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FF0C636CC
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 14:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 442BB81DEE;
	Sun,  5 Feb 2023 14:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 442BB81DEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eFAG8PtcA8CP; Sun,  5 Feb 2023 14:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DB4F81DEA;
	Sun,  5 Feb 2023 14:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DB4F81DEA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A94B1BF475
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 121E460760
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 14:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 121E460760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EeLWROQT6lAX for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 14:25:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4539B600B5
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 14:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4539B600B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3323483840; Sun,  5 Feb 2023 14:25:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 15:24:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32602f9cbb7ec0e0beca5ea0d69671ff41d46323
X-Git-Newrev: ae65870e652088dd65ca41d63304893d1d4443a2
X-Patchwork-Hint: ignore
Message-Id: <20230205142502.3323483840@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opusfile: fix CVE-2022-47021
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae65870e652088dd65ca41d63304893d1d4443a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A null pointer dereference issue was discovered in functions op_get_data
and op_open1 in opusfile.c in xiph opusfile 0.9 thru 0.12 allows
attackers to cause denial of service or other unspecified impacts.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...e-allocation-failure-from-ogg_sync_buffer.patch | 44 ++++++++++++++++++++++
 package/opusfile/opusfile.mk                       |  3 ++
 2 files changed, 47 insertions(+)

diff --git a/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
new file mode 100644
index 0000000000..2ef08502ab
--- /dev/null
+++ b/package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
@@ -0,0 +1,44 @@
+From 0a4cd796df5b030cb866f3f4a5e41a4b92caddf5 Mon Sep 17 00:00:00 2001
+From: Ralph Giles <giles@thaumas.net>
+Date: Tue, 6 Sep 2022 19:04:31 -0700
+Subject: [PATCH] Propagate allocation failure from ogg_sync_buffer.
+
+Instead of segfault, report OP_EFAULT if ogg_sync_buffer returns
+a null pointer. This allows more graceful recovery by the caller
+in the unlikely event of a fallible ogg_malloc call.
+
+We do check the return value elsewhere in the code, so the new
+checks make the code more consistent.
+
+Thanks to https://github.com/xiph/opusfile/issues/36 for reporting.
+
+Signed-off-by: Timothy B. Terriberry <tterribe@xiph.org>
+Signed-off-by: Mark Harris <mark.hsj@gmail.com>
+
+[Retrieved from:
+https://github.com/xiph/opusfile/commit/0a4cd796df5b030cb866f3f4a5e41a4b92caddf5]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/opusfile.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/opusfile.c b/src/opusfile.c
+index ca219b2..3c3c81e 100644
+--- a/src/opusfile.c
++++ b/src/opusfile.c
+@@ -148,6 +148,7 @@ static int op_get_data(OggOpusFile *_of,int _nbytes){
+   int            nbytes;
+   OP_ASSERT(_nbytes>0);
+   buffer=(unsigned char *)ogg_sync_buffer(&_of->oy,_nbytes);
++  if(OP_UNLIKELY(buffer==NULL))return OP_EFAULT;
+   nbytes=(int)(*_of->callbacks.read)(_of->stream,buffer,_nbytes);
+   OP_ASSERT(nbytes<=_nbytes);
+   if(OP_LIKELY(nbytes>0))ogg_sync_wrote(&_of->oy,nbytes);
+@@ -1527,6 +1528,7 @@ static int op_open1(OggOpusFile *_of,
+   if(_initial_bytes>0){
+     char *buffer;
+     buffer=ogg_sync_buffer(&_of->oy,(long)_initial_bytes);
++    if(OP_UNLIKELY(buffer==NULL))return OP_EFAULT;
+     memcpy(buffer,_initial_data,_initial_bytes*sizeof(*buffer));
+     ogg_sync_wrote(&_of->oy,(long)_initial_bytes);
+   }
diff --git a/package/opusfile/opusfile.mk b/package/opusfile/opusfile.mk
index 72ae82e801..63553a81e7 100644
--- a/package/opusfile/opusfile.mk
+++ b/package/opusfile/opusfile.mk
@@ -11,6 +11,9 @@ OPUSFILE_LICENSE = BSD-3-Clause
 OPUSFILE_LICENSE_FILES = COPYING
 OPUSFILE_INSTALL_STAGING = YES
 
+# 0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch
+OPUSFILE_IGNORE_CVES += CVE-2022-47021
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPUSFILE_DEPENDENCIES += openssl
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
