Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37250C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:06:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF37860FDC
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF37860FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD4BE40767;
	Thu, 26 Aug 2021 22:06:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6baGgxgDAyWF; Thu, 26 Aug 2021 22:06:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5774B40795;
	Thu, 26 Aug 2021 22:06:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FB151BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64ADF4077E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F7UY6nnZq6vW for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74DD140777
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D6FE08DC71; Thu, 26 Aug 2021 22:01:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 10:46:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8f7d7d9d86ecd4d43abaeed742ce691e46302276
X-Git-Newrev: b53cbf680c1ba6821722145752f239bf798cbbea
X-Patchwork-Hint: ignore
Message-Id: <20210826220126.D6FE08DC71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xen: fix build with
 gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b53cbf680c1ba6821722145752f239bf798cbbea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure with gcc 11:

linux.c:165:50: error: argument 7 of type 'const xen_pfn_t[]' {aka 'const long long unsigned int[]'} declared as an ordinary array [-Werror=vla-parameter]
  165 |                                  const xen_pfn_t arr[/*num*/], int err[/*num*/])
      |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~
In file included from linux.c:29:
private.h:35:50: note: previously declared as a variable length array 'const xen_pfn_t[num]' {aka 'const long long unsigned int[num]'}
   35 |                                  const xen_pfn_t arr[num], int err[num]);
      |                                  ~~~~~~~~~~~~~~~~^~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f70d060cf50254694113f19f50a8ef96ef33dd1a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-Fix-osdep_xenforeignmemory_map-prototype.patch | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch b/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
new file mode 100644
index 0000000000..170d1c22c2
--- /dev/null
+++ b/package/xen/0002-libs-foreignmemory-Fix-osdep_xenforeignmemory_map-prototype.patch
@@ -0,0 +1,33 @@
+From 5d3e4ebb5c71477d74a0c503438545a0126d3863 Mon Sep 17 00:00:00 2001
+From: Anthony PERARD <anthony.perard@citrix.com>
+Date: Tue, 1 Jun 2021 16:41:47 +0100
+Subject: [PATCH] libs/foreignmemory: Fix osdep_xenforeignmemory_map prototype
+
+Commit cf8c4d3d13b8 made some preparation to have one day
+variable-length-array argument, but didn't declare the array in the
+function prototype the same way as in the function definition. And now
+GCC 11 complains about it.
+
+Fixes: cf8c4d3d13b8 ("tools/libs/foreignmemory: pull array length argument to map forward")
+Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
+Reviewed-by: Jan Beulich <jbeulich@suse.com>
+[Retrieved from:
+https://github.com/xen-project/xen/commit/5d3e4ebb5c71477d74a0c503438545a0126d3863]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ tools/libs/foreignmemory/private.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/libs/foreignmemory/private.h b/tools/libs/foreignmemory/private.h
+index 1ee3626dd278..5bb0cefb0987 100644
+--- a/tools/libs/foreignmemory/private.h
++++ b/tools/libs/foreignmemory/private.h
+@@ -32,7 +32,7 @@ int osdep_xenforeignmemory_close(xenforeignmemory_handle *fmem);
+ void *osdep_xenforeignmemory_map(xenforeignmemory_handle *fmem,
+                                  uint32_t dom, void *addr,
+                                  int prot, int flags, size_t num,
+-                                 const xen_pfn_t arr[num], int err[num]);
++                                 const xen_pfn_t arr[/*num*/], int err[/*num*/]);
+ int osdep_xenforeignmemory_unmap(xenforeignmemory_handle *fmem,
+                                  void *addr, size_t num);
+ 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
